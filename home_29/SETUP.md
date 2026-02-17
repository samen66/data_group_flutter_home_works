# Инструкция по настройке проекта

## Шаг 1: Установка зависимостей

```bash
flutter pub get
```

## Шаг 2: Генерация кода Drift

Этот шаг обязателен! Drift генерирует код для работы с базой данных.

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Или для автоматической регенерации при изменениях:

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

## Шаг 3: Запуск приложения

После успешной генерации кода:

```bash
flutter run
```

## Решение проблем

### Ошибка "Can't use 'app_database.g.dart' as a part"

Эта ошибка возникает, если код еще не сгенерирован. Решение:
1. Убедитесь, что выполнили `flutter pub get`
2. Запустите `flutter pub run build_runner build --delete-conflicting-outputs`

### Ошибки типов Task/Tag

После генерации кода Drift создаст типы:
- `TaskData` - для данных из таблицы Tasks
- `TagData` - для данных из таблицы Tags
- `TasksCompanion` - для вставки/обновления задач
- `TagsCompanion` - для вставки/обновления тегов

Эти типы автоматически доступны после генерации.

## Структура сгенерированных файлов

После генерации будет создан файл:
- `lib/features/tasks/data/models/app_database.g.dart`

Этот файл содержит:
- Класс `_$AppDatabase` - базовый класс для AppDatabase
- Типы `TaskData` и `TagData` - типы данных из таблиц
- Типы `TasksCompanion` и `TagsCompanion` - для работы с данными

**Важно**: Не редактируйте сгенерированные файлы вручную!
