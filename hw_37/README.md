# hw_37

Flutter homework: **Singleton** (`AppLogger`, `AnalyticsService`), **Factory** for status UI and API parsing, plus **get_it** as a DI alternative.

## Patterns in code

| Pattern | Where |
|--------|--------|
| Singleton | `lib/core/logging/app_logger.dart`, `lib/core/analytics/analytics_service.dart` — used from `main.dart`, `HomePage`, `DemoApiClient` / `ApiResponseParserFactory` |
| Factory (UI) | `lib/core/status/status_widget_factory.dart` + `UiRequestStatus` |
| Factory (API) | `lib/core/api/api_response_parser_factory.dart` — разбор JSON по полю `type` |
| DI (get_it) | `lib/core/di/service_locator.dart` — `UserProfileRepository` / `DemoApiClient` через `sl<…>()`; `HomePage` зависит от абстракции `UserProfileRepository` |

## Singleton vs DI (get_it) — 5 пунктов

1. **Явность зависимостей.** Через get_it конструкторы и фабрики можно получать зависимости по типу; ручной `SomeService.instance` скрывает зависимость и затрудняет чтение графа объектов.
2. **Тестируемость.** С контейнером проще подменить реализации (`registerSingleton` с моком) и сбросить состояние (`reset()`). Статический singleton подменять сложнее, часто нужны обёртки или `visibleForTesting`.
3. **Контроль времени жизни.** get_it различает `registerFactory`, `registerLazySingleton`, `registerSingleton`; у классического singleton всегда один глобальный объект на процесс.
4. **Простота и отсутствие магии.** `X.instance` не требует bootstrap и сторонних пакетов; get_it добавляет слой регистрации и риск забыть `configureServiceLocator()` до `runApp`.
5. **Масштаб команды.** В больших приложениях единая точка регистрации и интерфейсы в DI упрощают соглашения; для маленьких экранов и утилит вроде логгера singleton часто достаточен и короче.

## Getting Started

```bash
cd hw_37
flutter pub get
flutter test
flutter run
```

Документация Flutter: [docs.flutter.dev](https://docs.flutter.dev/).
