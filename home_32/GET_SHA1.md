# Как получить SHA-1 fingerprint для Firebase

## Способ 1: Через Gradle (рекомендуется)

Выполните в терминале из корня проекта:

```bash
cd android
./gradlew :app:printSha1
```

Или на Windows:
```powershell
cd android
.\gradlew.bat :app:printSha1
```

## Способ 2: Через Android Studio

1. Откройте проект в Android Studio
2. В правой панели откройте **Gradle** (View > Tool Windows > Gradle)
3. Перейдите: `home_32 > android > app > Tasks > android > signingReport`
4. Дважды кликните на `signingReport`
5. Внизу в консоли найдите SHA-1 и SHA-256

## Способ 3: Через keytool (если установлен JDK)

```bash
keytool -list -v -keystore %USERPROFILE%\.android\debug.keystore -storepass android -alias androiddebugkey
```

Найдите строки:
- `SHA1: XX:XX:XX:...`
- `SHA256: XX:XX:XX:...`

## Что делать дальше?

1. Скопируйте SHA-1 fingerprint
2. Откройте [Firebase Console](https://console.firebase.google.com/)
3. Выберите проект **data-groupe-h31**
4. Project Settings > Your apps > Android app (`com.example.home_32`)
5. Нажмите **Add fingerprint** и вставьте SHA-1
6. Скачайте обновленный `google-services.json`
7. Замените файл `android/app/google-services.json`

После этого ошибка `CONFIGURATION_NOT_FOUND` должна исчезнуть.
