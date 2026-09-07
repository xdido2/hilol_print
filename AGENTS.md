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