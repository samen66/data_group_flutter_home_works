@echo off
echo Generating Drift code...
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
echo.
echo Code generation complete!
pause
