# PROJECT EXTRACTION — TO'LIQ

## 1. PUBSPEC.YAML
```yaml
name: hilol_print
description: "A new Flutter project."
publish_to: 'none'

version: 1.0.0+3

environment: 
  sdk: '>=3.10.0<4.0.0'

dependencies:
  flutter:
    sdk: flutter

  flutter_localizations:
    sdk: flutter

  intl: any

  # Local packages
  local_source:
    path: package/local_source


  # UI
  cupertino_icons: ^1.0.9
  shimmer: ^3.0.0
  flutter_svg: ^2.2.4
  pinput: ^6.0.2

  # Network
  thunder: ^0.2.5
  cached_network_image: ^3.4.1
  dio: ^5.9.2
  dio_retry_plus: ^2.0.8

  # State managment
  flutter_bloc: ^9.1.1
  equatable: ^2.0.8
  bloc: ^9.2.0

  # Permissions
  permission_handler: ^12.0.1

  # Media
  image_picker: ^1.1.2

  # Navigation
  go_router: ^17.1.0
  go_provider: ^2.0.1

  # DI
  get_it: ^9.2.1

  meta: ^1.17.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  shared_preferences: ^2.5.3
  # Code generation
  build_runner: ^2.13.1
  intl_utils: ^2.8.14
  flutter_gen_runner: ^5.13.0
  # dart run flutter_launcher_icons -f flutter_launcher_icons.yaml
  flutter_launcher_icons: ^0.14.4
  # dart run flutter_native_splash:create --path=flutter_native_splash.yaml
  flutter_native_splash: ^2.4.7
  vector_graphics_compiler: ^1.2.0

  # Lints
  flutter_lints: ^6.0.0
  prefer_shorthands: ^0.4.7

flutter:
  generate: true
  uses-material-design: true

  assets:
    - assets/images/
    - assets/icons/
    - assets/vectors/
    - config/

  fonts:
    - family: Inter
      fonts:
        - asset: assets/fonts/Inter/Inter-VariableFont.ttf
        - asset: assets/fonts/Inter/Inter-Italic-VariableFont.ttf
          style: italic

    - family: SF Pro Display
      fonts:
        - asset: assets/fonts/sf/SF-Pro-Display-Regular.otf
        - asset: assets/fonts/sf/SF-Pro-Display-Medium.otf
        - asset: assets/fonts/sf/SF-Pro-Display-Semibold.otf
        - asset: assets/fonts/sf/SF-Pro-Display-Bold.otf
        - asset: assets/fonts/sf/SF-Pro-Display-Heavy.otf
        - asset: assets/fonts/sf/SF-Pro-Display-Black.otf

flutter_intl:
  enabled: true
  class_name: GeneratedLocalization
  main_locale: ru
  arb_dir: lib/src/core/localization
  output_dir: lib/src/core/localization/generated
  use_deferred_loading: false
  line_length: 120

flutter_gen:
  output: lib/src/core/constant/gen
  line_length: 120

  integrations:
    flutter_svg: true

workspace:
  - package/local_source
```

## 2. LIB/ DARAXT STRUKTURASI
```
lib/main.dart
lib/src/common/constant/constants.dart
lib/src/common/data/enums/bloc_status_enum.dart
lib/src/common/data/models/.gitkeep
lib/src/common/extensions/context_ext.dart
lib/src/common/extensions/date_time_ext.dart
lib/src/common/extensions/extensions.dart
lib/src/common/extensions/list_ext.dart
lib/src/common/extensions/object_ext.dart
lib/src/common/extensions/string_ext.dart
lib/src/common/widget/network_connection_widget.dart
lib/src/common/widget/responsive_builder.dart
lib/src/core/app/app.dart
lib/src/core/app/app_init.dart
lib/src/core/app/initialization.dart
lib/src/core/app/splash_screen.dart
lib/src/core/auth/auth_session_notifier.dart
lib/src/core/constant/app_constants.dart
lib/src/core/constant/config.dart
lib/src/core/constant/gen/assets.gen.dart
lib/src/core/constant/gen/fonts.gen.dart
lib/src/core/constant/urls.dart
lib/src/core/di/injection.dart
lib/src/core/error/api_error_message_extractor.dart
lib/src/core/error/error_handler.dart
lib/src/core/error/error_util.dart
lib/src/core/error/failure.dart
lib/src/core/localization/generated/app_localizations.dart
lib/src/core/localization/generated/app_localizations_en.dart
lib/src/core/localization/generated/app_localizations_ru.dart
lib/src/core/localization/generated/app_localizations_uz.dart
lib/src/core/localization/generated/intl/messages_all.dart
lib/src/core/localization/generated/intl/messages_en.dart
lib/src/core/localization/generated/intl/messages_ru.dart
lib/src/core/localization/generated/intl/messages_uz.dart
lib/src/core/localization/generated/l10n.dart
lib/src/core/localization/intl_en.arb
lib/src/core/localization/intl_ru.arb
lib/src/core/localization/intl_uz.arb
lib/src/core/localization/localization.dart
lib/src/core/network/interceptors/refresh_token_interceptor.dart
lib/src/core/router/routes.dart
lib/src/core/shared/feature/data/.gitkeep
lib/src/core/shared/feature/data/model/.gitkeep
lib/src/core/shared/feature/data/repository/.gitkeep
lib/src/core/shared/feature/domain/.gitkeep
lib/src/core/shared/feature/domain/entity/.gitkeep
lib/src/core/shared/feature/domain/repository/.gitkeep
lib/src/core/shared/feature/domain/usecase/.gitkeep
lib/src/core/shared/settings/data/repository/settings_repository_impl.dart
lib/src/core/shared/settings/domain/repository/settings_repository.dart
lib/src/core/shared/settings/presentation/bloc/settings_cubit.dart
lib/src/core/shared/settings/presentation/bloc/settings_state.dart
lib/src/core/theme/extension/text_style_ext.dart
lib/src/core/theme/theme_colors.dart
lib/src/core/theme/theme_data.dart
lib/src/core/theme/theme_text_style.dart
lib/src/core/widget/button/custom_button.dart
lib/src/core/widget/button/custom_button.dart.example
lib/src/core/widget/button/custom_icon_button.dart
lib/src/core/widget/button/custom_icon_button.dart.example
lib/src/core/widget/cached_image_view.dart
lib/src/core/widget/custom_app_bar.dart
lib/src/core/widget/custom_tab_bar.dart
lib/src/core/widget/custom_text_field.dart
lib/src/core/widget/dialog/.gitkeep
lib/src/core/widget/sheet/.gitkeep
lib/src/core/widget/shimmer_widget.dart
lib/src/features/auth/data/datasources/local/auth_local_data_source.dart
lib/src/features/auth/data/models/auth_session_model.dart
lib/src/features/auth/data/models/user_model.dart
lib/src/features/auth/data/repository/auth_repository_impl.dart
lib/src/features/auth/domain/entities/auth_session_entity.dart
lib/src/features/auth/domain/entities/user_entity.dart
lib/src/features/auth/domain/error/auth_exceptions.dart
lib/src/features/auth/domain/repository/auth_repository.dart
lib/src/features/auth/domain/usecase/login_use_case.dart
lib/src/features/auth/domain/usecase/logout_use_case.dart
lib/src/features/auth/presentation/bloc/auth_cubit.dart
lib/src/features/auth/presentation/bloc/auth_cubit_state.dart
lib/src/features/auth/presentation/screen/login_screen.dart
lib/src/features/auth/presentation/state/login_state.dart
lib/src/features/home/data/repository/home_repository_impl.dart
lib/src/features/home/domain/entities/home_item_entity.dart
lib/src/features/home/domain/repository/home_repository.dart
lib/src/features/home/domain/usecase/get_home_items_use_case.dart
lib/src/features/home/presentation/cubit/home_cubit.dart
lib/src/features/home/presentation/cubit/home_cubit_state.dart
lib/src/features/home/presentation/screen/home_screen.dart
lib/src/features/journal/data/repository/journal_repository_impl.dart
lib/src/features/journal/domain/entities/journal_entry_entity.dart
lib/src/features/journal/domain/repository/journal_repository.dart
lib/src/features/journal/domain/usecase/get_journal_entries_use_case.dart
lib/src/features/journal/presentation/cubit/journal_cubit.dart
lib/src/features/journal/presentation/cubit/journal_cubit_state.dart
lib/src/features/journal/presentation/screen/journal_screen.dart
lib/src/features/main/presentation/screen/main_screen.dart
lib/src/features/main/presentation/state/main_screen_state.dart
lib/src/features/profile/data/repository/profile_repository_impl.dart
lib/src/features/profile/domain/entities/profile_entity.dart
lib/src/features/profile/domain/repository/profile_repository.dart
lib/src/features/profile/domain/usecase/get_profile_use_case.dart
lib/src/features/profile/presentation/cubit/profile_cubit.dart
lib/src/features/profile/presentation/cubit/profile_cubit_state.dart
lib/src/features/profile/presentation/screen/profile_screen.dart
```

## 3. ROOT FAYLLAR — har birini to'liq yoz:

### analysis_options.yaml
```yaml
include: package:flutter_lints/flutter.yaml

plugins:
  prefer_shorthands: ^0.4.7

prefer_shorthands:
  convert_implicit_declaration: true

formatter:
  page_width: 120

analyzer:
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"
    - "lib/src/core/localization/generated/**"
    - "lib/src/core/constant/gen/**"
    - "packages/**"
    - "package/**"

linter:
  rules:
    avoid_print: true
    prefer_single_quotes: false
    prefer_const_constructors: true
    prefer_relative_imports: true
    prefer_expression_function_bodies: true
```

### .gitignore
```
# Miscellaneous
*.class
*.log
*.pyc
*.swp
.DS_Store
.atom/
.build/
.buildlog/
.history
.svn/
.swiftpm/
migrate_working_dir/

# IntelliJ related
*.iml
*.ipr
*.iws
.idea/

# The .vscode folder contains launch configuration and tasks you configure in
# VS Code which you may wish to be included in version control, so this line
# is commented out by default.
#.vscode/

# Flutter/Dart/Pub related
**/doc/api/
**/ios/Flutter/.last_build_id
.dart_tool/
.flutter-plugins-dependencies
.pub-cache/
.pub/
/build/
/coverage/

# Symbolication related
app.*.symbols

# Obfuscation related
app.*.map.json

# Android Studio will place build artifacts here
/android/app/debug
/android/app/profile
/android/app/release

# FVM Version Cache
.fvm/
```

### Makefile
```makefile
.PHONY: help
help: # Script description and usage through `make` or `make help` commands
	$(MAKE) -C ./tools/makefile/ -f deploy.mk help-deploy
	$(MAKE) -C ./tools/makefile/ -f git.mk help-git
	$(MAKE) -C ./tools/makefile/ -f pub.mk help-pub

-include tools/makefile/deploy.mk tools/makefile/git.mk tools/makefile/pub.mk
```

### l10n.yaml
```yaml
arb-dir: lib/src/core/localization
template-arb-file: intl_en.arb
output-dir: lib/src/core/localization/generated
output-localization-file: app_localizations.dart
output-class: AppLocalizations
```

### .fvmrc
```
{
  "flutter": "3.41.6"
}
```

### .cursorrules
```
# Flutter Clean Architecture — Cursor Rules

This project uses Flutter with Clean Architecture, BLoC/Cubit, and feature-first organization. Follow these rules without exception when generating or completing code.

## Project Structure

```
lib/
  main.dart
  src/
    common/                    # shared, non-core helpers (extensions, generic widgets)
      extensions/
      widget/
    core/                      # cross-cutting infrastructure
      app/
      auth/                    # session notifier, auth state singleton
      di/injection.dart        # get_it: shared services + invokes each feature's di/ module
      error/                   # shared failures, error mappers
      localization/
      network/                 # dio, interceptors
      router/routes.dart       # go_router config
      shared/                  # shared feature-like modules (settings, etc.)
      theme/
      widget/                  # design system widgets
    features/
      <feature>/
        data/
          datasources/
            local/             # hive, shared_preferences wrappers
            remote/            # retrofit clients
          models/              # JSON DTOs with toEntity()
          repository/          # <feature>_repository_impl.dart
        domain/
          entities/            # pure Dart objects
          error/               # typed exceptions
          repository/          # abstract interfaces
          usecase/             # one file per use case
        presentation/
          bloc/                # or cubit/
          screen/
          state/               # State<T> mixins for screens
          widget/              # feature-local widgets
        di/                    # GetIt registration for this feature only (called from core/di)
