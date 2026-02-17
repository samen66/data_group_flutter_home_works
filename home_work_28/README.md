# Champions League Matches App

Flutter приложение для просмотра матчей Лиги Чемпионов с использованием Clean Architecture и flutter_bloc.

## Особенности

✅ **Dio клиент** с baseUrl, timeouts и логированием через Interceptors  
✅ **Обработка ошибок** с разными сообщениями для 400/401/500 и отсутствия сети  
✅ **Отмена запросов** (CancelToken) при уходе со страницы  
✅ **Retry логика** на сетевые ошибки (1-2 попытки)  
✅ **Прогресс-индикатор** загрузки  
✅ **Загрузка с onReceiveProgress** для отслеживания прогресса  
✅ **Фильтрация матчей**: Все / Ближайшие / Прошедшие  
✅ **Просмотр команд** Champions League  
✅ **Матчи команд** с фильтрацией по статусу  

## Архитектура

Проект следует принципам Clean Architecture с Feature-first организацией:

```
lib/
├── core/                          # Общий код
│   ├── error/                     # Обработка ошибок
│   ├── network/                   # Dio клиент, interceptors
│   ├── utils/                     # Утилиты
│   └── widgets/                   # Переиспользуемые виджеты
├── features/                      # Функциональность приложения
│   └── champions_league/          # Функция матчей
│       ├── data/                  # Слой данных
│       ├── domain/                # Слой домена
│       └── presentation/          # Слой представления
└── main.dart
```

## Установка

1. Установите зависимости:
```bash
flutter pub get
```

2. (Опционально) Если используете code generation:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

3. Запустите приложение:
```bash
flutter run
```

## API

Приложение использует [Football Data API](https://www.football-data.org/) для получения данных о матчах Лиги Чемпионов.

### Получение API токена

1. Зарегистрируйтесь на [football-data.org](https://www.football-data.org/register)
2. После регистрации вы получите бесплатный API токен
3. Добавьте токен одним из способов:

**Способ 1: Через переменную окружения (рекомендуется)**
```bash
# Windows PowerShell
$env:FOOTBALL_API_TOKEN="ваш_токен_здесь"
flutter run

# Linux/Mac
export FOOTBALL_API_TOKEN="ваш_токен_здесь"
flutter run
```

**Способ 2: Через compile-time переменную**
```bash
flutter run --dart-define=FOOTBALL_API_TOKEN=ваш_токен_здесь
```

**Способ 3: Прямо в коде (не рекомендуется для продакшена)**
Отредактируйте `lib/core/injection/injection.dart`:
```dart
final dioClient = DioClient(
  apiToken: 'ваш_токен_здесь',
);
```

**Бесплатный план**: 10 запросов в минуту, без токена - только 1 запрос в минуту.

**Примечание**: Если токен не указан, приложение все равно будет работать, но с ограничениями.

## Структура проекта

### Core Layer

- **DioClient**: Настроенный Dio клиент с interceptors для логирования и retry
- **NetworkInfo**: Проверка подключения к интернету
- **Failures**: Классы ошибок для разных типов сбоев
- **NetworkExceptions**: Маппинг DioException в Failure

### Feature Layer (Champions League)

#### Domain
- **Entities**: Match - бизнес-объект матча
- **Repositories**: Интерфейс репозитория
- **Use Cases**: GetChampionsLeagueMatches - бизнес-логика

#### Data
- **Models**: MatchModel - модель данных с маппингом в entity
- **Data Sources**: MatchesRemoteDataSource - источник данных
- **Repositories**: MatchesRepositoryImpl - реализация репозитория

#### Presentation
- **Bloc**: 
  - MatchesBloc - управление состоянием матчей
  - TeamsBloc - управление состоянием команд
- **Pages**: 
  - MatchesPage - экран со списком матчей с фильтрами
  - TeamsPage - экран со списком команд
- **Widgets**: 
  - MatchCard - карточка матча
  - TeamCard - карточка команды

## Основные компоненты

### Dio Client с Interceptors

```dart
// Логирование запросов/ответов
_LoggingInterceptor

// Retry на сетевые ошибки
_RetryInterceptor (до 2 попыток)
```

### Обработка ошибок

- **400**: Неверный запрос
- **401**: Ошибка авторизации
- **500+**: Ошибка сервера
- **Network**: Отсутствие подключения
- **Timeout**: Превышено время ожидания
- **Cancellation**: Запрос отменен

### CancelToken

Запросы автоматически отменяются при:
- Уходе со страницы (dispose)
- Начале нового запроса
- Закрытии Bloc

### Progress Indicator

Прогресс загрузки отображается через `onReceiveProgress` callback и показывается в UI.

### Фильтрация матчей

Приложение поддерживает фильтрацию матчей:
- **Все** - все матчи Champions League
- **Ближайшие** - запланированные матчи (SCHEDULED)
- **Прошедшие** - завершенные матчи (FINISHED)

### Команды

- Просмотр всех команд Champions League
- Информация о команде (название, эмблема, страна)
- Матчи конкретной команды (можно расширить функционал)

## Зависимости

- `dio`: HTTP клиент
- `flutter_bloc`: Управление состоянием
- `dartz`: Функциональное программирование (Either)
- `get_it`: Dependency Injection
- `connectivity_plus`: Проверка подключения
- `equatable`: Сравнение объектов
- `intl`: Форматирование дат

## Лицензия

Этот проект создан в образовательных целях.
