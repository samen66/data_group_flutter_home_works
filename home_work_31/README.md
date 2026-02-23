# Home Work 31

Flutter project implementing Clean Architecture with feature-first organization.

## Features Implemented

1. **Freezed + JSON Serializable**: DTO model (`ProductModel`) with code generation
2. **Cached Network Image**: List with images, placeholder, and error widget
3. **Internationalization (intl)**: Date/currency formatting and locale switching (ru/en)
4. **Go Router**: 3 routes with parameters:
   - `/` - Products list
   - `/products/:id` - Product detail page
   - `/settings` - Settings page with locale and token management
5. **Flutter Secure Storage**: Token storage demo

## Setup Instructions

1. Install dependencies:
```bash
flutter pub get
```

2. Generate code (Freezed and JSON Serializable):
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

3. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── core/
│   ├── di/                    # Dependency injection
│   ├── error/                  # Error handling
│   ├── router/                 # App routing
│   ├── storage/                # Secure storage service
│   └── utils/                  # Utilities and extensions
├── features/
│   └── products/               # Products feature
│       ├── data/               # Data layer
│       │   ├── datasources/    # Remote data sources
│       │   ├── models/         # DTOs
│       │   └── repositories/   # Repository implementations
│       ├── domain/             # Domain layer
│       │   ├── entities/       # Business objects
│       │   └── repositories/   # Repository interfaces
│       └── presentation/       # Presentation layer
│           ├── bloc/           # State management
│           ├── pages/          # Screens
│           └── widgets/        # UI components
└── main.dart
```

## Routes

- `/` - Products list page
- `/products` - Products list page (alias)
- `/products/:id` - Product detail page (with ID parameter)
- `/settings` - Settings page (with optional locale query parameter)

## Dependencies

- `flutter_bloc` - State management
- `freezed` + `json_serializable` - Code generation
- `cached_network_image` - Image caching
- `intl` - Internationalization
- `go_router` - Navigation
- `flutter_secure_storage` - Secure storage
- `get_it` - Dependency injection
- `dartz` - Functional programming (Either)
