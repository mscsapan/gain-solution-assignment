# Flutter Ticket Project – Clean Architecture with BLoC

## 🎯 **Architecture Assessment: ✅ FULLY COMPLIANT**

## 🎬 Project Demo Video

<div align="center">
  <video src="[output/project-video.mov](https://drive.google.com/file/d/11nhJCf4GJjmlT98Q26WoT-vHU5EqhsK2/view?usp=sharing)" controls width="100%" style="max-width: 800px; border-radius: 12px;">
    Your browser does not support the video tag.
    <a href="https://drive.google.com/file/d/11nhJCf4GJjmlT98Q26WoT-vHU5EqhsK2/view?usp=sharing">⬇️ Download the project demo video</a>
  </video>
</div>

> 💡 **Can't see the video?** [Click here to download and watch it]([output/project-video.mov](https://drive.google.com/file/d/11nhJCf4GJjmlT98Q26WoT-vHU5EqhsK2/view?usp=sharing))

This project **excellently follows Clean Architecture principles** with **proper BLoC pattern implementation**.

## 🏗️ Architecture Overview

### Clean Architecture Layers (Outer to Inner)

```
┌─────────────────────────────────────────────────────────────┐
│                    PRESENTATION LAYER                       │
│  • UI (Screens, Widgets)                                    │
│  • State Management (BLoC/Cubit)                            │
│  • Routes & Navigation                                      │
│  • UI Utilities & Constants                                 │
└─────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────┐
│                      DOMAIN LAYER                           │
│  • Entities (Business Objects)                              │
│  • Use Cases (Business Rules)                               │
│  • Repository Interfaces                                    │
└─────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────┐
│                       DATA LAYER                            │
│  • Repository Implementations                               │
│  • Data Sources (Remote/Local)                              │
│  • Models & Mappers                                         │
│  • Network Parser & Error Handling                          │
└─────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────┐
│                       CORE LAYER                            │
│  • Configuration & Environment                              │
│  • Base Classes & Use Cases                                 │
│  • Failures & Exceptions                                    │
│  • Services & Utilities                                     │
└─────────────────────────────────────────────────────────────┘
```

### Data Flow
```
UI (BLoC/Cubit) → Use Cases → Repository Interfaces → Repository Implementations → Data Sources → API/Database
```

## 📁 Project Structure

```
lib/
├── core/                           # Cross-cutting concerns
│   ├── config/
│   │   └── env_config.dart         # Environment configuration (dev, staging, prod)
│   ├── constants/
│   │   └── app_constants.dart      # App-wide constants
│   ├── exceptions/
│   │   └── exceptions.dart         # Custom exception definitions
│   ├── failures/
│   │   └── failures.dart           # Failure types (Server, Database, Network, etc.)
│   ├── services/
│   │   ├── navigation_service.dart # Navigation service implementation
│   │   └── navigation_service_examples.dart # Navigation examples
│   ├── usecases/
│   │   └── usecase.dart            # Base UseCase classes
│   └── utils/
│       ├── logger.dart             # Logging utilities
│       └── validators.dart         # Input validation helpers
│
├── domain/                         # Business Logic Layer
│   ├── entities/
│   │   ├── user.dart               # User business entity
│   │   └── auth_response.dart      # Authentication response entity
│   ├── repositories/
│   │   ├── auth_repository.dart    # Authentication repository interface
│   │   └── setting_repository.dart # Settings repository interface
│   └── usecases/
│       ├── auth/
│       │   └── auth_usecases.dart  # All auth use cases (Login, Logout, etc.)
│       └── setting/
│           └── get_setting_usecase.dart # Get settings use case
│
├── data/                           # Data Layer
│   ├── data_provider/
│   │   ├── local_data_source.dart  # Local storage (SharedPreferences)
│   │   ├── remote_data_source.dart # HTTP API calls
│   │   ├── network_parser.dart     # HTTP response parsing & error handling
│   │   └── remote_url.dart         # API endpoints configuration
│   ├── dummy_data/
│   │   └── dummy_data.dart         # Mock data for testing
│   ├── mappers/
│   │   └── auth_mappers.dart       # Data ↔ Domain entity mappers
│   ├── models/
│   │   ├── auth/
│   │   │   ├── login_model.dart          # Login request model
│   │   │   └── user_response_model.dart  # API response model
│   │   └── errors/
│   │       └── errors_model.dart         # Error response models
│   └── repositories/
│       ├── auth_repository_impl.dart     # Auth repository implementation
│       └── setting_repository_impl.dart  # Settings repository implementation
│
├── presentation/                   # UI Layer
│   ├── bloc/
│   │   ├── auth/
│   │   │   ├── login_bloc.dart     # Authentication BLoC
│   │   │   ├── login_event.dart    # Login events
│   │   │   └── login_state.dart    # Login states
│   │   └── internet_status/
│   │       ├── internet_status_bloc.dart  # Network connectivity BLoC
│   │       ├── internet_status_event.dart # Network events
│   │       └── internet_status_state.dart # Network states
│   ├── cubit/
│   │   └── setting/
│   │       ├── setting_cubit.dart  # Settings Cubit
│   │       └── setting_state.dart  # Settings states
│   ├── screens/                    # UI screens
│   │   ├── authentication/         # Auth screens (login, signup, etc.)
│   │   │   ├── auth_screen.dart
│   │   │   ├── login_screen.dart
│   │   │   ├── sign_up_screen.dart
│   │   │   ├── forgot_password_screen.dart
│   │   │   ├── otp_verification_screen.dart
│   │   │   ├── change_password_screen.dart
│   │   │   └── update_password_screen.dart
│   │   ├── main_screen/
│   │   │   └── main_screen.dart    # Main app screen
│   │   ├── on_boarding/
│   │   │   └── on_boarding_screen.dart # Onboarding screen
│   │   └── splash/
│   │       └── splash_screen.dart  # Splash screen
│   ├── widgets/                    # Reusable UI components
│   │   ├── custom_app_bar.dart
│   │   ├── custom_button.dart
│   │   ├── custom_form.dart
│   │   ├── custom_text.dart
│   │   ├── loading_widget.dart
│   │   ├── error_text.dart
│   │   └── ... (many more widgets)
│   ├── routes/
│   │   ├── route_names.dart        # Route name constants
│   │   └── route_packages_name.dart # Route configuration
│   └── utils/                      # UI utilities and constants
│       ├── constraints.dart
│       ├── k_images.dart
│       ├── k_string.dart
│       ├── language_string.dart
│       └── laravel_echo/           # Real-time communication
│
├── dependency_injection.dart       # Dependency injection setup
├── dependency_injection_packages.dart # DI exports
└── main.dart                       # App entry point
```

