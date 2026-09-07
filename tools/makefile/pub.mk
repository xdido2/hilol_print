# ──────────────────────────────────
# 🧠 PLATFORM DETECTION
# ──────────────────────────────────

ifeq ($(OS),Windows_NT)
	PLATFORM := windows
	CLEAR_CMD :=
else
	UNAME_S := $(shell uname -s)

	ifeq ($(UNAME_S),Darwin)
		PLATFORM := macos
	else
		PLATFORM := linux
	endif

	CLEAR_CMD := if [ -t 1 ]; then clear; fi
endif

# ──────────────────────────────────
# 📖 HELPERS
# ──────────────────────────────────

.PHONY: help-pub
help-pub: ## Show all available pub commands with descriptions
ifeq ($(PLATFORM),windows)
	@echo Platform: $(PLATFORM)
	@echo Usage: make ^<TARGET^>
	@echo.
	@powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-Content $(MAKEFILE_LIST) | Select-String -Pattern '^[a-zA-Z0-9_-]+:.*?## ' | ForEach-Object { $$line = $$_.Line; $$parts = $$line -split ':.*?## ', 2; if ($$parts.Count -eq 2) { '{0,-30} {1}' -f $$parts[0], $$parts[1] } }"
else
	@echo 'Platform: $(PLATFORM)'
	@echo 'Usage: make <TARGET>'
	@echo ''
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
endif

# ──────────────────────────────────
# 🔎 PROJECT INFORMATION
# ──────────────────────────────────

.PHONY: version
version: ## Check Flutter version
	@echo "Platform: $(PLATFORM)"
	@fvm flutter --version

# ──────────────────────────────────
# 🧹 CLEANING COMMANDS
# ──────────────────────────────────

.PHONY: clean
clean: ## Clean the project
	@flutter clean

.PHONY: clean_all
clean_all: ## Clean the project and remove generated files
ifeq ($(PLATFORM),windows)
	@echo Cleaning the project...
	@$(MAKE) clean
	@powershell -NoProfile -ExecutionPolicy Bypass -Command "Remove-Item -Force -ErrorAction SilentlyContinue coverage.*; Remove-Item -Recurse -Force -ErrorAction SilentlyContinue dist, bin, out, build, coverage, .dart_tool; Remove-Item -Force -ErrorAction SilentlyContinue .packages, pubspec.lock; exit 0"
	@echo Project successfully cleaned
else
	@echo "🗑️ Cleaning the project..."
	@$(MAKE) clean
	@rm -f coverage.*
	@rm -rf dist bin out build
	@rm -rf coverage .dart_tool .packages pubspec.lock
	@echo "✅ Project successfully cleaned"
endif

.PHONY: full-clean
full-clean: clean_all clear_gradle ## Clean project and clear Gradle cache

.PHONY: fcg
fcg: ## Flutter clean, get dependencies, and format
	@$(MAKE) clean
	@$(MAKE) get
	@$(MAKE) format

.PHONY: c_get
c_get: clean_all get ## Clean all and get dependencies

.PHONY: clear_gradle
clear_gradle: ## Clear Gradle cache
ifeq ($(PLATFORM),windows)
	@echo Clearing Gradle cache...
	@powershell -NoProfile -ExecutionPolicy Bypass -Command "Remove-Item -Recurse -Force -ErrorAction SilentlyContinue ""$$env:USERPROFILE\.gradle\caches""; Remove-Item -Recurse -Force -ErrorAction SilentlyContinue ""$$env:USERPROFILE\.gradle\wrapper""; Remove-Item -Recurse -Force -ErrorAction SilentlyContinue ""$$env:USERPROFILE\.gradle\daemon""; exit 0"
	@echo Gradle cache cleared
else
	@rm -rf ~/.gradle/caches/
	@rm -rf ~/.gradle/wrapper/
	@rm -rf ~/.gradle/daemon/
endif

# ──────────────────────────────────
# 📦 DEPENDENCY MANAGEMENT
# ──────────────────────────────────

.PHONY: get
get: ## Get dependencies
	@flutter pub get

.PHONY: upgrade
upgrade: ## Upgrade all dependencies
	@flutter pub upgrade

.PHONY: upgrade-major
upgrade-major: get ## Upgrade to major versions
	@flutter pub upgrade --major-versions

.PHONY: outdated
outdated: get ## Check for outdated dependencies
	@flutter pub outdated

.PHONY: dependencies
dependencies: get ## Check all types of outdated dependencies
	@flutter pub outdated --dependency-overrides --dev-dependencies --prereleases --show-all --transitive

# ──────────────────────────────────
# 🎨 CODE STYLE & FORMATTING
# ──────────────────────────────────

.PHONY: format
format: ## Format Dart code to line length 120
	@dart format -l 120 lib/ test/ package/ tools/

# ──────────────────────────────────
# ⚡ CODE GENERATION
# ──────────────────────────────────

.PHONY: fluttergen
fluttergen: ## Generate assets with flutter_gen/build_runner
	@dart run build_runner build --delete-conflicting-outputs

.PHONY: l10n
l10n: ## Generate localization files
	@dart pub global activate intl_utils
	@dart pub global run intl_utils:generate
	@flutter gen-l10n --arb-dir lib/src/common/localization --output-dir lib/src/common/localization/generated --template-arb-file intl_en.arb

.PHONY: build_runner
build_runner: ## Run build_runner to generate code
	@dart run build_runner build --delete-conflicting-outputs --release

.PHONY: gen
gen: ## Run all code generation tasks
ifeq ($(PLATFORM),windows)
	@echo Generating code...
	@flutter pub get
	@$(MAKE) fluttergen
	@$(MAKE) l10n
	@$(MAKE) build_runner
	@$(MAKE) format
	@echo Code generated successfully
else
	@echo "🔄 Generating code..."
	@flutter pub get
	@$(MAKE) fluttergen
	@$(MAKE) l10n
	@$(MAKE) build_runner
	@$(MAKE) format
	@$(CLEAR_CMD)
	@echo "✅ Code generated successfully"
endif

# ──────────────────────────────────
# 🎨 VECTOR GRAPHICS
# ──────────────────────────────────

.PHONY: build_vec
build_vec: ## Build vector graphics from SVG files
	@dart run tools/dart/vector_generator.dart $(r)

vec: r ?= false
.PHONY: vec
vec: build_vec fluttergen format ## Build vectors and regenerate assets

# ──────────────────────────────────
# 📱 APP RESOURCES
# ──────────────────────────────────

.PHONY: generate-icons
generate-icons: ## Generate app icons with flutter_launcher_icons
	@dart run flutter_launcher_icons -f flutter_launcher_icons.yaml

.PHONY: generate-splash
generate-splash: ## Generate splash screen with flutter_native_splash
	@dart run flutter_native_splash:create --path=flutter_native_splash.yaml

.PHONY: resources
resources: generate-icons generate-splash ## Generate app icons and splash screen

.PHONY: full-gen
full-gen: gen resources ## Run codegen, localization, icons, and splash generation

# ──────────────────────────────────
# 🍎 iOS SPECIFIC
# ──────────────────────────────────

.PHONY: pod-restart
pod-restart: ## Restart CocoaPods for iOS project
ifeq ($(PLATFORM),windows)
	@echo pod-restart is macOS only. CocoaPods requires macOS + Xcode.
else ifeq ($(PLATFORM),linux)
	@echo pod-restart is macOS only. CocoaPods requires macOS + Xcode.
else
	@cd ios && \
	rm -rf Pods && \
	rm -f Podfile.lock && \
	pod deintegrate && \
	pod install
	@$(MAKE) fcg
endif