```

## File Placement Rules

When the user asks for something, place it as follows. Never put a file in the wrong layer.

| Artifact                          | Path                                                                          |
| --------------------------------- | ----------------------------------------------------------------------------- |
| New feature                       | `lib/src/features/<feature>/`                                                 |
| Entity (pure Dart)                | `features/<feature>/domain/entities/<name>_entity.dart`                       |
| Repository interface              | `features/<feature>/domain/repository/<feature>_repository.dart`              |
| UseCase                           | `features/<feature>/domain/usecase/<verb>_<noun>_use_case.dart`               |
| Domain exception                  | `features/<feature>/domain/error/<feature>_exceptions.dart`                   |
| DTO model                         | `features/<feature>/data/models/<name>_model.dart`                            |
| Repository implementation         | `features/<feature>/data/repository/<feature>_repository_impl.dart`           |
| Remote data source                | `features/<feature>/data/datasources/remote/<feature>_remote_data_source.dart`|
| Local data source                 | `features/<feature>/data/datasources/local/<feature>_local_data_source.dart`  |
| Cubit                             | `features/<feature>/presentation/cubit/<feature>_cubit.dart`                  |
| Cubit state                       | `features/<feature>/presentation/cubit/<feature>_cubit_state.dart`            |
| Screen                            | `features/<feature>/presentation/screen/<name>_screen.dart`                   |
| Screen state mixin                | `features/<feature>/presentation/state/<name>_state.dart`                     |
| Feature-local widget              | `features/<feature>/presentation/widget/<name>_widget.dart`                   |
| Feature DI module                 | `features/<feature>/di/<feature>_injection.dart` (registers only that feature) |
| Design-system widget              | `core/widget/<category>/<name>.dart`                                          |
| Test                              | `test/features/<feature>/<layer>/<name>_test.dart`                            |

## Naming

- Files: `snake_case.dart`. Class suffix must match file suffix (`_cubit.dart` → `class XCubit`).
- Classes: `PascalCase`. Methods/variables: `lowerCamelCase`. Constants: `lowerCamelCase`, `k`-prefix only for file-local hardcoded values.
- Enums: cases are `lowerCamelCase`.
- Private: leading underscore. Use it aggressively for non-exposed members.

## Imports

Generate imports in this order, each group separated by one blank line:
1. `dart:*`
2. `package:flutter/*`
3. Third-party `package:*`
4. Workspace `package:<workspace_pkg>/*`
5. Relative `../`, `./`

Alphabetize within each group. Inside `lib/src/`, use relative imports. Across workspace packages (`packages/...`), use `package:` imports.

## State Management

- Default to `Cubit`. Use `Bloc` only when event transformers are needed.
- One state class per cubit, modeled as:

```dart
@immutable
final class XCubitState {
  const XCubitState({
    this.status = Status.initial,
    this.action = XAction.none,
    this.data,
    this.errorMessage,
  });

  final Status status;
  final XAction action;
  final DataType? data;
  final String? errorMessage;

  XCubitState copyWith({Status? status, XAction? action, DataType? data, String? errorMessage}) =>
      XCubitState(
        status: status ?? this.status,
        action: action ?? this.action,
        data: data ?? this.data,
        errorMessage: errorMessage,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is XCubitState &&
          status == other.status &&
          action == other.action &&
          data == other.data &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode => Object.hash(status, action, data, errorMessage);
}
```

- Always use the shared `Status` enum (`initial, loading, success, error`) from `common/data/enums/`.
- Cubit method template:

```dart
Future<void> doSomething(...) async {
  if (state.status.isLoading) return;
  emit(state.copyWith(status: .loading, action: .someAction, errorMessage: null));
  try {
    final result = await _someUseCase(...);
    emit(state.copyWith(status: .success, action: .someAction, data: result));
  } on KnownDomainException catch (e) {
    emit(state.copyWith(status: .error, action: .someAction, errorMessage: e.toString()));
  } catch (e) {
    emit(state.copyWith(status: .error, action: .someAction, errorMessage: e.toString()));
  }
}
```

- Cubits never depend on repositories directly. Inject UseCases.
- Cubits never import `flutter/material.dart` or `BuildContext`.

## UseCase Template

Always single `call()` method:

```dart
final class DoSomethingUseCase {
  const DoSomethingUseCase({required SomeRepository repository}) : _repository = repository;
  final SomeRepository _repository;

  Future<ResultEntity> call({required ParamType param}) => _repository.doSomething(param);
}
```

Do not put logic in a UseCase that the repository should own. UseCases orchestrate; repositories execute.

## Repository Template

```dart
// domain/repository/x_repository.dart
abstract interface class XRepository {
  Future<XEntity> fetch();
  Future<void> save(XEntity entity);
}

// data/repository/x_repository_impl.dart
final class XRepositoryImpl implements XRepository {
  const XRepositoryImpl({required XRemoteDataSource remote, required XLocalDataSource local})
    : _remote = remote, _local = local;

  final XRemoteDataSource _remote;
  final XLocalDataSource _local;

  @override
  Future<XEntity> fetch() async {
    final XModel model = await _remote.fetch();
    await _local.cache(model);
    return model.toEntity();
  }

  @override
  Future<void> save(XEntity entity) => _remote.save(XModel.fromEntity(entity));
}
```

## Model Template (freezed required for multi-field models)

```dart
@freezed
class XModel with _$XModel {
  const factory XModel({
    required String id,
    required String name,
    @Default(false) bool isActive,
  }) = _XModel;

  factory XModel.fromJson(Map<String, dynamic> json) => _$XModelFromJson(json);

  const XModel._();

  XEntity toEntity() => XEntity(id: id, name: name, isActive: isActive);
}
```

Rules:
- Models with ≥2 fields → freezed + json_serializable.
- Single-field DTOs may be hand-written.
- Every model exposes `toEntity()`. Models never leak past the data layer.
- Run `dart run build_runner build --delete-conflicting-outputs` after changing freezed/json classes.

## Entity Template

Pure Dart, immutable, no Flutter imports:

```dart
final class XEntity {
  const XEntity({required this.id, required this.name});

  final String id;
  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is XEntity && id == other.id && name == other.name;

  @override
  int get hashCode => Object.hash(id, name);
}
```

For complex entities, prefer freezed in domain (still pure-Dart compatible).

## Screen Template

```dart
class XScreen extends StatefulWidget {
  const XScreen({super.key});

  @override
  State<XScreen> createState() => _XScreenState();
}

class _XScreenState extends XScreenState {
  @override
  Widget build(BuildContext context) => BlocConsumer<XCubit, XCubitState>(
    listenWhen: (previous, current) => previous.status != current.status,
    listener: (context, state) {
      if (state.status.isError) context.showErrorSnackBar(state.errorMessage ?? 'Error');
    },
    builder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('X')),
      body: _Body(state: state),
    ),
  );
}
```

Move imperative state, controllers, focus nodes, and form validation into the `state/` mixin (`abstract class XScreenState extends State<XScreen>`).

## Dependency Injection

- **Per feature:** each feature owns its registrations in `features/<feature>/di/<feature>_injection.dart` (or equivalent), e.g. `void registerFeatureDependencies(GetIt sl) { ... }` containing only that feature’s data sources, repositories, use cases, and cubits.
- **Core composition:** `core/di/injection.dart` registers app-wide/shared services, then calls each feature’s registrar (in a documented order). Do not put feature B’s `register*` logic inside feature A’s module.

Example feature module:

```dart
void registerXDependencies(GetIt sl) {
  sl.registerLazySingleton<XRemoteDataSource>(() => XRemoteDataSourceImpl(dio: sl()));
  sl.registerLazySingleton<XRepository>(() => XRepositoryImpl(remote: sl(), local: sl()));
  sl.registerLazySingleton<DoSomethingUseCase>(() => DoSomethingUseCase(repository: sl()));
  sl.registerFactory<XCubit>(() => XCubit(doSomethingUseCase: sl()));
}
```

Rules:
- Repositories, data sources, use cases → `registerLazySingleton`.
- Cubits → `registerFactory` (new instance per provider).
- When `injectable` is used, prefer `@injectable` / `@LazySingleton()` annotations and run `build_runner`.

## Navigation

- Routes are declared in `core/router/routes.dart` inside `sealed class AppRouter`.
- Route paths are `static const String` fields on `AppRouter`.
- Use `ShellRoute` to share blocs across grouped routes (auth shell, main shell).
- Use `context.go(AppRouter.x)` for replacement, `context.push(AppRouter.x)` for stack.
- Reactive redirect via `refreshListenable: sl<AuthSessionNotifier>()`.

## Error Handling

- Domain exceptions in `features/<feature>/domain/error/<feature>_exceptions.dart`.
- Data layer translates infrastructure errors (DioException, HiveError) → domain exceptions. Never propagate `DioException` past the data layer.
- Cubits catch and emit `errorMessage`. UI displays it. No try/catch in widgets.

## Linting & Formatting

- `flutter analyze` must be clean before commit. Treat info-level warnings as errors when they appear in code you touched.
- 120-column line length (matches `analysis_options.yaml`).
- Single quotes for strings.
- Trailing commas on multi-line collections, parameter lists, and constructor arguments — they drive the auto-formatter.
- Use `const` constructors everywhere possible.
- Use enum shorthand syntax (`.loading` instead of `Status.loading`) when the type is inferred (this project has `prefer_shorthands` enabled).
- No `print()` in committed code. Use a logger.
- No `// TODO` or `// FIXME` without a tracking issue link or an owner prefix (`// TODO(name):`, `// FIXME(name):`).

## Comments

- Default: no comments. Names should explain.
- Add a comment only when the *why* is non-obvious: a hidden invariant, a workaround for a known bug, a constraint from an external system.
- When work is incomplete or intentionally wrong, leave `// TODO` (deferred/missing work) or `// FIXME` (known defect or temporary hack) at that line, with the same owner-or-issue rule as in Linting.
- No "what" comments. No restating the code in prose.
- No multi-paragraph docstrings on internal classes.

## Generated Files

Never hand-edit:
- `*.g.dart`
- `*.freezed.dart`
- `*.gen.dart`
- `lib/src/core/localization/generated/`
- `lib/src/core/constant/gen/`

Regenerate via:
- `dart run build_runner build --delete-conflicting-outputs` for freezed/json/injectable/retrofit.
- `flutter gen-l10n` for localization.
- `dart run flutter_gen` for assets.

## When Completing Code

- If asked to "add a feature X", scaffold the full `data/domain/presentation` tree plus `di/` with feature-local GetIt registration, wire that module from `core/di/injection.dart`, add a route, and stub a screen. Do not create just the screen.
- If asked to "fetch data from API", create remote data source + retrofit interface + model + repository impl + use case + cubit method. Don't shortcut by calling Dio from a cubit.
- If asked for a "form", put `TextEditingController`s in a `state/` mixin, not directly in the screen.
- If asked to "save locally", create a local data source. Cubits never touch `SharedPreferences` or `Hive` directly.

## Anti-patterns (auto-reject)

- `setState` in a screen that has a Cubit.
- Repository called directly from a Cubit.
- Model imported in `presentation/`.
- `Navigator.of(context).push(...)` instead of `go_router`.
- Catching `Exception` or `Object` broadly to silence errors.
- `dynamic` in public APIs.
- `late` without a clear lifecycle reason (prefer nullable or constructor injection).
- Business logic in widgets.
- New singleton via `static` instead of registering in `get_it`.
- Hardcoded user-facing strings in projects that have l10n configured.
```

### AGENTS.md
```markdown
# AGENTS.md

## Project: (Flutter)

This document defines development standards, architecture rules, and agent behavior for the Astir TV Flutter application.

---

# 1. Core Principles

All development must follow:

- **SOLID**
- **KISS (Keep It Simple, Stupid)**
- **DRY (Don't Repeat Yourself)**

General rules:
- Avoid over-engineering
- Prefer readability over cleverness
- Write maintainable and scalable code
- Every solution must be production-ready

---

# 2. Architecture

## 2.1 Architecture Style
- **Clean Architecture**
- **Feature-based structure**

## 2.2 Layers

Each feature must be divided into:

```
presentation/
domain/
data/
```

### Responsibilities:

- **Presentation**
  - UI
  - Bloc / Cubit / ValueNotifier
- **Domain**
  - Business logic
  - Use cases
  - Entities (must follow naming convention: `[Name]Entity`)
- **Data**
  - API calls
  - Local storage
  - Repositories implementation

---

# 3. State Management Rules

State management must follow strict scope-based usage:

| Scope | Tool | Usage |
|------|------|------|
| Large logic | Bloc | Complex flows, multiple states |
| Medium logic | Cubit | Feature-level state |
| Small logic | ValueNotifier | UI-only state |

## Rules:
- Do NOT mix Bloc and Cubit in the same feature unnecessarily
- ValueNotifier is only for UI-level ephemeral state
- Business logic must NOT be placed inside UI widgets
- **Use Single State Pattern**: Prefer a single state class for each Cubit/Bloc (use `copyWith` and `operator ==`)
- **Use Common Status Enum**: Use the `Status` enum from `lib/src/common/enum/bloc_status_enum.dart` for state tracking (initial, loading, success, error)
- Presentation layer MUST access Bloc/Cubit through provider context (`context.read`, `context.watch`, `context.select`) when provided in the widget tree
- Presentation layer MUST NOT call `di<Bloc/Cubit>()` directly when a provider-scoped instance exists
- Initial screen-level data loading MUST start in `*ScreenState.initState` and MUST be guarded by a status check (for example `Status.initial`) when duplicate fetches are possible

---

## 3.1 Screen-Based State Pattern (MANDATORY)

Each screen must have its **own dedicated state class**. This ensures clear separation between UI and logic, and keeps features modular and maintainable.

### Structure:
```
presentation/
 ├── screen/
 │     ├── onboarding_screen.dart
 │
 ├── state/
 │     ├── onboarding_screen_state.dart
```

### Rules:
- Each screen MUST have a corresponding `*ScreenState` class
- State class must extend `State<Screen>`
- All UI logic (controllers, notifiers, handlers) must be placed inside the state class
- UI (Widget build) must remain clean and declarative
- `*ScreenState` MUST own first-load bootstrap logic (for example `get...Data()` / `add(Get...Event())`) inside `initState`
- `*ScreenState` MUST resolve Bloc/Cubit from provider context, not direct service locator calls, when provider scope is available

### Responsibilities of ScreenState:
- Controllers (e.g. PageController, ScrollController)
- Local state (ValueNotifier, etc.)
- UI event handlers (onTap, onPageChanged, etc.)
- Lifecycle management (initState, dispose)

### Example Pattern:
```
abstract class OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController pageController;
  late final ValueNotifier<int> currentPageIndex;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    currentPageIndex = ValueNotifier(0);
  }

  @override
  void dispose() {
    pageController.dispose();
    currentPageIndex.dispose();
    super.dispose();
  }

  void onPageChanged(int index) => currentPageIndex.value = index;
}
```

### Benefits:
- Separation of UI and logic
- Easier testing and refactoring
- Cleaner widgets
- Scalable for large features

### Anti-Patterns:
- Placing controllers directly inside Widget class
- Mixing UI and logic in build method
- Reusing one state across multiple screens
- Triggering first-load network/mock fetches directly in `build`
- Direct `di<Bloc/Cubit>()` access in screen/state classes where a provider-scoped instance is available

---

---

# 4. Dependency Injection

## Tool:
- **GetIt**

## Rules:
- **Feature-scoped registration:** each feature owns its GetIt wiring in a module under that feature (for example `lib/src/features/<feature>/di/<feature>_injection.dart`) and exposes a single entry point (e.g. `registerXDependencies(GetIt sl)`) that registers only that feature’s types (data sources, repositories, use cases, cubits/blocs).
- **`core/di/` composes the graph:** shared/core services (e.g. `Dio`, `LocalSource`, app-wide notifiers) are registered in `core/di/`, which then calls each feature’s registration function in a defined order. Do not register another feature’s dependencies from a different feature’s module.
- Use `registerLazySingleton` by default for stateless shared services (repositories, data sources, clients)
- Bloc/Cubit MUST be registered with `registerFactory` unless a documented lifecycle exception exists
- DI lifecycle intent MUST be explicit: UI state managers use `registerFactory`, shared stateless services use singleton/lazy singleton
- Avoid global mutable state
- Feature-specific dependencies MUST stay inside that feature’s DI module (plus the core composition file)

---

# 5. Networking

## Tool:
- **Dio**

## Structure:
```
core/network/
```

## Rules:
- All API calls must go through a centralized client
- Use interceptors for:
  - Authentication
  - Logging
  - Error handling
- Do NOT call Dio directly from UI or Bloc

---

# 6. Data & Models

## Code Generation:
- ❌ Do NOT use Freezed
- ❌ Do NOT use json_serializable

## Rules:
- All models must be written manually
- Each model must implement:
  - `fromJson`
  - `toJson`
- All entities must follow the naming convention: `[Name]Entity` (e.g., `HomeItemEntity`)
- Large mappings should be extracted into mapper classes

---

# 7. Local Storage

## Tools:
- **SharedPreferences**
- **Drift**

## Rules:

### SharedPreferences:
- Tokens
- Flags
- Simple key-value data

### Drift:
- Offline mode
- Cached content
- Structured data (e.g. watch history)

---

# 8. Routing

## Tool:
- **GoRouter**

## Rules:
- All routes must be centralized
- Use named routes
- Support deep linking
- Feature-scoped providers MUST be attached at route boundaries (`GoRoute` / `ShellRoute`) with `BlocProvider` / `MultiBlocProvider`
- App-wide providers MUST be attached at app root, while feature-specific providers MUST stay scoped to their feature route tree

---

# 9. Video Player

## Tool:
- **Better Player**

## Rules:
- Player logic must be isolated in `features/player`
- UI and playback logic must be separated

---

# 10. Error Handling

## Strategy:
Centralized error handling

## Flow:
```
API → Exception → Repository → Failure → Bloc → UI
```

## Rules:
- Do NOT expose raw exceptions to UI
- Always map errors to a `Failure` model

---

# 11. Logging

- Development: detailed logs
- Production: minimal logs
- Sensitive data must NOT be logged

---

# 12. Performance Guidelines

- Minimize widget rebuilds
- Use `const` constructors where possible
- Use pagination for large data
- Cache images and API responses

---

# 13. Testing

Minimum required:
- Bloc tests
- Repository tests

Optional:
- Widget tests

---

# 14. Folder Structure (Example)

```
core/
 ├── di/
 ├── network/
 ├── storage/

features/
 ├── home/
 │    ├── presentation/
 │    ├── domain/
 │    ├── data/
 │    ├── di/            # GetIt registration for this feature (called from core/di)
```

---

# 15. Code Review Rules

Before merging:

- No duplicated logic
- No unused code
- Clear naming
- Proper separation of concerns
- No business logic inside UI

---

# 16. Anti-Patterns (Strictly запрещено)

- Calling API directly from UI
- Mixing multiple state management types randomly
- Using global mutable variables
- Copy-paste coding without abstraction
- Overusing ValueNotifier for complex logic
- Direct `di<Bloc/Cubit>()` usage inside presentation (`screen/`, `state/`, widget UI) when a provider-scoped instance exists
- Registering Bloc/Cubit as lazy singleton/singleton by default without documented lifecycle need

---

# 17. Decision Making

When unsure:

1. Choose the simplest working solution
2. Prefer consistency over novelty
3. Align with existing architecture
4. Ask clarification before implementing

---

# 18. Agent Behavior

When assisting in development:

- Always think as a **Senior Engineer**
- Provide **practical and implementable solutions**
- Ask clarifying questions if requirements are unclear
- Focus on:
  - performance
  - scalability
  - maintainability

---

# 19. UI-First Development & Backend Integration Strategy

The project will initially be developed **without a backend**. All UI must be built in a way that allows seamless backend integration later with **minimal code changes**.

## Core Principles:
- UI must NOT depend on real API implementations
- All external data must go through abstractions
- Replaceable data sources must be used from the beginning

## Required Architecture Rules:

### 1. Repository Abstraction (MANDATORY)
- Always define repository interfaces in the **domain layer**
- UI and Bloc must depend ONLY on interfaces

Example:
```
abstract class MovieRepository {
  Future<List<Movie>> getMovies();
}
```

---

### 2. Data Source Separation
Each repository must support multiple data sources:

```
data/
 ├── datasources/
 │     ├── remote/
 │     ├── local/
 │     ├── mock/
```

---

### 3. Mock / Fake Data (Initial Phase)
- All features must use **mock data sources** initially
- Mock data must simulate real API structure
- Avoid hardcoding data directly inside UI

Example:
```
class MockMovieRepository implements MovieRepository {
  @override
  Future<List<Movie>> getMovies() async {
    return mockMovies;
  }
}
```

---

### 4. API Contract Awareness
- Models must be designed close to expected backend response
- Avoid UI-specific models leaking into domain
- Prepare models for future JSON mapping

---

### 5. Switching to Backend (Future Phase)
When backend is ready:

- Replace mock data source with remote implementation
- Keep repository interface unchanged
- No changes in:
  - UI
  - Bloc/Cubit

---

### 6. Dependency Injection Strategy
- Keep registration **inside the feature** (feature `di/` module + `registerXDependencies`-style entry point); `core/di` only calls those entry points after shared services are ready.
- Register mock implementations initially inside that feature’s module
- Later replace with real API implementations via GetIt in the **same** feature module (repository interface unchanged)

Example (inside `features/movie/di/movie_injection.dart`):
```
void registerMovieDependencies(GetIt sl) {
  sl.registerLazySingleton<MovieRepository>(() => MockMovieRepository());
}
```

Then switch to:
```
void registerMovieDependencies(GetIt sl) {
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));
}
```

---

### 7. Anti-Patterns (Critical)
- DO NOT bind UI directly to mock data
- DO NOT skip repository layer for speed
- DO NOT write logic that depends on static/mock-only behavior

---

### 8. Goal
Ensure that backend integration requires:
- Minimal refactoring
- Zero UI rewrites
- Only data layer replacement

---

---

# 20. Design System & Theme Usage Rules (MANDATORY)

All UI must strictly use the centralized **design system (ThemeData + extensions)**. Direct styling is запрещено.

## Core Rules:
- Always use styles from `context.colors` and `context.textStyles`
- Do NOT hardcode colors, font sizes, or weights
- Do NOT create ad-hoc TextStyle or Color inside widgets

---

## Usage Pattern:

```
Text(
  'Title',
  style: context.textStyles.rubikW500S16,
)
```

```
Container(
  color: context.colors.primary,
)
```

---

## If Required Token Does NOT Exist:

- Create a new token inside:
  - `ThemeColors` OR
  - `ThemeTextStyles`
- Do NOT modify existing tokens
- Do NOT override existing styles

---

## Naming Rules:

- Follow existing naming patterns
- Keep naming consistent across the project

### Example (TextStyle):
```
rubikW500S16
```

Where:
- `rubik` → font family
- `W500` → font weight
- `S16` → font size

---

## Anti-Patterns:

- ❌ `TextStyle(fontSize: 16)` inside widget
- ❌ `Color(0xFF000000)` usage
- ❌ Modifying existing theme tokens
- ❌ Creating duplicate styles with different names

---

## Goal:

- Single source of truth for UI
- Consistent design across the app
- Easy global updates (theme change)

# 21. Dart Language Features

## Dot Shorthands
- **ALWAYS** use dot shorthands for Enums, static fields, and constructors where the type is inferred (e.g., `const .all(8)` instead of `const EdgeInsets.all(8)`, `.center` instead of `Alignment.center`).
- This makes the UI code significantly cleaner, more concise, and easier to read.
- Ensure the `prefer_shorthands` lint rule is active in `analysis_options.yaml` to enforce this.
- Apply this rule to static/top-level calls used in the codebase as well (e.g., `.parse(normalized, radix: 16)` instead of `int.parse(...)`, `.infinity` instead of `double.infinity` when the type is inferred).

---

# 22. Strict Typing (MANDATORY)

The project enforces strict typing to ensure runtime safety and catch type-related issues at compile time.

## Rules:
- **`dynamic` is prohibited** by default across the entire codebase. No exceptions are allowed without a clearly justified reason.
- **Prefer `Object?`** over `dynamic` when a type is unknown.
- **Always use explicit types** for:
  - Maps (e.g., `Map<String, Object?>` instead of `Map<String, dynamic>`)
  - Lists (e.g., `List<String>`)
  - Function parameters and return values
  - Intermediate variables (avoid `var` for non-obvious types)

## Safe Casting Pattern:
When parsing data (e.g., from JSON), avoid direct unsafe casts like `json['items'] as List<dynamic>`. Instead, use safe casting:

- **Avoid**: `e as Map<String, dynamic>`
- **Prefer**: `(e as Map).cast<String, Object?>()`

## Example (JSON Parsing):
```dart
factory HomeSectionEntity.fromJson(Map<String, Object?> json) {
  return HomeSectionEntity(
    id: json['id'] as String,
    items: ((json['items'] as List?) ?? [])
        .map((e) => HomeItemModel.fromJson((e as Map).cast<String, Object?>()))
        .toList(),
  );
}
```

## Goal:
- Eradicate runtime type errors.
- Improve code readability and self-documentation.
- Ensure the compiler can catch type mismatches everywhere.

---

# End of Document
p
```

### CLAUDE.md
```markdown
You are a senior Flutter engineer working on a Flutter codebase that follows Clean Architecture, BLoC/Cubit state management, and feature-first organization. Your job is to write, review, and refactor Dart/Flutter code that is production-grade, testable, and consistent with the patterns already in the repository.

# Architecture (non-negotiable)

The codebase is organized as `lib/src/features/<feature>/{data,domain,presentation}` with a shared `lib/src/core/` and `lib/src/common/`.

Layer rules:
- **domain/**: pure Dart, no Flutter imports, no third-party SDK imports (no dio, no hive, no flutter_bloc). Contains `entities/`, `repository/` (abstract interfaces only), and `usecase/`.
- **data/**: implements `domain/repository/` interfaces. Contains `models/` (DTOs with `fromJson`/`toJson`/`toEntity`), `datasources/{remote,local}/`, and `repository/<feature>_repository_impl.dart`. Models live in data, entities live in domain — never the reverse.
- **presentation/**: contains `bloc/` or `cubit/`, `screen/`, `widget/`, `state/` (mixins for screen-level state). Depends only on `domain/`, never on `data/`.

Dependency direction is strictly `presentation → domain ← data`. If you find yourself importing a data model in presentation, stop and use the entity instead.

# Dependency injection (per feature)

- Each feature **initializes its own GetIt registrations** in a dedicated module under that feature, e.g. `lib/src/features/<feature>/di/<feature>_injection.dart`, exposing something like `void registerFeatureDependencies(GetIt sl)` or `Future<void> registerFeatureDependencies(GetIt sl)` that registers its data sources, repositories, use cases, and cubits for that feature only.
- **`core/di/injection.dart`** (or the app root bootstrap) must **orchestrate only**: register cross-cutting singletons (network client, shared storage, session notifier, etc.), then **invoke each feature’s registration** in a clear order. Do not scatter one feature’s registrations across unrelated modules or inline ad hoc `register*` calls for feature B inside feature A’s code.
- Lifecycle rules stay the same: repositories/data sources/use cases → `registerLazySingleton` (unless you document an exception); cubits/blocs → `registerFactory` by default.

# Naming conventions

- Files: `snake_case.dart`. Suffix by role: `_entity.dart`, `_model.dart`, `_repository.dart`, `_repository_impl.dart`, `_use_case.dart`, `_cubit.dart`, `_cubit_state.dart`, `_screen.dart`, `_widget.dart`.
- Classes: `PascalCase`. Suffix matches file: `UserEntity`, `UserModel`, `AuthRepository`, `AuthRepositoryImpl`, `LoginUseCase`, `AuthCubit`, `AuthCubitState`, `LoginScreen`.
- Private members: leading underscore `_field`, `_method()`. Never expose mutable internals.
- Enum cases: `lowerCamelCase` (`Status.loading`, not `Status.LOADING`).
- Constants: `lowerCamelCase` for top-level, `kPrefixedCamelCase` only for compile-time hardcoded values in implementation files.
- Booleans read like questions: `isLoading`, `hasError`, `canRetry`.

# UseCase pattern

Every domain operation that crosses a layer goes through a UseCase, even single-line ones. UseCases expose a single `call()` method.

```dart
final class LoginUseCase {
  const LoginUseCase({required AuthRepository authRepository}) : _authRepository = authRepository;
  final AuthRepository _authRepository;

  Future<AuthSessionEntity> call({required String username, required String password}) =>
      _authRepository.login(username: username, password: password);
}
```

Cubits depend on UseCases, never on repositories directly. Reason: it makes intent visible at the call site and isolates tests.

# Repository pattern

Abstract interface lives in `domain/repository/`. Implementation lives in `data/repository/`. The interface declares behavior in terms of entities; the impl translates models ↔ entities at the boundary.

```dart
// domain/repository/auth_repository.dart
abstract interface class AuthRepository {
  Future<AuthSessionEntity> login({required String username, required String password});
  Future<void> logout();
  bool get isAuthenticated;
}
```

# BLoC / Cubit rules

- Prefer Cubit unless the feature genuinely needs an event stream (debouncing, transformers, sequential events). Reach for Bloc when `EventTransformer`s like `droppable()` or `restartable()` are needed.
- State classes are `@immutable final class`, with `copyWith`, `==`, and `hashCode`. One state class per cubit, modeled as `{Status status, ...data..., String? errorMessage}`. Use a `Status` enum (`initial, loading, success, error`), not booleans.
- Track which action produced the state when a cubit handles multiple operations: add an `Action` enum (e.g. `AuthAction.login | logout`) so the UI can react selectively in `listenWhen`.
- Cubits never throw. Catch at the cubit boundary, emit `Status.error` with `errorMessage`. Domain exceptions (`InvalidCredentialsException`, etc.) should be caught by type and converted to user-facing strings in the cubit, not in the UI.
- Never put `BuildContext` or `Widget` types in cubits or states.
- Emit only when state actually changes — guard early returns (`if (state.status.isLoading) return;`).

# Error handling

- Domain layer defines typed exceptions in `domain/error/<feature>_exceptions.dart` (`InvalidCredentialsException`, `NotFoundException`). They implement `Exception` and have a meaningful `toString()`.
- Data layer catches infrastructure errors (`DioException`, `HiveError`) and maps them to domain exceptions. Never let `DioException` reach a Cubit.
- Presentation layer reads `state.errorMessage` and displays it. Never `try/catch` in widgets.
- Validation errors (form-level) belong in presentation `state/` mixins, not in cubits.

# UI rules

- Screens are `StatelessWidget` unless they need lifecycle. When they do, extract the State logic into a `State<T>` mixin in `presentation/state/<screen>_state.dart` — keep `screen.dart` purely declarative.
- One widget per file once it exceeds ~40 lines or is used in more than one place.
- Never call `setState` inside a `BlocBuilder`. If you're tempted, the state belongs in the cubit.
- `BlocConsumer` only when you need both `listen` and `build` against the same cubit. Otherwise use `BlocListener` for side effects and `BlocBuilder` for rebuilds.
- Use `listenWhen` / `buildWhen` to scope rebuilds. Default `BlocBuilder` rebuilds are usually a bug waiting to happen.
- Navigation goes through `go_router`. Use `GoRouterHelper(context).go(...)` for replacement, `.push(...)` for stacked routes. Never call `Navigator.of(context).push` directly from a feature screen.

# Testing

- Every UseCase: unit test, mock the repository with `mocktail`.
- Every Cubit: `blocTest` covering happy path, error path, and idempotent calls (calling `login()` while already loading should not double-emit).
- Every repository impl: test the model↔entity mapping and the data source delegation, mocking the data source.
- Widget tests: golden-test screens only when the layout is stable. Otherwise `pumpWidget`, drive the cubit, assert visible text/widgets.
- Test files mirror source path: `lib/src/features/auth/.../login_use_case.dart` ↔ `test/features/auth/.../login_use_case_test.dart`.

# Code generation

- Models with more than ~3 fields, value objects, and union/sealed states use `freezed`. Single-field DTOs can stay hand-written.
- `json_serializable` for JSON; never hand-roll `fromJson` for non-trivial models.
- `injectable` annotations register services; run `build_runner` after changes. Do not hand-edit generated `.g.dart` / `.freezed.dart` files.
- `retrofit` for REST clients in `data/datasources/remote/`. The interface describes endpoints; the generated impl does the HTTP.

# Imports

Order, with a blank line between groups:
1. `dart:`
2. `package:flutter/...`
3. Third-party `package:...`
4. Project-local `package:<name>/...` (only when crossing the `packages/` workspace boundary)
5. Relative imports (`../`, `./`)

Inside each group, alphabetical. Use relative imports within `lib/src/`; use `package:` imports across workspace packages.

# What to refuse / push back on

- Direct `Navigator.push` in feature code → redirect to `go_router`.
- `setState` in a screen that already has a Cubit → move the state into the Cubit.
- Repository called directly from a Cubit → introduce a UseCase.
- Model imported in `presentation/` → use the entity.
- `print()` or `debugPrint()` left in committed code → use a logger or remove.
- Hardcoded strings in UI for anything user-facing (in projects with l10n configured) → use the l10n key.
- Catching `Exception` broadly to swallow errors → catch by type, re-throw or convert.

# Incomplete work (`TODO` / `FIXME`)

When work is not finished in a single change, do not leave empty stubs or unexplained placeholders. Annotate the call site:

- **`TODO`** — missing or deferred implementation; use `// TODO(owner): …` with a concise note or a tracking issue URL.
- **`FIXME`** — known-broken behavior, incorrect logic, or a temporary workaround that must be revisited; use `// FIXME(owner): …` or link the issue.

Bare `// TODO` / `// FIXME` without an owner or issue reference is not acceptable in code intended to merge.

# Response structure

When writing or modifying code:
1. **Plan**: one or two sentences naming the affected layers and files.
2. **Code**: the actual changes. Show full file content for new files, focused diffs for edits.
3. **Notes**: only if a decision is non-obvious — explain the trade-off in one or two lines. Skip if the code is self-explanatory.
4. **Follow-ups**: list only concrete leftover work (missing tests, generation steps like `dart run build_runner build`, migrations). No filler.

When reviewing code, group findings by severity: `Blocking` (correctness/architecture violations), `Should fix` (style/maintenance), `Nitpick` (optional). Quote the file and line. No praise sandwich — be direct.

When refactoring, never change behavior and structure in the same step. Refactor first, behavior change next, in separate diffs.
```

### flutter_launcher_icons.yaml
```yaml
# TODO: add icon path
flutter_launcher_icons:
  image_path: "assets/images/logo.png"
  image_path_android: "assets/images/logo.png"
  image_path_ios: "assets/images/logo.png"
  android: true # can specify file name here e.g. "ic_launcher"
  ios: true # can specify file name here e.g. "My-Launcher-Icon"
  adaptive_icon_background: "assets/images/logo.png" # only available for Android 8.0 devices and above
  adaptive_icon_foreground: "assets/images/logo.png" # only available for Android 8.0 devices and above
  adaptive_icon_foreground_inset: 16 # only available for Android 8.0 devices and above
  adaptive_icon_monochrome: "assets/images/logo.png" # only available for Android 13 devices and above
  min_sdk_android: 21 # android min sdk min:16, default 21
  remove_alpha_ios: true
  background_color_ios: "#ffffff"
  
```

### flutter_native_splash.yaml
```yaml
# Native splash screen (make generate-splash)
# Rasm: PNG, 4x pixel density uchun mo‘ljallangan.
flutter_native_splash:
  color: "#00563B"
  image: "assets/images/splash.png"
  fullscreen: true

  # Android 12+
  android_12:
    color: "#00563B"
    image: "assets/images/splash.png"
    icon_background_color: "#00563B"
```

### devtools_options.yaml
```yaml
description: This file stores settings for Dart & Flutter DevTools.
documentation: https://docs.flutter.dev/tools/devtools/extensions#configure-extension-enablement-states
extensions:
```

### README.md
```markdown
# Initial Project Mobile

A production-grade Flutter starter template built with Clean Architecture, BLoC/Cubit state management, and feature-first organization.

## Overview

This is a minimal yet comprehensive Flutter template designed to serve as a solid foundation for new mobile applications. It demonstrates best practices in Flutter development while remaining simple enough to understand and extend.

**Key Features:**
- ✅ Clean Architecture (domain/data/presentation layers)
- ✅ BLoC/Cubit state management
- ✅ Feature-first project structure
- ✅ Dependency injection with get_it
- ✅ go_router for navigation
- ✅ Mock data (no backend required)
- ✅ Production-ready error handling
- ✅ Comprehensive development guidelines

## Project Structure

```
lib/src/
├── common/              # Shared helpers and extensions
├── core/                # Cross-cutting infrastructure
│   ├── app/
│   ├── auth/
│   ├── di/              # Dependency injection setup
│   ├── error/
│   ├── router/          # Navigation configuration
│   ├── theme/
│   └── widget/          # Design system components
└── features/
    ├── auth/            # Login feature (includes `di/` for feature-local GetIt registration)
    ├── home/            # Home screen
    ├── journal/         # Journal/list screen
    ├── profile/         # Profile & settings
    └── main/            # Main shell with bottom navigation
```

Each feature follows the Clean Architecture pattern:
- `domain/` - Entities, repository interfaces, use cases
- `data/` - Models, data sources, repository implementations
- `presentation/` - UI (screens, widgets), Cubit/BLoC state management
- `di/` *(per feature)* - GetIt registrations for that feature only; composed from `core/di/injection.dart`

## Getting Started

1. **Prerequisites:**
   - Flutter SDK (latest stable)
   - Dart 3.10+
   - IDE with Flutter support (VS Code, Android Studio, or JetBrains)

2. **Setup:**
   ```bash
   # Install dependencies
   flutter pub get

   # Generate code (models, localization, assets)
   dart run build_runner build --delete-conflicting-outputs
   flutter gen-l10n

   # Run the app
   flutter run
   ```

3. **Login Credentials** (template credentials):
   - Username: `udevs`
   - Password: `1234`

4. **Verify Setup:**
   ```bash
   flutter analyze  # Should show no errors
   flutter test     # Run test suite
   ```

## Architecture Overview

### Domain Layer
- **Entities**: Pure Dart immutable objects (no Flutter dependencies)
- **Repositories**: Abstract interfaces defining data contracts
- **Use Cases**: Single-responsibility classes with a `call()` method
- **Errors**: Typed domain exceptions

### Data Layer
- **Models**: JSON-serializable DTOs with `toEntity()` conversions
- **Data Sources**: Remote (API) and local (cache) implementations
- **Repository Implementation**: Coordinates between data sources

### Presentation Layer
- **Cubits**: State management (extends Cubit with BLoC for event transformation)
- **Screens**: Stateful widgets consuming cubits via `BlocConsumer`
- **Widgets**: Feature-local or shared components
- **State Mixins**: Imperative state (controllers, focus nodes, validation)

## Development Guidelines

This project includes comprehensive development rules:

- **[CLAUDE.md](./CLAUDE.md)** - System prompt for Claude AI with architecture rules, patterns, and best practices
- **[.cursorrules](./.cursorrules)** - Cursor IDE configuration for code generation and completion

### Incomplete work (`TODO` / `FIXME`)

If you stop before a feature, fix, or integration is finished, mark the exact spot in code instead of leaving silent stubs:

- **`TODO`** — planned follow-up, missing implementation, or deferred wiring.
- **`FIXME`** — known defect, wrong behavior, or a temporary hack that must be corrected.

Each marker needs a short explanation plus either a tracking issue/ticket link or an owner prefix, for example `// TODO(alex): replace mock when API is ready` or `// FIXME: https://github.com/org/repo/issues/42 — race on fast logout`.

### Key Principles

- **Strict Layer Separation**: Data flows domain ← data ← presentation
- **No Business Logic in Widgets**: Move to Cubits and Use Cases
- **Status Enum Pattern**: Use shared `Status` enum (initial, loading, success, error)
- **Error Handling**: Exceptions caught at cubit boundary, emitted as error messages
- **Navigation**: go_router for type-safe, reactive routing
- **Naming Conventions**:
  - Files: `snake_case.dart` with class suffixes matching file suffixes
  - Classes: `PascalCase`
  - Methods/variables: `lowerCamelCase`
  - Enums: `lowerCamelCase` cases

### Code Generation

Models with ≥2 fields use freezed + json_serializable:
```bash
dart run build_runner build --delete-conflicting-outputs
```

Generated files (never edit manually):
- `*.g.dart` - JSON serialization
- `*.freezed.dart` - Freezed immutability
- `lib/src/core/localization/generated/` - Localization
- `lib/src/core/constant/gen/` - Asset constants

## Extending the Template

To add a new feature:

1. **Create Feature Structure:**
   ```
   lib/src/features/<feature_name>/
   ├── di/                 # Feature-scoped GetIt registration (called from core DI)
   ├── domain/
   │   ├── entities/
   │   ├── repository/
   │   ├── usecase/
   │   └── error/
   ├── data/
   │   ├── datasources/
   │   │   ├── remote/
   │   │   └── local/
   │   ├── models/
   │   └── repository/
   └── presentation/
       ├── cubit/
       ├── screen/
       ├── widget/
       └── state/
   ```

2. **Implement Domain Layer:**
   - Create entities (pure Dart, immutable)
   - Define repository interface
   - Create use cases with single `call()` method

3. **Implement Data Layer:**
   - Create models with `toEntity()` conversions
   - Implement data sources
   - Implement repository

4. **Implement Presentation Layer:**
   - Create cubit with state and business logic
   - Create screens and widgets
   - Extract imperative state to state mixins

5. **Wire Up:**
   - **Dependency injection (per feature):** add a registration module under the feature, for example `lib/src/features/<feature_name>/di/<feature_name>_injection.dart`, that registers that feature’s data sources, repositories, use cases, and cubits (`registerFactory` for cubits). `lib/src/core/di/injection.dart` should only compose bootstrapping: shared/core services (e.g. `Dio`, `LocalSource`) and then call each feature’s registrar—avoid defining another feature’s bindings outside its module.
   - Add routes in `lib/src/core/router/routes.dart`
   - Create BlocProvider bindings in shell routes if needed

### Reference Implementations

Study these existing features as examples:
- **auth**: Simple authentication with cubit
- **home**: Data fetching and list display
- **journal**: Repository pattern with mock data
- **profile**: User information and logout

## Testing

The project includes a widget test in `test/widget_test.dart` that initializes the DI container and verifies the app builds correctly. For comprehensive testing:

- **Unit Tests**: Test use cases and cubits in isolation
- **Widget Tests**: Test screens and widgets with mocked cubits
- **Integration Tests**: Test feature flows end-to-end

## Best Practices

### ✅ Do

- Use const constructors everywhere possible
- Use enum shorthand syntax (`.loading` instead of `Status.loading`) when inferred
- Put TextEditingControllers in state mixins, not screens
- Catch domain exceptions in cubits, emit error messages
- Create local data sources for persistence (never use SharedPreferences in cubits)

### ❌ Don't

- Use `setState` in screens with cubits
- Call repositories directly from cubits (use use cases)
- Import models in presentation layer
- Use Navigator.push directly (use go_router)
- Catch `Exception` or `Object` broadly
- Use `dynamic` in public APIs
- Hardcode user-facing strings in projects with l10n

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [BLoC Library](https://bloclibrary.dev/)
- [go_router Documentation](https://pub.dev/packages/go_router)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) by Robert C. Martin
- [Effective Dart](https://dart.dev/guides/language/effective-dart)

## License

This is a template project. Use and modify freely for your projects.
```

## 4. CONFIG PAPKASI

### config/development.json
```json
{
  "ENVIRONMENT": "development",
  "API_BASE_URL": "https://api.example.com",
  "ENVIRONMENT_ID" :"",
  "PROJECT_ID" :""
}
```

### config/staging.json
```json
{
  "ENVIRONMENT": "staging",
  "API_BASE_URL": "https://api.example.com",
  "ENVIRONMENT_ID" :"",
  "PROJECT_ID" :""
}
```

### config/production.json
```json
{
  "ENVIRONMENT": "production",
  "API_BASE_URL": "https://api.example.com",
  "ENVIRONMENT_ID" :"",
  "PROJECT_ID" :""
}

```

## 5. TOOLS PAPKASI

### tools/dart/vector_generator.dart
```dart
// ignore_for_file: avoid_print
import 'dart:io';

int _newGeneratedVecFilesCount = 0, _existingVecFilesCount = 0, _errorOccurredFilesCount = 0;

void main(List<String> args) async {
  // To determine run time
  final sw = Stopwatch()..start();

  'Creating vector graphic files started...'._printInfo;

  /// Variables
  const vectorFileName = 'vectors';
  final assetsDirectory = Directory('assets/');
  final vecDirectory = Directory('assets/$vectorFileName');

  // Delete existing vector graphic files if regeneration is required
  if ((args.length == 1 && (args[0] == 'true' || args[0] == 't')) && vecDirectory.existsSync()) {
    'assets/vectors directory has been deleted for regeneration...'._printInfo;
    vecDirectory.deleteSync(recursive: true);
  }

  // Check whether assets directory exists
  if (!assetsDirectory.existsSync()) {
    return print('The assets directory does not exists.');
  }

  'Searching .svg files from all\x1B[38;2;220;202;109m assets\x1B[0m directory...'._printInfo;

  // Check whether [vectorFileName] directory exists
  // If does not exists, create new one
  if (!vecDirectory.existsSync()) vecDirectory.createSync(recursive: true);

  // Get all SVG files from assets directories
  final svgFiles = await _getSvgFiles(dir: assetsDirectory);

  // Existing VecFiles without extension. Just basename e.g.:
  // If a file path is 'assets/vectors/icon.vec'
  // path.basenameWithoutExtension() would return 'icon'
  final Set<String> existingVecFiles = .from(
    vecDirectory.listSync().map((e) => e.path.split('.').firstOrNull?.split('/').last),
  );

  // List to store all vector compilation futures
  final vectorGeneratorFutureFunctions = <Future<void>>[];

  'Processing files...'._printInfo;

  // Iterate through all SVG files
  for (final file in svgFiles) {
    final inputFile = file.path;
    final baseName = inputFile.split('.').firstOrNull?.split('/').last;
    final outputFile = '${vecDirectory.path}/$baseName.vec';

    // Skipping if the .vec file already exists
    if (existingVecFiles.contains(baseName)) {
      _existingVecFilesCount++;
      continue;
    }

    vectorGeneratorFutureFunctions.add(_compileVector(inputFile: inputFile, outputFile: outputFile));
  }

  // Compiling all vector files concurrently using Future.wait()
  await Future.wait(vectorGeneratorFutureFunctions);

  '$_existingVecFilesCount existing vector files found and they are skipped'._printInfo;
  '$_errorOccurredFilesCount files failed to compile'._printInfo;
  '$_newGeneratedVecFilesCount new .vec files has been generated'._printInfo;

  // Printing info that with took time
  'All files processed, took: ${(sw.elapsedMilliseconds / 1000).toStringAsFixed(1)}s\n'._printInfo;
}

/// Retrieves all SVG files from the given directory and including its subdirectories
///
/// Returns a list of file which contains SVG files
Future<List<File>> _getSvgFiles({required Directory dir}) async {
  final svgFiles = <File>[];

  await for (final entity in dir.list(recursive: true)) {
    if (entity is File && entity.path.toLowerCase().endsWith('.svg')) {
      svgFiles.add(entity);
    }
  }

  return svgFiles;
}

/// Compiles an SVG file into a VEC file
///
/// [inputFile] The path to the input SVG file
/// [outputFile] The path where the output VEC file should be saved
Future<void> _compileVector({required String inputFile, required String outputFile}) async {
  final result = await Process.run('dart', ['run', 'vector_graphics_compiler', '-i', inputFile, '-o', outputFile]);

  // Print the result of the compilation process
  if (result.exitCode == 0) {
    _newGeneratedVecFilesCount++;
  } else {
    _errorOccurredFilesCount++;
    print('❌ Failed to generate $outputFile. Error: ${result.stderr}');
  }
}

/// [INFO] printer with color
extension _PrinterX on String {
  void get _printInfo => print('\x1B[38;2;70;198;178m[INFO]\x1B[0m $this');
}
```

### tools/makefile/deploy.mk
```makefile
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
# 🚢 PUBLISHING
# ──────────────────────

.PHONY: publish
publish: ## Publish the app to TestFlight
ifeq ($(PLATFORM),windows)
	@echo TestFlight publishing is not supported on Windows. Use macOS with Xcode.
else
	@dart run tools/dart/test_flight_publisher.dart
endif
```

### tools/makefile/fire.mk
```makefile
# ────────────────────
# 🔥 FIREBASE COMMANDS
# ────────────────────
.PHONY: help-fire
help-fire: ## Show all available Firebase-related commands
	@echo 'Usage: make <OPTIONS> ... <TARGETS>'
	@echo ''
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: init-firebase
init-firebase: fire-login configure ## Initialize Firebase for this project

.PHONY: fire-login
fire-login: ## Login and initialize Firebase CLI
	@echo "🔑 Installing Firebase CLI..."
	@(curl -sL https://firebase.tools | bash)
	@echo "🔓 Logging into Firebase..."
#	@(curl -sL https://firebase.tools | upgrade=true bash)
#	@firebase logout
	@firebase login
	@echo "⚙️ Initializing Firebase project..."
	@firebase init

.PHONY: configure
configure: ## Configure FlutterFire for the project
	@echo "📦 Activating flutterfire_cli..."
	@dart pub global activate flutterfire_cli
	@echo "🛠️ Running flutterfire configuration..."
	@flutterfire configure \
		-i uz.xdido.hilol_print \
		-a uz.xdido.hilol_print \
		-p initial_project \
		-e "" \
		-o lib/src/common/constant/firebase_options.g.dart
```

### tools/makefile/git.mk
```makefile
# ───────────────
# 🛠️ GIT COMMANDS
# ───────────────

.PHONY: help-git
help-git: ## Show all available Git-related commands
	@echo 'Usage: make <OPTIONS> ... <TARGETS>'
	@echo ''
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: tag-prod
tag-prod: format ## Create and push a Git tag for production
ifndef m
	$(error ❌ Error: Tag message (m) is required. Usage: make tag-prod m="v1.0.0")
endif
	@echo "🏷️ Creating Git tag: $(m)"
	@git tag -a "${m}" -m "${m}"
	@echo "📤 Pushing tags to remote..."
	@git push origin --tags
```

### tools/makefile/pub.mk
```makefile
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
```

### tools/script/android-settings.sh
```bash
#!/bin/bash

# Define paths for key.properties and keystore (.jks) file
KEY_PROPERTIES_FILE="android/key.properties"
JKS_FILE_PATTERN="*.jks"
JKS_FILE_PATH="android/app"
DEFAULT_KEYSTORE_NAME="release-key.jks"

# Define keystore details
KEYSTORE_PASSWORD="change_me"
KEY_PASSWORD="change_me"
KEY_ALIAS="release"
VALIDITY=10000

# Check if key.properties file exists
if [ -f "$KEY_PROPERTIES_FILE" ]; then
    echo "✅ key.properties file found at $KEY_PROPERTIES_FILE"
else
    echo "❌ key.properties file not found."
    echo "Generating a default key.properties file..."

    # Generate default key.properties file
    cat <<EOL > $KEY_PROPERTIES_FILE
storePassword=$KEYSTORE_PASSWORD
keyPassword=$KEY_PASSWORD
keyAlias=$KEY_ALIAS
storeFile=$DEFAULT_KEYSTORE_NAME
EOL
    echo "✅ Default key.properties file created at $KEY_PROPERTIES_FILE"
fi

# Check if .jks file exists in the specified path
JKS_FILE=$(find "$JKS_FILE_PATH" -name "$JKS_FILE_PATTERN" -print -quit)

if [ -n "$JKS_FILE" ]; then
    echo "✅ Keystore file (.jks) found at $JKS_FILE"
else
    echo "❌ Keystore file (.jks) not found."

    # Generate a new keystore
    echo "Generating a new keystore..."
    keytool -genkey -v \
        -keystore "$JKS_FILE_PATH/$DEFAULT_KEYSTORE_NAME" \
        -keyalg RSA \
        -keysize 2048 \
        -validity $VALIDITY \
        -alias $KEY_ALIAS \
        -storepass $KEYSTORE_PASSWORD \
        -keypass $KEY_PASSWORD \
        -dname "CN=Unknown, OU=Unknown, O=Unknown, L=Unknown, ST=Unknown, C=Unknown"

    if [ $? -eq 0 ]; then
        echo "✅ New keystore generated at $JKS_FILE_PATH/$DEFAULT_KEYSTORE_NAME"
    else
        echo "❌ Failed to generate new keystore"
    fi
fi

echo "All necessary checks and setups are done."
```

## 6. PACKAGE — local_source

```
package/local_source/.dart_tool/pub/workspace_ref.json
package/local_source/.flutter-plugins-dependencies
package/local_source/.gitignore
package/local_source/.metadata
package/local_source/analysis_options.yaml
package/local_source/lib/local_source.dart
package/local_source/lib/src/interface/session_data_source.dart
package/local_source/lib/src/interface/settings_data_source.dart
package/local_source/lib/src/interface/user_data_source.dart
package/local_source/lib/src/local_source.dart
package/local_source/lib/src/preference_dao/preference_entry.dart
package/local_source/lib/src/utils/extensions.dart
package/local_source/lib/src/utils/secure_store.dart
package/local_source/pubspec.yaml
```

### package/local_source/analysis_options.yaml
```yaml
include: ../../analysis_options.yaml

analyzer:
  exclude:
    - "**/*.g.dart"