## 🔧 Key Components Explained

### Domain Layer

**Entities**: Pure business objects with no dependencies on Flutter or external frameworks.
```dart path=lib/domain/entities/user.dart start=4
class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final int status;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.status,
  });

  @override
  List<Object> get props => [id, name, email, phone, image, status];
}
```

**Use Cases**: Encapsulate business rules and application-specific logic.
```dart path=lib/domain/usecases/auth/auth_usecases.dart start=14
class LoginUseCase implements UseCase<AuthResponse, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, AuthResponse>> call(LoginParams params) async {
    return await repository.login(
      email: params.email,
      password: params.password,
    );
  }
}
```

**Repository Interfaces**: Define contracts for data operations.
```dart path=lib/domain/repositories/auth_repository.dart start=6
abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> logout(String token);

  Either<Failure, AuthResponse> getExistingUserInfo();
  
  Future<Either<Failure, void>> saveCredentials({
    required String email,
    required String password,
  });
  
  // ... other methods
}
```

### Data Layer

**Repository Implementations**: Implement domain repository interfaces.
```dart path=lib/data/repositories/auth_repository_impl.dart start=22
@override
Future<Either<Failure, AuthResponse>> login({
  required String email,
  required String password,
}) async {
  try {
    final loginModel = LoginModel(email: email, password: password);
    final result = await remoteDataSources.login(loginModel);
    localDataSources.cacheUserResponse(result);
    return Right(result.toDomain());
  } on ServerException catch (e) {
    return Left(ServerFailure(e.message, e.statusCode));
  } on InvalidAuthDataException catch (e) {
    return Left(InvalidAuthDataFailure(e.errors));
  } catch (e) {
    return Left(ServerFailure('Unexpected error occurred', 500));
  }
}
```

**Data Sources**: Handle external data (API calls, local storage).
**Mappers**: Convert between data models and domain entities.
```dart path=lib/data/mappers/auth_mappers.dart start=18
extension UserResponseModelAuthMapper on UserResponseModel {
  AuthResponse toDomain() {
    return AuthResponse(
      accessToken: accessToken,
      tokenType: tokenType,
      isVendor: isVendor,
      expireIn: expireIn,
      user: user?.toDomain(),
    );
  }
}
```

### Presentation Layer

