# Решение проблемы пустого oauth_client

## Проблема
После добавления SHA-1 и SHA-256 fingerprints, поле `oauth_client` в `google-services.json` остается пустым.

## Возможные причины и решения

### 1. Firebase еще не сгенерировал OAuth client

**Решение:**
- Подождите 5-10 минут после добавления fingerprints
- Обновите страницу Firebase Console (F5)
- Скачайте `google-services.json` заново

### 2. Authentication не включен в Firebase Console

**Проверка:**
1. Откройте Firebase Console
2. Перейдите в **Authentication** (в левом меню)
3. Если видите сообщение "Get started", нажмите на него
4. Выберите метод аутентификации (Email/Password) и включите его

**Важно:** OAuth client создается только после включения Authentication!

### 3. Fingerprints добавлены неправильно

**Проверка:**
1. Firebase Console → Project Settings → Your apps → Android app
2. Убедитесь, что видны ОБА fingerprint:
   - SHA-1: `28:73:B5:7B:14:97:95:C0:8E:67:41:4C:D9:37:35:96:60:88:F8:32`
   - SHA-256: `03:CD:EB:CA:4D:04:5F:62:47:3F:56:9F:9C:33:94:A0:01:5D:AB:BB:4B:AE:D0:A0:85:15:FA:20:54:37:DC:EE`

### 4. Неправильный package name

**Проверка:**
- В Firebase Console package name должен быть: `com.example.home_32`
- В `android/app/build.gradle.kts` applicationId должен быть: `com.example.home_32`

### 5. Нужно пересоздать OAuth client вручную

Если ничего не помогает:

1. Firebase Console → Authentication → Settings
2. Прокрутите до раздела "Authorized domains"
3. Убедитесь, что ваш домен добавлен

4. **Альтернативный способ:**
   - Удалите Android app из Firebase Console
   - Добавьте его заново с тем же package name
   - Добавьте SHA-1 и SHA-256
   - Включите Authentication
   - Скачайте новый `google-services.json`

## Пошаговая проверка

1. ✅ Authentication включен в Firebase Console?
2. ✅ SHA-1 добавлен в Firebase Console?
3. ✅ SHA-256 добавлен в Firebase Console?
4. ✅ Package name совпадает (`com.example.home_32`)?
5. ✅ Прошло 5-10 минут после добавления fingerprints?
6. ✅ Скачан обновленный `google-services.json`?

## Если ничего не помогает

Попробуйте использовать FlutterFire CLI для переконфигурации:

```bash
flutterfire configure
```

Это автоматически обновит конфигурацию Firebase для всех платформ.