```

### package/local_source/lib/local_source.dart
```dart
export 'src/local_source.dart';
export 'src/preference_dao/preference_entry.dart';
```

### package/local_source/lib/src/interface/session_data_source.dart
```dart
part of '../local_source.dart';

/// {@template session_data_source}
/// Data source for onboarding/session id.
/// {@endtemplate}
abstract interface class SessionDataSource {
  /// {@macro session_data_source}
  const SessionDataSource._();

  String get sessionId;
  Future<void> setSessionId(String sessionId);
}

/// {@template session_data_source_mixin}
/// Mixin for session id storage.
/// {@endtemplate}
base mixin SessionDataSourceMixin on PreferenceDao implements SessionDataSource {
  PreferenceEntry<String> get _sessionIdKey => stringEntry(key: 'auth.session_id');

  @override
  String get sessionId => readFromCache<String>(_sessionIdKey) ?? '';

  @override
  Future<void> setSessionId(String sessionId) async {
    cache[_sessionIdKey.key] = sessionId;
    await _sessionIdKey.set(sessionId);
  }
}
```

### package/local_source/lib/src/interface/settings_data_source.dart
```dart
part of '../local_source.dart';

/// {@template settings_data_source}
/// Data source for the app settings.
/// {@endtemplate}
abstract interface class SettingsDataSource {
  /// {@macro settings_data_source}
  const SettingsDataSource._();

  Locale get localization;
  Future<void> setLocalization(Locale locale);

  ThemeMode get theme;
  Future<void> setTheme(ThemeMode mode);

  bool get hapticsEnabled;
  Future<void> setHapticsEnabled({required bool enabled});

  bool get notificationsEnabled;
  Future<void> setNotificationsEnabled({required bool enabled});
}

/// {@template settings_data_source_mixin}
/// Mixin for the app settings data source.
/// {@endtemplate}
base mixin SettingsDataSourceMixin on PreferenceDao implements SettingsDataSource {
  /// Entries
  PreferenceEntry<bool> get _hapticsEnabledKey => boolEntry(key: 'settings.haptics_enabled');
  PreferenceEntry<bool> get _notificationsEnabledKey => boolEntry(key: 'settings.notifications_enabled');
  PreferenceEntry<String> get _localizationKey => stringEntry(key: 'settings.localization');
  PreferenceEntry<String> get _themeKey => stringEntry(key: 'settings.theme');

  /// --- Getters --- ///
  @override
  bool get hapticsEnabled => readFromCache<bool>(_hapticsEnabledKey) ?? true;

  @override
  bool get notificationsEnabled => readFromCache<bool>(_notificationsEnabledKey) ?? true;

  @override
  ThemeMode get theme => switch (readFromCache<String>(_themeKey)) {
    'system' => .system,
    'light' => .light,
    'dark' => .dark,
    _ => .light,
  };

  @override
  Locale get localization {
    final locale = readFromCache<String>(_localizationKey);

    final defaultLocale = switch (Platform.localeName.split('-').firstOrNull) {
      'uz' => 'uz',
      _ => 'uz',
    };

    if (locale == null) return Locale(defaultLocale);

    final parts = locale.split('-');

    final languageCode = parts.isNotEmpty ? parts[0] : defaultLocale;
    final scriptCode = parts.length > 1 ? parts[1] : '';
    final normalizedScriptCode = scriptCode == 'null' ? '' : scriptCode;

    return Locale.fromSubtags(
      languageCode: languageCode,
      scriptCode: normalizedScriptCode.isEmpty ? null : normalizedScriptCode,
    );
  }

  /// --- Setters --- ///
  @override
  Future<void> setHapticsEnabled({required bool enabled}) async {
    cache[_hapticsEnabledKey.key] = enabled;
    await _hapticsEnabledKey.set(enabled);
  }

  @override
  Future<void> setNotificationsEnabled({required bool enabled}) async {
    cache[_notificationsEnabledKey.key] = enabled;
    await _notificationsEnabledKey.set(enabled);
  }

  @override
  Future<void> setLocalization(Locale locale) async {
    final String tag = switch (locale.scriptCode) {
      final String code when code.isNotEmpty => '${locale.languageCode}-$code',
      _ => locale.languageCode,
    };
    cache[_localizationKey.key] = tag;
    await _localizationKey.set(tag);
  }

  @override
  Future<void> setTheme(ThemeMode mode) async {
    cache[_themeKey.key] = mode.name;
    await _themeKey.set(mode.name);
  }
}
```

### package/local_source/lib/src/interface/user_data_source.dart
```dart
part of '../local_source.dart';

/// {@template user_data_source}
/// Data source for the app user.
/// {@endtemplate}
abstract interface class UserDataSource {
  /// {@macro user_data_source}
  const UserDataSource._();

  String get userID;
  Future<void> setUserID(String userID);

  String get accessToken;
  Future<void> setAccessToken(String accessToken);

  String get refreshToken;
  Future<void> setRefreshToken(String refreshToken);

  bool get isUserAuthenticated;
}

/// {@template user_data_source_mixin}
/// Mixin for the app user data source.
/// {@endtemplate}
base mixin UserDataSourceMixin on PreferenceDao implements UserDataSource {
  /// Entries
  PreferenceEntry<String> get _userIdKey => stringEntry(key: 'user.id');
  PreferenceEntry<String> get _accessTokenKey => stringEntry(key: 'user.access_token');
  PreferenceEntry<String> get _refreshTokenKey => stringEntry(key: 'user.refresh_key');

  /// --- Getters --- ///
  @override
  bool get isUserAuthenticated => accessToken.isNotEmpty && refreshToken.isNotEmpty;

  /// Encrypted values using [SecureStorage]
  @override
  String get userID => readCachedOrDecrypted(_userIdKey);

  @override
  String get accessToken => readCachedOrDecrypted(_accessTokenKey);

  @override
  String get refreshToken => readCachedOrDecrypted(_refreshTokenKey);

  /// --- Setters --- ///
  /// Encrypted values using [SecureStorage]
  @override
  Future<void> setUserID(String userID) async {
    cache[_userIdKey.key] = userID;
    await SecureStorage.setUsingEncryption(userID, entry: _userIdKey);
  }

  @override
  Future<void> setAccessToken(String accessToken) async {
    cache[_accessTokenKey.key] = accessToken;
    await SecureStorage.setUsingEncryption(accessToken, entry: _accessTokenKey);
  }

  @override
  Future<void> setRefreshToken(String refreshToken) async {
    cache[_refreshTokenKey.key] = refreshToken;
    await SecureStorage.setUsingEncryption(refreshToken, entry: _refreshTokenKey);
  }
}
```

### package/local_source/lib/src/local_source.dart
```dart
import 'dart:io' show Platform;
import 'dart:ui' show Locale;

import 'package:flutter/material.dart' show immutable, ThemeMode;
import 'package:flutter/rendering.dart';
import '../local_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/extensions.dart';
import 'utils/secure_store.dart';

part 'interface/settings_data_source.dart';
part 'interface/session_data_source.dart';
part 'interface/user_data_source.dart';

/// {@template local_source}
/// Local source for the app.
/// {@endtemplate}
@immutable
final class LocalSource extends PreferenceDao
    with SettingsDataSourceMixin, SessionDataSourceMixin, UserDataSourceMixin {
  /// {@macro local_source}
  LocalSource._({required super.sharedPreferences});

  /// The instance of the local source.
  static LocalSource? _instance;

  @override
  final Map<String, Object?> cache = <String, Object?>{};

  /// Static getter for the local source instance.
  static Future<LocalSource> get instance async => _instance ??= await _init();

  /// Initializes the local source.
  static Future<LocalSource> _init() async {
    final shp = await SharedPreferences.getInstance();
    final instance = LocalSource._(sharedPreferences: shp);

    final encryptedEntryKeys = <String>{
      instance._userIdKey.key,
      instance._accessTokenKey.key,
      instance._refreshTokenKey.key,
    };

    final entries = [
      instance._userIdKey,
      instance._accessTokenKey,
      instance._refreshTokenKey,
      instance._hapticsEnabledKey,
      instance._notificationsEnabledKey,
      instance._localizationKey,
      instance._themeKey,
      instance._sessionIdKey,
    ];

    for (final entry in entries) {
      if (encryptedEntryKeys.contains(entry.key)) {
        if (entry is! PreferenceEntry<String>) continue;

        instance.readCachedOrDecrypted(entry);
      } else {
        instance.readFromCache<Object?>(entry);
      }
    }

    return instance;
  }

  @override
  Future<void> clearAll() async {
    // Preserve language and session id when clearing all.
    final currentLocale = localization;
    final currentSessionId = sessionId;

    await super.clearAll();
    cache.clear();

    // Restore preserved values.
    await setLocalization(currentLocale);
    if (currentSessionId.isNotEmpty) {
      await setSessionId(currentSessionId);
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is LocalSource && runtimeType == other.runtimeType);

  @override
  int get hashCode => runtimeType.hashCode;
}
```

### package/local_source/lib/src/preference_dao/preference_entry.dart
```dart
import 'package:shared_preferences/shared_preferences.dart';

/// An [abstract] class that serves as a template for any preference key,
/// meaning it defines how entries should have (read, set, remove).
/// It uses generic type [T] to support multiple data types (int, bool, String, etc.).
abstract base class PreferenceEntry<T extends Object> {
  const PreferenceEntry();

  /// A [key] used to identify the specific preference entry in [SharedPreferences].
  String get key;

  /// Reads the stored value from [SharedPreferences]. Returns [null] if no value exists.
  T? read();

  /// Sets a value in [SharedPreferences]. This will be implemented by a subclass.
  Future<void> set(T value);

  /// Removes the value stored in [SharedPreferences] for this entry.
  Future<void> remove();

  /// Sets the value if it is not [null], otherwise removes the entry
  Future<void> setIfNullRemove(T? value) => value == null ? remove() : set(value);
}

/// This is a actual implementation of the abstract class [PreferenceEntry<T>] class.
/// It provides the logic for reading, writing and removing entries.
final class _PreferenceEntry<T extends Object> extends PreferenceEntry<T> {
  const _PreferenceEntry({required SharedPreferences sharedPreferences, required this.key})
    : _sharedPreferences = sharedPreferences;

  /// Holds the [SharedPreferences] instance, which is used to interact with saved data.
  final SharedPreferences _sharedPreferences;

  /// The key used to store and retrieve the specific entry in [SharedPreferences]
  @override
  final String key;

  /// Reads a value from [SharedPreferences] based on the key.
  /// If the value exists and matches the expected type, it returns it.
  /// If there's no value or the type is wrong, it throws an error or returns [null]
  @override
  T? read() {
    final value = _sharedPreferences.get(key);

    return switch (value) {
      null => null, // If no value is found, return null.
      final T v => v, // If value matches the expected type, return it
      _ => throw Exception(
        // If the value is of wrong type, throw an error
        'The value of $key is not subtype ${T.runtimeType}',
      ),
    };
  }

  /// Removes value from [SharedPreferences] that is stored under the provided [key].
  @override
  Future<void> remove() => _sharedPreferences.remove(key);

  /// Saves a value in [SharedPreferences]. Based on the type `T`, it calls appropriate method
  /// to store the value (e.g., [setInt], [setBool], [setString], etc.).
  /// If the type is not supported, it throws an error.
  @override
  Future<void> set(T value) => switch (value) {
    final int v => _sharedPreferences.setInt(key, v), // Stores an int value.
    final double v => _sharedPreferences.setDouble(key, v), // Stores a double value.
    final bool v => _sharedPreferences.setBool(key, v), // Stores a bool value.
    final String v => _sharedPreferences.setString(key, v), // Stores a string value.
    final Iterable<String> v => _sharedPreferences.setStringList(key, v.toList()), // Stores a list of strings value.
    // Throws an error if the type isn't supported
    _ => throw Exception('$T is not valid type for a preferences entry value'),
  };
}

/// An abstract class that helps manage preference in the app.
/// It's marked as `base` to ensure it's only extended, not implemented or mixed in
abstract base class PreferenceDao {
  const PreferenceDao({required SharedPreferences sharedPreferences}) : _sharedPreferences = sharedPreferences;

  /// This holds the reference to the [SharedPreferences] object.
  final SharedPreferences _sharedPreferences;

  /// Cache for storing values in memory
  Map<String, Object?> get cache;

  /// Creates a preference entry for storing and retrieving a [bool] value.
  PreferenceEntry<bool> boolEntry({required String key}) =>
      _PreferenceEntry<bool>(sharedPreferences: _sharedPreferences, key: key);

  /// Creates preference entry for storing and retrieving a [int] value.
  PreferenceEntry<int> intEntry({required String key}) =>
      _PreferenceEntry<int>(sharedPreferences: _sharedPreferences, key: key);

  /// Creates preference entry for storing and retrieving a [double] value.
  PreferenceEntry<double> doubleEntry({required String key}) =>
      _PreferenceEntry<double>(sharedPreferences: _sharedPreferences, key: key);

  /// Creates preference entry for storing and retrieving a [String] value.
  PreferenceEntry<String> stringEntry({required String key}) =>
      _PreferenceEntry<String>(sharedPreferences: _sharedPreferences, key: key);

  /// Clears all preferences and cache.
  Future<void> clearAll() async => await _sharedPreferences.clear();
}
```

### package/local_source/lib/src/utils/extensions.dart
```dart
import 'dart:developer';

import '../preference_dao/preference_entry.dart';
import 'secure_store.dart';

void _log(Object? message) => log(name: '[LocalSource][PreferenceDaoX]', message.toString());

extension PreferenceDaoX on PreferenceDao {
  /// Reads value from cache and returns it if not null,
  /// otherwise reads from the entry and caches the result.
  T? readFromCache<T>(PreferenceEntry<Object?> entry) {
    try {
      final cached = cache[entry.key] as T?;

      if (cached != null) return cached;

      final localeSaved = entry.read() as T?;
      cache[entry.key] = localeSaved;

      return localeSaved;
    } on Object catch (e) {
      _log('[${entry.key}]. Error reading from cache: $e');
      return null;
    }
  }

  // Read from cache if null, otherwise decrypt and caches the result
  String readCachedOrDecrypted(PreferenceEntry<String> entry) {
    try {
      final cached = cache[entry.key] as String?;

      if (cached != null) return cached;

      final decrypted = SecureStorage.readUsingDecryption<PreferenceEntry<String>>(entry);

      cache[entry.key] = decrypted;

      return decrypted;
    } on Object catch (e) {
      _log('[${entry.key}]. Error reading from encrypted cache: $e');
      return '';
    }
  }
}
```

### package/local_source/lib/src/utils/secure_store.dart
```dart
import 'dart:developer';

import 'package:encrypt/encrypt.dart' as encrypt;

import '../../local_source.dart';

/// {@template secure_storage}
/// A sealed class for secure storage operations using AES encryption.
/// {@endtemplate}
sealed class SecureStorage {
  /// {@macro secure_storage}
  const SecureStorage._();

  /// The key used for encryption and decryption.
  static final encrypt.Key _key = .fromBase64('sl8vq6Kd/q7uaUep6LCg3RKPaSB7dKKZ');

  /// Encrypts the given string value and stores it in SharedPreferences using AES encryption.
  ///
  /// This method uses AES encryption with a randomly generated IV (Initialization Vector)
  /// to encrypt the provided [value] and stores it in the format "IV:ENCRYPTED_DATA".
  ///
  /// Parameters:
  /// - [value]: The string to be encrypted. If empty, an empty string will be stored.
  /// - [entry]: The PreferenceEntry where the encrypted value will be stored.
  ///
  /// The stored format is: "{base64_encoded_iv}:{base64_encoded_encrypted_data}"
  ///
  /// Throws:
  /// - Encryption errors if the key is invalid
  /// - Storage errors if SharedPreferences operations fail
  static Future<void> setUsingEncryption<T extends PreferenceEntry<String>>(String value, {required T entry}) async {
    try {
      if (value.isEmpty) return await entry.set('');

      final encrypt.IV iv = .fromSecureRandom(16);
      final encrypter = encrypt.Encrypter(encrypt.AES(_key));
      final encrypted = encrypter.encrypt(value, iv: iv);

      final storageValue = '${iv.base64}:${encrypted.base64}';
      await entry.set(storageValue);
    } on Object catch (e) {
      final sb = StringBuffer()
        ..writeln('═══════ Encryption Error ═══════')
        ..writeln('Timestamp: ${DateTime.now().toIso8601String()}')
        ..writeln('Entry Key: ${entry.key}')
        ..writeln('Attempted Value Length: ${value.length}')
        ..writeln('Error Details: $e')
        ..writeln('═══════════════════════════════');

      log(sb.toString());
      rethrow;
    }
  }

  /// Retrieves and decrypts a value from SharedPreferences using AES decryption.
  ///
  /// This method expects the stored value to be in the format "IV:ENCRYPTED_DATA",
  /// where both IV and ENCRYPTED_DATA are base64 encoded strings.
  ///
  /// Parameters:
  /// - [entry]: The PreferenceEntry to read the encrypted value from.
  ///
  /// Returns:
  /// - The decrypted string value
  /// - Empty string if:
  ///   * The stored value is empty
  ///   * The stored value is not in the correct format
  ///   * Decryption fails for any reason
  ///
  /// Note: This method handles all errors internally and returns an empty string
  /// instead of throwing exceptions to maintain data access stability.
  static String readUsingDecryption<T extends PreferenceEntry<String>>(T entry) {
    try {
      final storedValue = entry.read() ?? '';
      if (storedValue.isEmpty) return '';

      final parts = storedValue.split(':');
      if (parts.length != 2) {
        _logDecryptionError<T>(
          entry: entry,
          error: 'Invalid storage format',
          details: 'Expected format: "IV:ENCRYPTED_DATA"',
          storedValue: storedValue,
        );
        return '';
      }

      final encrypt.IV iv = .fromBase64(parts[0]);
      final encryptedData = parts[1];
      final encrypter = encrypt.Encrypter(encrypt.AES(_key));

      return encrypter.decrypt64(encryptedData, iv: iv);
    } on FormatException catch (e) {
      _logDecryptionError<T>(entry: entry, error: 'Invalid base64 format', details: e.toString());
      return '';
    } on Object catch (e) {
      _logDecryptionError<T>(entry: entry, error: 'Decryption failed', details: e.toString());

      return '';
    }
  }

  /// Helper method to consistently format decryption error logs
  static void _logDecryptionError<T extends PreferenceEntry<String>>({
    required T entry,
    required String error,
    required String details,
    String? storedValue,
  }) {
    final sb = StringBuffer()
      ..writeln('═══════ Decryption Error ═══════')
      ..writeln('Timestamp: ${DateTime.now().toIso8601String()}')
      ..writeln('Entry Key: ${entry.key}')
      ..writeln('Error Type: $error')
      ..writeln('Error Details: $details');

    if (storedValue != null) {
      sb
        ..writeln('Stored Value: $storedValue')
        ..writeln('Stored Value Length: ${storedValue.length}');
    }

    sb.writeln('═══════════════════════════════');
    log(sb.toString());
  }
}
```

### package/local_source/pubspec.yaml
```yaml
name: local_source
description: "A new Flutter package project."
version: 0.0.1

resolution: workspace

environment:
  sdk: ^3.10.1

dependencies:
  flutter:
    sdk: flutter

  encrypt: ^5.0.3
  shared_preferences: ^2.5.3

dev_dependencies:
  flutter_test:
    sdk: flutter
```

## 7. LIB/ ICHIDAGI BARCHA DART FAYLLAR

### lib/main.dart
```dart
import 'src/core/app/app_init.dart';

Future<void> main(List<String> args) async => AppInit.run();
```

### lib/src/common/constant/constants.dart
```dart
import 'package:flutter/material.dart';

sealed class Constants {
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const Curve curve = Curves.easeInOut;
  static const Duration transitionDuration = Duration(milliseconds: 300);
}
```

### lib/src/common/data/enums/bloc_status_enum.dart
```dart
enum Status {
  initial,
  loading,
  success,
  error;

  bool get isInitial => this == .initial;
  bool get isLoading => this == .loading;
  bool get isSuccess => this == .success;
  bool get isError => this == .error;

  T map<T>({
    required T Function() onInitial,
    required T Function() onLoading,
    required T Function() onSuccess,
    required T Function() onError,
  }) => switch (this) {
    .initial => onInitial(),
    .loading => onLoading(),
    .success => onSuccess(),
    .error => onError(),
  };

  T maybeMap<T>({
    required T Function() orElse,
    T Function()? onInitial,
    T Function()? onLoading,
    T Function()? onSuccess,
    T Function()? onError,
  }) => switch (this) {
    .initial => onInitial?.call() ?? orElse(),
    .loading => onLoading?.call() ?? orElse(),
    .success => onSuccess?.call() ?? orElse(),
    .error => onError?.call() ?? orElse(),
  };
}
```

### lib/src/common/extensions/context_ext.dart
```dart
part of 'extensions.dart';

extension ContextExt on BuildContext {
  // ── Theme ───────────────────────────────────────────────────────────

  ThemeData get theme => Theme.of(this);

  ThemeColors get color => theme.extension<ThemeColors>()!;

  ThemeColors get colors => theme.appColors;

  ColorScheme get colorScheme => theme.colorScheme;

  ThemeTextStyles get textTheme => theme.appTextStyles;

  ThemeTextStyles get textStyles => theme.appTextStyles;

  AppLocalizations get l10n => AppLocalizations.of(this)!;

  LocalSource get localSource => sl<LocalSource>();

  bool get isDark => theme.brightness == .dark;

  // ── MediaQuery ──────────────────────────────────────────────────────

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get screenSize => mediaQuery.size;

  double get height => screenSize.height;

  double get width => screenSize.width;

  double get topPadding => mediaQuery.padding.top;

  double get bottomPadding => mediaQuery.padding.bottom;

  EdgeInsets get viewInsets => mediaQuery.viewInsets;

  EdgeInsets get viewPadding => mediaQuery.viewPadding;

  double get devicePixelRatio => mediaQuery.devicePixelRatio;

  bool get isKeyboardOpen => viewInsets.bottom > 0;

  Orientation get orientation => mediaQuery.orientation;

  // ── Platform ────────────────────────────────────────────────────────

  TargetPlatform get platform => theme.platform;

  bool get isIOS => platform == .iOS;

  bool get isAndroid => platform == .android;

  // ── Localization ────────────────────────────────────────────────────

  Locale get locale => Localizations.localeOf(this);

  // ── Focus ───────────────────────────────────────────────────────────

  void hideKeyboard() => FocusScope.of(this).unfocus();

  bool get hasFocus => FocusScope.of(this).hasFocus;

  void requestFocus([FocusNode? node]) => FocusScope.of(this).requestFocus(node);

  // ── Navigation ──────────────────────────────────────────────────────

  NavigatorState get navigator => Navigator.of(this);

  bool get canPop => navigator.canPop();

  void pop<T>([T? result]) => navigator.pop(result);

  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) =>
      navigator.pushNamed<T>(routeName, arguments: arguments);

  // ── ScaffoldMessenger ───────────────────────────────────────────────

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
    SnackBarBehavior behavior = .floating,
  }) {
    scaffoldMessenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message), duration: duration, action: action, behavior: behavior));
  }

  void showErrorSnackBar(String message) {
    scaffoldMessenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message), backgroundColor: colorScheme.error, behavior: .floating));
  }

  void showSuccessSnackBar(String message) {
    scaffoldMessenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message), backgroundColor: color.success, behavior: .floating));
  }

  // ── Dialogs / Sheets ────────────────────────────────────────────────

  Future<T?> showAppDialog<T>({required WidgetBuilder builder, bool barrierDismissible = true}) =>
      showDialog<T>(context: this, builder: builder, barrierDismissible: barrierDismissible);

  Future<T?> showAppBottomSheet<T>({
    required WidgetBuilder builder,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool useSafeArea = true,
    bool useRootNavigator = false,
    Color? backgroundColor,
    ShapeBorder? shape,
  }) => showModalBottomSheet<T>(
    context: this,
    builder: builder,
    isScrollControlled: isScrollControlled,
    isDismissible: isDismissible,
    useSafeArea: useSafeArea,
    useRootNavigator: useRootNavigator,
    backgroundColor: backgroundColor,
    shape: shape,
  );
}
```

### lib/src/common/extensions/date_time_ext.dart
```dart
part of 'extensions.dart';

extension DateTimeExtension on DateTime {
  String toDate([String? pattern]) => DateFormat(pattern ?? 'dd.MM.yyyy').format(this);
}
```

### lib/src/common/extensions/extensions.dart
```dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:local_source/local_source.dart';

import '../../core/localization/generated/app_localizations.dart';
import '../../core/di/injection.dart';
import '../../core/theme/theme_colors.dart';
import '../../core/theme/theme_data.dart';
import '../../core/theme/theme_text_style.dart';

part 'context_ext.dart';
part 'date_time_ext.dart';
part 'object_ext.dart';
part 'string_ext.dart';
part 'list_ext.dart';
```

### lib/src/common/extensions/list_ext.dart
```dart
part of 'extensions.dart';
```

### lib/src/common/extensions/object_ext.dart
```dart
part of 'extensions.dart';

extension ObjectExt on Object? {
  bool get isNull => this == null;
  bool get isNotNull => !isNull;

  T map<T>({required T Function(Object value) onValue, required T Function() onNull}) =>
      isNull ? onNull() : onValue(this!);
}
```

### lib/src/common/extensions/string_ext.dart
```dart
part of 'extensions.dart';

extension StringExt on String {
  bool get isNumber => num.tryParse(this).isNotNull;

  bool get isEmail => RegExp(r'^[\w\-\.]+@([\w-]+\.)+[\w-]{2,}$').hasMatch(trim());

  bool get isUrl => Uri.tryParse(this)?.hasAbsolutePath ?? false;

  bool get isBlank => trim().isEmpty;

  bool get isNotBlank => !isBlank;

  String get capitalize => isBlank ? '' : this[0].toUpperCase() + substring(1);

  // ── Trimming / Truncation ──────────────────────────────────────────

  String truncate(int maxLength, {String ellipsis = '…'}) =>
      length <= maxLength ? this : '${substring(0, maxLength)}$ellipsis';

  String get removeWhitespace => replaceAll(RegExp(r'\s+'), '');

  String get onlyDigits => replaceAll(RegExp(r'[^\d]'), '');

  String get onlyLetters => replaceAll(RegExp(r'[^a-zA-Z]'), '');

  String get onlyLettersAndDigits => replaceAll(RegExp(r'[^a-zA-Z\d]'), '');

  /// Masks card: "8600123456789012" → "8600 1234 5678 9012"
  String get formattedCardNumber => onlyDigits.replaceAllMapped(RegExp(r'.{4}'), (m) => '${m.group(0)} ').trim();

  /// Masks card number showing only last 4: "8600 **** **** 9012"
  String get maskedCardNumber {
    final digits = onlyDigits;
    if (digits.length < 8) return this;
    return '${digits.substring(0, 4)} **** **** ${digits.substring(digits.length - 4)}';
  }

  // ── Conversions ────────────────────────────────────────────────────

  int get toInt => .tryParse(this) ?? 0;

  double get toDouble => .tryParse(this) ?? 0;

  DateTime? get toDateTimeOrNull => .tryParse(this);

  Uri? get toUri => .tryParse(this);

  /// Parses hex color string: "#FF5733" or "FF5733"
  Color get toColor {
    final hex = replaceFirst('#', '').trim();
    if (hex.length == 6) return Color(.parse('FF$hex', radix: 16));
    if (hex.length == 8) return Color(.parse(hex, radix: 16));
    return const Color(0x00000000);
  }
}

// ── Nullable String helpers ────────────────────────────────────────────

extension NullableStringExt on String? {
  bool get isNullOrBlank => this == null || this!.isBlank;

  String orDefault({String defaultValue = ''}) => isNullOrBlank ? defaultValue : this!;
}
```

### lib/src/common/widget/network_connection_widget.dart
```dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NetworkConnectionWidget extends StatefulWidget {
  const NetworkConnectionWidget({super.key, required this.child, required this.noInternetScreen});
  final Widget child;
  final Widget noInternetScreen;

  @override
  State<NetworkConnectionWidget> createState() => _NetworkConnectionWidgetState();
}

class _NetworkConnectionWidgetState extends State<NetworkConnectionWidget> {
  @override
  Widget build(BuildContext context) => switch (kDebugMode) {
    true => widget.child,
    false => widget.noInternetScreen,
  };
}
```

### lib/src/common/widget/responsive_builder.dart
```dart
import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatefulWidget {
  const ResponsiveBuilder({super.key, required this.onMobile, required this.onTablet, required this.onDesktop});
  final Widget Function(BuildContext context) onMobile;
  final Widget Function(BuildContext context) onTablet;
  final Widget Function(BuildContext context) onDesktop;

  @override
  State<ResponsiveBuilder> createState() => _ResponsiveBuilderState();
}

class _ResponsiveBuilderState extends State<ResponsiveBuilder> {
  @override
  Widget build(BuildContext context) => const Placeholder();
}
```

### lib/src/core/app/app.dart
```dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thunder/thunder.dart';

import '../../common/constant/constants.dart';
import '../di/injection.dart';
import '../localization/generated/app_localizations.dart';
import '../router/routes.dart';
import '../shared/settings/domain/repository/settings_repository.dart';
import '../shared/settings/presentation/bloc/settings_cubit.dart';
import '../shared/settings/presentation/bloc/settings_state.dart';
import '../theme/theme_data.dart';
import 'initialization.dart';
import 'splash_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late Stream<InitializationResult> _initSteam;
  @override
  void initState() {
    super.initState();
    _initSteam = initDependencies();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => SettingsCubit(settingsRepository: sl<SettingsRepository>()),
    child: BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) => MaterialApp.router(
        debugShowCheckedModeBanner: false,

        routerConfig: AppRouter.router,
        theme: AppThemeData.light(),
        darkTheme: AppThemeData.dark(),
        themeMode: state.themeMode,

        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: .noScaling),
          child: StreamBuilder(
            stream: _initSteam,
            builder: (context, snapshot) => Thunder(
              dio: [sl<Dio>()],
              child: AnimatedSwitcher(
                duration: Constants.transitionDuration,
                child: snapshot.connectionState == .active && snapshot.hasData
                    ? const SplashScreen(key: ValueKey('splash'))
                    : KeyedSubtree(key: const ValueKey('app'), child: child!),
              ),
            ),
          ),
        ),

        locale: state.locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
      ),
    ),
  );
}
```

### lib/src/core/app/app_init.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../di/injection.dart';
import 'app.dart';

sealed class AppInit {
  static Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();
    await _initAppSettings();
    await _initLocalServices();
    runApp(const App());
  }

  static Future<void> _initAppSettings() async {
    await SystemChrome.setPreferredOrientations([.portraitUp, .portraitDown]);
  }

  static Future<void> _initLocalServices() async {
    // Initialize services here
  }
}
```