**BLoC/Cubit**: Manage UI state using use cases (not repositories directly).
```dart path=lib/presentation/bloc/auth/login_bloc.dart start=16
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthUseCases _authUseCases;

  AuthResponse? _user;

  bool get isLoggedIn => _user != null && _user!.accessToken.isNotEmpty;

  LoginBloc({required AuthUseCases authUseCases})
      : _authUseCases = authUseCases,
        super(const LoginInitial()) {
    on<LoginEventSubmit>(_onLoginSubmit);
    on<LoginEventLogout>(_onLogout);

    // Load existing user info on initialization
    _loadExistingUser();
  }
}
```

## 🔄 Complete API Flow: UI to Backend and Back

Here's the detailed step-by-step flow showing exactly which functions are called in which files during a login operation:

### 📱 Login Flow (UI → API → UI)

```
┌─────────────────────────────────────────────────────────────────────┐
│                           USER INTERACTION                          │
└─────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────┐
│  1. UI LAYER (Presentation)                                         │
│     📄 File: lib/presentation/screens/authentication/login_screen.dart │
│     🔧 Function: User taps login button                             │
│     📤 Action: context.read<LoginBloc>().add(LoginEventSubmit())    │
└─────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────┐
│  2. BLOC LAYER (State Management)                                   │
│     📄 File: lib/presentation/bloc/auth/login_bloc.dart             │
│     🔧 Function: _onLoginSubmit()  [Line 54-85]                     │
│     📤 Actions:                                                     │
│        • emit(LoginLoading())                                       │
│        • Create LoginParams(email, password)                        │
│        • Call: await _authUseCases.login(params)                    │
└─────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────┐
│  3. USE CASE LAYER (Business Logic)                                 │
│     📄 File: lib/domain/usecases/auth/auth_usecases.dart            │
│     🔧 Function: LoginUseCase.call()  [Line 20-25]                  │
│     📤 Action: return repository.login(email, password)             │
└─────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────┐
│  4. REPOSITORY IMPLEMENTATION (Data Orchestration)                  │
│     📄 File: lib/data/repositories/auth_repository_impl.dart        │
│     🔧 Function: login()  [Line 22-38]                              │
│     📤 Actions:                                                     │
│        • Create LoginModel(email, password)                         │
│        • Call: remoteDataSources.login(loginModel)                  │
│        • Call: localDataSources.cacheUserResponse(result)           │
│        • Return: Right(result.toDomain())  [mapper conversion]      │
└─────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────┐
│  5. REMOTE DATA SOURCE (API Layer)                                  │
│     📄 File: lib/data/data_provider/remote_data_source.dart         │
│     🔧 Function: login(LoginModel)                                  │
│     📤 Actions:                                                     │
│        • Uri.parse(RemoteUrls.login)                                │
│        • client.post(uri, body: body.toMap(), headers: headers)     │
│        • NetworkParser.callClientWithCatchException()               │
└─────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────┐
│  6. NETWORK PARSER (HTTP Response Handling)                         │
│     📄 File: lib/data/data_provider/network_parser.dart             │
│     🔧 Function: callClientWithCatchException()                     │
│     🔧 Function: _responseParser()                                  │
│     📤 Actions:                                                     │
│        • Handle HTTP status codes (200, 400, 401, 422, 500, etc.)   │
│        • Parse JSON response or throw specific exceptions           │
│        • Return parsed response data                                │
└─────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────┐
│  🌐 EXTERNAL API SERVER                                             │
│     🔧 Processes HTTP POST request                                  │
│     📤 Returns JSON response with user data or error                │
└─────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────┐
│  7. RESPONSE PROCESSING (Data Transformation)                       │
│     📄 File: lib/data/mappers/auth_mappers.dart                     │
│     🔧 Function: toDomain()  [Line 19-27]                           │
│     📤 Actions:                                                     │
│        • Convert UserResponseModel → AuthResponse (domain entity)   │
│        • Convert nested UserResponse → User (domain entity)         │
└─────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────┐
│  8. LOCAL STORAGE (Cache Management)                                │
│     📄 File: lib/data/data_provider/local_data_source.dart          │
│     🔧 Function: cacheUserResponse()                                │
│     📤 Action: sharedPreferences.setString(key, userModel.toJson()) │
└─────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────┐
│  9. BLOC STATE EMISSION (UI Update)                                 │
│     📄 File: lib/presentation/bloc/auth/login_bloc.dart             │
│     🔧 Function: _onLoginSubmit()  [Line 75-77]                     │
│     📤 Actions:                                                     │
│        • _user = authResponse                                       │
│        • emit(LoginLoaded(authResponse: authResponse))              │
└─────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────┐
│  10. UI UPDATE (Screen Rebuild)                                     │
│     📄 File: lib/presentation/screens/authentication/login_screen.dart │
│     🔧 Function: BlocListener/BlocBuilder rebuilds                  │
│     📤 Actions:                                                     │
│        • Hide loading indicator                                     │
│        • Navigate to main screen or show error message              │
└─────────────────────────────────────────────────────────────────────┘
```

