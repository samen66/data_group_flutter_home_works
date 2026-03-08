# Решение проблемы с Firebase CLI в PowerShell

## Проблема
PowerShell блокирует выполнение скриптов Firebase CLI из-за политики выполнения.

## Решение 1: Изменить политику выполнения (рекомендуется)

Откройте PowerShell **от имени администратора** и выполните:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Затем попробуйте снова:
```powershell
firebase login
```

## Решение 2: Использовать Firebase Console (без CLI)

Если не хотите менять политику, можно задеплоить правила через Firebase Console:

### Шаг 1: Создайте базу данных Firestore

1. В Firebase Console нажмите **"Create database"**
2. Выберите режим:
   - **Production mode** (рекомендуется) - с правилами безопасности
   - **Test mode** - для тестирования (открытый доступ на 30 дней)
3. Выберите регион (например, `us-central` или ближайший к вам)
4. Нажмите **Enable**

### Шаг 2: Скопируйте правила вручную

1. Откройте файл `firestore.rules` в проекте
2. Скопируйте его содержимое
3. В Firebase Console перейдите в **Firestore Database** → **Rules**
4. Вставьте содержимое файла `firestore.rules`
5. Нажмите **Publish**

## Решение 3: Использовать cmd вместо PowerShell

Откройте **Command Prompt** (cmd) вместо PowerShell:

```cmd
firebase login
firebase deploy --only firestore:rules
```

## Решение 4: Временно разрешить для одной сессии

В PowerShell выполните:

```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
firebase login
firebase deploy --only firestore:rules
```

Это разрешит выполнение только для текущей сессии PowerShell.

## Проверка

После деплоя правил:
1. В Firebase Console → Firestore Database → Rules
2. Убедитесь, что правила соответствуют файлу `firestore.rules`
3. Правила должны быть активны (зеленая галочка)
