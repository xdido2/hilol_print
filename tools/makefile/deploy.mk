# ──────────────────────
# 🚀 DEPLOYMENT COMMANDS
# ──────────────────────

# ──────────────────────
# 🧠 PLATFORM DETECTION
# ──────────────────────

ifeq ($(OS),Windows_NT)
	PLATFORM := windows
	OPEN_APK_DIR := explorer build\app\outputs\apk\release
	OPEN_AAB_DIR := explorer build\app\outputs\bundle\release
	OPEN_IOS_ARCHIVE :=
else
	UNAME_S := $(shell uname -s)

	ifeq ($(UNAME_S),Darwin)
		PLATFORM := macos
		OPEN_APK_DIR := open build/app/outputs/apk/release/
		OPEN_AAB_DIR := open build/app/outputs/bundle/release/
		OPEN_IOS_ARCHIVE := open build/ios/archive/Runner.xcarchive
	else
		PLATFORM := linux
		OPEN_APK_DIR := xdg-open build/app/outputs/apk/release/
		OPEN_AAB_DIR := xdg-open build/app/outputs/bundle/release/
		OPEN_IOS_ARCHIVE :=
	endif
endif

# ──────────────────────
# ⚙️ CONFIG
# ──────────────────────

SENDER_SCRIPT := sender.dart

# ──────────────────────
# 📖 HELP
# ──────────────────────

.PHONY: help-deploy
help-deploy: ## Show all available deployment-related commands
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

# ──────────────────────
# 🔢 VERSION HELPERS
# ──────────────────────

.PHONY: print-version
print-version: ## Print app version from pubspec.yaml
ifeq ($(PLATFORM),windows)
	@powershell -NoProfile -ExecutionPolicy Bypass -Command "$$line = (Select-String -Path pubspec.yaml -Pattern '^version:\s*').Line; $$version = $$line.Replace('version:', '').Trim(); Write-Host $$version"
else
	@grep '^version: ' pubspec.yaml | sed 's/version: //'
endif

.PHONY: increment-build
increment-build: ## Increment build number in pubspec.yaml
ifeq ($(PLATFORM),windows)
	@powershell -NoProfile -ExecutionPolicy Bypass -Command "$$content = Get-Content pubspec.yaml; $$updated = $$content | ForEach-Object { if ($$_ -match '^version:\s*([0-9.]+)\+([0-9]+)') { 'version: ' + $$matches[1] + '+' + ([int]$$matches[2] + 1) } else { $$_ } }; Set-Content pubspec.yaml $$updated; $$line = (Select-String -Path pubspec.yaml -Pattern '^version:\s*').Line; Write-Host ('Build number incremented: ' + $$line.Replace('version:', '').Trim())"
else
	@sed -i.bak 's/\(^version: *[0-9.]*\)+\([0-9]*\)/\1+'"$$(($$(grep '^version:' pubspec.yaml | cut -d+ -f2) + 1))"'/' pubspec.yaml
	@rm -f pubspec.yaml.bak
	@echo ""
	@echo "Build number incremented: $$(grep '^version: ' pubspec.yaml | sed 's/version: //')"
	@echo ""
endif

# ──────────────────────
# 🧱 PRE BUILD
# ──────────────────────

.PHONY: pre-build
pre-build: ## Run before build tasks
	@$(MAKE) increment-build
	@$(MAKE) clean_all
	@$(MAKE) get
	@$(MAKE) gen

# ──────────────────────
# 🤖 ANDROID APK BUILDS
# ──────────────────────

.PHONY: apk
apk: pre-build ## Build Android APK with development config
ifeq ($(PLATFORM),windows)
	@powershell -NoProfile -ExecutionPolicy Bypass -Command "$$line = (Select-String -Path pubspec.yaml -Pattern '^version:\s*').Line.Replace('version:', '').Trim(); $$parts = $$line.Split('+'); $$buildName = $$parts[0]; $$buildNumber = $$parts[1]; flutter build apk --release --build-name=$$buildName --build-number=$$buildNumber --dart-define-from-file=config/development.json --dart-define=config.platform=android"
	@$(OPEN_APK_DIR)
