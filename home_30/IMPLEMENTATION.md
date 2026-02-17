# Реализация GetIt Dependency Injection

## Выполненные задачи

### ✅ 1. Регистрация зависимостей в GetIt
- **ApiClient** - зарегистрирован как `LazySingleton`
- **UserRepository** - зарегистрирован как `LazySingleton`
- **GetUser UseCase** - зарегистрирован как `LazySingleton`
- Все зависимости регистрируются в `lib/core/di/injection_container.dart`

### ✅ 2. Mock и Real реализации ApiClient
- **MockApiClient** - используется в **debug** режиме (`kDebugMode`)
- **RealApiClient** - используется в **release** режиме
- Переключение происходит автоматически в `injection_container.dart`:
```dart
if (kDebugMode) {
  getIt.registerLazySingleton<ApiClient>(() => MockApiClient());
} else {
  getIt.registerLazySingleton<ApiClient>(
    () => RealApiClient(client: getIt()),
  );
}
```

### ✅ 3. Асинхронная инициализация перед runApp
- `SharedPreferences` инициализируется асинхронно в `main()` функции
- Используется `WidgetsFlutterBinding.ensureInitialized()` для корректной работы
- Все зависимости регистрируются до вызова `runApp()`

### ✅ 4. Получение зависимостей в UI через GetIt
- `UserPage` получает `GetUser` use case через конструктор
- В `main.dart` use case получается через `di.getIt<GetUser>()`
- Это демонстрирует использование фабрики для создания виджетов с зависимостями

### ✅ 5. Unit-тест с подменой зависимостей
- Тест находится в `test/features/user/domain/usecases/get_user_test.dart`
- Используется `MockApiClient` через `mockito`
- Демонстрирует подмену зависимостей через GetIt в тестах

## Структура проекта

```
lib/
├── core/
│   ├── di/
│   │   └── injection_container.dart    # Регистрация всех зависимостей
│   ├── error/
│   │   └── failures.dart               # Классы ошибок
│   └── network/
│       └── api_client.dart             # ApiClient (Mock и Real)
├── features/
│   └── user/
│       ├── data/
│       │   ├── models/
│       │   │   └── user_model.dart
│       │   └── repositories/
│       │       └── user_repository_impl.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   └── user.dart
│       │   ├── repositories/
│       │   │   └── user_repository.dart
│       │   └── usecases/
│       │       └── get_user.dart
│       └── presentation/
│           └── pages/
│               └── user_page.dart
└── main.dart
```

## Запуск тестов

Для генерации моков и запуска тестов:

```bash
# Генерация моков
flutter pub run build_runner build

# Запуск тестов
flutter test
```

## Использование

1. **В debug режиме**: используется `MockApiClient` (быстрые ответы без реальных запросов)
2. **В release режиме**: используется `RealApiClient` (реальные HTTP запросы)

Зависимости автоматически переключаются при сборке приложения.
