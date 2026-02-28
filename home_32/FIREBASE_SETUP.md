# Настройка Firebase для Android (решение ошибки CONFIGURATION_NOT_FOUND)

## Проблема
Ошибка `CONFIGURATION_NOT_FOUND` возникает при регистрации пользователя, потому что Firebase Auth требует настройки reCAPTCHA для Android.

## Решение

### Шаг 1: Получите SHA-1 и SHA-256 fingerprints

**Вариант A: Используя PowerShell скрипт**
```powershell
.\get_sha1.ps1
```

**Вариант B: Вручную через keytool**
```bash
keytool -list -v -keystore %USERPROFILE%\.android\debug.keystore -storepass android -alias androiddebugkey
```

Ищите строки:
- `SHA1: XX:XX:XX:...`
- `SHA256: XX:XX:XX:...`

### Шаг 2: Добавьте fingerprints в Firebase Console

1. Откройте [Firebase Console](https://console.firebase.google.com/)
2. Выберите проект **data-groupe-h31**
3. Перейдите в **Project Settings** (⚙️ в левом верхнем углу)
4. Прокрутите вниз до раздела **Your apps**
5. Найдите ваше Android приложение (`com.example.home_32`)
6. Нажмите **Add fingerprint**
7. Добавьте **SHA-1** fingerprint
8. Добавьте **SHA-256** fingerprint (опционально, но рекомендуется)

### Шаг 3: Скачайте обновленный google-services.json

1. После добавления fingerprints, нажмите **Download google-services.json**
2. Замените файл `android/app/google-services.json` новым файлом

### Шаг 4: Пересоберите приложение

```bash
flutter clean
flutter pub get
flutter run
```

## Альтернативное решение (для тестирования)

Если вы хотите временно отключить reCAPTCHA для тестирования, можно использовать тестовый режим в Firebase Console:

1. Firebase Console > Authentication > Settings
2. Включите "Use email link (passwordless sign-in)" (это может помочь)
3. Или используйте тестовые номера телефонов для тестирования

**Примечание:** Для production приложения обязательно настройте SHA-1/SHA-256 fingerprints.

## Проверка

После настройки, в `google-services.json` должно появиться поле `oauth_client` с данными:

```json
"oauth_client": [
  {
    "client_id": "...",
    "client_type": 3
  }
]
```

Если это поле все еще пустое, подождите несколько минут и перезагрузите страницу в Firebase Console.