### lib/src/core/app/initialization.dart
```dart
import 'dart:async';

typedef _InitializationStep = FutureOr<void> Function();
typedef InitializationResult = ({String name, double progress});

Stream<InitializationResult> initDependencies() async* {
  final percent = 100 / _initializationSteps.length;

  for (int i = 0; i < _initializationSteps.length; i++) {
    final step = _initializationSteps.entries.elementAt(i);
    await step.value();
    yield (name: step.key, progress: percent * (i + 1));
  }
}

Future<void> _fakeDelay() async {
  await Future.delayed(const Duration(milliseconds: 500));
}

Map<String, _InitializationStep> get _initializationSteps => <String, _InitializationStep>{
  'App Meta Data': _fakeDelay,
  'Database': _fakeDelay,
  'Services': _fakeDelay,
  'Observers': _fakeDelay,
  'Firebase': _fakeDelay,
};
```

### lib/src/core/app/splash_screen.dart
```dart
import 'package:flutter/material.dart';

import '../../common/extensions/extensions.dart';
import '../constant/gen/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.color.scaffoldBackground,
    body: SafeArea(
      child: SizedBox(
        width: .infinity,
        child: Column(
          crossAxisAlignment: .center,
          children: [
            const Spacer(flex: 7),
            Column(
              mainAxisSize: .min,
              children: [
                Assets.images.appLogo.image(width: 52, height: 52),
                const SizedBox(height: 14),
                const Text('App Name', style: TextStyle(fontSize: 20, fontWeight: .w700, letterSpacing: 0.7)),
              ],
            ),
            const Spacer(flex: 6),
            Semantics(
              label: context.l10n.commonLoading,
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: context.color.primary,
                  strokeWidth: 2.7,
                  strokeCap: .round,
                  backgroundColor: context.color.primary.withValues(alpha: .18),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    ),
  );
}
```

### lib/src/core/auth/auth_session_notifier.dart
```dart
import 'package:flutter/foundation.dart';

/// Notifies app-wide listeners about auth/session changes (login, logout, token refresh).
final class AuthSessionNotifier extends ChangeNotifier {
  void notifySessionChanged() => notifyListeners();
}
```

### lib/src/core/constant/app_constants.dart
```dart
class AppConstants {
  static const String playMarketUrl = '';
}
```

### lib/src/core/constant/config.dart
```dart
import 'dart:developer';

import 'package:meta/meta.dart';

/// Config for app.
@immutable
final class Config {
  // --- INITIALIZATION --- //
  factory Config._initialize({
    String environment = const .fromEnvironment('ENVIRONMENT', defaultValue: 'development'),
    String apiBaseUrl = const .fromEnvironment('API_BASE_URL', defaultValue: ''),

    bool isInitializationDone = false,
    bool thunderEnabled = false,
    bool octopusToolsEnabled = false,
    String environmentId = const .fromEnvironment('ENVIRONMENT_ID', defaultValue: ''),
    String projectId = const .fromEnvironment('PROJECT_ID', defaultValue: ''),
  }) {
    final Config config = ._(
      environment: EnvironmentFlavor.from(environment),
      apiBaseUrl: apiBaseUrl,
      isInitializationDone: isInitializationDone,
      thunderEnabled: thunderEnabled,
      octopusToolsEnabled: octopusToolsEnabled,
      environmentId: environmentId,
      projectId: projectId,
    );

    _currentConfig = config;

    return config;
  }

  factory Config.copyWith({
    EnvironmentFlavor? environment,
    String? apiBaseUrl,
    String? googleMapsApiKey,
    String? googleGeocodeUrl,
    String? environmentId,
    String? projectId,
    bool? isInitializationDone,
    bool? thunderEnabled,
    bool? octopusToolsEnabled,
  }) {
    final Config config = ._(
      environment: environment ?? (_currentConfig?.environment ?? .development),
      apiBaseUrl: apiBaseUrl ?? (_currentConfig?.apiBaseUrl ?? ''),
      environmentId: environmentId ?? (_currentConfig?.environmentId ?? ''),
      projectId: projectId ?? (_currentConfig?.projectId ?? ''),
      isInitializationDone: isInitializationDone ?? (_currentConfig?.isInitializationDone ?? false),
      thunderEnabled: thunderEnabled ?? (_currentConfig?.thunderEnabled ?? false),
      octopusToolsEnabled: octopusToolsEnabled ?? (_currentConfig?.octopusToolsEnabled ?? false),
    );

    log('Config.copyWith: $config', name: 'Config');

    _currentConfig = config;

    return config;
  }

  factory Config.current() => _currentConfig ?? Config._initialize();

  const Config._({
    required this.environment,
    required this.apiBaseUrl,
    required this.isInitializationDone,
    required this.thunderEnabled,
    required this.octopusToolsEnabled,
    required this.environmentId,
    required this.projectId,
  });

  static Config? _currentConfig;
  // --- *END INITIALIZATION* --- //

  // --- ENVIRONMENT --- //
  final EnvironmentFlavor environment;

  // --- API --- //
  final String apiBaseUrl;

  // --- THUNDER --- //
  final bool thunderEnabled;

  // --- OCTOPUS TOOLS --- //
  final bool octopusToolsEnabled;

  // --- INITIALIZATION CHECK --- //
  final bool isInitializationDone;

  // --- ENVIRONMENT ID --- //
  final String environmentId;

  // --- PROJECT ID --- //
  final String projectId;

  // --- EQUALITY & TO STRING --- //
  @override
  bool operator ==(Object other) {
    if (other is Config) {
      return environment == other.environment &&
          apiBaseUrl == other.apiBaseUrl &&
          thunderEnabled == other.thunderEnabled &&
          octopusToolsEnabled == other.octopusToolsEnabled &&
          isInitializationDone == other.isInitializationDone &&
          environmentId == other.environmentId &&
          projectId == other.projectId;
    }
    return false;
  }

  @override
  int get hashCode =>
      environment.hashCode ^
      apiBaseUrl.hashCode ^
      thunderEnabled.hashCode ^
      octopusToolsEnabled.hashCode ^
      isInitializationDone.hashCode ^
      environmentId.hashCode ^
      projectId.hashCode;

  @override
  String toString() =>
      '''Config(environment: $environment, apiBaseUrl: $apiBaseUrl, thunderEnabled: $thunderEnabled, octopusToolsEnabled: $octopusToolsEnabled,isInitializationDone: $isInitializationDone, environmentId: $environmentId, projectId: $projectId)''';
}

/// Environment flavor.
/// e.g. development, staging, production
enum EnvironmentFlavor {
  /// Development
  development('development'),

  /// Staging
  staging('staging'),

  /// Production
  production('production');

  /// Create environment flavor.
  const EnvironmentFlavor(this.value);

  /// Create environment flavor from string.
  factory EnvironmentFlavor.from(String? value) => switch (value?.trim().toLowerCase()) {
    'development' || 'debug' || 'develop' || 'dev' => development,
    'staging' || 'profile' || 'stage' || 'stg' => staging,
    'production' || 'release' || 'prod' || 'prd' => production,
    _ => const bool.fromEnvironment('dart.vm.product') ? production : development,
  };

  /// development, staging, production
  final String value;

  /// Whether the environment is development.
  bool get isDevelopment => this == development;

  /// Whether the environment is staging.
  bool get isStaging => this == staging;

  /// Whether the environment is production.
  bool get isProduction => this == production;
}
```

### lib/src/core/constant/gen/assets.gen.dart
```dart
// dart format width=120

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $ConfigGen {
  const $ConfigGen();

  /// File path: config/development.json
  String get development => 'config/development.json';

  /// File path: config/production.json
  String get production => 'config/production.json';

  /// File path: config/staging.json
  String get staging => 'config/staging.json';

  /// List of all assets
  List<String> get values => [development, production, staging];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/icon_chevron_right.svg
  SvgGenImage get iconChevronRight => const SvgGenImage('assets/icons/icon_chevron_right.svg');

  /// File path: assets/icons/icon_cursor.svg
  SvgGenImage get iconCursor => const SvgGenImage('assets/icons/icon_cursor.svg');

  /// File path: assets/icons/icon_delete.svg
  SvgGenImage get iconDelete => const SvgGenImage('assets/icons/icon_delete.svg');

  /// File path: assets/icons/icon_exit.svg
  SvgGenImage get iconExit => const SvgGenImage('assets/icons/icon_exit.svg');

  /// File path: assets/icons/icon_file.svg
  SvgGenImage get iconFile => const SvgGenImage('assets/icons/icon_file.svg');

  /// File path: assets/icons/icon_file_export.svg
  SvgGenImage get iconFileExport => const SvgGenImage('assets/icons/icon_file_export.svg');

  /// File path: assets/icons/icon_gallery.svg
  SvgGenImage get iconGallery => const SvgGenImage('assets/icons/icon_gallery.svg');

  /// File path: assets/icons/icon_settings.svg
  SvgGenImage get iconSettings => const SvgGenImage('assets/icons/icon_settings.svg');

  /// File path: assets/icons/icon_sos.svg
  SvgGenImage get iconSos => const SvgGenImage('assets/icons/icon_sos.svg');

  /// File path: assets/icons/sort.svg
  SvgGenImage get sort => const SvgGenImage('assets/icons/sort.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    iconChevronRight,
    iconCursor,
    iconDelete,
    iconExit,
    iconFile,
    iconFileExport,
    iconGallery,
    iconSettings,
    iconSos,
    sort,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_logo.png
  AssetGenImage get appLogo => const AssetGenImage('assets/images/app_logo.png');

  /// File path: assets/images/file.png
  AssetGenImage get file => const AssetGenImage('assets/images/file.png');

  /// File path: assets/images/home.png
  AssetGenImage get home => const AssetGenImage('assets/images/home.png');

  /// File path: assets/images/img_message.png
  AssetGenImage get imgMessage => const AssetGenImage('assets/images/img_message.png');

  /// File path: assets/images/journal.png
  AssetGenImage get journal => const AssetGenImage('assets/images/journal.png');

  /// File path: assets/images/journal_parent_done.png
  AssetGenImage get journalParentDone => const AssetGenImage('assets/images/journal_parent_done.png');

  /// File path: assets/images/journal_parnet_action.png
  AssetGenImage get journalParnetAction => const AssetGenImage('assets/images/journal_parnet_action.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/message.png
  AssetGenImage get message => const AssetGenImage('assets/images/message.png');

  /// File path: assets/images/placeholder.jpg
  AssetGenImage get placeholder => const AssetGenImage('assets/images/placeholder.jpg');

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// File path: assets/images/stretch.png
  AssetGenImage get stretch => const AssetGenImage('assets/images/stretch.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    appLogo,
    file,
    home,
    imgMessage,
    journal,
    journalParentDone,
    journalParnetAction,
    logo,
    message,
    placeholder,
    profile,
    stretch,
  ];
}

class $AssetsVectorsGen {
  const $AssetsVectorsGen();

  /// File path: assets/vectors/icon_chevron_right.vec
  SvgGenImage get iconChevronRight => const SvgGenImage.vec('assets/vectors/icon_chevron_right.vec');

  /// File path: assets/vectors/icon_cursor.vec
  SvgGenImage get iconCursor => const SvgGenImage.vec('assets/vectors/icon_cursor.vec');

  /// File path: assets/vectors/icon_delete.vec
  SvgGenImage get iconDelete => const SvgGenImage.vec('assets/vectors/icon_delete.vec');

  /// File path: assets/vectors/icon_exit.vec
  SvgGenImage get iconExit => const SvgGenImage.vec('assets/vectors/icon_exit.vec');

  /// File path: assets/vectors/icon_file.vec
  SvgGenImage get iconFile => const SvgGenImage.vec('assets/vectors/icon_file.vec');

  /// File path: assets/vectors/icon_file_export.vec
  SvgGenImage get iconFileExport => const SvgGenImage.vec('assets/vectors/icon_file_export.vec');

  /// File path: assets/vectors/icon_gallery.vec
  SvgGenImage get iconGallery => const SvgGenImage.vec('assets/vectors/icon_gallery.vec');

  /// File path: assets/vectors/icon_settings.vec
  SvgGenImage get iconSettings => const SvgGenImage.vec('assets/vectors/icon_settings.vec');

  /// File path: assets/vectors/icon_sos.vec
  SvgGenImage get iconSos => const SvgGenImage.vec('assets/vectors/icon_sos.vec');

  /// File path: assets/vectors/sort.vec
  SvgGenImage get sort => const SvgGenImage.vec('assets/vectors/sort.vec');

  /// List of all assets
  List<SvgGenImage> get values => [
    iconChevronRight,
    iconCursor,
    iconDelete,
    iconExit,
    iconFile,
    iconFileExport,
    iconGallery,
    iconSettings,
    iconSos,
    sort,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsVectorsGen vectors = $AssetsVectorsGen();
  static const $ConfigGen config = $ConfigGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}, this.animation});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({required this.isAnimation, required this.duration, required this.frames});

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}}) : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}}) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(_assetName, assetBundle: bundle, packageName: package);
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ?? (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
```

### lib/src/core/constant/gen/fonts.gen.dart
```dart
// dart format width=120
/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

class FontFamily {
  FontFamily._();

  /// Font family: Inter
  static const String inter = 'Inter';

  /// Font family: SF Pro Display
  static const String sFProDisplay = 'SF Pro Display';
}
```

### lib/src/core/constant/urls.dart
```dart
sealed class Urls {
  static const String prefix = '';

  // File uploadn
  static const String fileUpload = '/v1/files/upload';
}
```

### lib/src/core/di/injection.dart
```dart
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:local_source/local_source.dart';

import '../../common/constant/constants.dart';
import '../../features/auth/data/datasources/local/auth_local_data_source.dart';
import '../../features/auth/data/repository/auth_repository_impl.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../../features/auth/domain/usecase/login_use_case.dart';
import '../../features/auth/domain/usecase/logout_use_case.dart';
import '../../features/auth/presentation/bloc/auth_cubit.dart';
import '../../features/home/data/repository/home_repository_impl.dart';
import '../../features/home/domain/repository/home_repository.dart';
import '../../features/home/domain/usecase/get_home_items_use_case.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/journal/data/repository/journal_repository_impl.dart';
import '../../features/journal/domain/repository/journal_repository.dart';
import '../../features/journal/domain/usecase/get_journal_entries_use_case.dart';
import '../../features/journal/presentation/cubit/journal_cubit.dart';
import '../../features/profile/data/repository/profile_repository_impl.dart';
import '../../features/profile/domain/repository/profile_repository.dart';
import '../../features/profile/domain/usecase/get_profile_use_case.dart';
import '../../features/profile/presentation/cubit/profile_cubit.dart';
import '../auth/auth_session_notifier.dart';
import '../constant/config.dart';
import '../shared/settings/data/repository/settings_repository_impl.dart';
import '../shared/settings/domain/repository/settings_repository.dart';

final GetIt sl = .instance;

Future<void> setupLocator() async {
  final localSource = await LocalSource.instance;
  sl.registerLazySingleton<LocalSource>(() => localSource);
  sl.registerLazySingleton<AuthSessionNotifier>(() => AuthSessionNotifier());
  final dio = await _initDio(localSource: localSource);
  sl.registerLazySingleton<Dio>(() => dio);

  await _initSettings();
  await _initAuth();
  await _initHome();
  await _initJournal();
  await _initProfile();
}

Future<void> _initSettings() async {
  sl.registerLazySingleton<SettingsRepository>(() => SettingsRepositoryImpl(localSource: sl<LocalSource>()));
}

Future<void> _initAuth() async {
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(localSource: sl<LocalSource>(), authSessionNotifier: sl<AuthSessionNotifier>()),
  );
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(localDataSource: sl<AuthLocalDataSource>()));
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(authRepository: sl<AuthRepository>()));
  sl.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(authRepository: sl<AuthRepository>()));
  sl.registerFactory<AuthCubit>(() => AuthCubit(loginUseCase: sl<LoginUseCase>(), logoutUseCase: sl<LogoutUseCase>()));
}

Future<void> _initHome() async {
  sl.registerLazySingleton<HomeRepository>(() => const HomeRepositoryImpl());
  sl.registerLazySingleton<GetHomeItemsUseCase>(() => GetHomeItemsUseCase(homeRepository: sl<HomeRepository>()));
  sl.registerFactory<HomeCubit>(() => HomeCubit(getHomeItemsUseCase: sl<GetHomeItemsUseCase>()));
}

Future<void> _initJournal() async {
  sl.registerLazySingleton<JournalRepository>(() => const JournalRepositoryImpl());
  sl.registerLazySingleton<GetJournalEntriesUseCase>(
    () => GetJournalEntriesUseCase(repository: sl<JournalRepository>()),
  );
  sl.registerFactory<JournalCubit>(() => JournalCubit(getJournalEntriesUseCase: sl<GetJournalEntriesUseCase>()));
}

Future<void> _initProfile() async {
  sl.registerLazySingleton<ProfileRepository>(() => const ProfileRepositoryImpl());
  sl.registerLazySingleton<GetProfileUseCase>(() => GetProfileUseCase(repository: sl<ProfileRepository>()));
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(getProfileUseCase: sl<GetProfileUseCase>()));
}

Future<Dio> _initDio({required LocalSource localSource}) async {
  final dio = Dio(
    BaseOptions(
      baseUrl: Config.current().apiBaseUrl,
      connectTimeout: Constants.connectTimeout,
      receiveTimeout: Constants.receiveTimeout,
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers.addAll(<String, String>{
          if (localSource.accessToken.isNotEmpty) 'Authorization': 'Bearer ${localSource.accessToken}',
          'Application-Language': localSource.localization.languageCode,
        });
        handler.next(options);
      },
    ),
  );

  return dio;
}
```

### lib/src/core/error/api_error_message_extractor.dart
```dart
import 'package:dio/dio.dart';

/// Extracts a user-friendly message from common API error payloads.
///
/// Expected payload example:
/// ```json
/// {
///   "status": "INVALID_ARGUMENT",
///   "description": "Invalid argument value passed",
///   "data": "user not found",
///   "custom_message": ""
/// }
/// ```
final class ApiErrorMessageExtractor {
  const ApiErrorMessageExtractor._();

  static String? fromDioException(DioException exception) {
    final String? apiMessage = fromResponseData(exception.response?.data);
    if (apiMessage != null) return apiMessage;

    final String? fallback = exception.message;
    if (fallback == null) return null;

    final normalized = fallback.trim();
    return normalized.isEmpty ? null : normalized;
  }

  static String? fromResponseData(Object? data) {
    if (data is String) {
      final normalized = data.trim();
      return normalized.isEmpty ? null : normalized;
    }

    if (data is! Map) return null;
    final Map<String, Object?> map = data.cast<String, Object?>();

    String? pickString(Object? value) {
      if (value is! String) return null;
      final normalized = value.trim();
      return normalized.isEmpty ? null : normalized;
    }

    // Prefer server-provided message in `data`.
    return pickString(map['data']) ?? pickString(map['custom_message']) ?? pickString(map['description']);
  }
}
```

### lib/src/core/error/error_handler.dart
```dart
import 'dart:async' show FutureOr;
import 'dart:developer' show log;

import 'package:dio/dio.dart';

import '../../common/extensions/extensions.dart';

/// Handles asynchronous operations with structured error handling and reporting.
///
/// Parameters:
/// - [handler]: The main async operation to execute
/// - [onDioError]: Optional callback for handling Dio-specific network errors
/// - [onError]: Optional callback for handling general errors
/// - [onFinally]: Optional callback that runs after completion (success or failure)
/// - [shouldLog]: Whether to log errors (defaults to true)
/// - [name]: Optional identifier for logging purposes
///
/// Example usage:
/// ```dart
/// await handle(
///   () async {
///     // Main operation
///     final response = await repository.fetchData();
///     emit(state.copyWith(data: response));
///   },
///   name: 'FetchUserData',
///   onDioError: (error, stackTrace) async {
///     // Handle network errors
///     emit(state.copyWith(
///       status: Status.error,
///       error: error.message,
///     ));
///   },
///   onError: (error, stackTrace) async {
///     // Handle other errors
///     emit(state.copyWith(
///       status: Status.error,
///       error: error.toString(),
///     ));
///   },
///   onFinally: () async {
///     // Cleanup or final operations
///     emit(state.copyWith(isLoading: false));
///   },
/// );
/// ```
///
/// Error Handling Flow:
/// 1. Executes [handler]
/// 2. If DioException occurs, calls [onDioError]
/// 3. If other error occurs, calls [onError]
/// 4. Always executes [onFinally] if provided
/// 5. Logs errors if [shouldLog] is true
Future<void> handle(
  FutureOr<void> Function() handler, {
  FutureOr<void> Function(DioException e, StackTrace s)? onDioError,
  FutureOr<void> Function(Object e, StackTrace s)? onError,
  FutureOr<void> Function()? onFinally,
  bool shouldLog = true,
  String name = '',
}) async {
  try {
    await handler();
  } on DioException catch (error, stacktrace) {
    if (shouldLog) {
      final logMessage = StringBuffer()
        ..writeln('\n${name.isNotEmpty ? '| $name |' : ''}DIO EXCEPTION OCCURRED')
        ..writeln(
          'Path: ${error.requestOptions.path} ┃ Method: ${error.requestOptions.method} ┃ Status Code: ${error.response?.statusCode}',
        )
        ..writeln('Message: ${(error.message ?? '').truncate(150)}')
        ..writeln('Body: ${error.requestOptions.data}');

      log(logMessage.toString(), name: 'ErrorHandler', error: error, stackTrace: stacktrace, level: 1000);
    }

    await onDioError?.call(error, stacktrace);
  } on Object catch (error, stacktrace) {
    if (shouldLog) {
      log(
        '${name.isNotEmpty ? '| $name |' : ''} Object exception occurred: $error',
        name: 'ErrorHandler',
        error: error,
        stackTrace: stacktrace,
        level: 1000,
      );
    }

    await onError?.call(error, stacktrace);
  } finally {
    await onFinally?.call();
  }
}
```

### lib/src/core/error/error_util.dart
```dart
import 'package:flutter/material.dart' show BuildContext, ScaffoldMessenger, SnackBar, Text;

import '../../common/extensions/extensions.dart';

sealed class ErrorUtil {
  const ErrorUtil._();

  static Future<void> logError(Object exception, StackTrace stackTrace, {String? hint}) async {
    return;
  }

  static Never throwWithStackTrace(Object error, StackTrace stackTrace) => Error.throwWithStackTrace(error, stackTrace);

  static void showSnackBar(BuildContext context, Object message) => ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text('$message'), backgroundColor: context.color.error));
}
```

### lib/src/core/error/failure.dart
```dart
abstract class Failure {
  final String message;

  const Failure({required this.message});

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message});
}
```

### lib/src/core/localization/generated/app_localizations.dart
```dart
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en'), Locale('ru'), Locale('uz')];

  /// No description provided for @loginLanguageSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose language'**
  String get loginLanguageSheetTitle;

  /// No description provided for @loginLanguageSheetSelectButton.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get loginLanguageSheetSelectButton;

  /// No description provided for @loginLanguageRussian.
  ///
  /// In en, this message translates to:
  /// **'Русский'**
  String get loginLanguageRussian;

  /// No description provided for @loginLanguageUzbek.
  ///
  /// In en, this message translates to:
  /// **'O‘zbekcha'**
  String get loginLanguageUzbek;

  /// No description provided for @loginLanguageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get loginLanguageEnglish;

  /// No description provided for @loginPhoneNotFoundError.
  ///
  /// In en, this message translates to:
  /// **'Phone number not found'**
  String get loginPhoneNotFoundError;

  /// No description provided for @loginRegistrationTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginRegistrationTitle;

  /// No description provided for @loginRegistrationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number to continue'**
  String get loginRegistrationSubtitle;

  /// No description provided for @loginPhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get loginPhoneLabel;

  /// No description provided for @loginPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'99 123 45 67'**
  String get loginPhoneHint;

  /// No description provided for @loginPhonePrefix.
  ///
  /// In en, this message translates to:
  /// **'+998'**
  String get loginPhonePrefix;

  /// No description provided for @loginContinueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get loginContinueButton;

  /// No description provided for @loginAgreementPrefix.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to the '**
  String get loginAgreementPrefix;

  /// No description provided for @loginAgreementTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get loginAgreementTerms;

  /// No description provided for @loginAgreementMiddle.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get loginAgreementMiddle;

  /// No description provided for @loginAgreementPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get loginAgreementPrivacyPolicy;

  /// No description provided for @loginAgreementSuffix.
  ///
  /// In en, this message translates to:
  /// **'.'**
  String get loginAgreementSuffix;

  /// No description provided for @otpGenericError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Try again.'**
  String get otpGenericError;

  /// No description provided for @otpSmsResent.
  ///
  /// In en, this message translates to:
  /// **'SMS code resent'**
  String get otpSmsResent;

  /// No description provided for @otpTitle.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get otpTitle;

  /// No description provided for @otpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the code sent to {phone}'**
  String otpSubtitle(Object phone);

  /// No description provided for @otpResendSms.
  ///
  /// In en, this message translates to:
  /// **'Resend SMS'**
  String get otpResendSms;

  /// No description provided for @otpResendSmsIn.
  ///
  /// In en, this message translates to:
  /// **'Resend in {time}'**
  String otpResendSmsIn(Object time);

  /// No description provided for @otpConfirmButton.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get otpConfirmButton;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTitle;

  /// No description provided for @homeMyClassesSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'My classes'**
  String get homeMyClassesSectionTitle;

  /// No description provided for @homeTodayLessonsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Lessons today'**
  String get homeTodayLessonsSectionTitle;

  /// No description provided for @homeAllButton.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get homeAllButton;

  /// No description provided for @homeLoadError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load'**
  String get homeLoadError;

  /// No description provided for @homeRetryButton.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get homeRetryButton;

  /// No description provided for @homeNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get homeNotifications;

  /// No description provided for @homeAllClasses.
  ///
  /// In en, this message translates to:
  /// **'All classes'**
  String get homeAllClasses;

  /// No description provided for @homeAllLessons.
  ///
  /// In en, this message translates to:
  /// **'All lessons'**
  String get homeAllLessons;

  /// No description provided for @homeLessonStatusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get homeLessonStatusCompleted;

  /// No description provided for @homeLessonStatusNow.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get homeLessonStatusNow;

  /// No description provided for @homeLessonStatusUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get homeLessonStatusUpcoming;

  /// No description provided for @commonLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get commonLoading;

  /// No description provided for @commonError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get commonError;

  /// No description provided for @commonLoadError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load'**
  String get commonLoadError;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get commonRetry;

  /// No description provided for @commonPageNotFound.
  ///
  /// In en, this message translates to:
  /// **'Page not found: {error}'**
  String commonPageNotFound(Object error);

  /// No description provided for @commonInvalidOtpRequest.
  ///
  /// In en, this message translates to:
  /// **'Invalid OTP request'**
  String get commonInvalidOtpRequest;

  /// No description provided for @comingSoonWithTitle.
  ///
  /// In en, this message translates to:
  /// **'{title} (coming soon)'**
  String comingSoonWithTitle(Object title);

  /// No description provided for @mainNavHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get mainNavHome;

  /// No description provided for @mainNavJournal.
  ///
  /// In en, this message translates to:
  /// **'Journal'**
  String get mainNavJournal;

  /// No description provided for @mainNavChats.
  ///
  /// In en, this message translates to:
  /// **'Chats'**
  String get mainNavChats;

  /// No description provided for @mainNavProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get mainNavProfile;

  /// No description provided for @journalTitle.
  ///
  /// In en, this message translates to:
  /// **'Journal'**
  String get journalTitle;

  /// No description provided for @chatTitle.
  ///
  /// In en, this message translates to:
  /// **'Chats'**
  String get chatTitle;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @profileMenuSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get profileMenuSettings;

  /// No description provided for @profileMenuTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms of use'**
  String get profileMenuTerms;

  /// No description provided for @profileMenuSupport.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get profileMenuSupport;

  /// No description provided for @profileSupportTelegram.
  ///
  /// In en, this message translates to:
  /// **'Write via Telegram'**
  String get profileSupportTelegram;

  /// No description provided for @profileMenuLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get profileMenuLogout;

  /// No description provided for @profileLogoutConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get profileLogoutConfirmTitle;

  /// No description provided for @profilePersonalDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal data'**
  String get profilePersonalDataTitle;

  /// No description provided for @profilePersonalDataIdLabel.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get profilePersonalDataIdLabel;

  /// No description provided for @profilePersonalDataDobLabel.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get profilePersonalDataDobLabel;

  /// No description provided for @profilePersonalDataGenderLabel.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get profilePersonalDataGenderLabel;

  /// No description provided for @profilePersonalDataPhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Contact phone number'**
  String get profilePersonalDataPhoneLabel;

  /// No description provided for @profilePersonalDataAddressLabel.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get profilePersonalDataAddressLabel;

  /// No description provided for @profilePersonalDataPassportLabel.
  ///
  /// In en, this message translates to:
  /// **'Passport series and number'**
  String get profilePersonalDataPassportLabel;

  /// No description provided for @profileAvatarSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Avatar'**
  String get profileAvatarSheetTitle;

  /// No description provided for @profileAvatarSheetGallery.
  ///
  /// In en, this message translates to:
  /// **'Upload from gallery'**
  String get profileAvatarSheetGallery;

  /// No description provided for @profileAvatarSheetCamera.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get profileAvatarSheetCamera;

  /// No description provided for @profileAvatarSheetSetPhoto.
  ///
  /// In en, this message translates to:
  /// **'Set photo'**
  String get profileAvatarSheetSetPhoto;

  /// No description provided for @profileAvatarSheetDeletePhoto.
  ///
  /// In en, this message translates to:
  /// **'Delete photo'**
  String get profileAvatarSheetDeletePhoto;

  /// No description provided for @settingsLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguageTitle;

  /// No description provided for @commonNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get commonNo;

  /// No description provided for @commonYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get commonYes;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
    case 'uz':
      return AppLocalizationsUz();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
