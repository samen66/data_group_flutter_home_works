# Настройка Google Sign-In для Firebase

## Проблема
Ошибка при входе через Google, хотя email/пароль работает.

## Решение

### Шаг 1: Включите Google Sign-In в Firebase Console

1. Откройте [Firebase Console](https://console.firebase.google.com/)
2. Выберите проект **data-groupe-h31**
3. Перейдите в **Authentication** → **Sign-in method**
4. Найдите **Google** в списке провайдеров
5. Нажмите на **Google**
6. Включите переключатель **Enable**
7. Выберите **Project support email** (ваш email)
8. Нажмите **Save**

### Шаг 2: Настройте OAuth consent screen в Google Cloud Console

1. Откройте [Google Cloud Console](https://console.cloud.google.com/)
2. Выберите проект **data-groupe-h31** (или создайте новый)
3. Перейдите в **APIs & Services** → **OAuth consent screen**
4. Выберите тип приложения (External или Internal)
5. Заполните обязательные поля:
   - **App name**: Home 32 (или любое имя)
   - **User support email**: ваш email
   - **Developer contact information**: ваш email
6. Нажмите **Save and Continue**
7. На шаге **Scopes** нажмите **Save and Continue**
8. На шаге **Test users** (если External) добавьте тестовые email
9. Нажмите **Save and Continue** → **Back to Dashboard**

### Шаг 3: Создайте OAuth 2.0 Client ID

1. В Google Cloud Console перейдите в **APIs & Services** → **Credentials**
2. Нажмите **+ CREATE CREDENTIALS** → **OAuth client ID**
3. Выберите тип **Android**
4. Заполните:
   - **Name**: Home 32 Android (или любое имя)
   - **Package name**: `com.example.home_32`
   - **SHA-1 certificate fingerprint**: `28:73:B5:7B:14:97:95:C0:8E:67:41:4C:D9:37:35:96:60:88:F8:32`
5. Нажмите **Create**
6. Скопируйте **Client ID** (он понадобится для iOS, если нужно)

### Шаг 4: Проверьте настройки в Firebase Console

1. Вернитесь в Firebase Console
2. **Project Settings** → **Your apps** → **Android app**
3. Убедитесь, что видны SHA-1 и SHA-256 fingerprints
4. Проверьте, что в **Authentication** → **Sign-in method** → **Google** включен

### Шаг 5: Пересоберите приложение

```bash
flutter clean
flutter pub get
flutter run
```

## Проверка

После настройки:
1. Google Sign-In должен открывать диалог выбора аккаунта
2. После выбора аккаунта должен произойти вход
3. Пользователь должен быть перенаправлен на HomePage

## Частые ошибки

### "10:"
- Не настроен OAuth client в Google Cloud Console
- Неправильный SHA-1 fingerprint

### "12500:"
- Google Sign-In не включен в Firebase Console
- Неправильный package name

### "7:"
- Проблемы с сетью
- Неправильная конфигурация OAuth

## Альтернатива: Использование Web Client ID

Если проблемы продолжаются, можно явно указать Web Client ID:

1. В Google Cloud Console создайте **Web application** OAuth client
2. Скопируйте **Client ID**
3. В коде используйте:

```dart
final googleSignIn = GoogleSignIn(
  scopes: ['email', 'profile'],
);
```

Но обычно это не требуется, Firebase автоматически использует правильный client ID.
