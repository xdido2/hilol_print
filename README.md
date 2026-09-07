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

5. **Running on a physical iOS device:**
   Signing is driven by xcconfig variables so you can build under your own
   Apple ID (a free Personal Team works) without touching the shared team
   configuration. See [ios/SIGNING.md](ios/SIGNING.md).

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