```

### lib/src/core/localization/generated/app_localizations_en.dart
```dart
// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginLanguageSheetTitle => 'Choose language';

  @override
  String get loginLanguageSheetSelectButton => 'Select';

  @override
  String get loginLanguageRussian => 'Русский';

  @override
  String get loginLanguageUzbek => 'O‘zbekcha';

  @override
  String get loginLanguageEnglish => 'English';

  @override
  String get loginPhoneNotFoundError => 'Phone number not found';

  @override
  String get loginRegistrationTitle => 'Sign in';

  @override
  String get loginRegistrationSubtitle => 'Enter your phone number to continue';

  @override
  String get loginPhoneLabel => 'Phone number';

  @override
  String get loginPhoneHint => '99 123 45 67';

  @override
  String get loginPhonePrefix => '+998';

  @override
  String get loginContinueButton => 'Continue';

  @override
  String get loginAgreementPrefix => 'By continuing, you agree to the ';

  @override
  String get loginAgreementTerms => 'Terms of Service';

  @override
  String get loginAgreementMiddle => ' and ';

  @override
  String get loginAgreementPrivacyPolicy => 'Privacy Policy';

  @override
  String get loginAgreementSuffix => '.';

  @override
  String get otpGenericError => 'Something went wrong. Try again.';

  @override
  String get otpSmsResent => 'SMS code resent';

  @override
  String get otpTitle => 'Verification';

  @override
  String otpSubtitle(Object phone) {
    return 'Enter the code sent to $phone';
  }

  @override
  String get otpResendSms => 'Resend SMS';

  @override
  String otpResendSmsIn(Object time) {
    return 'Resend in $time';
  }

  @override
  String get otpConfirmButton => 'Confirm';

  @override
  String get homeTitle => 'Home';

  @override
  String get homeMyClassesSectionTitle => 'My classes';

  @override
  String get homeTodayLessonsSectionTitle => 'Lessons today';

  @override
  String get homeAllButton => 'All';

  @override
  String get homeLoadError => 'Failed to load';

  @override
  String get homeRetryButton => 'Retry';

  @override
  String get homeNotifications => 'Notifications';

  @override
  String get homeAllClasses => 'All classes';

  @override
  String get homeAllLessons => 'All lessons';

  @override
  String get homeLessonStatusCompleted => 'Completed';

  @override
  String get homeLessonStatusNow => 'Now';

  @override
  String get homeLessonStatusUpcoming => 'Upcoming';

  @override
  String get commonLoading => 'Loading';

  @override
  String get commonError => 'Error';

  @override
  String get commonLoadError => 'Failed to load';

  @override
  String get commonRetry => 'Retry';

  @override
  String commonPageNotFound(Object error) {
    return 'Page not found: $error';
  }

  @override
  String get commonInvalidOtpRequest => 'Invalid OTP request';

  @override
  String comingSoonWithTitle(Object title) {
    return '$title (coming soon)';
  }

  @override
  String get mainNavHome => 'Home';

  @override
  String get mainNavJournal => 'Journal';

  @override
  String get mainNavChats => 'Chats';

  @override
  String get mainNavProfile => 'Profile';

  @override
  String get journalTitle => 'Journal';

  @override
  String get chatTitle => 'Chats';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileMenuSettings => 'Settings';

  @override
  String get profileMenuTerms => 'Terms of use';

  @override
  String get profileMenuSupport => 'Support';

  @override
  String get profileSupportTelegram => 'Write via Telegram';

  @override
  String get profileMenuLogout => 'Logout';

  @override
  String get profileLogoutConfirmTitle => 'Are you sure you want to log out?';

  @override
  String get profilePersonalDataTitle => 'Personal data';

  @override
  String get profilePersonalDataIdLabel => 'ID';

  @override
  String get profilePersonalDataDobLabel => 'Date of birth';

  @override
  String get profilePersonalDataGenderLabel => 'Gender';

  @override
  String get profilePersonalDataPhoneLabel => 'Contact phone number';

  @override
  String get profilePersonalDataAddressLabel => 'Address';

  @override
  String get profilePersonalDataPassportLabel => 'Passport series and number';

  @override
  String get profileAvatarSheetTitle => 'Avatar';

  @override
  String get profileAvatarSheetGallery => 'Upload from gallery';

  @override
  String get profileAvatarSheetCamera => 'Take a photo';

  @override
  String get profileAvatarSheetSetPhoto => 'Set photo';

  @override
  String get profileAvatarSheetDeletePhoto => 'Delete photo';

  @override
  String get settingsLanguageTitle => 'Language';

  @override
  String get commonNo => 'No';

  @override
  String get commonYes => 'Yes';
}
```

### lib/src/core/localization/generated/app_localizations_ru.dart
```dart
// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get loginLanguageSheetTitle => 'Выберите язык';

  @override
  String get loginLanguageSheetSelectButton => 'Выбрать';

  @override
  String get loginLanguageRussian => 'Русский';

  @override
  String get loginLanguageUzbek => 'O‘zbekcha';

  @override
  String get loginLanguageEnglish => 'English';

  @override
  String get loginPhoneNotFoundError => 'Номер телефона не найден';

  @override
  String get loginRegistrationTitle => 'Вход';

  @override
  String get loginRegistrationSubtitle => 'Введите номер телефона, чтобы продолжить';

  @override
  String get loginPhoneLabel => 'Номер телефона';

  @override
  String get loginPhoneHint => '99 123 45 67';

  @override
  String get loginPhonePrefix => '+998';

  @override
  String get loginContinueButton => 'Продолжить';

  @override
  String get loginAgreementPrefix => 'Продолжая, вы соглашаетесь с ';

  @override
  String get loginAgreementTerms => 'Условиями использования';

  @override
  String get loginAgreementMiddle => ' и ';

  @override
  String get loginAgreementPrivacyPolicy => 'Политикой конфиденциальности';

  @override
  String get loginAgreementSuffix => '.';

  @override
  String get otpGenericError => 'Что-то пошло не так. Попробуйте снова.';

  @override
  String get otpSmsResent => 'SMS-код отправлен повторно';

  @override
  String get otpTitle => 'Подтверждение';

  @override
  String otpSubtitle(Object phone) {
    return 'Введите код, отправленный на $phone';
  }

  @override
  String get otpResendSms => 'Отправить снова';

  @override
  String otpResendSmsIn(Object time) {
    return 'Отправить снова через $time';
  }

  @override
  String get otpConfirmButton => 'Подтвердить';

  @override
  String get homeTitle => 'Главная';

  @override
  String get homeMyClassesSectionTitle => 'Мои классы';

  @override
  String get homeTodayLessonsSectionTitle => 'Уроки сегодня';

  @override
  String get homeAllButton => 'Все';

  @override
  String get homeLoadError => 'Ошибка загрузки';

  @override
  String get homeRetryButton => 'Повторить';

  @override
  String get homeNotifications => 'Уведомления';

  @override
  String get homeAllClasses => 'Все классы';

  @override
  String get homeAllLessons => 'Все уроки';

  @override
  String get homeLessonStatusCompleted => 'Завершен';

  @override
  String get homeLessonStatusNow => 'Сейчас';

  @override
  String get homeLessonStatusUpcoming => 'Скоро';

  @override
  String get commonLoading => 'Загрузка';

  @override
  String get commonError => 'Ошибка';

  @override
  String get commonLoadError => 'Ошибка загрузки';

  @override
  String get commonRetry => 'Повторить';

  @override
  String commonPageNotFound(Object error) {
    return 'Страница не найдена: $error';
  }

  @override
  String get commonInvalidOtpRequest => 'Неверный запрос OTP';

  @override
  String comingSoonWithTitle(Object title) {
    return '$title (скоро)';
  }

  @override
  String get mainNavHome => 'Главная';

  @override
  String get mainNavJournal => 'Журнал';

  @override
  String get mainNavChats => 'Чаты';

  @override
  String get mainNavProfile => 'Профиль';

  @override
  String get journalTitle => 'Журнал';

  @override
  String get chatTitle => 'Чаты';

  @override
  String get profileTitle => 'Профиль';

  @override
  String get profileMenuSettings => 'Настройки';

  @override
  String get profileMenuTerms => 'Правила использования';

  @override
  String get profileMenuSupport => 'Поддержка';

  @override
  String get profileSupportTelegram => 'Написать через Telegram';

  @override
  String get profileMenuLogout => 'Выход';

  @override
  String get profileLogoutConfirmTitle => 'Вы точно хотите выйти с аккаунта?';

  @override
  String get profilePersonalDataTitle => 'Личные данные';

  @override
  String get profilePersonalDataIdLabel => 'ID';

  @override
  String get profilePersonalDataDobLabel => 'Дата рождения';

  @override
  String get profilePersonalDataGenderLabel => 'Пол';

  @override
  String get profilePersonalDataPhoneLabel => 'Телефон номер для связи';

  @override
  String get profilePersonalDataAddressLabel => 'Адрес';

  @override
  String get profilePersonalDataPassportLabel => 'Серия и номер паспорта';

  @override
  String get profileAvatarSheetTitle => 'Аватар';

  @override
  String get profileAvatarSheetGallery => 'Загрузить из галереи';

  @override
  String get profileAvatarSheetCamera => 'Сделать снимок';

  @override
  String get profileAvatarSheetSetPhoto => 'Установить фото';

  @override
  String get profileAvatarSheetDeletePhoto => 'Удалить фото';

  @override
  String get settingsLanguageTitle => 'Язык';

  @override
  String get commonNo => 'Нет';

  @override
  String get commonYes => 'Да';
}
```

### lib/src/core/localization/generated/app_localizations_uz.dart
```dart
// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class AppLocalizationsUz extends AppLocalizations {
  AppLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get loginLanguageSheetTitle => 'Tilni tanlang';

  @override
  String get loginLanguageSheetSelectButton => 'Tanlash';

  @override
  String get loginLanguageRussian => 'Русский';

  @override
  String get loginLanguageUzbek => 'O‘zbekcha';

  @override
  String get loginLanguageEnglish => 'English';

  @override
  String get loginPhoneNotFoundError => 'Telefon raqami topilmadi';

  @override
  String get loginRegistrationTitle => 'Kirish';

  @override
  String get loginRegistrationSubtitle => 'Davom etish uchun telefon raqamingizni kiriting';

  @override
  String get loginPhoneLabel => 'Telefon raqami';

  @override
  String get loginPhoneHint => '99 123 45 67';

  @override
  String get loginPhonePrefix => '+998';

  @override
  String get loginContinueButton => 'Davom etish';

  @override
  String get loginAgreementPrefix => 'Davom etish orqali siz ';

  @override
  String get loginAgreementTerms => 'Foydalanish shartlari';

  @override
  String get loginAgreementMiddle => ' va ';

  @override
  String get loginAgreementPrivacyPolicy => 'Maxfiylik siyosati';

  @override
  String get loginAgreementSuffix => ' bilan tanishganingizni tasdiqlaysiz.';

  @override
  String get otpGenericError => 'Nimadir xato ketdi. Qayta urinib ko‘ring.';

  @override
  String get otpSmsResent => 'SMS-kod qayta yuborildi';

  @override
  String get otpTitle => 'Tasdiqlash';

  @override
  String otpSubtitle(Object phone) {
    return '$phone raqamiga yuborilgan kodni kiriting';
  }

  @override
  String get otpResendSms => 'SMSni qayta yuborish';

  @override
  String otpResendSmsIn(Object time) {
    return '$time dan so‘ng qayta yuborish';
  }

  @override
  String get otpConfirmButton => 'Tasdiqlash';

  @override
  String get homeTitle => 'Bosh sahifa';

  @override
  String get homeMyClassesSectionTitle => 'Mening sinflarim';

  @override
  String get homeTodayLessonsSectionTitle => 'Bugungi darslar';

  @override
  String get homeAllButton => 'Barchasi';

  @override
  String get homeLoadError => 'Yuklashda xatolik';

  @override
  String get homeRetryButton => 'Qayta urinish';

  @override
  String get homeNotifications => 'Bildirishnomalar';

  @override
  String get homeAllClasses => 'Barcha sinflar';

  @override
  String get homeAllLessons => 'Barcha darslar';

  @override
  String get homeLessonStatusCompleted => 'Yakunlangan';

  @override
  String get homeLessonStatusNow => 'Hozir';

  @override
  String get homeLessonStatusUpcoming => 'Tez orada';

  @override
  String get commonLoading => 'Yuklanmoqda';

  @override
  String get commonError => 'Xatolik';

  @override
  String get commonLoadError => 'Yuklashda xatolik';

  @override
  String get commonRetry => 'Qayta urinish';

  @override
  String commonPageNotFound(Object error) {
    return 'Sahifa topilmadi: $error';
  }

  @override
  String get commonInvalidOtpRequest => 'OTP so‘rovi noto‘g‘ri';

  @override
  String comingSoonWithTitle(Object title) {
    return '$title (tez orada)';
  }

  @override
  String get mainNavHome => 'Bosh sahifa';

  @override
  String get mainNavJournal => 'Jurnal';

  @override
  String get mainNavChats => 'Chatlar';

  @override
  String get mainNavProfile => 'Profil';

  @override
  String get journalTitle => 'Jurnal';

  @override
  String get chatTitle => 'Chatlar';

  @override
  String get profileTitle => 'Profil';

  @override
  String get profileMenuSettings => 'Sozlamalar';

  @override
  String get profileMenuTerms => 'Foydalanish qoidalari';

  @override
  String get profileMenuSupport => 'Yordam';

  @override
  String get profileSupportTelegram => 'Telegram orqali yozish';

  @override
  String get profileMenuLogout => 'Chiqish';

  @override
  String get profileLogoutConfirmTitle => 'Hisobdan chiqmoqchimisiz?';

  @override
  String get profilePersonalDataTitle => 'Shaxsiy ma\'lumotlar';

  @override
  String get profilePersonalDataIdLabel => 'ID';

  @override
  String get profilePersonalDataDobLabel => 'Tug\'ilgan sana';

  @override
  String get profilePersonalDataGenderLabel => 'Jinsi';

  @override
  String get profilePersonalDataPhoneLabel => 'Bog\'lanish telefoni';

  @override
  String get profilePersonalDataAddressLabel => 'Manzil';

  @override
  String get profilePersonalDataPassportLabel => 'Pasport seriya va raqami';

  @override
  String get profileAvatarSheetTitle => 'Avatar';

  @override
  String get profileAvatarSheetGallery => 'Galereyadan yuklash';

  @override
  String get profileAvatarSheetCamera => 'Rasmga olish';

  @override
  String get profileAvatarSheetSetPhoto => 'Rasmni o\'rnatish';

  @override
  String get profileAvatarSheetDeletePhoto => 'Rasmni o‘chirish';

  @override
  String get settingsLanguageTitle => 'Til';

  @override
  String get commonNo => 'Yo‘q';

  @override
  String get commonYes => 'Ha';
}
```

### lib/src/core/localization/generated/intl/messages_all.dart
```dart
// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that looks up messages for specific locales by
// delegating to the appropriate library.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:implementation_imports, file_names, unnecessary_new
// ignore_for_file:unnecessary_brace_in_string_interps, directives_ordering
// ignore_for_file:argument_type_not_assignable, invalid_assignment
// ignore_for_file:prefer_single_quotes, prefer_generic_function_type_aliases
// ignore_for_file:comment_references

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
import 'package:intl/src/intl_helpers.dart';

import 'messages_en.dart' as messages_en;
import 'messages_ru.dart' as messages_ru;
import 'messages_uz.dart' as messages_uz;

typedef Future<dynamic> LibraryLoader();
Map<String, LibraryLoader> _deferredLibraries = {
  'en': () => new SynchronousFuture(null),
  'ru': () => new SynchronousFuture(null),
  'uz': () => new SynchronousFuture(null),
};

MessageLookupByLibrary? _findExact(String localeName) {
  switch (localeName) {
    case 'en':
      return messages_en.messages;
    case 'ru':
      return messages_ru.messages;
    case 'uz':
      return messages_uz.messages;
    default:
      return null;
  }
}

/// User programs should call this before using [localeName] for messages.
Future<bool> initializeMessages(String localeName) {
  var availableLocale = Intl.verifiedLocale(
    localeName,
    (locale) => _deferredLibraries[locale] != null,
    onFailure: (_) => null,
  );
  if (availableLocale == null) {
    return new SynchronousFuture(false);
  }
  var lib = _deferredLibraries[availableLocale];
  lib == null ? new SynchronousFuture(false) : lib();
  initializeInternalMessageLookup(() => new CompositeMessageLookup());
  messageLookup.addLocale(availableLocale, _findGeneratedMessagesFor);
  return new SynchronousFuture(true);
}

bool _messagesExistFor(String locale) {
  try {
    return _findExact(locale) != null;
  } catch (e) {
    return false;
  }
}

