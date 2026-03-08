# Деплой правил безопасности Firestore

## Шаг 1: Установка Firebase CLI

Если Firebase CLI еще не установлен:

```bash
npm install -g firebase-tools
```

## Шаг 2: Вход в Firebase

```bash
firebase login
```

## Шаг 3: Проверка конфигурации

Убедитесь, что в `firebase.json` есть секция `firestore`:

```json
{
  "firestore": {
    "rules": "firestore.rules",
    "indexes": "firestore.indexes.json"
  }
}
```

Если секции нет, она уже добавлена в проект.

## Шаг 4: Деплой правил

```bash
firebase deploy --only firestore:rules
```

## Проверка правил

После деплоя проверьте правила в Firebase Console:
1. Откройте [Firebase Console](https://console.firebase.google.com/)
2. Выберите проект **data-groupe-h31**
3. Перейдите в **Firestore Database** → **Rules**
4. Убедитесь, что правила соответствуют файлу `firestore.rules`

## Тестирование правил

Правила безопасности гарантируют:
- ✅ Только авторизованные пользователи могут читать/писать
- ✅ Пользователь может читать/писать только свои записи (userId совпадает с auth.uid)
- ✅ При создании проверяется, что userId в данных совпадает с auth.uid

## Важно

После деплоя правил подождите несколько минут, чтобы изменения вступили в силу.