else
	@BUILD_VERSION=$$(grep '^version: ' pubspec.yaml | sed 's/version: //'); \
	BUILD_NAME=$$(echo $$BUILD_VERSION | cut -d+ -f1); \
	BUILD_NUMBER=$$(echo $$BUILD_VERSION | cut -d+ -f2); \
	flutter build apk --release \
		--build-name=$$BUILD_NAME \
		--build-number=$$BUILD_NUMBER \
		--dart-define-from-file=config/development.json \
		--dart-define=config.platform=android
	@$(OPEN_APK_DIR)
endif

.PHONY: apk-staging
apk-staging: pre-build ## Build Android APK with staging config
ifeq ($(PLATFORM),windows)
	@powershell -NoProfile -ExecutionPolicy Bypass -Command "$$line = (Select-String -Path pubspec.yaml -Pattern '^version:\s*').Line.Replace('version:', '').Trim(); $$parts = $$line.Split('+'); $$buildName = $$parts[0]; $$buildNumber = $$parts[1]; flutter build apk --release --build-name=$$buildName --build-number=$$buildNumber --dart-define-from-file=config/staging.json --dart-define=config.platform=android"
	@$(OPEN_APK_DIR)
else
	@BUILD_VERSION=$$(grep '^version: ' pubspec.yaml | sed 's/version: //'); \
	BUILD_NAME=$$(echo $$BUILD_VERSION | cut -d+ -f1); \
	BUILD_NUMBER=$$(echo $$BUILD_VERSION | cut -d+ -f2); \
	flutter build apk --release \
		--build-name=$$BUILD_NAME \
		--build-number=$$BUILD_NUMBER \
		--dart-define-from-file=config/staging.json \
		--dart-define=config.platform=android
	@$(OPEN_APK_DIR)
endif

.PHONY: apk-prod
apk-prod: pre-build ## Build Android APK with production config
ifeq ($(PLATFORM),windows)
	@powershell -NoProfile -ExecutionPolicy Bypass -Command "$$line = (Select-String -Path pubspec.yaml -Pattern '^version:\s*').Line.Replace('version:', '').Trim(); $$parts = $$line.Split('+'); $$buildName = $$parts[0]; $$buildNumber = $$parts[1]; flutter build apk --release --build-name=$$buildName --build-number=$$buildNumber --dart-define-from-file=config/production.json --dart-define=config.platform=android"
	@$(OPEN_APK_DIR)
else
	@BUILD_VERSION=$$(grep '^version: ' pubspec.yaml | sed 's/version: //'); \
	BUILD_NAME=$$(echo $$BUILD_VERSION | cut -d+ -f1); \
	BUILD_NUMBER=$$(echo $$BUILD_VERSION | cut -d+ -f2); \
	flutter build apk --release \
		--build-name=$$BUILD_NAME \
		--build-number=$$BUILD_NUMBER \
		--dart-define-from-file=config/production.json \
		--dart-define=config.platform=android
	@$(OPEN_APK_DIR)
endif

# ──────────────────────
# 🤖 ANDROID AAB BUILDS
# ──────────────────────

.PHONY: aab
aab: pre-build ## Build Android AAB with production config
ifeq ($(PLATFORM),windows)
	@powershell -NoProfile -ExecutionPolicy Bypass -Command "$$line = (Select-String -Path pubspec.yaml -Pattern '^version:\s*').Line.Replace('version:', '').Trim(); $$parts = $$line.Split('+'); $$buildName = $$parts[0]; $$buildNumber = $$parts[1]; flutter build appbundle --release --build-name=$$buildName --build-number=$$buildNumber --dart-define-from-file=config/production.json --dart-define=config.platform=android"
	@$(OPEN_AAB_DIR)
else
	@BUILD_VERSION=$$(grep '^version: ' pubspec.yaml | sed 's/version: //'); \
	BUILD_NAME=$$(echo $$BUILD_VERSION | cut -d+ -f1); \
	BUILD_NUMBER=$$(echo $$BUILD_VERSION | cut -d+ -f2); \
	flutter build appbundle --release \
		--build-name=$$BUILD_NAME \
		--build-number=$$BUILD_NUMBER \
		--dart-define-from-file=config/production.json \
		--dart-define=config.platform=android
	@$(OPEN_AAB_DIR)
endif

# ──────────────────────
# 🍎 iOS IPA BUILDS
# ──────────────────────