### 🔄 Error Handling Flow

When errors occur, they follow this path:

```
API Error (422, 401, 500) → NetworkParser._responseParser() 
                         → Throws specific exception (InvalidInputException, UnauthorisedException) 
                         → AuthRepositoryImpl.login() catches exception
                         → Returns Left(ServerFailure/InvalidAuthDataFailure)
                         → LoginBloc._onLoginSubmit() handles Either result
                         → Emits error state (LoginError/LoginFormValidationError)
                         → UI shows error message
```
### 📊 Key Function Calls Summary

| Layer | File | Key Function | Purpose |
|-------|------|--------------|----------|
| **Presentation** | `login_bloc.dart` | `_onLoginSubmit()` | Handle login event, orchestrate flow |
| **Domain** | `auth_usecases.dart` | `LoginUseCase.call()` | Execute business rule |
| **Data** | `auth_repository_impl.dart` | `login()` | Coordinate data operations |
| **Data** | `remote_data_source.dart` | `login()` | Make HTTP request |
| **Data** | `network_parser.dart` | `callClientWithCatchException()` | Handle HTTP response/errors |
| **Data** | `auth_mappers.dart` | `toDomain()` | Convert data model to domain entity |
| **Data** | `local_data_source.dart` | `cacheUserResponse()` | Store user data locally |
| **Data** | `local_data_source.dart` | `cacheUserResponse()` | 40-43 | Store user data locally |

### 💾 Data Transformation Points

1. **UI Input** → `LoginParams` (domain object)
2. **LoginParams** → `LoginModel` (data model for API)
3. **API Response JSON** → `UserResponseModel` (data model)
4. **UserResponseModel** → `AuthResponse` (domain entity) ✨ **[Mapper]**
5. **AuthResponse** → UI state (`LoginLoaded`)

### 🎯 Dependency Flow

```
LoginBloc depends on → LoginUseCase
                   depends on → AuthRepository (interface)
                               implemented by → AuthRepositoryImpl
                                           depends on → RemoteDataSource & LocalDataSource
                                                   implemented by → RemoteDataSourceImpl & LocalDataSourceImpl
```

## 🔄 How Authentication Works (Legacy Description)

1. **UI** dispatches `LoginEventSubmit(email, password, rememberMe)`
2. **LoginBloc** calls `LoginUseCase` with parameters
3. **LoginUseCase** calls `AuthRepository.login()`
4. **AuthRepositoryImpl** uses `RemoteDataSource` to make API call
5. **Response** is mapped from data models to domain entities
6. **Result** is emitted back to UI through BLoC states

## 🏭 Dependency Injection

The DI system is organized in layers using `RepositoryProvider` and `BlocProvider`:

```dart path=lib/dependency_injection.dart start=15
static final repositoryProvider = <RepositoryProvider>[
  // Core dependencies
  RepositoryProvider<Client>(
    create: (context) => Client(),
  ),
  RepositoryProvider<SharedPreferences>(
    create: (context) => _sharedPreferences,
  ),

  // Data sources
  RepositoryProvider<RemoteDataSource>(
    create: (context) => RemoteDataSourceImpl(
      client: context.read(),
    ),
  ),
  RepositoryProvider<LocalDataSource>(
    create: (context) => LocalDataSourceImpl(
      sharedPreferences: context.read(),
    ),
  ),

  // Repository implementations
  RepositoryProvider<AuthRepository>(
    create: (context) => AuthRepositoryImpl(
      remoteDataSources: context.read(),
      localDataSources: context.read(),
    ),
  ),
  RepositoryProvider<SettingRepository>(
    create: (context) => SettingRepositoryImpl(
      remoteDataSources: context.read(),
      localDataSources: context.read(),
    ),
  ),

  // Combined Auth Use Cases
  RepositoryProvider<AuthUseCases>(
    create: (context) => AuthUseCases.create(context.read<AuthRepository>()),
  ),
  RepositoryProvider<GetSettingUseCase>(
    create: (context) => GetSettingUseCase(context.read<SettingRepository>()),
  ),
];

static final blocProviders = <BlocProvider>[
  BlocProvider<InternetStatusBloc>(
    create: (context) => InternetStatusBloc(),
  ),
  BlocProvider<LoginBloc>(
    create: (BuildContext context) => LoginBloc(
      authUseCases: context.read<AuthUseCases>(),
    ),
  ),
  BlocProvider<SettingCubit>(
    create: (BuildContext context) => SettingCubit(
      getSettingUseCase: context.read<GetSettingUseCase>(),
    ),
  ),
];
```