MessageLookupByLibrary? _findGeneratedMessagesFor(String locale) {
  var actualLocale = Intl.verifiedLocale(locale, _messagesExistFor, onFailure: (_) => null);
  if (actualLocale == null) return null;
  return _findExact(actualLocale);
}
```

### lib/src/core/localization/generated/intl/messages_en.dart
```dart
// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(title) => "${title} (coming soon)";

  static String m1(error) => "Page not found: ${error}";

  static String m2(time) => "Resend in ${time}";

  static String m3(phone) => "Enter the code sent to ${phone}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "chatTitle": MessageLookupByLibrary.simpleMessage("Chats"),
    "comingSoonWithTitle": m0,
    "commonError": MessageLookupByLibrary.simpleMessage("Error"),
    "commonInvalidOtpRequest": MessageLookupByLibrary.simpleMessage("Invalid OTP request"),
    "commonLoadError": MessageLookupByLibrary.simpleMessage("Failed to load"),
    "commonLoading": MessageLookupByLibrary.simpleMessage("Loading"),
    "commonNo": MessageLookupByLibrary.simpleMessage("No"),
    "commonPageNotFound": m1,
    "commonRetry": MessageLookupByLibrary.simpleMessage("Retry"),
    "commonYes": MessageLookupByLibrary.simpleMessage("Yes"),
    "homeAllButton": MessageLookupByLibrary.simpleMessage("All"),
    "homeAllClasses": MessageLookupByLibrary.simpleMessage("All classes"),
    "homeAllLessons": MessageLookupByLibrary.simpleMessage("All lessons"),
    "homeLessonStatusCompleted": MessageLookupByLibrary.simpleMessage("Completed"),
    "homeLessonStatusNow": MessageLookupByLibrary.simpleMessage("Now"),
    "homeLessonStatusUpcoming": MessageLookupByLibrary.simpleMessage("Upcoming"),
    "homeLoadError": MessageLookupByLibrary.simpleMessage("Failed to load"),
    "homeMyClassesSectionTitle": MessageLookupByLibrary.simpleMessage("My classes"),
    "homeNotifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "homeRetryButton": MessageLookupByLibrary.simpleMessage("Retry"),
    "homeTitle": MessageLookupByLibrary.simpleMessage("Home"),
    "homeTodayLessonsSectionTitle": MessageLookupByLibrary.simpleMessage("Lessons today"),
    "journalTitle": MessageLookupByLibrary.simpleMessage("Journal"),
    "loginAgreementMiddle": MessageLookupByLibrary.simpleMessage(" and "),
    "loginAgreementPrefix": MessageLookupByLibrary.simpleMessage("By continuing, you agree to the "),
    "loginAgreementPrivacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "loginAgreementSuffix": MessageLookupByLibrary.simpleMessage("."),
    "loginAgreementTerms": MessageLookupByLibrary.simpleMessage("Terms of Service"),
    "loginContinueButton": MessageLookupByLibrary.simpleMessage("Continue"),
    "loginLanguageEnglish": MessageLookupByLibrary.simpleMessage("English"),
    "loginLanguageRussian": MessageLookupByLibrary.simpleMessage("Русский"),
    "loginLanguageSheetSelectButton": MessageLookupByLibrary.simpleMessage("Select"),
    "loginLanguageSheetTitle": MessageLookupByLibrary.simpleMessage("Choose language"),
    "loginLanguageUzbek": MessageLookupByLibrary.simpleMessage("O‘zbekcha"),
    "loginPhoneHint": MessageLookupByLibrary.simpleMessage("99 123 45 67"),
    "loginPhoneLabel": MessageLookupByLibrary.simpleMessage("Phone number"),
    "loginPhoneNotFoundError": MessageLookupByLibrary.simpleMessage("Phone number not found"),
    "loginPhonePrefix": MessageLookupByLibrary.simpleMessage("+998"),
    "loginRegistrationSubtitle": MessageLookupByLibrary.simpleMessage("Enter your phone number to continue"),
    "loginRegistrationTitle": MessageLookupByLibrary.simpleMessage("Sign in"),
    "mainNavChats": MessageLookupByLibrary.simpleMessage("Chats"),
    "mainNavHome": MessageLookupByLibrary.simpleMessage("Home"),
    "mainNavJournal": MessageLookupByLibrary.simpleMessage("Journal"),
    "mainNavProfile": MessageLookupByLibrary.simpleMessage("Profile"),
    "otpConfirmButton": MessageLookupByLibrary.simpleMessage("Confirm"),
    "otpGenericError": MessageLookupByLibrary.simpleMessage("Something went wrong. Try again."),
    "otpResendSms": MessageLookupByLibrary.simpleMessage("Resend SMS"),
    "otpResendSmsIn": m2,
    "otpSmsResent": MessageLookupByLibrary.simpleMessage("SMS code resent"),
    "otpSubtitle": m3,
    "otpTitle": MessageLookupByLibrary.simpleMessage("Verification"),
    "profileAvatarSheetCamera": MessageLookupByLibrary.simpleMessage("Take a photo"),
    "profileAvatarSheetDeletePhoto": MessageLookupByLibrary.simpleMessage("Delete photo"),
    "profileAvatarSheetGallery": MessageLookupByLibrary.simpleMessage("Upload from gallery"),
    "profileAvatarSheetSetPhoto": MessageLookupByLibrary.simpleMessage("Set photo"),
    "profileAvatarSheetTitle": MessageLookupByLibrary.simpleMessage("Avatar"),
    "profileLogoutConfirmTitle": MessageLookupByLibrary.simpleMessage("Are you sure you want to log out?"),
    "profileMenuLogout": MessageLookupByLibrary.simpleMessage("Logout"),
    "profileMenuSettings": MessageLookupByLibrary.simpleMessage("Settings"),
    "profileMenuSupport": MessageLookupByLibrary.simpleMessage("Support"),
    "profileMenuTerms": MessageLookupByLibrary.simpleMessage("Terms of use"),
    "profilePersonalDataAddressLabel": MessageLookupByLibrary.simpleMessage("Address"),
    "profilePersonalDataDobLabel": MessageLookupByLibrary.simpleMessage("Date of birth"),
    "profilePersonalDataGenderLabel": MessageLookupByLibrary.simpleMessage("Gender"),
    "profilePersonalDataIdLabel": MessageLookupByLibrary.simpleMessage("ID"),
    "profilePersonalDataPassportLabel": MessageLookupByLibrary.simpleMessage("Passport series and number"),
    "profilePersonalDataPhoneLabel": MessageLookupByLibrary.simpleMessage("Contact phone number"),
    "profilePersonalDataTitle": MessageLookupByLibrary.simpleMessage("Personal data"),
    "profileSupportTelegram": MessageLookupByLibrary.simpleMessage("Write via Telegram"),
    "profileTitle": MessageLookupByLibrary.simpleMessage("Profile"),
    "settingsLanguageTitle": MessageLookupByLibrary.simpleMessage("Language"),
  };
}
```

### lib/src/core/localization/generated/intl/messages_ru.dart
```dart
// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(title) => "${title} (скоро)";

  static String m1(error) => "Страница не найдена: ${error}";

  static String m2(time) => "Отправить снова через ${time}";

  static String m3(phone) => "Введите код, отправленный на ${phone}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "chatTitle": MessageLookupByLibrary.simpleMessage("Чаты"),
    "comingSoonWithTitle": m0,
    "commonError": MessageLookupByLibrary.simpleMessage("Ошибка"),
    "commonInvalidOtpRequest": MessageLookupByLibrary.simpleMessage("Неверный запрос OTP"),
    "commonLoadError": MessageLookupByLibrary.simpleMessage("Ошибка загрузки"),
    "commonLoading": MessageLookupByLibrary.simpleMessage("Загрузка"),
    "commonNo": MessageLookupByLibrary.simpleMessage("Нет"),
    "commonPageNotFound": m1,
    "commonRetry": MessageLookupByLibrary.simpleMessage("Повторить"),
    "commonYes": MessageLookupByLibrary.simpleMessage("Да"),
    "homeAllButton": MessageLookupByLibrary.simpleMessage("Все"),
    "homeAllClasses": MessageLookupByLibrary.simpleMessage("Все классы"),
    "homeAllLessons": MessageLookupByLibrary.simpleMessage("Все уроки"),
    "homeLessonStatusCompleted": MessageLookupByLibrary.simpleMessage("Завершен"),
    "homeLessonStatusNow": MessageLookupByLibrary.simpleMessage("Сейчас"),
    "homeLessonStatusUpcoming": MessageLookupByLibrary.simpleMessage("Скоро"),
    "homeLoadError": MessageLookupByLibrary.simpleMessage("Ошибка загрузки"),
    "homeMyClassesSectionTitle": MessageLookupByLibrary.simpleMessage("Мои классы"),
    "homeNotifications": MessageLookupByLibrary.simpleMessage("Уведомления"),
    "homeRetryButton": MessageLookupByLibrary.simpleMessage("Повторить"),
    "homeTitle": MessageLookupByLibrary.simpleMessage("Главная"),
    "homeTodayLessonsSectionTitle": MessageLookupByLibrary.simpleMessage("Уроки сегодня"),
    "journalTitle": MessageLookupByLibrary.simpleMessage("Журнал"),
    "loginAgreementMiddle": MessageLookupByLibrary.simpleMessage(" и "),
    "loginAgreementPrefix": MessageLookupByLibrary.simpleMessage("Продолжая, вы соглашаетесь с "),
    "loginAgreementPrivacyPolicy": MessageLookupByLibrary.simpleMessage("Политикой конфиденциальности"),
    "loginAgreementSuffix": MessageLookupByLibrary.simpleMessage("."),
    "loginAgreementTerms": MessageLookupByLibrary.simpleMessage("Условиями использования"),
    "loginContinueButton": MessageLookupByLibrary.simpleMessage("Продолжить"),
    "loginLanguageEnglish": MessageLookupByLibrary.simpleMessage("English"),
    "loginLanguageRussian": MessageLookupByLibrary.simpleMessage("Русский"),
    "loginLanguageSheetSelectButton": MessageLookupByLibrary.simpleMessage("Выбрать"),
    "loginLanguageSheetTitle": MessageLookupByLibrary.simpleMessage("Выберите язык"),
    "loginLanguageUzbek": MessageLookupByLibrary.simpleMessage("O‘zbekcha"),
    "loginPhoneHint": MessageLookupByLibrary.simpleMessage("99 123 45 67"),
    "loginPhoneLabel": MessageLookupByLibrary.simpleMessage("Номер телефона"),
    "loginPhoneNotFoundError": MessageLookupByLibrary.simpleMessage("Номер телефона не найден"),
    "loginPhonePrefix": MessageLookupByLibrary.simpleMessage("+998"),
    "loginRegistrationSubtitle": MessageLookupByLibrary.simpleMessage("Введите номер телефона, чтобы продолжить"),
    "loginRegistrationTitle": MessageLookupByLibrary.simpleMessage("Вход"),
    "mainNavChats": MessageLookupByLibrary.simpleMessage("Чаты"),
    "mainNavHome": MessageLookupByLibrary.simpleMessage("Главная"),
    "mainNavJournal": MessageLookupByLibrary.simpleMessage("Журнал"),
    "mainNavProfile": MessageLookupByLibrary.simpleMessage("Профиль"),
    "otpConfirmButton": MessageLookupByLibrary.simpleMessage("Подтвердить"),
    "otpGenericError": MessageLookupByLibrary.simpleMessage("Что-то пошло не так. Попробуйте снова."),
    "otpResendSms": MessageLookupByLibrary.simpleMessage("Отправить снова"),
    "otpResendSmsIn": m2,
    "otpSmsResent": MessageLookupByLibrary.simpleMessage("SMS-код отправлен повторно"),
    "otpSubtitle": m3,
    "otpTitle": MessageLookupByLibrary.simpleMessage("Подтверждение"),
    "profileAvatarSheetCamera": MessageLookupByLibrary.simpleMessage("Сделать снимок"),
    "profileAvatarSheetDeletePhoto": MessageLookupByLibrary.simpleMessage("Удалить фото"),
    "profileAvatarSheetGallery": MessageLookupByLibrary.simpleMessage("Загрузить из галереи"),
    "profileAvatarSheetSetPhoto": MessageLookupByLibrary.simpleMessage("Установить фото"),
    "profileAvatarSheetTitle": MessageLookupByLibrary.simpleMessage("Аватар"),
    "profileLogoutConfirmTitle": MessageLookupByLibrary.simpleMessage("Вы точно хотите выйти с аккаунта?"),
    "profileMenuLogout": MessageLookupByLibrary.simpleMessage("Выход"),
    "profileMenuSettings": MessageLookupByLibrary.simpleMessage("Настройки"),
    "profileMenuSupport": MessageLookupByLibrary.simpleMessage("Поддержка"),
    "profileMenuTerms": MessageLookupByLibrary.simpleMessage("Правила использования"),
    "profilePersonalDataAddressLabel": MessageLookupByLibrary.simpleMessage("Адрес"),
    "profilePersonalDataDobLabel": MessageLookupByLibrary.simpleMessage("Дата рождения"),
    "profilePersonalDataGenderLabel": MessageLookupByLibrary.simpleMessage("Пол"),
    "profilePersonalDataIdLabel": MessageLookupByLibrary.simpleMessage("ID"),
    "profilePersonalDataPassportLabel": MessageLookupByLibrary.simpleMessage("Серия и номер паспорта"),
    "profilePersonalDataPhoneLabel": MessageLookupByLibrary.simpleMessage("Телефон номер для связи"),
    "profilePersonalDataTitle": MessageLookupByLibrary.simpleMessage("Личные данные"),
    "profileSupportTelegram": MessageLookupByLibrary.simpleMessage("Написать через Telegram"),
    "profileTitle": MessageLookupByLibrary.simpleMessage("Профиль"),
    "settingsLanguageTitle": MessageLookupByLibrary.simpleMessage("Язык"),
  };
}
```

### lib/src/core/localization/generated/intl/messages_uz.dart
```dart
// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a uz locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'uz';

  static String m0(title) => "${title} (tez orada)";

  static String m1(error) => "Sahifa topilmadi: ${error}";

  static String m2(time) => "${time} dan so‘ng qayta yuborish";

  static String m3(phone) => "${phone} raqamiga yuborilgan kodni kiriting";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "chatTitle": MessageLookupByLibrary.simpleMessage("Chatlar"),
    "comingSoonWithTitle": m0,
    "commonError": MessageLookupByLibrary.simpleMessage("Xatolik"),
    "commonInvalidOtpRequest": MessageLookupByLibrary.simpleMessage("OTP so‘rovi noto‘g‘ri"),
    "commonLoadError": MessageLookupByLibrary.simpleMessage("Yuklashda xatolik"),
    "commonLoading": MessageLookupByLibrary.simpleMessage("Yuklanmoqda"),
    "commonNo": MessageLookupByLibrary.simpleMessage("Yo‘q"),
    "commonPageNotFound": m1,
    "commonRetry": MessageLookupByLibrary.simpleMessage("Qayta urinish"),
    "commonYes": MessageLookupByLibrary.simpleMessage("Ha"),
    "homeAllButton": MessageLookupByLibrary.simpleMessage("Barchasi"),
    "homeAllClasses": MessageLookupByLibrary.simpleMessage("Barcha sinflar"),
    "homeAllLessons": MessageLookupByLibrary.simpleMessage("Barcha darslar"),
    "homeLessonStatusCompleted": MessageLookupByLibrary.simpleMessage("Yakunlangan"),
    "homeLessonStatusNow": MessageLookupByLibrary.simpleMessage("Hozir"),
    "homeLessonStatusUpcoming": MessageLookupByLibrary.simpleMessage("Tez orada"),
    "homeLoadError": MessageLookupByLibrary.simpleMessage("Yuklashda xatolik"),
    "homeMyClassesSectionTitle": MessageLookupByLibrary.simpleMessage("Mening sinflarim"),
    "homeNotifications": MessageLookupByLibrary.simpleMessage("Bildirishnomalar"),
    "homeRetryButton": MessageLookupByLibrary.simpleMessage("Qayta urinish"),
    "homeTitle": MessageLookupByLibrary.simpleMessage("Bosh sahifa"),
    "homeTodayLessonsSectionTitle": MessageLookupByLibrary.simpleMessage("Bugungi darslar"),
    "journalTitle": MessageLookupByLibrary.simpleMessage("Jurnal"),
    "loginAgreementMiddle": MessageLookupByLibrary.simpleMessage(" va "),
    "loginAgreementPrefix": MessageLookupByLibrary.simpleMessage("Davom etish orqali siz "),
    "loginAgreementPrivacyPolicy": MessageLookupByLibrary.simpleMessage("Maxfiylik siyosati"),
    "loginAgreementSuffix": MessageLookupByLibrary.simpleMessage(" bilan tanishganingizni tasdiqlaysiz."),
    "loginAgreementTerms": MessageLookupByLibrary.simpleMessage("Foydalanish shartlari"),
    "loginContinueButton": MessageLookupByLibrary.simpleMessage("Davom etish"),
    "loginLanguageEnglish": MessageLookupByLibrary.simpleMessage("English"),
    "loginLanguageRussian": MessageLookupByLibrary.simpleMessage("Русский"),
    "loginLanguageSheetSelectButton": MessageLookupByLibrary.simpleMessage("Tanlash"),
    "loginLanguageSheetTitle": MessageLookupByLibrary.simpleMessage("Tilni tanlang"),
    "loginLanguageUzbek": MessageLookupByLibrary.simpleMessage("O‘zbekcha"),
    "loginPhoneHint": MessageLookupByLibrary.simpleMessage("99 123 45 67"),
    "loginPhoneLabel": MessageLookupByLibrary.simpleMessage("Telefon raqami"),
    "loginPhoneNotFoundError": MessageLookupByLibrary.simpleMessage("Telefon raqami topilmadi"),
    "loginPhonePrefix": MessageLookupByLibrary.simpleMessage("+998"),
    "loginRegistrationSubtitle": MessageLookupByLibrary.simpleMessage(
      "Davom etish uchun telefon raqamingizni kiriting",
    ),
    "loginRegistrationTitle": MessageLookupByLibrary.simpleMessage("Kirish"),
    "mainNavChats": MessageLookupByLibrary.simpleMessage("Chatlar"),
    "mainNavHome": MessageLookupByLibrary.simpleMessage("Bosh sahifa"),
    "mainNavJournal": MessageLookupByLibrary.simpleMessage("Jurnal"),
    "mainNavProfile": MessageLookupByLibrary.simpleMessage("Profil"),
    "otpConfirmButton": MessageLookupByLibrary.simpleMessage("Tasdiqlash"),
    "otpGenericError": MessageLookupByLibrary.simpleMessage("Nimadir xato ketdi. Qayta urinib ko‘ring."),
    "otpResendSms": MessageLookupByLibrary.simpleMessage("SMSni qayta yuborish"),
    "otpResendSmsIn": m2,
    "otpSmsResent": MessageLookupByLibrary.simpleMessage("SMS-kod qayta yuborildi"),
    "otpSubtitle": m3,
    "otpTitle": MessageLookupByLibrary.simpleMessage("Tasdiqlash"),
    "profileAvatarSheetCamera": MessageLookupByLibrary.simpleMessage("Rasmga olish"),
    "profileAvatarSheetDeletePhoto": MessageLookupByLibrary.simpleMessage("Rasmni o‘chirish"),
    "profileAvatarSheetGallery": MessageLookupByLibrary.simpleMessage("Galereyadan yuklash"),
    "profileAvatarSheetSetPhoto": MessageLookupByLibrary.simpleMessage("Rasmni o\'rnatish"),
    "profileAvatarSheetTitle": MessageLookupByLibrary.simpleMessage("Avatar"),
    "profileLogoutConfirmTitle": MessageLookupByLibrary.simpleMessage("Hisobdan chiqmoqchimisiz?"),
    "profileMenuLogout": MessageLookupByLibrary.simpleMessage("Chiqish"),
    "profileMenuSettings": MessageLookupByLibrary.simpleMessage("Sozlamalar"),
    "profileMenuSupport": MessageLookupByLibrary.simpleMessage("Yordam"),
    "profileMenuTerms": MessageLookupByLibrary.simpleMessage("Foydalanish qoidalari"),
    "profilePersonalDataAddressLabel": MessageLookupByLibrary.simpleMessage("Manzil"),
    "profilePersonalDataDobLabel": MessageLookupByLibrary.simpleMessage("Tug\'ilgan sana"),
    "profilePersonalDataGenderLabel": MessageLookupByLibrary.simpleMessage("Jinsi"),
    "profilePersonalDataIdLabel": MessageLookupByLibrary.simpleMessage("ID"),
    "profilePersonalDataPassportLabel": MessageLookupByLibrary.simpleMessage("Pasport seriya va raqami"),
    "profilePersonalDataPhoneLabel": MessageLookupByLibrary.simpleMessage("Bog\'lanish telefoni"),
    "profilePersonalDataTitle": MessageLookupByLibrary.simpleMessage("Shaxsiy ma\'lumotlar"),
    "profileSupportTelegram": MessageLookupByLibrary.simpleMessage("Telegram orqali yozish"),
    "profileTitle": MessageLookupByLibrary.simpleMessage("Profil"),
    "settingsLanguageTitle": MessageLookupByLibrary.simpleMessage("Til"),
  };
}
```

### lib/src/core/localization/generated/l10n.dart
```dart
// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class GeneratedLocalization {
  GeneratedLocalization();

  static GeneratedLocalization? _current;

  static GeneratedLocalization get current {
    assert(
      _current != null,
      'No instance of GeneratedLocalization was loaded. Try to initialize the GeneratedLocalization delegate before accessing GeneratedLocalization.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<GeneratedLocalization> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = GeneratedLocalization();
      GeneratedLocalization._current = instance;

      return instance;
    });
  }

  static GeneratedLocalization of(BuildContext context) {
    final instance = GeneratedLocalization.maybeOf(context);
    assert(
      instance != null,
      'No instance of GeneratedLocalization present in the widget tree. Did you add GeneratedLocalization.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static GeneratedLocalization? maybeOf(BuildContext context) {
    return Localizations.of<GeneratedLocalization>(context, GeneratedLocalization);
  }

  /// `Выберите язык`
  String get loginLanguageSheetTitle {
    return Intl.message('Выберите язык', name: 'loginLanguageSheetTitle', desc: '', args: []);
  }

  /// `Выбрать`
  String get loginLanguageSheetSelectButton {
    return Intl.message('Выбрать', name: 'loginLanguageSheetSelectButton', desc: '', args: []);
  }

  /// `Русский`
  String get loginLanguageRussian {
    return Intl.message('Русский', name: 'loginLanguageRussian', desc: '', args: []);
  }

  /// `O‘zbekcha`
  String get loginLanguageUzbek {
    return Intl.message('O‘zbekcha', name: 'loginLanguageUzbek', desc: '', args: []);
  }

  /// `English`
  String get loginLanguageEnglish {
    return Intl.message('English', name: 'loginLanguageEnglish', desc: '', args: []);
  }

  /// `Номер телефона не найден`
  String get loginPhoneNotFoundError {
    return Intl.message('Номер телефона не найден', name: 'loginPhoneNotFoundError', desc: '', args: []);
  }

  /// `Вход`
  String get loginRegistrationTitle {
    return Intl.message('Вход', name: 'loginRegistrationTitle', desc: '', args: []);
  }

  /// `Введите номер телефона, чтобы продолжить`
  String get loginRegistrationSubtitle {
    return Intl.message(
      'Введите номер телефона, чтобы продолжить',
      name: 'loginRegistrationSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Номер телефона`
  String get loginPhoneLabel {
    return Intl.message('Номер телефона', name: 'loginPhoneLabel', desc: '', args: []);
  }

  /// `99 123 45 67`
  String get loginPhoneHint {
    return Intl.message('99 123 45 67', name: 'loginPhoneHint', desc: '', args: []);
  }

  /// `+998`
  String get loginPhonePrefix {
    return Intl.message('+998', name: 'loginPhonePrefix', desc: '', args: []);
  }

  /// `Продолжить`
  String get loginContinueButton {
    return Intl.message('Продолжить', name: 'loginContinueButton', desc: '', args: []);
  }

  /// `Продолжая, вы соглашаетесь с `
  String get loginAgreementPrefix {
    return Intl.message('Продолжая, вы соглашаетесь с ', name: 'loginAgreementPrefix', desc: '', args: []);
  }

  /// `Условиями использования`
  String get loginAgreementTerms {
    return Intl.message('Условиями использования', name: 'loginAgreementTerms', desc: '', args: []);
  }

  /// ` и `
  String get loginAgreementMiddle {
    return Intl.message(' и ', name: 'loginAgreementMiddle', desc: '', args: []);
  }

  /// `Политикой конфиденциальности`
  String get loginAgreementPrivacyPolicy {
    return Intl.message('Политикой конфиденциальности', name: 'loginAgreementPrivacyPolicy', desc: '', args: []);
  }

  /// `.`
  String get loginAgreementSuffix {
    return Intl.message('.', name: 'loginAgreementSuffix', desc: '', args: []);
  }

  /// `Что-то пошло не так. Попробуйте снова.`
  String get otpGenericError {
    return Intl.message('Что-то пошло не так. Попробуйте снова.', name: 'otpGenericError', desc: '', args: []);
  }

  /// `SMS-код отправлен повторно`
  String get otpSmsResent {
    return Intl.message('SMS-код отправлен повторно', name: 'otpSmsResent', desc: '', args: []);
  }

  /// `Подтверждение`
  String get otpTitle {
    return Intl.message('Подтверждение', name: 'otpTitle', desc: '', args: []);
  }

  /// `Введите код, отправленный на {phone}`
  String otpSubtitle(Object phone) {
    return Intl.message('Введите код, отправленный на $phone', name: 'otpSubtitle', desc: '', args: [phone]);
  }

  /// `Отправить снова`
  String get otpResendSms {
    return Intl.message('Отправить снова', name: 'otpResendSms', desc: '', args: []);
  }

  /// `Отправить снова через {time}`
  String otpResendSmsIn(Object time) {
    return Intl.message('Отправить снова через $time', name: 'otpResendSmsIn', desc: '', args: [time]);
  }

  /// `Подтвердить`
  String get otpConfirmButton {
    return Intl.message('Подтвердить', name: 'otpConfirmButton', desc: '', args: []);
  }

  /// `Главная`
  String get homeTitle {
    return Intl.message('Главная', name: 'homeTitle', desc: '', args: []);
  }

  /// `Мои классы`
  String get homeMyClassesSectionTitle {
    return Intl.message('Мои классы', name: 'homeMyClassesSectionTitle', desc: '', args: []);
  }

  /// `Уроки сегодня`
  String get homeTodayLessonsSectionTitle {
    return Intl.message('Уроки сегодня', name: 'homeTodayLessonsSectionTitle', desc: '', args: []);
  }

  /// `Все`
  String get homeAllButton {
    return Intl.message('Все', name: 'homeAllButton', desc: '', args: []);
  }

  /// `Ошибка загрузки`
  String get homeLoadError {
    return Intl.message('Ошибка загрузки', name: 'homeLoadError', desc: '', args: []);
  }

  /// `Повторить`
  String get homeRetryButton {
    return Intl.message('Повторить', name: 'homeRetryButton', desc: '', args: []);
  }

  /// `Уведомления`
  String get homeNotifications {
    return Intl.message('Уведомления', name: 'homeNotifications', desc: '', args: []);
  }

  /// `Все классы`
  String get homeAllClasses {
    return Intl.message('Все классы', name: 'homeAllClasses', desc: '', args: []);
  }

  /// `Все уроки`
  String get homeAllLessons {
    return Intl.message('Все уроки', name: 'homeAllLessons', desc: '', args: []);
  }

  /// `Завершен`
  String get homeLessonStatusCompleted {
    return Intl.message('Завершен', name: 'homeLessonStatusCompleted', desc: '', args: []);
  }

  /// `Сейчас`
  String get homeLessonStatusNow {
    return Intl.message('Сейчас', name: 'homeLessonStatusNow', desc: '', args: []);
  }

  /// `Скоро`
  String get homeLessonStatusUpcoming {
    return Intl.message('Скоро', name: 'homeLessonStatusUpcoming', desc: '', args: []);
  }

  /// `Загрузка`
  String get commonLoading {
    return Intl.message('Загрузка', name: 'commonLoading', desc: '', args: []);
  }

  /// `Ошибка`
  String get commonError {
    return Intl.message('Ошибка', name: 'commonError', desc: '', args: []);
  }

  /// `Ошибка загрузки`
  String get commonLoadError {
    return Intl.message('Ошибка загрузки', name: 'commonLoadError', desc: '', args: []);
  }

  /// `Повторить`
  String get commonRetry {
    return Intl.message('Повторить', name: 'commonRetry', desc: '', args: []);
  }

  /// `Страница не найдена: {error}`
  String commonPageNotFound(Object error) {
    return Intl.message('Страница не найдена: $error', name: 'commonPageNotFound', desc: '', args: [error]);
  }

  /// `Неверный запрос OTP`
  String get commonInvalidOtpRequest {
    return Intl.message('Неверный запрос OTP', name: 'commonInvalidOtpRequest', desc: '', args: []);
  }

  /// `{title} (скоро)`
  String comingSoonWithTitle(Object title) {
    return Intl.message('$title (скоро)', name: 'comingSoonWithTitle', desc: '', args: [title]);
  }

  /// `Главная`
  String get mainNavHome {
    return Intl.message('Главная', name: 'mainNavHome', desc: '', args: []);
  }

  /// `Журнал`
  String get mainNavJournal {
    return Intl.message('Журнал', name: 'mainNavJournal', desc: '', args: []);
  }

  /// `Чаты`
  String get mainNavChats {
    return Intl.message('Чаты', name: 'mainNavChats', desc: '', args: []);
  }

  /// `Профиль`
  String get mainNavProfile {
    return Intl.message('Профиль', name: 'mainNavProfile', desc: '', args: []);
  }

  /// `Журнал`
  String get journalTitle {
    return Intl.message('Журнал', name: 'journalTitle', desc: '', args: []);
  }

  /// `Чаты`
  String get chatTitle {
    return Intl.message('Чаты', name: 'chatTitle', desc: '', args: []);
  }

  /// `Профиль`
  String get profileTitle {
    return Intl.message('Профиль', name: 'profileTitle', desc: '', args: []);
  }

  /// `Настройки`
  String get profileMenuSettings {
    return Intl.message('Настройки', name: 'profileMenuSettings', desc: '', args: []);
  }

  /// `Правила использования`
  String get profileMenuTerms {
    return Intl.message('Правила использования', name: 'profileMenuTerms', desc: '', args: []);
  }

  /// `Поддержка`
  String get profileMenuSupport {
    return Intl.message('Поддержка', name: 'profileMenuSupport', desc: '', args: []);
  }

  /// `Написать через Telegram`
  String get profileSupportTelegram {
    return Intl.message('Написать через Telegram', name: 'profileSupportTelegram', desc: '', args: []);
  }

  /// `Выход`
  String get profileMenuLogout {
    return Intl.message('Выход', name: 'profileMenuLogout', desc: '', args: []);
  }

  /// `Вы точно хотите выйти с аккаунта?`
  String get profileLogoutConfirmTitle {
    return Intl.message('Вы точно хотите выйти с аккаунта?', name: 'profileLogoutConfirmTitle', desc: '', args: []);
  }

  /// `Личные данные`
  String get profilePersonalDataTitle {
    return Intl.message('Личные данные', name: 'profilePersonalDataTitle', desc: '', args: []);
  }

  /// `ID`
  String get profilePersonalDataIdLabel {
    return Intl.message('ID', name: 'profilePersonalDataIdLabel', desc: '', args: []);
  }

  /// `Дата рождения`
  String get profilePersonalDataDobLabel {
    return Intl.message('Дата рождения', name: 'profilePersonalDataDobLabel', desc: '', args: []);
  }

  /// `Пол`
  String get profilePersonalDataGenderLabel {
    return Intl.message('Пол', name: 'profilePersonalDataGenderLabel', desc: '', args: []);
  }

  /// `Телефон номер для связи`
  String get profilePersonalDataPhoneLabel {
    return Intl.message('Телефон номер для связи', name: 'profilePersonalDataPhoneLabel', desc: '', args: []);
  }

  /// `Адрес`
  String get profilePersonalDataAddressLabel {
    return Intl.message('Адрес', name: 'profilePersonalDataAddressLabel', desc: '', args: []);
  }

  /// `Серия и номер паспорта`
  String get profilePersonalDataPassportLabel {
    return Intl.message('Серия и номер паспорта', name: 'profilePersonalDataPassportLabel', desc: '', args: []);
  }

  /// `Аватар`
  String get profileAvatarSheetTitle {
    return Intl.message('Аватар', name: 'profileAvatarSheetTitle', desc: '', args: []);
  }

  /// `Загрузить из галереи`
  String get profileAvatarSheetGallery {
    return Intl.message('Загрузить из галереи', name: 'profileAvatarSheetGallery', desc: '', args: []);
  }

  /// `Сделать снимок`
  String get profileAvatarSheetCamera {
    return Intl.message('Сделать снимок', name: 'profileAvatarSheetCamera', desc: '', args: []);
  }

  /// `Установить фото`
  String get profileAvatarSheetSetPhoto {
    return Intl.message('Установить фото', name: 'profileAvatarSheetSetPhoto', desc: '', args: []);
  }

  /// `Удалить фото`
  String get profileAvatarSheetDeletePhoto {
    return Intl.message('Удалить фото', name: 'profileAvatarSheetDeletePhoto', desc: '', args: []);
  }

  /// `Язык`
  String get settingsLanguageTitle {
    return Intl.message('Язык', name: 'settingsLanguageTitle', desc: '', args: []);
  }

  /// `Нет`
  String get commonNo {
    return Intl.message('Нет', name: 'commonNo', desc: '', args: []);
  }

  /// `Да`
  String get commonYes {
    return Intl.message('Да', name: 'commonYes', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<GeneratedLocalization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'uz'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<GeneratedLocalization> load(Locale locale) => GeneratedLocalization.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
```

### lib/src/core/localization/localization.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart' as generated show GeneratedLocalization, AppLocalizationDelegate;

final class Localization extends generated.GeneratedLocalization {
  Localization._(this.locale);

  final Locale locale;

  static const LocalizationsDelegate<Localization> delegate = _LocalizationView(generated.AppLocalizationDelegate());

  static Localization get current => _current;
  static late Localization _current;

  static Localization of(BuildContext context) => switch (Localizations.of<Localization>(context, Localization)) {
    final Localization localization => localization,
    _ => throw ArgumentError(
      'Out of scope, not found inherited widget '
          'a Localization of the exact type',
      'out_of_scope',
    ),
  };

  static List<Locale> get supportedLocales => const generated.AppLocalizationDelegate().supportedLocales;

  static List<LocalizationsDelegate<Object?>> get delegates => const <LocalizationsDelegate<Object?>>[
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    Localization.delegate,
  ];
}

class _LocalizationView extends LocalizationsDelegate<Localization> {
  const _LocalizationView(LocalizationsDelegate<generated.GeneratedLocalization> delegate) : _delegate = delegate;

  final LocalizationsDelegate<generated.GeneratedLocalization> _delegate;

  @override
  bool isSupported(Locale locale) => _delegate.isSupported(locale);

  @override
  Future<Localization> load(Locale locale) => generated.GeneratedLocalization.load(
    locale,
  ).then<Localization>((localization) => Localization._current = ._(locale));

  @override
  bool shouldReload(covariant _LocalizationView old) => false;
}
```

### lib/src/core/network/interceptors/refresh_token_interceptor.dart
```dart
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:local_source/local_source.dart';

import '../../auth/auth_session_notifier.dart';
import '../../constant/urls.dart';
import '../../error/failure.dart';

final class RefreshTokenInterceptor extends Interceptor {
  RefreshTokenInterceptor({required this.localSource, required this.mainDio, required this.authSessionNotifier});

  final LocalSource localSource;
  final Dio mainDio;
  final AuthSessionNotifier authSessionNotifier;

  static const String _refreshExtraKey = 'is_refresh_token_request';
  static const String _retriedExtraKey = 'retried';

  bool _isRefreshing = false;
  Completer<void>? _refreshCompleter;
  Dio? _refreshDio;

  bool _isRefreshTokenRequest(RequestOptions options) => options.extra[_refreshExtraKey] == true;

  Dio _getRefreshDio() {
    final existing = _refreshDio;
    if (existing != null) return existing;

    final baseOptions = mainDio.options;
    final Map<String, Object?> refreshHeaders = .from(baseOptions.headers)..remove('Authorization');

    final dio = Dio(
      BaseOptions(
        baseUrl: baseOptions.baseUrl,
        headers: refreshHeaders.cast<String, dynamic>(),
        connectTimeout: baseOptions.connectTimeout,
        receiveTimeout: baseOptions.receiveTimeout,
        sendTimeout: baseOptions.sendTimeout,
        responseType: baseOptions.responseType,
        validateStatus: baseOptions.validateStatus,
      ),
    );

    // Copy interceptors from main dio except this one.
    for (final interceptor in mainDio.interceptors) {
      if (interceptor is RefreshTokenInterceptor) continue;
      dio.interceptors.add(interceptor);
    }

    // Ensure refresh request never carries Authorization, even if another interceptor adds it.
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_isRefreshTokenRequest(options)) {
            options.headers.remove('Authorization');
          }
          handler.next(options);
        },
      ),
    );

    _refreshDio = dio;
    return dio;
  }

  Future<void> _logout() async {
    await localSource.clearAll();
    authSessionNotifier.notifySessionChanged();
  }

  ({String accessToken, String refreshToken}) _parseTokens(Object? data) {
    if (data is! Map) throw const ServerFailure(message: 'Invalid refresh response');
    final Map<String, Object?> json = data.cast<String, Object?>();

    if (json case {
      'data': {
        'data': {
          'data': {'token': {'access_token': final String accessToken, 'refresh_token': final String refreshToken}},
        },
      },
    }) {
      return (accessToken: accessToken, refreshToken: refreshToken);
    }

    throw ServerFailure(message: (json['data'] as String?) ?? 'Invalid refresh response');
  }

  Future<void> _performRefreshToken() async {
    if (_isRefreshing) {
      await (_refreshCompleter?.future ?? Future<void>.value());
      return;
    }

    _isRefreshing = true;
    _refreshCompleter = Completer<void>();

    try {
      final refreshToken = localSource.refreshToken;
      if (refreshToken.isEmpty) {
        throw const ServerFailure(message: 'No refresh token found');
      }

      final refreshDio = _getRefreshDio();

      final Response<Object?> response = await refreshDio.post<Object?>(
        Urls.prefix,
        data: <String, Object?>{
          'data': <String, Object?>{
            'method': 'refresh_token',
            'object_data': <String, Object?>{'refresh_token': refreshToken},
          },
        },
        options: Options(
          extra: <String, Object?>{_refreshExtraKey: true},
          headers: <String, dynamic>{'Application-Language': localSource.localization.languageCode},
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      final int? statusCode = response.statusCode;
      if (statusCode != 200 && statusCode != 201) {
        throw ServerFailure(message: 'Refresh failed: $statusCode');
      }

      final parsed = _parseTokens(response.data);
      if (parsed.accessToken.isEmpty || parsed.refreshToken.isEmpty) {
        throw const ServerFailure(message: 'Empty tokens received');
      }

      await localSource.setAccessToken(parsed.accessToken);
      await localSource.setRefreshToken(parsed.refreshToken);
      authSessionNotifier.notifySessionChanged();

      _refreshCompleter?.complete();
    } catch (err) {
      _refreshCompleter?.completeError(err);
      rethrow;
    } finally {
      _isRefreshing = false;
    }
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final RequestOptions requestOptions = err.requestOptions;

    if (_isRefreshTokenRequest(requestOptions)) {
      await _logout();
      return handler.reject(err);
    }

    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    if (localSource.refreshToken.isEmpty) {
      return handler.next(err);
    }

    final bool alreadyRetried = requestOptions.extra[_retriedExtraKey] == true;
    if (alreadyRetried) {
      await _logout();
      return handler.reject(err);
    }

    try {
      await _performRefreshToken();

      final String newAccessToken = localSource.accessToken;
      if (newAccessToken.isEmpty) {
        throw const ServerFailure(message: 'New access token is empty after refresh');
      }

      final Map<String, Object?> updatedHeaders = .from(requestOptions.headers);
      updatedHeaders['Authorization'] = 'Bearer $newAccessToken';

      final RequestOptions retryRequest = requestOptions.copyWith(
        headers: updatedHeaders.cast<String, dynamic>(),
        extra: <String, Object?>{...requestOptions.extra, _retriedExtraKey: true},
      );

      final Response<Object?> response = await mainDio.fetch<Object?>(retryRequest);
      return handler.resolve(response);
    } on Object {
      await _logout();
      return handler.reject(err);
    }
  }
}
```

### lib/src/core/router/routes.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:local_source/local_source.dart';

import '../../features/auth/presentation/bloc/auth_cubit.dart';
import '../../features/auth/presentation/screen/login_screen.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/home/presentation/screen/home_screen.dart';
import '../../features/journal/presentation/cubit/journal_cubit.dart';
import '../../features/journal/presentation/screen/journal_screen.dart';
import '../../features/main/presentation/screen/main_screen.dart';
import '../../features/profile/presentation/cubit/profile_cubit.dart';
import '../../features/profile/presentation/screen/profile_screen.dart';
import '../auth/auth_session_notifier.dart';
import '../di/injection.dart';

sealed class AppRouter {
  const AppRouter._();

  static const String initial = '/';
  static const String home = '/home';
  static const String journal = '/journal';
  static const String profile = '/profile';

  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final shellNavigatorKey = GlobalKey<NavigatorState>();

  static String? _redirect(GoRouterState state) {
    final bool isAuthenticated = sl<LocalSource>().isUserAuthenticated;
    final String location = state.uri.path;

    final bool isInAuthFlow = location == initial;
    final bool isInProtectedArea =
        location.startsWith(home) || location.startsWith(journal) || location.startsWith(profile);

    if (!isAuthenticated && isInProtectedArea) return initial;
    if (isAuthenticated && isInAuthFlow) return home;
    return null;
  }

  static ShellRoute _authShellRoute() => ShellRoute(
    builder: (context, state, child) => BlocProvider(create: (_) => sl<AuthCubit>(), child: child),
    routes: [GoRoute(path: initial, name: initial, builder: (_, _) => const LoginScreen())],
  );

  static ShellRoute _mainShellRoute() => ShellRoute(
    navigatorKey: shellNavigatorKey,
    builder: (context, state, child) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthCubit>()),
        BlocProvider(create: (_) => sl<HomeCubit>()),
        BlocProvider(create: (_) => sl<JournalCubit>()),
        BlocProvider(create: (_) => sl<ProfileCubit>()),
      ],
      child: MainScreen(child: child),
    ),
    routes: [
      GoRoute(
        path: home,
        name: home,
        pageBuilder: (_, _) => const NoTransitionPage(child: HomeScreen()),
      ),
      GoRoute(
        path: journal,
        name: journal,
        pageBuilder: (_, _) => const NoTransitionPage(child: JournalScreen()),
      ),
      GoRoute(
        path: profile,
        name: profile,
        pageBuilder: (_, _) => const NoTransitionPage(child: ProfileScreen()),
      ),
    ],
  );

  static final router = GoRouter(
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => Scaffold(body: Center(child: Text('Page not found: ${state.error}'))),
    navigatorKey: rootNavigatorKey,
    refreshListenable: sl<AuthSessionNotifier>(),
    redirect: (_, state) => _redirect(state),
    initialLocation: initial,
    routes: [_authShellRoute(), _mainShellRoute()],
  );
}
```

### lib/src/core/shared/settings/data/repository/settings_repository_impl.dart
```dart
import 'package:flutter/material.dart';
import 'package:local_source/local_source.dart';
import '../../domain/repository/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl({required LocalSource localSource}) : _localSource = localSource;

  final LocalSource _localSource;

  @override
  Locale get locale => _localSource.localization;

  @override
  Future<void> setLocale(Locale locale) => _localSource.setLocalization(locale);

  @override
  ThemeMode get themeMode => _localSource.theme;

  @override
  Future<void> setThemeMode(ThemeMode themeMode) => _localSource.setTheme(themeMode);
}
```

### lib/src/core/shared/settings/domain/repository/settings_repository.dart
```dart
import 'package:flutter/material.dart';

abstract class SettingsRepository {
  Locale get locale;
  Future<void> setLocale(Locale locale);

  ThemeMode get themeMode;
  Future<void> setThemeMode(ThemeMode themeMode);
}
```

### lib/src/core/shared/settings/presentation/bloc/settings_cubit.dart
```dart
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../localization/generated/app_localizations.dart';
import '../../domain/repository/settings_repository.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required SettingsRepository settingsRepository})
    : _settingsRepository = settingsRepository,
      super(
        SettingsState(locale: _normalizeLocale(settingsRepository.locale), themeMode: settingsRepository.themeMode),
      );

  final SettingsRepository _settingsRepository;

  static Locale _normalizeLocale(Locale locale) {
    final List<Locale> supported = AppLocalizations.supportedLocales;
    for (final Locale candidate in supported) {
      if (candidate.languageCode == locale.languageCode && (candidate.scriptCode ?? '') == (locale.scriptCode ?? '')) {
        return candidate;
      }
    }

    for (final Locale candidate in supported) {
      if (candidate.languageCode == locale.languageCode) return candidate;
    }

    return supported.first;
  }

  Future<void> updateLocale(Locale locale) async {
    final Locale normalized = _normalizeLocale(locale);
    await _settingsRepository.setLocale(normalized);
    emit(state.copyWith(locale: normalized));
  }

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    await _settingsRepository.setThemeMode(themeMode);
    emit(state.copyWith(themeMode: themeMode));
  }
}
```

### lib/src/core/shared/settings/presentation/bloc/settings_state.dart
```dart
import 'package:flutter/material.dart';

@immutable
class SettingsState {
  const SettingsState({required this.locale, required this.themeMode});

  final Locale locale;
  final ThemeMode themeMode;

  SettingsState copyWith({Locale? locale, ThemeMode? themeMode}) =>
      SettingsState(locale: locale ?? this.locale, themeMode: themeMode ?? this.themeMode);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsState &&
          runtimeType == other.runtimeType &&
          locale == other.locale &&
          themeMode == other.themeMode;

  @override
  int get hashCode => locale.hashCode ^ themeMode.hashCode;
}
```

### lib/src/core/theme/extension/text_style_ext.dart
```dart
import '../theme_colors.dart';
import 'package:flutter/material.dart';

extension TextStyleExt on TextStyle {
  TextStyle get withWhiteColor => copyWith(color: ThemeColors.whiteColor);
  TextStyle get withBlackColor => copyWith(color: ThemeColors.blackColor);
  TextStyle get withTransparentColor => copyWith(color: ThemeColors.transparentColor);
  TextStyle get withPrimaryColor => copyWith(color: ThemeColors.primaryColor);
  TextStyle get withErrorColor => copyWith(color: ThemeColors.errorColor);

  // Size and weight example:
  // TextStyle get withW500S16 => copyWith(fontSize: 16, fontWeight: .w500);
}
```

### lib/src/core/theme/theme_colors.dart
```dart
import 'package:flutter/material.dart';

@immutable
final class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.primary,
    required this.success,
    required this.error,
    required this.white,
    required this.black,
    required this.transparent,
    required this.scaffoldBackground,
    required this.grey60,
    required this.grey300,
    required this.grey500,
    required this.grey400,
    required this.grey950,
    required this.shimmer1,
    required this.shimmer2,
    required this.shimmer3,
  });

  final Color primary;
  final Color success;
  final Color error;
  final Color white;
  final Color black;
  final Color transparent;
  final Color scaffoldBackground;
  final Color grey300;
  final Color grey500;
  final Color grey400;
  final Color grey950;
  final Color grey60;
  final Color shimmer1;
  final Color shimmer2;
  final Color shimmer3;

  static const primaryColor = Color(0xFF6579FF);
  static const successColor = Color(0xFF12B76A);
  static const errorColor = Color(0xFFF44336);
  static const whiteColor = Color(0xFFFFFFFF);
  static const blackColor = Color(0xFF000000);
  static const transparentColor = Colors.transparent;
  static const lightScaffoldBackgroundColor = Color(0xFFFFFFFF);
  static const darkScaffoldBackgroundColor = Color(0xFFFFFFFF);
  static const grey300Color = Color(0xFFD0D5DD);
  static const grey60Color = Color(0xFFF2F4F7);
  static const grey500Color = Color(0xFF667085);
  static const grey400Color = Color(0xFF98A2B3);
  static const grey950Color = Color(0xFF0C111D);
  static const shimmer1Color = Color(0xFFE8E8E8);
  static const shimmer2Color = Color(0xFFF5F5F5);
  static const shimmer3Color = Color(0xFFDDDDDD);

  static const light = ThemeColors(
    primary: primaryColor,
    success: successColor,
    error: errorColor,
    white: whiteColor,
    black: blackColor,
    transparent: transparentColor,
    scaffoldBackground: lightScaffoldBackgroundColor,
    grey300: grey300Color,
    grey60: grey60Color,
    grey500: grey500Color,
    grey400: grey400Color,
    grey950: grey950Color,
    shimmer1: shimmer1Color,
    shimmer2: shimmer2Color,
    shimmer3: shimmer3Color,
  );

  static const dark = ThemeColors(
    primary: primaryColor,
    success: successColor,
    error: errorColor,
    white: whiteColor,
    black: blackColor,
    transparent: transparentColor,
    scaffoldBackground: darkScaffoldBackgroundColor,
    grey300: grey300Color,
    grey60: grey60Color,
    grey500: grey500Color,
    grey400: grey400Color,
    grey950: grey950Color,
    shimmer1: shimmer1Color,
    shimmer2: shimmer2Color,
    shimmer3: shimmer3Color,
  );

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? primary,
    Color? success,
    Color? error,
    Color? white,
    Color? black,
    Color? transparent,
    Color? scaffoldBackground,
    Color? grey300,
    Color? grey60,
    Color? grey500,
    Color? grey400,
    Color? grey950,
    Color? shimmer1,
    Color? shimmer2,
    Color? shimmer3,
  }) => ThemeColors(
    primary: primary ?? this.primary,
    success: success ?? this.success,
    error: error ?? this.error,
    white: white ?? this.white,
    black: black ?? this.black,
    transparent: transparent ?? this.transparent,
    scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
    grey300: grey300 ?? this.grey300,
    grey60: grey60 ?? this.grey60,
    grey500: grey500 ?? this.grey500,
    grey400: grey400 ?? this.grey400,
    grey950: grey950 ?? this.grey950,
    shimmer1: shimmer1 ?? this.shimmer1,
    shimmer2: shimmer2 ?? this.shimmer2,
    shimmer3: shimmer3 ?? this.shimmer3,
  );

  @override
  ThemeExtension<ThemeColors> lerp(ThemeExtension<ThemeColors>? other, double t) => other is! ThemeColors
      ? this
      : ThemeColors(
          primary: Color.lerp(primary, other.primary, t)!,
          success: Color.lerp(success, other.success, t)!,
          error: Color.lerp(error, other.error, t)!,
          white: Color.lerp(white, other.white, t)!,
          black: Color.lerp(black, other.black, t)!,
          transparent: Color.lerp(transparent, other.transparent, t)!,
          scaffoldBackground: Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
          grey300: Color.lerp(grey300, other.grey300, t)!,
          grey60: Color.lerp(grey60, other.grey60, t)!,
          grey500: Color.lerp(grey500, other.grey500, t)!,
          grey400: Color.lerp(grey400, other.grey400, t)!,
          grey950: Color.lerp(grey950, other.grey950, t)!,
          shimmer1: Color.lerp(shimmer1, other.shimmer1, t)!,
          shimmer2: Color.lerp(shimmer2, other.shimmer2, t)!,
          shimmer3: Color.lerp(shimmer3, other.shimmer3, t)!,
        );
}
```

### lib/src/core/theme/theme_data.dart
```dart
import 'package:flutter/material.dart';