.PHONY: ipa
ipa: pre-build ## Build iOS IPA with development config
ifeq ($(PLATFORM),windows)
	@echo iOS IPA build is not supported on Windows. Use macOS with Xcode.
else
	@BUILD_VERSION=$$(grep '^version: ' pubspec.yaml | sed 's/version: //'); \
	BUILD_NAME=$$(echo $$BUILD_VERSION | cut -d+ -f1); \
	BUILD_NUMBER=$$(echo $$BUILD_VERSION | cut -d+ -f2); \
	flutter build ipa \
		--build-name=$$BUILD_NAME \
		--build-number=$$BUILD_NUMBER \
		--dart-define-from-file=config/development.json \
		--dart-define=config.platform=ios
	@$(OPEN_IOS_ARCHIVE)
endif

.PHONY: ipa-staging
ipa-staging: pre-build ## Build iOS IPA with staging config
ifeq ($(PLATFORM),windows)
	@echo iOS IPA build is not supported on Windows. Use macOS with Xcode.
else
	@BUILD_VERSION=$$(grep '^version: ' pubspec.yaml | sed 's/version: //'); \
	BUILD_NAME=$$(echo $$BUILD_VERSION | cut -d+ -f1); \
	BUILD_NUMBER=$$(echo $$BUILD_VERSION | cut -d+ -f2); \
	flutter build ipa \
		--build-name=$$BUILD_NAME \
		--build-number=$$BUILD_NUMBER \
		--dart-define-from-file=config/staging.json \
		--dart-define=config.platform=ios
	@$(OPEN_IOS_ARCHIVE)
endif

.PHONY: ipa-prod
ipa-prod: pre-build ## Build iOS IPA with production config
ifeq ($(PLATFORM),windows)
	@echo iOS IPA build is not supported on Windows. Use macOS with Xcode.
else
	@BUILD_VERSION=$$(grep '^version: ' pubspec.yaml | sed 's/version: //'); \
	BUILD_NAME=$$(echo $$BUILD_VERSION | cut -d+ -f1); \
	BUILD_NUMBER=$$(echo $$BUILD_VERSION | cut -d+ -f2); \
	flutter build ipa \
		--build-name=$$BUILD_NAME \
		--build-number=$$BUILD_NUMBER \
		--dart-define-from-file=config/production.json \
		--dart-define=config.platform=ios
	@$(OPEN_IOS_ARCHIVE)
endif

# ──────────────────────
# 📱 LOCAL DEVICE RUN
# ──────────────────────

.PHONY: run-ios
run-ios: ## Run development config on a connected iOS device (DEVICE=<id> to pick one)
ifeq ($(PLATFORM),macos)
	@test -f ios/Flutter/LocalSigning.xcconfig || { \
		echo ""; \
		echo "ios/Flutter/LocalSigning.xcconfig is missing."; \
		echo "  cp ios/Flutter/LocalSigning.xcconfig.example ios/Flutter/LocalSigning.xcconfig"; \
		echo "then set DEV_TEAM to your Apple Developer Team ID."; \
		echo ""; \
		exit 1; \
	}
	@flutter run \
		$(if $(DEVICE),-d $(DEVICE),) \
		--dart-define-from-file=config/development.json \
		--dart-define=config.platform=ios
else
	@echo "Running on an iOS device requires macOS with Xcode."
endif

.PHONY: ios-signing
ios-signing: ## Print the resolved iOS signing settings for the Debug configuration
ifeq ($(PLATFORM),macos)
	@xcodebuild -workspace ios/Runner.xcworkspace -scheme Runner -configuration Debug \
		-showBuildSettings 2>/dev/null \
		| grep -E "^ +(DEVELOPMENT_TEAM|PRODUCT_BUNDLE_IDENTIFIER|CODE_SIGN_STYLE|CODE_SIGN_IDENTITY) "
else
	@echo "iOS signing settings are only readable on macOS with Xcode."
endif

# ──────────────────────
# 🚢 PUBLISHING
# ──────────────────────

.PHONY: publish
publish: ## Publish the app to TestFlight
ifeq ($(PLATFORM),windows)
	@echo TestFlight publishing is not supported on Windows. Use macOS with Xcode.
else
	@dart run tools/dart/test_flight_publisher.dart
endif