## ➕ Adding New Features

### 1. Domain Layer
```dart
// 1. Create entity
class Product extends Equatable { ... }

// 2. Create repository interface
abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}

// 3. Create use case
class GetProductsUseCase implements UseCase<List<Product>, NoParams> {
  final ProductRepository repository;
  // ...
}
```

### 2. Data Layer
```dart
// 1. Create data model
class ProductModel { ... }

// 2. Create mapper
extension ProductModelMapper on ProductModel {
  Product toDomain() => Product(...);
}

// 3. Update data sources
abstract class RemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

// 4. Implement repository
class ProductRepositoryImpl implements ProductRepository {
  // Implementation using data sources and mappers
}
```

### 3. Presentation Layer
```dart
// 1. Create BLoC/Cubit
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase _getProductsUseCase;
  // ...
}

// 2. Create events and states
abstract class ProductEvent extends Equatable { ... }
abstract class ProductState extends Equatable { ... }
```

### 4. Update Dependency Injection
```dart
// Add to repositoryProvider list
RepositoryProvider<ProductRepository>(
  create: (context) => ProductRepositoryImpl(...),
),
RepositoryProvider<GetProductsUseCase>(
  create: (context) => GetProductsUseCase(context.read()),
),

// Add to blocProviders list
BlocProvider<ProductBloc>(
  create: (context) => ProductBloc(getProductsUseCase: context.read()),
),
```

## 🧪 Testing Strategy

This project implements a comprehensive testing strategy that covers all layers of Clean Architecture. Each layer can be tested independently, ensuring robust and reliable code.

### 📋 Testing Pyramid Overview

```
                    🔺 E2E Tests (Few)
                  Integration Tests (Some)  
                Widget Tests (More)
              Unit Tests (Many)
```

### 🎯 Testing Approaches by Layer

#### 1. **Unit Tests** - Domain & Data Layer Testing

**Purpose**: Test business logic, use cases, repositories, and mappers in isolation.

**What to Test**:
- ✅ Use Cases (Business Logic)
- ✅ Entities (Value Objects)
- ✅ Repository Implementations
- ✅ Data Sources
- ✅ Mappers (Data ↔ Domain conversion)
- ✅ Validators & Utilities

**Example Structure**:
```
test/
├── unit/
│   ├── domain/
│   │   ├── usecases/
│   │   │   ├── auth/
│   │   │   │   ├── login_usecase_test.dart
│   │   │   │   ├── logout_usecase_test.dart
│   │   │   │   └── get_existing_user_info_usecase_test.dart
│   │   │   └── setting/
│   │   │       └── get_setting_usecase_test.dart
│   │   └── entities/
│   │       ├── user_test.dart
│   │       └── auth_response_test.dart
│   ├── data/
│   │   ├── repositories/
│   │   │   ├── auth_repository_impl_test.dart
│   │   │   └── setting_repository_impl_test.dart
│   │   ├── data_provider/
│   │   │   ├── remote_data_source_test.dart
│   │   │   └── local_data_source_test.dart
│   │   └── mappers/
│   │       └── auth_mappers_test.dart
│   └── core/
│       ├── utils/
│       │   ├── validators_test.dart
│       │   └── logger_test.dart
│       └── services/
│           └── navigation_service_test.dart
```

#### 2. **Widget Tests** - Presentation Layer Testing

**Purpose**: Test UI components and their interaction with BLoCs/Cubits.

**What to Test**:
- ✅ Individual Widgets
- ✅ Screen Widgets
- ✅ BLoC/Cubit State Changes
- ✅ User Interactions
- ✅ Navigation Flows

**Example Structure**:
```
test/
├── widget/
│   ├── presentation/
│   │   ├── bloc/
│   │   │   ├── auth/
│   │   │   │   └── login_bloc_test.dart
│   │   │   └── internet_status/
│   │   │       └── internet_status_bloc_test.dart
│   │   ├── screens/
│   │   │   ├── authentication/
│   │   │   │   └── login_screen_test.dart
│   │   │   └── splash/
│   │   │       └── splash_screen_test.dart
│   │   └── widgets/
│   │       ├── custom_button_test.dart
│   │       └── loading_widget_test.dart
```

#### 3. **Integration Tests** - Feature Flow Testing

**Purpose**: Test complete user journeys and feature flows.

**What to Test**:
- ✅ End-to-end user workflows
- ✅ Multiple screen interactions
- ✅ Real API integration (with test environment)
- ✅ Authentication flows
- ✅ Data persistence