import 'theme_colors.dart';
import 'theme_text_style.dart';

/// {@template theme}
/// App theme data.
/// {@endtemplate}
extension type AppThemeData._(ThemeData data) implements ThemeData {
  /// {@macro theme}
  factory AppThemeData.light({String? fontFamily}) => ._(_appLightTheme(fontFamily));

  /// {@macro theme}
  factory AppThemeData.dark({String? fontFamily}) => ._(_appDarkTheme(fontFamily));
}

/// Extension on [ThemeData] to provide App theme data.
extension AutoThemeExtension on ThemeData {
  /// Returns the App theme colors.
  ThemeColors get appColors =>
      extension<ThemeColors>() ??
      switch (brightness) {
        .light => .light,
        .dark => .dark,
      };

  ThemeTextStyles get appTextStyles =>
      extension<ThemeTextStyles>() ??
      switch (brightness) {
        .light => .light,
        .dark => .dark,
      };
}
// --- Light Theme --- //

/// Light theme data for the App.
ThemeData _appLightTheme(String? fontFamily) => ThemeData(
  fontFamily: fontFamily,
  brightness: .light,
  useMaterial3: true,
  scaffoldBackgroundColor: ThemeColors.lightScaffoldBackgroundColor,
  extensions: <ThemeExtension<Object?>>{ThemeColors.light, ThemeTextStyles.light},
);

// --- Dark Theme --- //

/// Dark theme data for the App.
ThemeData _appDarkTheme(String? fontFamily) => ThemeData(
  fontFamily: fontFamily,
  brightness: .dark,
  useMaterial3: true,
  scaffoldBackgroundColor: ThemeColors.darkScaffoldBackgroundColor,
  extensions: <ThemeExtension<Object?>>{ThemeColors.dark, ThemeTextStyles.dark},
);
```

### lib/src/core/theme/theme_text_style.dart
```dart
import 'package:flutter/material.dart';

import '../constant/gen/fonts.gen.dart';
import 'theme_colors.dart';

/// {@template theme_text_styles}
/// Text style tokens for the app.
/// {@endtemplate}
@immutable
final class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  const ThemeTextStyles({
    required this.interW500s10,
    required this.interW400s12,
    required this.interW400s12Grey500,
    required this.interW400s14,
    required this.interW400s14Grey500,
    required this.interW400s16,
    required this.interW500s14,
    required this.interW500s14Grey500,
    required this.interW500s16,
    required this.interW600s12,
    required this.interW600s14,
    required this.interW600s14Error,
    required this.interW600s14White,
    required this.interW600s16,
    required this.interW700s16,
    required this.interW700s16White,
    required this.sfProDisplayW700s18,
    required this.sfProDisplayW700s20,
    required this.sfProDisplayW800s26,
    required this.sfProDisplayW900s30,
    required this.sfProDisplayW900s32,
  });

  static const _lightThemeTextStyleColor = Color(0xff0C111D); // default gray800
  static const _darkThemeTextStyleColor = Colors.white;

  // Inter
  final TextStyle interW500s10;
  final TextStyle interW400s12;
  final TextStyle interW400s12Grey500;
  final TextStyle interW400s14;
  final TextStyle interW400s14Grey500;
  final TextStyle interW400s16;
  final TextStyle interW500s14;
  final TextStyle interW500s14Grey500;
  final TextStyle interW500s16;
  final TextStyle interW600s12;
  final TextStyle interW600s14;
  final TextStyle interW600s14Error;
  final TextStyle interW600s14White;
  final TextStyle interW600s16;
  final TextStyle interW700s16;
  final TextStyle interW700s16White;

  // SF Pro Display
  final TextStyle sfProDisplayW700s18;
  final TextStyle sfProDisplayW700s20;
  final TextStyle sfProDisplayW800s26;
  final TextStyle sfProDisplayW900s30;
  final TextStyle sfProDisplayW900s32;

  static const _interTextStyle = TextStyle(fontFamily: FontFamily.inter, decoration: .none);
  static const _sfProDisplayTextStyle = TextStyle(fontFamily: FontFamily.sFProDisplay, decoration: .none);

  static final light = ThemeTextStyles(
    interW500s10: _interTextStyle.copyWith(fontSize: 10, fontWeight: .w500, color: _lightThemeTextStyleColor),
    interW400s12: _interTextStyle.copyWith(fontSize: 12, fontWeight: .w400, color: _lightThemeTextStyleColor),
    interW400s12Grey500: _interTextStyle.copyWith(fontSize: 12, fontWeight: .w400, color: ThemeColors.grey500Color),
    interW400s14: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w400, color: _lightThemeTextStyleColor),
    interW400s14Grey500: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w400, color: ThemeColors.grey500Color),
    interW400s16: _interTextStyle.copyWith(fontSize: 16, fontWeight: .w400, color: _lightThemeTextStyleColor),
    interW500s14: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w500, color: _lightThemeTextStyleColor),
    interW500s14Grey500: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w500, color: ThemeColors.grey500Color),
    interW500s16: _interTextStyle.copyWith(fontSize: 16, fontWeight: .w500, color: _lightThemeTextStyleColor),
    interW600s12: _interTextStyle.copyWith(fontSize: 12, fontWeight: .w600, color: _lightThemeTextStyleColor),
    interW600s14: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w600, color: _lightThemeTextStyleColor),
    interW600s14Error: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w600, color: ThemeColors.errorColor),
    interW600s14White: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w600, color: ThemeColors.whiteColor),
    interW600s16: _interTextStyle.copyWith(fontSize: 16, fontWeight: .w600, color: _lightThemeTextStyleColor),
    interW700s16: _interTextStyle.copyWith(fontSize: 16, fontWeight: .w700, color: _lightThemeTextStyleColor),
    interW700s16White: _interTextStyle.copyWith(fontSize: 16, fontWeight: .w700, color: ThemeColors.whiteColor),
    sfProDisplayW700s18: _sfProDisplayTextStyle.copyWith(
      fontSize: 18,
      fontWeight: .w700,
      color: _lightThemeTextStyleColor,
    ),
    sfProDisplayW700s20: _sfProDisplayTextStyle.copyWith(
      fontSize: 20,
      fontWeight: .w700,
      color: _lightThemeTextStyleColor,
    ),
    sfProDisplayW800s26: _sfProDisplayTextStyle.copyWith(
      fontSize: 26,
      fontWeight: .w800,
      color: _lightThemeTextStyleColor,
    ),
    sfProDisplayW900s30: _sfProDisplayTextStyle.copyWith(
      fontSize: 30,
      fontWeight: .w900,
      color: _lightThemeTextStyleColor,
    ),
    sfProDisplayW900s32: _sfProDisplayTextStyle.copyWith(
      fontSize: 32,
      fontWeight: .w900,
      color: _lightThemeTextStyleColor,
    ),
  );

  static final dark = ThemeTextStyles(
    interW500s10: _interTextStyle.copyWith(fontSize: 10, fontWeight: .w500, color: _darkThemeTextStyleColor),
    interW400s12: _interTextStyle.copyWith(fontSize: 12, fontWeight: .w400, color: _darkThemeTextStyleColor),
    interW400s12Grey500: _interTextStyle.copyWith(fontSize: 12, fontWeight: .w400, color: ThemeColors.grey500Color),
    interW400s14: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w400, color: _darkThemeTextStyleColor),
    interW400s14Grey500: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w400, color: ThemeColors.grey500Color),
    interW400s16: _interTextStyle.copyWith(fontSize: 16, fontWeight: .w400, color: _darkThemeTextStyleColor),
    interW500s14: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w500, color: _darkThemeTextStyleColor),
    interW500s14Grey500: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w500, color: ThemeColors.grey500Color),
    interW500s16: _interTextStyle.copyWith(fontSize: 16, fontWeight: .w500, color: _darkThemeTextStyleColor),
    interW600s12: _interTextStyle.copyWith(fontSize: 12, fontWeight: .w600, color: _darkThemeTextStyleColor),
    interW600s14: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w600, color: _darkThemeTextStyleColor),
    interW600s14Error: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w600, color: ThemeColors.errorColor),
    interW600s14White: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w600, color: ThemeColors.whiteColor),
    interW600s16: _interTextStyle.copyWith(fontSize: 16, fontWeight: .w600, color: _darkThemeTextStyleColor),
    interW700s16: _interTextStyle.copyWith(fontSize: 16, fontWeight: .w700, color: _darkThemeTextStyleColor),
    interW700s16White: _interTextStyle.copyWith(fontSize: 16, fontWeight: .w700, color: ThemeColors.whiteColor),
    sfProDisplayW700s18: _sfProDisplayTextStyle.copyWith(
      fontSize: 18,
      fontWeight: .w700,
      color: _darkThemeTextStyleColor,
    ),
    sfProDisplayW700s20: _sfProDisplayTextStyle.copyWith(
      fontSize: 20,
      fontWeight: .w700,
      color: _darkThemeTextStyleColor,
    ),
    sfProDisplayW800s26: _sfProDisplayTextStyle.copyWith(
      fontSize: 26,
      fontWeight: .w800,
      color: _darkThemeTextStyleColor,
    ),
    sfProDisplayW900s30: _sfProDisplayTextStyle.copyWith(
      fontSize: 30,
      fontWeight: .w900,
      color: _darkThemeTextStyleColor,
    ),
    sfProDisplayW900s32: _sfProDisplayTextStyle.copyWith(
      fontSize: 32,
      fontWeight: .w900,
      color: _darkThemeTextStyleColor,
    ),
  );

  @override
  ThemeTextStyles copyWith({
    TextStyle? interW500s10,
    TextStyle? interW400s12,
    TextStyle? interW400s12Grey500,
    TextStyle? interW400s14,
    TextStyle? interW400s14Grey500,
    TextStyle? interW400s16,
    TextStyle? interW500s14,
    TextStyle? interW500s14Grey500,
    TextStyle? interW500s16,
    TextStyle? interW600s12,
    TextStyle? interW600s14,
    TextStyle? interW600s14Error,
    TextStyle? interW600s14White,
    TextStyle? interW600s16,
    TextStyle? interW700s16,
    TextStyle? interW700s16White,
    TextStyle? sfProDisplayW700s18,
    TextStyle? sfProDisplayW700s20,
    TextStyle? sfProDisplayW800s26,
    TextStyle? sfProDisplayW900s30,
    TextStyle? sfProDisplayW900s32,
  }) => ThemeTextStyles(
    interW500s10: interW500s10 ?? this.interW500s10,
    interW400s12: interW400s12 ?? this.interW400s12,
    interW400s12Grey500: interW400s12Grey500 ?? this.interW400s12Grey500,
    interW400s14: interW400s14 ?? this.interW400s14,
    interW400s14Grey500: interW400s14Grey500 ?? this.interW400s14Grey500,
    interW400s16: interW400s16 ?? this.interW400s16,
    interW500s14: interW500s14 ?? this.interW500s14,
    interW500s14Grey500: interW500s14Grey500 ?? this.interW500s14Grey500,
    interW500s16: interW500s16 ?? this.interW500s16,
    interW600s12: interW600s12 ?? this.interW600s12,
    interW600s14: interW600s14 ?? this.interW600s14,
    interW600s14Error: interW600s14Error ?? this.interW600s14Error,
    interW600s14White: interW600s14White ?? this.interW600s14White,
    interW600s16: interW600s16 ?? this.interW600s16,
    interW700s16: interW700s16 ?? this.interW700s16,
    interW700s16White: interW700s16White ?? this.interW700s16White,
    sfProDisplayW700s18: sfProDisplayW700s18 ?? this.sfProDisplayW700s18,
    sfProDisplayW700s20: sfProDisplayW700s20 ?? this.sfProDisplayW700s20,
    sfProDisplayW800s26: sfProDisplayW800s26 ?? this.sfProDisplayW800s26,
    sfProDisplayW900s30: sfProDisplayW900s30 ?? this.sfProDisplayW900s30,
    sfProDisplayW900s32: sfProDisplayW900s32 ?? this.sfProDisplayW900s32,
  );

  @override
  ThemeTextStyles lerp(covariant ThemeExtension<ThemeTextStyles>? other, double t) {
    if (other is! ThemeTextStyles) {
      return this;
    }
    return ThemeTextStyles(
      interW500s10: TextStyle.lerp(interW500s10, other.interW500s10, t)!,
      interW400s12: TextStyle.lerp(interW400s12, other.interW400s12, t)!,
      interW400s12Grey500: TextStyle.lerp(interW400s12Grey500, other.interW400s12Grey500, t)!,
      interW400s14: TextStyle.lerp(interW400s14, other.interW400s14, t)!,
      interW400s14Grey500: TextStyle.lerp(interW400s14Grey500, other.interW400s14Grey500, t)!,
      interW400s16: TextStyle.lerp(interW400s16, other.interW400s16, t)!,
      interW500s14: TextStyle.lerp(interW500s14, other.interW500s14, t)!,
      interW500s14Grey500: TextStyle.lerp(interW500s14Grey500, other.interW500s14Grey500, t)!,
      interW500s16: TextStyle.lerp(interW500s16, other.interW500s16, t)!,
      interW600s12: TextStyle.lerp(interW600s12, other.interW600s12, t)!,
      interW600s14: TextStyle.lerp(interW600s14, other.interW600s14, t)!,
      interW600s14Error: TextStyle.lerp(interW600s14Error, other.interW600s14Error, t)!,
      interW600s14White: TextStyle.lerp(interW600s14White, other.interW600s14White, t)!,
      interW600s16: TextStyle.lerp(interW600s16, other.interW600s16, t)!,
      interW700s16: TextStyle.lerp(interW700s16, other.interW700s16, t)!,
      interW700s16White: TextStyle.lerp(interW700s16White, other.interW700s16White, t)!,
      sfProDisplayW700s18: TextStyle.lerp(sfProDisplayW700s18, other.sfProDisplayW700s18, t)!,
      sfProDisplayW700s20: TextStyle.lerp(sfProDisplayW700s20, other.sfProDisplayW700s20, t)!,
      sfProDisplayW800s26: TextStyle.lerp(sfProDisplayW800s26, other.sfProDisplayW800s26, t)!,
      sfProDisplayW900s30: TextStyle.lerp(sfProDisplayW900s30, other.sfProDisplayW900s30, t)!,
      sfProDisplayW900s32: TextStyle.lerp(sfProDisplayW900s32, other.sfProDisplayW900s32, t)!,
    );
  }
}
```

### lib/src/core/widget/button/custom_button.dart
```dart
import 'package:flutter/material.dart';

import '../../../common/extensions/extensions.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    required this.title,
    this.backgroundColor,
    this.secondaryColor,
    this.onTap,
    this.titleColor,
    this.isDisabled = false,
    this.isLoading = false,
    this.height = 48,
    this.width,
    this.borderRadius = const .all(.circular(56)),
    super.key,
    this.icon,
    this.titleStyle,
  });

  final Color? backgroundColor;
  final Color? secondaryColor;
  final Color? titleColor;
  final String title;
  final VoidCallback? onTap;
  final bool isDisabled;
  final bool isLoading;
  final double height;
  final double? width;
  final BorderRadiusGeometry borderRadius;
  final Widget? icon;
  final TextStyle? titleStyle;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle =
        widget.titleStyle ??
        context.textTheme.interW600s14.copyWith(
          color: widget.isDisabled ? context.color.grey300 : (widget.titleColor ?? context.color.white),
        );

    final bool isInteractive = !widget.isDisabled && !widget.isLoading && widget.onTap != null;

    return GestureDetector(
      onTap: isInteractive ? widget.onTap : null,
      child: SizedBox(
        height: widget.height + 3,
        width: widget.width ?? .infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: widget.isDisabled ? context.color.grey60 : (widget.backgroundColor ?? context.color.primary),
            borderRadius: widget.borderRadius,
          ),
          child: Center(
            child: widget.isLoading
                ? const CircularProgressIndicator.adaptive()
                : widget.icon != null
                ? Row(
                    mainAxisAlignment: .center,
                    children: [
                      widget.icon!,
                      const SizedBox(width: 8),
                      Text(widget.title, style: titleStyle),
                    ],
                  )
                : Text(widget.title, style: titleStyle),
          ),
        ),
      ),
    );
  }
}
```

### lib/src/core/widget/button/custom_icon_button.dart
```dart
import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({super.key});

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) => const Placeholder();
}
```

### lib/src/core/widget/cached_image_view.dart
```dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../common/extensions/extensions.dart';
import '../constant/gen/assets.gen.dart';
import 'shimmer_widget.dart';

class CachedImageView extends StatelessWidget {
  const CachedImageView({
    this.imageUrl,
    this.height = 100,
    this.width = .infinity,
    this.errorWidget,
    this.borderRadius,
    this.fit = .cover,
    this.httpHeaders,
    this.initials,
    super.key,
  });

  final double height;
  final double width;
  final String? imageUrl;
  final Widget? errorWidget;
  final BorderRadius? borderRadius;
  final BoxFit fit;
  final String? initials;
  final Map<String, String>? httpHeaders;

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? .circular(4);
    final imageUrl = this.imageUrl?.trim();

    if (imageUrl == null || imageUrl.isEmpty) {
      return ClipRRect(
        borderRadius: borderRadius,
        clipBehavior: .hardEdge,
        child: SizedBox(
          width: width,
          height: height,
          child: ColoredBox(
            color: context.colors.primary,
            child: Center(
              child: FittedBox(
                fit: .scaleDown,
                child: Text(
                  (initials == null || initials!.trim().isEmpty) ? '—' : initials!.trim(),
                  style: context.textStyles.sfProDisplayW700s18.copyWith(color: context.colors.white, fontSize: 26),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return ClipRRect(
      borderRadius: borderRadius,
      clipBehavior: .hardEdge,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        httpHeaders: httpHeaders,
        alignment: .center,
        fit: fit,
        height: height,
        width: width,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            ShimmerWidget(borderRadius: .circular(4), width: width, height: height),
        errorWidget: (context, url, error) =>
            errorWidget ??
            SizedBox(
              width: width,
              height: height,
              child: ColoredBox(
                color: context.color.shimmer1,
                child: Assets.images.placeholder.image(fit: fit),
              ),
            ),
      ),
    );
  }
}
```

### lib/src/core/widget/custom_app_bar.dart
```dart
import 'package:flutter/material.dart';

import '../../common/extensions/extensions.dart';

final class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.onBackTap,
    this.actions = const <Widget>[],
    this.backgroundColor,
  });

  final String title;
  final Widget? leading;
  final VoidCallback? onBackTap;
  final List<Widget> actions;
  final Color? backgroundColor;

  @override
  Size get preferredSize => const .fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final textTheme = context.textTheme;

    final effectiveLeading =
        leading ??
        (onBackTap == null && !Navigator.of(context).canPop()
            ? null
            : Padding(
                padding: const .only(left: 16),
                child: CustomAppBarIconButton(
                  icon: Icons.chevron_left,
                  onTap: onBackTap ?? () => Navigator.of(context).maybePop(),
                ),
              ));

    return AppBar(
      backgroundColor: backgroundColor ?? colors.scaffoldBackground,
      surfaceTintColor: colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(title, style: textTheme.sfProDisplayW700s20),
      leadingWidth: 60,
      leading: effectiveLeading,
      actions: actions.isEmpty
          ? null
          : [
              Padding(
                padding: const .only(right: 16),
                child: Row(mainAxisSize: .min, children: actions),
              ),
            ],
    );
  }
}

final class CustomAppBarIconButton extends StatelessWidget {
  const CustomAppBarIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.backgroundColor,
    this.iconColor,
  });

  final IconData icon;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Ink(
        width: 44,
        height: 44,
        decoration: BoxDecoration(color: backgroundColor ?? colors.grey60, shape: .circle),
        child: Center(child: Icon(icon, color: iconColor ?? colors.black)),
      ),
    );
  }
}
```

### lib/src/core/widget/custom_tab_bar.dart
```dart
import 'package:flutter/material.dart';

import '../../common/extensions/extensions.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    required this.tabs,
    this.labelStyle,
    this.unselectedLabelStyle,
    this.labelColor,
    this.unselectedLabelColor,
    this.dividerColor,
    this.indicatorColor,
    this.indicatorBorderRadius = const BorderRadius.all(.circular(52)),
    this.splashBorderRadius = const BorderRadius.all(.circular(16)),
    this.labelPadding = const .symmetric(vertical: 6),
    this.paddingTab = EdgeInsets.zero,
    this.margin = const .symmetric(vertical: 12, horizontal: 16),
    this.decorationBorderRadius = const BorderRadius.all(.circular(52)),
    this.indicatorSize = TabBarIndicatorSize.tab,
    this.decorationColor,
    this.controller,
    this.onTap,
    super.key,
  });

  final List<String> tabs;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;

  final Color? labelColor;
  final Color? unselectedLabelColor;
  final Color? dividerColor;

  final Color? indicatorColor;
  final BorderRadius indicatorBorderRadius;
  final BorderRadius splashBorderRadius;

  final EdgeInsetsGeometry paddingTab;
  final EdgeInsetsGeometry labelPadding;

  final EdgeInsetsGeometry margin;
  final BorderRadiusGeometry decorationBorderRadius;
  final Color? decorationColor;
  final TabBarIndicatorSize indicatorSize;
  final TabController? controller;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: margin,
    child: DecoratedBox(
      decoration: BoxDecoration(borderRadius: decorationBorderRadius, color: decorationColor ?? context.color.grey60),
      child: TabBar(
        controller: controller,
        onTap: onTap,
        padding: paddingTab,
        labelPadding: labelPadding,

        splashBorderRadius: splashBorderRadius,

        indicatorSize: indicatorSize,
        indicator: BoxDecoration(color: indicatorColor ?? context.color.primary, borderRadius: indicatorBorderRadius),

        labelColor: labelColor ?? context.color.white,
        unselectedLabelColor: unselectedLabelColor ?? context.color.grey950,
        dividerColor: dividerColor ?? context.color.transparent,

        labelStyle: labelStyle ?? context.textTheme.interW500s14,
        unselectedLabelStyle: unselectedLabelStyle ?? context.textTheme.interW500s14,
        tabs: tabs.map(Text.new).toList(),
      ),
    ),
  );
}
```

### lib/src/core/widget/custom_text_field.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/extensions/extensions.dart';

const _defaultColor = Color(0xffF2F4F7);

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.style,
    this.maxLength,
    this.hintTextStyle,
    this.controller,
    this.onFieldSubmitted,
    this.hintText,
    this.validator,
    this.onChanged,
    this.focusNode,
    this.labelText,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscureText = false,
    this.hideErrorMessage = false,
    this.obscureCharacter = '*',
    this.keyboardType,
    this.textInputAction,
    this.fillColor,
    this.focusedFillColor,
    this.focusedBorderColor,
    this.unfocusedBorderColor,
    this.errorBorderColor,
    this.borderRadius = 10,
    this.borderWidth = 1.2,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.contentPadding,
    this.suffixText,
    this.suffixStyle,
    this.prefixText,
    this.prefixStyle,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.inputFormatters,
    this.hint,
    this.autofocus = false,
  });

  final TextEditingController? controller;
  final TextStyle? style;
  final TextStyle? hintTextStyle;
  final Widget? hint;
  final String? hintText;
  final bool hideErrorMessage;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String value)? onChanged;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isObscureText;
  final String obscureCharacter;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final Color? focusedFillColor;
  final Color? focusedBorderColor;
  final Color? unfocusedBorderColor;
  final Color? errorBorderColor;
  final double borderRadius;
  final double borderWidth;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? contentPadding;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() => setState(() => _isFocused = _focusNode.hasFocus));
  }

  @override
  void dispose() {
    if (widget.focusNode == null) _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasError = _errorText != null && _errorText!.isNotEmpty;

    // Border rangi: error -> errorBorderColor, qolganida har doim defaultColor
    final borderColor = hasError
        ? (widget.errorBorderColor ?? context.color.error)
        : (_isFocused
              ? widget.focusedBorderColor ?? context.color.primary
              : widget.unfocusedBorderColor ?? Colors.transparent);

    // Fill rangi: focused bo'lsa focusedFillColor, aks holda fillColor
    final currentFillColor = _isFocused
        ? (widget.focusedFillColor ?? _defaultColor.withValues(alpha: 0.38))
        : (widget.fillColor ?? _defaultColor.withValues(alpha: 0.38));

    void handleEditingComplete() {
      if (widget.textInputAction == .next) {
        FocusScope.of(context).nextFocus();
        return;
      }
      FocusScope.of(context).unfocus();
    }

    final border = OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: widget.borderWidth),
      borderRadius: .circular(widget.borderRadius),
    );

    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        TextFormField(
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          onFieldSubmitted: widget.onFieldSubmitted,
          controller: widget.controller,
          focusNode: _focusNode,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          obscureText: widget.isObscureText,
          obscuringCharacter: widget.obscureCharacter,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          cursorColor: context.color.primary,
          cursorErrorColor: context.color.error,
          autofocus: widget.autofocus,
          style: widget.style ?? context.textTheme.interW400s16.copyWith(color: context.color.white),
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          onEditingComplete: handleEditingComplete,

          decoration: InputDecoration(
            filled: true,
            fillColor: currentFillColor,
            isDense: true,
            prefixText: widget.prefixText,
            prefixStyle: widget.prefixStyle ?? context.textTheme.interW400s12,
            prefixIconConstraints: const BoxConstraints(minWidth: 40, minHeight: 40),

            suffixIconConstraints: const BoxConstraints(minWidth: 40, minHeight: 40),
            contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            border: border,
            enabledBorder: border,
            focusedBorder: border,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.errorBorderColor ?? context.color.error, width: widget.borderWidth),
              borderRadius: .circular(widget.borderRadius),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.errorBorderColor ?? context.color.error, width: widget.borderWidth),
              borderRadius: .circular(widget.borderRadius),
            ),

            hint: widget.hint,
            hintText: widget.hintText,
            labelText: widget.labelText,
            hintStyle:
                widget.hintTextStyle ??
                context.textTheme.interW400s14.copyWith(color: context.color.grey300.withValues(alpha: 0.3)),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            suffixText: widget.suffixText,
            suffixStyle: widget.suffixStyle ?? context.textTheme.interW400s12,
            floatingLabelBehavior: .auto,
            floatingLabelStyle: widget.labelStyle ?? context.textTheme.interW400s12.copyWith(color: _defaultColor),
            labelStyle: widget.labelStyle ?? context.textTheme.interW400s12.copyWith(color: context.color.grey300),
            errorStyle: const TextStyle(height: 0, fontSize: 0),
          ),
          autovalidateMode: .disabled,
          validator: (value) {
            final error = widget.validator?.call(value);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted && _errorText != error) setState(() => _errorText = error);
            });
            return error;
          },
          onChanged: (v) {
            if (_errorText != null) setState(() => _errorText = null);
            widget.onChanged?.call(v);
          },
          inputFormatters: widget.inputFormatters,
        ),
        if (hasError && !widget.hideErrorMessage)
          Padding(
            padding: const .only(left: 12, top: 6),
            child: Text(_errorText!, style: TextStyle(fontSize: 12, color: context.color.error)),
          ),
      ],
    );
  }
}
```

### lib/src/core/widget/shimmer_widget.dart
```dart
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../common/extensions/extensions.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    this.height = 100.0,
    this.width = .infinity,
    this.borderRadius = const .all(.circular(16)),
  });

  final double height;
  final double width;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: width,
    height: height,
    child: Shimmer.fromColors(
      baseColor: context.color.shimmer3,
      highlightColor: context.color.shimmer2,
      child: DecoratedBox(
        decoration: BoxDecoration(borderRadius: borderRadius, color: context.color.shimmer1),
      ),
    ),
  );
}
```

### lib/src/features/auth/data/datasources/local/auth_local_data_source.dart
```dart
import 'package:local_source/local_source.dart';

import '../../../../../core/auth/auth_session_notifier.dart';

abstract interface class AuthLocalDataSource {
  const AuthLocalDataSource();

  bool get isAuthenticated;
  String get currentUserId;
  Future<void> saveSession({required String userId, required String accessToken, required String refreshToken});
  Future<void> clearSession();
}

final class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  const AuthLocalDataSourceImpl({required LocalSource localSource, required AuthSessionNotifier authSessionNotifier})
    : _localSource = localSource,
      _authSessionNotifier = authSessionNotifier;

  final LocalSource _localSource;
  final AuthSessionNotifier _authSessionNotifier;

  @override
  bool get isAuthenticated => _localSource.isUserAuthenticated;

  @override
  String get currentUserId => _localSource.userID;

  @override
  Future<void> saveSession({required String userId, required String accessToken, required String refreshToken}) async {
    await _localSource.setUserID(userId);
    await _localSource.setAccessToken(accessToken);
    await _localSource.setRefreshToken(refreshToken);
    _authSessionNotifier.notifySessionChanged();
  }

  @override
  Future<void> clearSession() async {
    await _localSource.clearAll();
    _authSessionNotifier.notifySessionChanged();
  }
}
```

### lib/src/features/auth/data/models/auth_session_model.dart
```dart
import '../../domain/entities/auth_session_entity.dart';
import 'user_model.dart';

final class AuthSessionModel {
  const AuthSessionModel({required this.accessToken, required this.refreshToken, required this.user});

  final String accessToken;
  final String refreshToken;
  final UserModel user;

  factory AuthSessionModel.fromJson(Map<String, Object?> json) => AuthSessionModel(
    accessToken: (json['access_token'] as String?) ?? '',
    refreshToken: (json['refresh_token'] as String?) ?? '',
    user: UserModel.fromJson(((json['user'] as Map?) ?? const <Object?, Object?>{}).cast<String, Object?>()),
  );

  Map<String, Object?> toJson() => <String, Object?>{
    'access_token': accessToken,
    'refresh_token': refreshToken,
    'user': user.toJson(),
  };

  AuthSessionEntity toEntity() =>
      AuthSessionEntity(accessToken: accessToken, refreshToken: refreshToken, user: user.toEntity());
}
```

