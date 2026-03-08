# Настройка активного проекта Firebase

## Проблема
Firebase CLI не знает, какой проект использовать для деплоя.

## Решение 1: Установить активный проект

```powershell
firebase use --add
```

Выберите:
- Проект: `data-groupe-h31`
- Alias (опционально): `default` или оставьте пустым

Затем задеплойте правила:
```powershell
firebase deploy --only firestore:rules
```

## Решение 2: Указать проект напрямую в команде

```powershell
firebase deploy --only firestore:rules --project data-groupe-h31
```

## Решение 3: Использовать Firebase Console (самый простой способ)

После создания базы данных:

1. В Firebase Console перейдите в **Firestore Database** → **Rules**
2. Скопируйте содержимое файла `firestore.rules`
3. Вставьте в редактор правил
4. Нажмите **Publish**

Это самый простой способ, не требует настройки CLI.

## Проверка активного проекта

```powershell
firebase projects:list
```

Покажет все доступные проекты.

## Установка проекта по умолчанию

```powershell
firebase use data-groupe-h31
```

Или с алиасом:
```powershell
firebase use data-groupe-h31 --alias default
```