**Example Structure**:
```
integration_test/
├── flows/
│   ├── authentication_flow_test.dart
│   ├── onboarding_flow_test.dart
│   └── settings_flow_test.dart
└── helpers/
    ├── test_helpers.dart
    └── mock_data.dart
```

### 🛠️ Testing Setup & Tools

#### **Dependencies for Testing**
Add these to your `pubspec.yaml`:

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  mockito: ^5.4.2
  build_runner: ^2.4.6
  bloc_test: ^9.1.4
  mocktail: ^1.0.0
  integration_test:
    sdk: flutter
```

### 📝 Testing Implementation Examples

#### **1. Unit Test - Use Case Example**

```dart
// test/unit/domain/usecases/auth/login_usecase_test.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:your_app/core/error/failures.dart';
import 'package:your_app/domain/entities/auth_response.dart';
import 'package:your_app/domain/repositories/auth_repository.dart';
import 'package:your_app/domain/usecases/auth/login_usecase.dart';

@GenerateNiceMocks([MockSpec<AuthRepository>()])
import 'login_usecase_test.mocks.dart';

void main() {
  late LoginUseCase usecase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    usecase = LoginUseCase(mockRepository);
  });

  const testEmail = 'test@example.com';
  const testPassword = 'password123';
  const testAuthResponse = AuthResponse(
    accessToken: 'token123',
    tokenType: 'Bearer',
    isVendor: 0,
    expireIn: 3600,
  );

  group('LoginUseCase', () {
    test('should return AuthResponse when login is successful', () async {
      // Arrange
      when(mockRepository.login(
        email: anyNamed('email'),
        password: anyNamed('password'),
      )).thenAnswer((_) async => const Right(testAuthResponse));

      // Act
      final result = await usecase(const LoginParams(
        email: testEmail,
        password: testPassword,
      ));

      // Assert
      expect(result, const Right(testAuthResponse));
      verify(mockRepository.login(
        email: testEmail,
        password: testPassword,
      )).called(1);
    });

    test('should return ServerFailure when login fails', () async {
      // Arrange
      when(mockRepository.login(
        email: anyNamed('email'),
        password: anyNamed('password'),
      )).thenAnswer((_) async => const Left(ServerFailure('Login failed', 401)));

      // Act
      final result = await usecase(const LoginParams(
        email: testEmail,
        password: testPassword,
      ));

      // Assert
      expect(result, const Left(ServerFailure('Login failed', 401)));
    });
  });
}
```

#### **2. Widget Test - BLoC Testing Example**

```dart
// test/widget/presentation/bloc/auth/login_bloc_test.dart
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:your_app/core/error/failures.dart';
import 'package:your_app/domain/entities/auth_response.dart';
import 'package:your_app/domain/usecases/auth/login_usecase.dart';
import 'package:your_app/presentation/bloc/auth/login_bloc.dart';

@GenerateNiceMocks([MockSpec<LoginUseCase>()])
import 'login_bloc_test.mocks.dart';

void main() {
  late LoginBloc loginBloc;
  late MockLoginUseCase mockLoginUseCase;
  late MockLogoutUseCase mockLogoutUseCase;
  late MockGetExistingUserInfoUseCase mockGetExistingUserInfoUseCase;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    mockLogoutUseCase = MockLogoutUseCase();
    mockGetExistingUserInfoUseCase = MockGetExistingUserInfoUseCase();
    
    loginBloc = LoginBloc(
      loginUseCase: mockLoginUseCase,
      logoutUseCase: mockLogoutUseCase,
      getExistingUserInfoUseCase: mockGetExistingUserInfoUseCase,
    );
  });

  tearDown(() {
    loginBloc.close();
  });

  const testAuthResponse = AuthResponse(
    accessToken: 'token123',
    tokenType: 'Bearer',
    isVendor: 0,
    expireIn: 3600,
  );

  group('LoginBloc', () {
    blocTest<LoginBloc, LoginState>(
      'emits [LoginLoading, LoginLoaded] when login is successful',
      build: () {
        when(mockLoginUseCase(any))
            .thenAnswer((_) async => const Right(testAuthResponse));
        return loginBloc;
      },
      act: (bloc) => bloc.add(const LoginEventSubmit(
        email: 'test@example.com',
        password: 'password123',
        rememberMe: false,
      )),
      expect: () => [
        const LoginLoading(),
        const LoginLoaded(authResponse: testAuthResponse),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [LoginLoading, LoginError] when login fails',
      build: () {
        when(mockLoginUseCase(any))
            .thenAnswer((_) async => const Left(ServerFailure('Login failed', 401)));
        return loginBloc;
      },
      act: (bloc) => bloc.add(const LoginEventSubmit(
        email: 'test@example.com',
        password: 'wrong_password',
        rememberMe: false,
      )),
      expect: () => [
        const LoginLoading(),
        const LoginError(message: 'Login failed', statusCode: 401),
      ],
    );
  });
}
```

#### **3. Widget Test - Screen Testing Example**

```dart
// test/widget/presentation/screens/authentication/login_screen_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:your_app/presentation/bloc/auth/login_bloc.dart';
import 'package:your_app/presentation/screens/authentication/login_screen.dart';

