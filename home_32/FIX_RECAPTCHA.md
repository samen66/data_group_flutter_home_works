# Исправление ошибки CONFIGURATION_NOT_FOUND

## Проблема
В `google-services.json` поле `oauth_client` пустое, что означает отсутствие конфигурации reCAPTCHA.

## Решение

### Шаг 1: Добавьте SHA-1 fingerprint (обязательно!)

На скриншоте видно только SHA-256. Firebase Auth для reCAPTCHA **требует SHA-1**.

1. Получите SHA-1 fingerprint через Android Studio:
   - Откройте проект в Android Studio
   - Gradle → `home_32 > android > app > Tasks > android > signingReport`
   - Найдите **SHA1** (не SHA-256!)

2. В Firebase Console:
   - Project Settings → Your apps → Android app
   - Нажмите **Add fingerprint**
   - Добавьте **SHA-1** (формат: `XX:XX:XX:...`)

### Шаг 2: Скачайте обновленный google-services.json

**ВАЖНО:** После добавления SHA-1:

1. В Firebase Console нажмите кнопку **"google-services.json"** (с иконкой скачивания)
2. Замените файл `android/app/google-services.json` новым файлом
3. Проверьте, что в новом файле есть поле `oauth_client` с данными:

```json
"oauth_client": [
  {
    "client_id": "...",
    "client_type": 3
  }
]
```

### Шаг 3: Пересоберите приложение

```bash
flutter clean
cd android
./gradlew clean
cd ..
flutter pub get
flutter run
```

## Альтернативное решение (если SHA-1 не помогает)

Если проблема сохраняется, попробуйте:

1. **Проверьте настройки Authentication в Firebase Console:**
   - Authentication → Settings → Authorized domains
   - Убедитесь, что ваш домен добавлен

2. **Временно отключите reCAPTCHA (только для тестирования):**
   - Это не рекомендуется для production
   - Можно использовать тестовые номера телефонов

3. **Проверьте, что прошло достаточно времени:**
   - После добавления SHA-1 может потребоваться 5-10 минут для синхронизации
   - Обновите страницу Firebase Console и скачайте `google-services.json` заново

## Проверка

После выполнения всех шагов, в `android/app/google-services.json` должно быть:

```json
"oauth_client": [
  {
    "client_id": "965197810926-xxxxxxxxxxxxx.apps.googleusercontent.com",
    "client_type": 3
  }
]
```

Если поле `oauth_client` все еще пустое, подождите несколько минут и повторите скачивание файла.
