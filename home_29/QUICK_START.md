# Быстрый старт

## ⚠️ Важно: Генерация кода обязательна!

Перед первым запуском приложения **обязательно** нужно сгенерировать код для Drift.

## Способ 1: Через скрипт (Windows)

Просто запустите файл:
```
generate_code.bat
```

## Способ 2: Через терминал

Откройте терминал в папке проекта и выполните:

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

## Способ 3: Через IDE

Если используете VS Code или Android Studio:
1. Откройте терминал в IDE
2. Выполните команды из Способа 2

## Что происходит?

Drift генерирует файл `app_database.g.dart`, который содержит:
- Базовый класс `_$AppDatabase` с геттерами `tasks` и `tags`
- Типы данных `TaskData` и `TagData`
- Типы для вставки `TasksCompanion` и `TagsCompanion`

## После генерации

После успешной генерации:
- Все ошибки компиляции исчезнут
- Можно запускать приложение: `flutter run`

## Если возникают ошибки

1. Убедитесь, что Flutter установлен: `flutter doctor`
2. Убедитесь, что зависимости установлены: `flutter pub get`
3. Если генерация не работает, попробуйте:
   ```bash
   flutter clean
   flutter pub get
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

## Текущие ошибки - это нормально!

Ошибки, которые вы видите сейчас:
- ❌ `Target of URI hasn't been generated: 'app_database.g.dart'`
- ❌ `Undefined name 'tasks'`

**Это нормально!** Они исчезнут после генерации кода.