class MockLoginBloc extends Mock implements LoginBloc {}

void main() {
  late MockLoginBloc mockLoginBloc;

  setUp(() {
    mockLoginBloc = MockLoginBloc();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<LoginBloc>(
        create: (_) => mockLoginBloc,
        child: const LoginScreen(),
      ),
    );
  }

  group('LoginScreen', () {
    testWidgets('displays email and password fields', (WidgetTester tester) async {
      // Arrange
      when(mockLoginBloc.state).thenReturn(const LoginInitial());
      when(mockLoginBloc.stream).thenAnswer((_) => const Stream.empty());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.byKey(const ValueKey('email_field')), findsOneWidget);
      expect(find.byKey(const ValueKey('password_field')), findsOneWidget);
      expect(find.byKey(const ValueKey('login_button')), findsOneWidget);
    });

    testWidgets('triggers login event when login button is pressed',
        (WidgetTester tester) async {
      // Arrange
      when(mockLoginBloc.state).thenReturn(const LoginInitial());
      when(mockLoginBloc.stream).thenAnswer((_) => const Stream.empty());

      await tester.pumpWidget(createWidgetUnderTest());

      // Act
      await tester.enterText(
          find.byKey(const ValueKey('email_field')), 'test@example.com');
      await tester.enterText(
          find.byKey(const ValueKey('password_field')), 'password123');
      await tester.tap(find.byKey(const ValueKey('login_button')));
      await tester.pump();

      // Assert
      verify(mockLoginBloc.add(const LoginEventSubmit(
        email: 'test@example.com',
        password: 'password123',
        rememberMe: false,
      ))).called(1);
    });
  });
}
```

#### **4. Integration Test Example**

```dart
// integration_test/flows/authentication_flow_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:your_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Authentication Flow', () {
    testWidgets('complete login flow', (WidgetTester tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Navigate to login screen
      await tester.tap(find.byKey(const ValueKey('login_button')));
      await tester.pumpAndSettle();

      // Enter credentials
      await tester.enterText(
          find.byKey(const ValueKey('email_field')), 'test@example.com');
      await tester.enterText(
          find.byKey(const ValueKey('password_field')), 'password123');

      // Submit login
      await tester.tap(find.byKey(const ValueKey('submit_button')));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Verify successful login
      expect(find.byKey(const ValueKey('main_screen')), findsOneWidget);
    });

    testWidgets('login with invalid credentials shows error',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const ValueKey('login_button')));
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(const ValueKey('email_field')), 'invalid@example.com');
      await tester.enterText(
          find.byKey(const ValueKey('password_field')), 'wrongpassword');

      await tester.tap(find.byKey(const ValueKey('submit_button')));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.text('Invalid credentials'), findsOneWidget);
    });
  });
}
```

### 🚀 Running Tests

#### **Generate Mocks**
```bash
flutter packages pub run build_runner build
```

#### **Run All Tests**
```bash
flutter test
```

#### **Run Specific Test Categories**
```bash
# Unit tests only
flutter test test/unit/

# Widget tests only
flutter test test/widget/

# Integration tests
flutter test integration_test/
```

#### **Run Tests with Coverage**
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

#### **Watch Mode for Development**
```bash
flutter test --watch
```

### 📊 Test Coverage Goals

| Layer | Target Coverage | Focus Area |
|-------|----------------|------------|
| **Domain** | 90-100% | Use Cases, Entities |
| **Data** | 80-90% | Repositories, Data Sources, Mappers |
| **Presentation** | 70-80% | BLoCs, Critical UI Components |
| **Core** | 90-100% | Utilities, Services, Validators |

### 🎯 Testing Best Practices

#### **DO's** ✅
- Test business logic thoroughly in domain layer
- Mock external dependencies (APIs, databases)
- Use descriptive test names that explain the scenario
- Follow AAA pattern (Arrange, Act, Assert)
- Test both success and failure scenarios
- Use `setUp()` and `tearDown()` for test preparation
- Group related tests with `group()`

#### **DON'Ts** ❌
- Don't test Flutter framework code
- Don't test third-party packages
- Don't write tests that depend on network connectivity
- Don't test implementation details, test behavior
- Don't ignore test failures

### 🔧 Mock Data & Test Helpers

```dart
// test/helpers/test_data.dart
class TestData {
  static const testUser = User(
    id: 1,
    name: 'Test User',
    email: 'test@example.com',
    phoneNumber: '+1234567890',
    isVendor: 0,
  );