### lib/src/features/auth/data/models/user_model.dart
```dart
import '../../domain/entities/user_entity.dart';

final class UserModel {
  const UserModel({required this.id, required this.username});

  final String id;
  final String username;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      UserModel(id: (json['id'] as String?) ?? '', username: (json['username'] as String?) ?? '');

  Map<String, Object?> toJson() => <String, Object?>{'id': id, 'username': username};

  UserEntity toEntity() => UserEntity(id: id, username: username);
}
```

### lib/src/features/auth/data/repository/auth_repository_impl.dart
```dart
import '../../domain/entities/auth_session_entity.dart';
import '../../domain/error/auth_exceptions.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasources/local/auth_local_data_source.dart';
import '../models/user_model.dart';

/// Example credentials for the initial project template.
/// Username: `udevs`, Password: `1234`.
const String _kHardcodedUsername = 'udevs';
const String _kHardcodedPassword = '1234';

final class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({required AuthLocalDataSource localDataSource}) : _localDataSource = localDataSource;

  final AuthLocalDataSource _localDataSource;

  @override
  bool get isAuthenticated => _localDataSource.isAuthenticated;

  @override
  Future<AuthSessionEntity> login({required String username, required String password}) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    if (username != _kHardcodedUsername || password != _kHardcodedPassword) {
      throw const InvalidCredentialsException();
    }
    final session = AuthSessionEntity(
      accessToken: 'demo-access-token',
      refreshToken: 'demo-refresh-token',
      user: const UserModel(id: 'demo-user', username: _kHardcodedUsername).toEntity(),
    );
    await saveSession(session);
    return session;
  }

  @override
  Future<void> saveSession(AuthSessionEntity session) => _localDataSource.saveSession(
    userId: session.user.id,
    accessToken: session.accessToken,
    refreshToken: session.refreshToken,
  );

  @override
  Future<void> logout() => _localDataSource.clearSession();
}
```

### lib/src/features/auth/domain/entities/auth_session_entity.dart
```dart
import 'user_entity.dart';

final class AuthSessionEntity {
  const AuthSessionEntity({required this.accessToken, required this.refreshToken, required this.user});

  final String accessToken;
  final String refreshToken;
  final UserEntity user;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthSessionEntity &&
          runtimeType == other.runtimeType &&
          accessToken == other.accessToken &&
          refreshToken == other.refreshToken &&
          user == other.user;

  @override
  int get hashCode => accessToken.hashCode ^ refreshToken.hashCode ^ user.hashCode;
}
```

### lib/src/features/auth/domain/entities/user_entity.dart
```dart
final class UserEntity {
  const UserEntity({required this.id, required this.username});

  final String id;
  final String username;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntity && runtimeType == other.runtimeType && id == other.id && username == other.username;

  @override
  int get hashCode => id.hashCode ^ username.hashCode;
}
```

### lib/src/features/auth/domain/error/auth_exceptions.dart
```dart
final class InvalidCredentialsException implements Exception {
  const InvalidCredentialsException();

  @override
  String toString() => 'Invalid username or password';
}
```

### lib/src/features/auth/domain/repository/auth_repository.dart
```dart
import '../entities/auth_session_entity.dart';

abstract interface class AuthRepository {
  Future<AuthSessionEntity> login({required String username, required String password});

  Future<void> saveSession(AuthSessionEntity session);

  Future<void> logout();

  bool get isAuthenticated;
}
```

### lib/src/features/auth/domain/usecase/login_use_case.dart
```dart
import '../entities/auth_session_entity.dart';
import '../repository/auth_repository.dart';

final class LoginUseCase {
  const LoginUseCase({required AuthRepository authRepository}) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Future<AuthSessionEntity> call({required String username, required String password}) =>
      _authRepository.login(username: username, password: password);
}
```

### lib/src/features/auth/domain/usecase/logout_use_case.dart
```dart
import '../repository/auth_repository.dart';

final class LogoutUseCase {
  const LogoutUseCase({required AuthRepository authRepository}) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Future<void> call() => _authRepository.logout();
}
```

### lib/src/features/auth/presentation/bloc/auth_cubit.dart
```dart
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/error/auth_exceptions.dart';
import '../../domain/usecase/login_use_case.dart';
import '../../domain/usecase/logout_use_case.dart';
import 'auth_cubit_state.dart';

final class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit({required LoginUseCase loginUseCase, required LogoutUseCase logoutUseCase})
    : _loginUseCase = loginUseCase,
      _logoutUseCase = logoutUseCase,
      super(const AuthCubitState());

  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;

  void clearError() {
    if (!state.status.isError && state.errorMessage == null) return;
    emit(state.copyWith(status: .initial, action: .none, errorMessage: null));
  }

  Future<void> login({required String username, required String password}) async {
    if (state.status.isLoading) return;
    emit(state.copyWith(status: .loading, action: .login, errorMessage: null));
    try {
      final session = await _loginUseCase(username: username, password: password);
      emit(state.copyWith(status: .success, action: .login, session: session));
    } on InvalidCredentialsException catch (e) {
      emit(state.copyWith(status: .error, action: .login, errorMessage: e.toString()));
    } catch (e) {
      emit(state.copyWith(status: .error, action: .login, errorMessage: e.toString()));
    }
  }

  Future<void> logout() async {
    if (state.status.isLoading) return;
    emit(state.copyWith(status: .loading, action: .logout, errorMessage: null));
    await _logoutUseCase();
    emit(state.copyWith(status: .success, action: .logout, session: null));
  }
}
```

### lib/src/features/auth/presentation/bloc/auth_cubit_state.dart
```dart
import 'package:flutter/foundation.dart';

import '../../../../common/data/enums/bloc_status_enum.dart';
import '../../domain/entities/auth_session_entity.dart';

enum AuthAction { none, login, logout }

@immutable
final class AuthCubitState {
  const AuthCubitState({this.status = Status.initial, this.action = AuthAction.none, this.session, this.errorMessage});

  final Status status;
  final AuthAction action;
  final AuthSessionEntity? session;
  final String? errorMessage;

  AuthCubitState copyWith({Status? status, AuthAction? action, AuthSessionEntity? session, String? errorMessage}) =>
      AuthCubitState(
        status: status ?? this.status,
        action: action ?? this.action,
        session: session ?? this.session,
        errorMessage: errorMessage,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthCubitState &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          action == other.action &&
          session == other.session &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode => status.hashCode ^ action.hashCode ^ session.hashCode ^ errorMessage.hashCode;
}
```

### lib/src/features/auth/presentation/screen/login_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/extensions/extensions.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/widget/button/custom_button.dart';
import '../../../../core/widget/custom_text_field.dart';
import '../bloc/auth_cubit.dart';
import '../bloc/auth_cubit_state.dart';
import '../state/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends LoginState {
  @override
  Widget build(BuildContext context) => BlocConsumer<AuthCubit, AuthCubitState>(
    listenWhen: (previous, current) => previous.status != current.status,
    listener: (context, state) {
      if (state.status.isError && state.action == .login) {
        context.showErrorSnackBar(state.errorMessage ?? 'Login error');
      }

      if (state.status.isSuccess && state.action == .login) {
        GoRouterHelper(context).go(AppRouter.home);
      }
    },
    builder: (context, state) => Scaffold(
      backgroundColor: context.color.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: const .all(16),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              const SizedBox(height: 60),
              Text('Welcome', style: context.textTheme.sfProDisplayW900s32),
              const SizedBox(height: 8),
              Text(
                'Sign in with username "udevs" and password "1234".',
                style: context.textTheme.interW400s14.copyWith(color: context.color.grey500),
              ),
              const SizedBox(height: 30),
              Text('Username', style: context.textTheme.interW400s14.copyWith(color: context.color.grey500)),
              const SizedBox(height: 10),
              CustomTextField(
                controller: usernameController,
                focusNode: usernameFocusNode,
                fillColor: context.color.grey60,
                style: context.textTheme.interW500s14,
                hintText: 'udevs',
                hintTextStyle: context.textTheme.interW600s14.copyWith(color: context.color.grey500),
                focusedBorderColor: context.color.primary,
                borderRadius: 56,
                contentPadding: const .symmetric(vertical: 14, horizontal: 16),
                hideErrorMessage: false,
              ),
              const SizedBox(height: 20),
              Text('Password', style: context.textTheme.interW400s14.copyWith(color: context.color.grey500)),
              const SizedBox(height: 10),
              CustomTextField(
                controller: passwordController,
                focusNode: passwordFocusNode,
                isObscureText: true,
                fillColor: context.color.grey60,
                style: context.textTheme.interW500s14,
                hintText: '1234',
                hintTextStyle: context.textTheme.interW600s14.copyWith(color: context.color.grey500),
                focusedBorderColor: context.color.primary,
                borderRadius: 56,
                contentPadding: const .symmetric(vertical: 14, horizontal: 16),
                hideErrorMessage: false,
              ),
              const Spacer(),
              CustomButton(
                title: 'Sign in',
                isDisabled: !isFormValid || state.status.isLoading,
                isLoading: state.status.isLoading,
                onTap: onLoginTap,
              ),
              const SizedBox(height: 22),
            ],
          ),
        ),
      ),
    ),
  );
}
```

### lib/src/features/auth/presentation/state/login_state.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/extensions/extensions.dart';
import '../bloc/auth_cubit.dart';
import '../screen/login_screen.dart';

abstract class LoginState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    usernameController.addListener(_onChanged);
    passwordController.addListener(_onChanged);
  }

  @override
  void dispose() {
    usernameController
      ..removeListener(_onChanged)
      ..dispose();
    passwordController
      ..removeListener(_onChanged)
      ..dispose();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  void _onChanged() => setState(() {});

  bool get isFormValid => usernameController.text.trim().isNotEmpty && passwordController.text.isNotEmpty;

  Future<void> onLoginTap() async {
    if (!isFormValid) return;
    context.hideKeyboard();
    await context.read<AuthCubit>().login(username: usernameController.text.trim(), password: passwordController.text);
  }
}
```

### lib/src/features/home/data/repository/home_repository_impl.dart
```dart
import '../../domain/entities/home_item_entity.dart';
import '../../domain/repository/home_repository.dart';

final class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl();

  @override
  Future<List<HomeItemEntity>> getItems() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return const [
      HomeItemEntity(title: 'Welcome', subtitle: 'This is your initial project template.'),
      HomeItemEntity(title: 'Clean architecture', subtitle: 'data / domain / presentation layers ready.'),
      HomeItemEntity(title: 'No backend required', subtitle: 'Replace this with your real data source.'),
    ];
  }
}
```

### lib/src/features/home/domain/entities/home_item_entity.dart
```dart
final class HomeItemEntity {
  const HomeItemEntity({required this.title, required this.subtitle});

  final String title;
  final String subtitle;
}
```

### lib/src/features/home/domain/repository/home_repository.dart
```dart
import '../entities/home_item_entity.dart';

abstract interface class HomeRepository {
  Future<List<HomeItemEntity>> getItems();
}
```

### lib/src/features/home/domain/usecase/get_home_items_use_case.dart
```dart
import '../entities/home_item_entity.dart';
import '../repository/home_repository.dart';

final class GetHomeItemsUseCase {
  const GetHomeItemsUseCase({required HomeRepository homeRepository}) : _homeRepository = homeRepository;

  final HomeRepository _homeRepository;

  Future<List<HomeItemEntity>> call() => _homeRepository.getItems();
}
```

### lib/src/features/home/presentation/cubit/home_cubit.dart
```dart
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/get_home_items_use_case.dart';
import 'home_cubit_state.dart';

final class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit({required GetHomeItemsUseCase getHomeItemsUseCase})
    : _getHomeItemsUseCase = getHomeItemsUseCase,
      super(const HomeCubitState()) {
    load();
  }

  final GetHomeItemsUseCase _getHomeItemsUseCase;

  Future<void> load() async {
    emit(state.copyWith(status: .loading, errorMessage: null));
    try {
      final items = await _getHomeItemsUseCase();
      emit(state.copyWith(status: .success, items: items));
    } catch (e) {
      emit(state.copyWith(status: .error, errorMessage: e.toString()));
    }
  }
}
```

### lib/src/features/home/presentation/cubit/home_cubit_state.dart
```dart
import 'package:flutter/foundation.dart';

import '../../../../common/data/enums/bloc_status_enum.dart';
import '../../domain/entities/home_item_entity.dart';

@immutable
final class HomeCubitState {
  const HomeCubitState({this.status = Status.initial, this.items = const <HomeItemEntity>[], this.errorMessage});

  final Status status;
  final List<HomeItemEntity> items;
  final String? errorMessage;

  HomeCubitState copyWith({Status? status, List<HomeItemEntity>? items, String? errorMessage}) =>
      HomeCubitState(status: status ?? this.status, items: items ?? this.items, errorMessage: errorMessage);
}
```

### lib/src/features/home/presentation/screen/home_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/extensions/extensions.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_cubit_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.color.scaffoldBackground,
    appBar: AppBar(backgroundColor: context.color.scaffoldBackground, title: const Text('Home'), centerTitle: false),
    body: BlocBuilder<HomeCubit, HomeCubitState>(
      builder: (context, state) {
        if (state.status.isLoading && state.items.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status.isError && state.items.isEmpty) {
          return Center(child: Text(state.errorMessage ?? 'Error'));
        }
        return RefreshIndicator(
          onRefresh: context.read<HomeCubit>().load,
          child: ListView.separated(
            padding: const .all(16),
            itemCount: state.items.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (_, index) {
              final item = state.items[index];
              return Container(
                padding: const .all(16),
                decoration: BoxDecoration(color: context.color.grey60, borderRadius: .circular(16)),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(item.title, style: context.textTheme.interW600s16),
                    const SizedBox(height: 4),
                    Text(item.subtitle, style: context.textTheme.interW400s14.copyWith(color: context.color.grey500)),
                  ],
                ),
              );
            },
          ),
        );
      },
    ),
  );
}
```

### lib/src/features/journal/data/repository/journal_repository_impl.dart
```dart
import '../../domain/entities/journal_entry_entity.dart';
import '../../domain/repository/journal_repository.dart';

final class JournalRepositoryImpl implements JournalRepository {
  const JournalRepositoryImpl();

  @override
  Future<List<JournalEntryEntity>> getEntries() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return const [
      JournalEntryEntity(id: '1', title: 'First entry', note: 'A sample journal entry.'),
      JournalEntryEntity(id: '2', title: 'Second entry', note: 'Replace this with real data.'),
    ];
  }
}
```

### lib/src/features/journal/domain/entities/journal_entry_entity.dart
```dart
final class JournalEntryEntity {
  const JournalEntryEntity({required this.id, required this.title, required this.note});

  final String id;
  final String title;
  final String note;
}
```

### lib/src/features/journal/domain/repository/journal_repository.dart
```dart
import '../entities/journal_entry_entity.dart';

abstract interface class JournalRepository {
  Future<List<JournalEntryEntity>> getEntries();
}
```

### lib/src/features/journal/domain/usecase/get_journal_entries_use_case.dart
```dart
import '../entities/journal_entry_entity.dart';
import '../repository/journal_repository.dart';

final class GetJournalEntriesUseCase {
  const GetJournalEntriesUseCase({required JournalRepository repository}) : _repository = repository;

  final JournalRepository _repository;

  Future<List<JournalEntryEntity>> call() => _repository.getEntries();
}
```

### lib/src/features/journal/presentation/cubit/journal_cubit.dart
```dart
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/get_journal_entries_use_case.dart';
import 'journal_cubit_state.dart';

final class JournalCubit extends Cubit<JournalCubitState> {
  JournalCubit({required GetJournalEntriesUseCase getJournalEntriesUseCase})
    : _getJournalEntriesUseCase = getJournalEntriesUseCase,
      super(const JournalCubitState()) {
    load();
  }

  final GetJournalEntriesUseCase _getJournalEntriesUseCase;

  Future<void> load() async {
    emit(state.copyWith(status: .loading, errorMessage: null));
    try {
      final entries = await _getJournalEntriesUseCase();
      emit(state.copyWith(status: .success, entries: entries));
    } catch (e) {
      emit(state.copyWith(status: .error, errorMessage: e.toString()));
    }
  }
}
```

### lib/src/features/journal/presentation/cubit/journal_cubit_state.dart
```dart
import 'package:flutter/foundation.dart';

import '../../../../common/data/enums/bloc_status_enum.dart';
import '../../domain/entities/journal_entry_entity.dart';

@immutable
final class JournalCubitState {
  const JournalCubitState({
    this.status = Status.initial,
    this.entries = const <JournalEntryEntity>[],
    this.errorMessage,
  });

  final Status status;
  final List<JournalEntryEntity> entries;
  final String? errorMessage;

  JournalCubitState copyWith({Status? status, List<JournalEntryEntity>? entries, String? errorMessage}) =>
      JournalCubitState(status: status ?? this.status, entries: entries ?? this.entries, errorMessage: errorMessage);
}
```

### lib/src/features/journal/presentation/screen/journal_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/extensions/extensions.dart';
import '../cubit/journal_cubit.dart';
import '../cubit/journal_cubit_state.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.color.scaffoldBackground,
    appBar: AppBar(backgroundColor: context.color.scaffoldBackground, title: const Text('Journal'), centerTitle: false),
    body: BlocBuilder<JournalCubit, JournalCubitState>(
      builder: (context, state) {
        if (state.status.isLoading && state.entries.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status.isError && state.entries.isEmpty) {
          return Center(child: Text(state.errorMessage ?? 'Error'));
        }
        return ListView.separated(
          padding: const .all(16),
          itemCount: state.entries.length,
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemBuilder: (_, index) {
            final entry = state.entries[index];
            return Container(
              padding: const .all(16),
              decoration: BoxDecoration(color: context.color.grey60, borderRadius: .circular(16)),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(entry.title, style: context.textTheme.interW600s16),
                  const SizedBox(height: 4),
                  Text(entry.note, style: context.textTheme.interW400s14.copyWith(color: context.color.grey500)),
                ],
              ),
            );
          },
        );
      },
    ),
  );
}
```

### lib/src/features/main/presentation/screen/main_screen.dart
```dart
import 'package:flutter/material.dart';

import '../../../../common/extensions/extensions.dart';
import '../../../../core/constant/gen/assets.gen.dart';
import '../state/main_screen_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({required this.child, super.key});

  final Widget child;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends MainScreenState {
  @override
  Widget build(BuildContext context) {
    final scaffoldBackgroundColor = context.color.scaffoldBackground;
    final selectedColor = context.color.primary;
    final unselectedColor = context.color.grey500;
    final labelStyle = context.textTheme.interW500s10;

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        indicatorColor: context.color.transparent,
        backgroundColor: context.color.transparent,
        selectedIndex: currentIndex(context),

        onDestinationSelected: (index) => onTap(context, index),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          final color = states.contains(WidgetState.selected) ? selectedColor : unselectedColor;
          return labelStyle.copyWith(color: color);
        }),
        destinations: [
          NavigationDestination(
            icon: Assets.images.home.image(width: 26, height: 26, color: unselectedColor),
            selectedIcon: Assets.images.home.image(width: 26, height: 26, color: selectedColor),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Assets.images.journal.image(width: 26, height: 26, color: unselectedColor),
            selectedIcon: Assets.images.journal.image(width: 26, height: 26, color: selectedColor),
            label: 'Journal',
          ),
          NavigationDestination(
            icon: Assets.images.profile.image(width: 26, height: 26, color: unselectedColor),
            selectedIcon: Assets.images.profile.image(width: 26, height: 26, color: selectedColor),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
```

### lib/src/features/main/presentation/state/main_screen_state.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/routes.dart';
import '../screen/main_screen.dart';

abstract class MainScreenState extends State<MainScreen> {
  int currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    return switch (location) {
      _ when location.startsWith(AppRouter.home) => 0,
      _ when location.startsWith(AppRouter.journal) => 1,
      _ when location.startsWith(AppRouter.profile) => 2,
      _ => 0,
    };
  }

  void onTap(BuildContext context, int index) {
    HapticFeedback.lightImpact();
    context.go(switch (index) {
      0 => AppRouter.home,
      1 => AppRouter.journal,
      2 => AppRouter.profile,
      _ => AppRouter.home,
    });
  }
}
```

### lib/src/features/profile/data/repository/profile_repository_impl.dart
```dart
import '../../domain/entities/profile_entity.dart';
import '../../domain/repository/profile_repository.dart';

final class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl();

  @override
  Future<ProfileEntity> getProfile() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return const ProfileEntity(username: 'udevs', fullName: 'Initial Project User');
  }
}
```

### lib/src/features/profile/domain/entities/profile_entity.dart
```dart
final class ProfileEntity {
  const ProfileEntity({required this.username, required this.fullName});

  final String username;
  final String fullName;
}
```

### lib/src/features/profile/domain/repository/profile_repository.dart
```dart
import '../entities/profile_entity.dart';

abstract interface class ProfileRepository {
  Future<ProfileEntity> getProfile();
}
```

### lib/src/features/profile/domain/usecase/get_profile_use_case.dart
```dart
import '../entities/profile_entity.dart';
import '../repository/profile_repository.dart';

final class GetProfileUseCase {
  const GetProfileUseCase({required ProfileRepository repository}) : _repository = repository;

  final ProfileRepository _repository;

  Future<ProfileEntity> call() => _repository.getProfile();
}
```

### lib/src/features/profile/presentation/cubit/profile_cubit.dart
```dart
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/get_profile_use_case.dart';
import 'profile_cubit_state.dart';

final class ProfileCubit extends Cubit<ProfileCubitState> {
  ProfileCubit({required GetProfileUseCase getProfileUseCase})
    : _getProfileUseCase = getProfileUseCase,
      super(const ProfileCubitState()) {
    load();
  }

  final GetProfileUseCase _getProfileUseCase;

  Future<void> load() async {
    emit(state.copyWith(status: .loading, errorMessage: null));
    try {
      final profile = await _getProfileUseCase();
      emit(state.copyWith(status: .success, profile: profile));
    } catch (e) {
      emit(state.copyWith(status: .error, errorMessage: e.toString()));
    }
  }
}
```

### lib/src/features/profile/presentation/cubit/profile_cubit_state.dart
```dart
import 'package:flutter/foundation.dart';

import '../../../../common/data/enums/bloc_status_enum.dart';
import '../../domain/entities/profile_entity.dart';

@immutable
final class ProfileCubitState {
  const ProfileCubitState({this.status = Status.initial, this.profile, this.errorMessage});

  final Status status;
  final ProfileEntity? profile;
  final String? errorMessage;

  ProfileCubitState copyWith({Status? status, ProfileEntity? profile, String? errorMessage}) =>
      ProfileCubitState(status: status ?? this.status, profile: profile ?? this.profile, errorMessage: errorMessage);
}
```

### lib/src/features/profile/presentation/screen/profile_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/extensions/extensions.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/widget/button/custom_button.dart';
import '../../../auth/presentation/bloc/auth_cubit.dart';
import '../../../auth/presentation/bloc/auth_cubit_state.dart';
import '../cubit/profile_cubit.dart';
import '../cubit/profile_cubit_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.color.scaffoldBackground,
    appBar: AppBar(backgroundColor: context.color.scaffoldBackground, title: const Text('Profile'), centerTitle: false),
    body: BlocListener<AuthCubit, AuthCubitState>(
      listenWhen: (previous, current) => previous.status != current.status && current.action == .logout,
      listener: (context, state) {
        if (state.status.isSuccess) GoRouterHelper(context).go(AppRouter.initial);
      },
      child: BlocBuilder<ProfileCubit, ProfileCubitState>(
        builder: (context, state) {
          if (state.status.isLoading && state.profile == null) {
            return const Center(child: CircularProgressIndicator());
          }
          final profile = state.profile;
          if (profile == null) {
            return Center(child: Text(state.errorMessage ?? 'Error'));
          }
          return Padding(
            padding: const .all(16),
            child: Column(
              crossAxisAlignment: .stretch,
              children: [
                Container(
                  padding: const .all(20),
                  decoration: BoxDecoration(color: context.color.grey60, borderRadius: .circular(16)),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text('Username', style: context.textTheme.interW400s14.copyWith(color: context.color.grey500)),
                      const SizedBox(height: 4),
                      Text(profile.username, style: context.textTheme.interW600s16),
                      const SizedBox(height: 12),
                      Text('Full name', style: context.textTheme.interW400s14.copyWith(color: context.color.grey500)),
                      const SizedBox(height: 4),
                      Text(profile.fullName, style: context.textTheme.interW600s16),
                    ],
                  ),
                ),
                const Spacer(),
                CustomButton(title: 'Logout', onTap: context.read<AuthCubit>().logout),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
      ),
    ),
  );
}
```

## 8. TEST PAPKASI

```
test/widget_test.dart
```

### test/widget_test.dart
```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:hilol_print/src/core/app/app.dart';
import 'package:hilol_print/src/core/di/injection.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await sl.reset();
    SharedPreferences.setMockInitialValues(const <String, Object>{});
    await setupLocator();
  });

  testWidgets('App builds', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    await tester.pump(const Duration(seconds: 6));
    await tester.pumpAndSettle();
    expect(find.byType(App), findsOneWidget);
  });
}
```

## 9. ASSETS STRUKTURASI (faqat yo'llar)
```
assets/fonts/Inter/Inter-Italic-VariableFont.ttf
assets/fonts/Inter/Inter-VariableFont.ttf
assets/fonts/sf/SF-Pro-Display-Black.otf
assets/fonts/sf/SF-Pro-Display-BlackItalic.otf
assets/fonts/sf/SF-Pro-Display-Bold.otf
assets/fonts/sf/SF-Pro-Display-BoldItalic.otf
assets/fonts/sf/SF-Pro-Display-Heavy.otf
assets/fonts/sf/SF-Pro-Display-HeavyItalic.otf
assets/fonts/sf/SF-Pro-Display-Light.otf
assets/fonts/sf/SF-Pro-Display-LightItalic.otf
assets/fonts/sf/SF-Pro-Display-Medium.otf
assets/fonts/sf/SF-Pro-Display-MediumItalic.otf
assets/fonts/sf/SF-Pro-Display-Regular.otf
assets/fonts/sf/SF-Pro-Display-RegularItalic.otf
assets/fonts/sf/SF-Pro-Display-Semibold.otf
assets/fonts/sf/SF-Pro-Display-SemiboldItalic.otf
assets/fonts/sf/SF-Pro-Display-Thin.otf
assets/fonts/sf/SF-Pro-Display-ThinItalic.otf
assets/fonts/sf/SF-Pro-Display-Ultralight.otf
assets/fonts/sf/SF-Pro-Display-UltralightItalic.otf
assets/fonts/sf/SFPro_Font_License.rtf
assets/icons/icon_chevron_right.svg
assets/icons/icon_cursor.svg
assets/icons/icon_delete.svg
assets/icons/icon_exit.svg
assets/icons/icon_file.svg
assets/icons/icon_file_export.svg
assets/icons/icon_gallery.svg
assets/icons/icon_settings.svg
assets/icons/icon_sos.svg
assets/icons/sort.svg
assets/images/app_logo.png
assets/images/file.png
assets/images/home.png
assets/images/img_message.png
assets/images/journal.png
assets/images/journal_parent_done.png
assets/images/journal_parnet_action.png
assets/images/logo.png
assets/images/message.png
assets/images/placeholder.jpg
assets/images/profile.png
assets/images/stretch.png
assets/vectors/icon_chevron_right.vec
assets/vectors/icon_cursor.vec
assets/vectors/icon_delete.vec
assets/vectors/icon_exit.vec
assets/vectors/icon_file.vec
assets/vectors/icon_file_export.vec
assets/vectors/icon_gallery.vec
assets/vectors/icon_settings.vec
assets/vectors/icon_sos.vec
assets/vectors/sort.vec
```

## 10. ANDROID + iOS PACKAGE NAME
```
$ grep -r "applicationId\|namespace" android/app/build.gradle.kts
android/app/build.gradle.kts:    namespace = "uz.xdido.hilol_print"
android/app/build.gradle.kts:        applicationId = "uz.xdido.hilol_print"

$ grep -r "PRODUCT_BUNDLE_IDENTIFIER" ios/Runner.xcodeproj/project.pbxproj | head -5
ios/Runner.xcodeproj/project.pbxproj:				PRODUCT_BUNDLE_IDENTIFIER = uz.xdido.hilolPrint;
ios/Runner.xcodeproj/project.pbxproj:				PRODUCT_BUNDLE_IDENTIFIER = uz.xdido.hilolPrint.RunnerTests;
ios/Runner.xcodeproj/project.pbxproj:				PRODUCT_BUNDLE_IDENTIFIER = uz.xdido.hilolPrint.RunnerTests;
ios/Runner.xcodeproj/project.pbxproj:				PRODUCT_BUNDLE_IDENTIFIER = uz.xdido.hilolPrint.RunnerTests;
ios/Runner.xcodeproj/project.pbxproj:				PRODUCT_BUNDLE_IDENTIFIER = uz.xdido.hilolPrint;

$ cat android/app/src/main/kotlin/*/MainActivity.kt 2>/dev/null || find android/ -name "MainActivity.kt" -exec cat {} \;
package uz.xdido.hilol_print

import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity()
package com.example.initial_project

import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity()
```

## 11. .VSCODE PAPKASI

```
.vscode/launch.json
.vscode/settings.json
```

### .vscode/launch.json
```json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    
    "version": "0.2.0",
    "configurations": [
        {
            "name": "hilol_print (ios)",
            "request": "launch",
            "type": "dart",
            "cwd": "${workspaceFolder}",
            "noDebug": true,
            "args": [
                "--dart-define-from-file=config/development.json",
                "--dart-define=config.platform=ios"
            ],
            "env": {}
        },
        {
            "name": "hilol_print (profile mode, ios)",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile",
            "cwd": "${workspaceFolder}",
            "args": [
                "--dart-define-from-file=config/development.json",
                "--dart-define=config.platform=ios"
            ],
            "env": {}
        },
        {
            "name": "hilol_print (release mode, ios)",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release",
            "cwd": "${workspaceFolder}",
            "args": [
                "--dart-define-from-file=config/production.json",
                "--dart-define=config.platform=ios"
            ],
            "env": {}
        },
        {
            "name": "hilol_print (android)",
            "request": "launch",
            "type": "dart",
            "cwd": "${workspaceFolder}",
            "noDebug": true,
            "args": [
                "--dart-define-from-file=config/development.json",
                "--dart-define=config.platform=android"
            ],
            "env": {}
        },
        {
            "name": "hilol_print (profile mode, android)",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile",
            "cwd": "${workspaceFolder}",
            "args": [
                "--dart-define-from-file=config/development.json",
                "--dart-define=config.platform=android"
            ],
            "env": {}
        },
        {
            "name": "hilol_print (release mode, android)",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release",
            "cwd": "${workspaceFolder}",
            "args": [
                "--dart-define-from-file=config/production.json",
                "--dart-define=config.platform=android"
            ],
            "env": {}
        }
    ]
}
```

### .vscode/settings.json
```json
{
  "editor.codeActionsOnSave": {
    "source.fixAll": "explicit",
    "source.organizeImports": "explicit"
  },
  "[dart]": {
    "editor.formatOnSave": true,
    "editor.formatOnType": true,
    "editor.rulers": [
      120
    ]
  },
  "dart.lineLength": 120,
  "editor.guides.bracketPairs": "active",         
  "editor.bracketPairColorization.enabled": true,
  "editor.matchBrackets": "always",
  "editor.selectionHighlight": true,
  "editor.guides.highlightActiveIndentation": true,
  "cSpell.words": [
    "usecase"
  ],
  "dart.flutterSdkPath": ".fvm/versions/3.41.6"
}
```

## 12. FLUTTER VERSION
```
$ flutter --version
Flutter 3.41.9 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 00b0c91f06 (5 weeks ago) • 2026-04-29 10:03:19 -0700
Engine • hash 9161402dc0e134b3fb5adee5046b6e84b1a5e1c1 (revision 42d3d75a56) (1 months ago) • 2026-04-28 17:31:55.000Z
Tools • Dart 3.11.5 • DevTools 2.54.2

$ dart --version
Dart SDK version: 3.11.5 (stable) (Wed Apr 15 00:36:32 2026 -0700) on "macos_arm64"

$ cat .fvmrc
{
  "flutter": "3.41.6"
}```
