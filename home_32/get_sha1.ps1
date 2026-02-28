# Скрипт для получения SHA-1 fingerprint для Android
# Запустите этот скрипт в PowerShell из корня проекта

Write-Host "Получение SHA-1 fingerprint для debug keystore..." -ForegroundColor Green

# Путь к debug keystore (стандартный путь для Windows)
$keystorePath = "$env:USERPROFILE\.android\debug.keystore"
$keystorePassword = "android"

if (Test-Path $keystorePath) {
    Write-Host "Keystore найден: $keystorePath" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "SHA-1 fingerprint:" -ForegroundColor Cyan
    & keytool -list -v -keystore $keystorePath -storepass $keystorePassword | Select-String "SHA1"
    Write-Host ""
    Write-Host "SHA-256 fingerprint:" -ForegroundColor Cyan
    & keytool -list -v -keystore $keystorePath -storepass $keystorePassword | Select-String "SHA256"
} else {
    Write-Host "Keystore не найден. Создаю новый..." -ForegroundColor Yellow
    & keytool -genkey -v -keystore $keystorePath -alias androiddebugkey -storepass $keystorePassword -keypass $keystorePassword -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Android Debug,O=Android,C=US"
    Write-Host ""
    Write-Host "SHA-1 fingerprint:" -ForegroundColor Cyan
    & keytool -list -v -keystore $keystorePath -storepass $keystorePassword | Select-String "SHA1"
}

Write-Host ""
Write-Host "Скопируйте SHA-1 и SHA-256 и добавьте их в Firebase Console:" -ForegroundColor Green
Write-Host "1. Откройте https://console.firebase.google.com/" -ForegroundColor Yellow
Write-Host "2. Выберите проект 'data-groupe-h31'" -ForegroundColor Yellow
Write-Host "3. Перейдите в Project Settings > Your apps > Android app" -ForegroundColor Yellow
Write-Host "4. Добавьте SHA-1 и SHA-256 fingerprints" -ForegroundColor Yellow
Write-Host "5. Скачайте обновленный google-services.json" -ForegroundColor Yellow