  static const testAuthResponse = AuthResponse(
    accessToken: 'test_token',
    tokenType: 'Bearer',
    isVendor: 0,
    expireIn: 3600,
    user: testUser,
  );
}

// test/helpers/widget_test_helpers.dart
class WidgetTestHelpers {
  static Widget wrapWithMaterialApp(Widget child) {
    return MaterialApp(home: Scaffold(body: child));
  }

  static Widget wrapWithBloc<B extends StateStreamableSource<Object?>>(
    B bloc,
    Widget child,
  ) {
    return BlocProvider<B>.value(
      value: bloc,
      child: wrapWithMaterialApp(child),
    );
  }
}
```

### 📈 Continuous Integration

Add this to your CI/CD pipeline (e.g., GitHub Actions):

```yaml
# .github/workflows/test.yml
name: Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.13.0'
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test --coverage
      - run: flutter test integration_test/
```

This testing strategy ensures your Clean Architecture Flutter project is robust, maintainable, and bug-free! 🧪✨

## 📦 Dependencies

### State Management
- `flutter_bloc: ^9.1.1` - BLoC pattern implementation
- `equatable: ^2.0.7` - Value equality for states and events

### Functional Programming
- `dartz: ^0.10.1` - Either type for error handling

### Network & Storage
- `http: ^1.5.0` - HTTP client
- `shared_preferences: ^2.5.3` - Local storage
- `connectivity_plus: ^7.0.0` - Network connectivity

### UI & Styling
- `flutter_screenutil: ^5.9.3` - Responsive design
- `google_fonts: ^6.3.1` - Custom fonts
- `flutter_svg: ^2.2.1` - SVG support
- `cached_network_image: ^3.4.1` - Image caching
- `cupertino_icons: ^1.0.8` - iOS style icons

### Utilities
- `intl: ^0.20.2` - Internationalization

### Development & Testing
- `mockito: ^5.4.2` - Mock objects for testing
- `build_runner: ^2.4.6` - Code generation runner
- `bloc_test: ^10.0.0` - Testing utilities for BLoC
- `mocktail: ^1.0.0` - Alternative mocking library
- `flutter_lints: ^6.0.0` - Recommended linting rules

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.8.1+
- Dart SDK 3.0+
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation & Setup

1. **Clone the repository**
```bash
git clone <your-repository-url>
cd flutter-template-project
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Configure environment**
    - Update API endpoints in `lib/data/data_provider/remote_url.dart`
    - Set environment in `lib/main.dart` (development/staging/production)
    - Configure app constants in `lib/core/constants/app_constants.dart`

4. **Run the app**
```bash
# Development
flutter run

# Release mode
flutter run --release

# Specific device
flutter run -d <device-id>
```

5. **Run tests**
```bash
# All tests
flutter test

# Unit tests only
flutter test test/unit/

# Widget tests only
flutter test test/widget/

# Integration tests
flutter test integration_test/

# With coverage
flutter test --coverage
```

6. **Code analysis & formatting**
```bash
# Analyze code
flutter analyze

# Format code
dart format .

# Fix lint issues
dart fix --apply
```

7. **Build for production**
```bash
# Android APK
flutter build apk --release

# Android AAB (Play Store)
flutter build appbundle --release

# iOS (requires macOS)
flutter build ios --release
```

## 🎯 Benefits of This Architecture

- **🔧 Maintainability**: Clear separation of concerns makes code easy to understand and modify
- **🧠 Testability**: Each layer can be tested in isolation with proper mocking
- **🔄 Flexibility**: UI, database, and external services can be changed independently
- **🚀 Scalability**: Easy to add new features following established patterns
- **👥 Team Development**: Multiple developers can work on different layers simultaneously
- **🛡️ Reliability**: Functional error handling prevents crashes and provides better UX

## 🧭 SOLID Principles Implementation

| Principle | Implementation |
|-----------|----------------|
| **S**RP | Each class has single responsibility (Use Cases, Entities, Repositories) |
| **O**CP | Open for extension via interfaces, closed for modification |
| **L**SP | Repository implementations are completely substitutable |
| **I**SP | Focused interfaces per domain (AuthRepository, SettingRepository) |
| **D**IP | Dependencies point toward abstractions, not concretions |
