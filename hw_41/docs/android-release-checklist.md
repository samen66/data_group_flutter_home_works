# Android Release Checklist

## 1) Versioning
- Update `pubspec.yaml` field `version` using `versionName+versionCode` format.
- Example: `version: 1.0.1+2`.
- Validate after build:
  - `versionName` = `1.0.1`
  - `versionCode` = `2`

## 2) Signing (keystore)
- Generate upload keystore once:
  - `keytool -genkey -v -keystore keystore/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload`
- Create `android/key.properties` from `android/key.properties.example`.
- Fill values for:
  - `storePassword`
  - `keyPassword`
  - `keyAlias`
  - `storeFile`
- Confirm `android/app/build.gradle.kts` uses `signingConfigs.release` when `key.properties` exists.
- Never commit `android/key.properties` and keystore to git.

## 3) App icon and splash
- Source file: `assets/branding/app_icon.png`.
- Regenerate icons:
  - `flutter pub run flutter_launcher_icons`
- Regenerate splash:
  - `dart run flutter_native_splash:create`
- Verify on Android device/emulator:
  - Launcher icon displayed correctly.
  - Splash opens without stretch/crop issues.
  - Android 12 splash icon is centered and visible.

## 4) Permissions and privacy texts
- Current manifest has no camera/photo/notification runtime permissions.
- Before release, verify feature scope:
  - Camera usage -> `android.permission.CAMERA` + in-app explanation + privacy policy update.
  - Photo library/files usage -> relevant media permissions by API level + privacy policy update.
  - Notifications usage -> `android.permission.POST_NOTIFICATIONS` (Android 13+) + opt-in text.
- Keep privacy policy aligned with actual collected data and permissions.

## 5) Build and sanity checks
- Commands:
  - `flutter clean`
  - `flutter pub get`
  - `flutter test`
  - `flutter test integration_test -d <android-device-id>`
  - `flutter build appbundle --release`
- Output artifact:
  - `build/app/outputs/bundle/release/app-release.aab`

## 6) Play Console internal testing
- Open Play Console -> app -> `Testing` -> `Internal testing`.
- Create release in internal track and upload `app-release.aab`.
- Add release notes (what changed and known issues).
- Add testers by email list/group.
- Roll out to internal testing.
- Validate install/update flow from Play Store test link.

## 7) CI expectation
- Ensure GitHub Actions CI executes:
  - `flutter test`
  - `flutter test integration_test`
- Require green CI before publishing a build to testers.
