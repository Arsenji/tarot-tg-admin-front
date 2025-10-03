# Настройка WebApp для Telegram бота

## Проблема
При открытии в боте показывается "Not found" вместо фронтенда.

## Решение

### 1. Получить URL фронтенда с Render
1. Зайдите в панель Render
2. Найдите ваш фронтенд проект
3. Скопируйте URL (например: `https://tarot-frontend.onrender.com`)

### 2. Обновить FRONTEND_URL в .env
```bash
# В файле backend/.env
FRONTEND_URL=https://your-frontend-url.onrender.com
```

### 3. Перезапустить бэкенд
```bash
cd backend
npm run dev
```

### 4. Проверить в боте
1. Отправьте `/start` боту
2. Нажмите "Начать"
3. Нажмите "Открыть"
4. Должна появиться кнопка "🎯 Открыть приложение"

## Что было добавлено в бота

### Кнопка WebApp
```typescript
const getWebAppKeyboard = () => {
  const frontendUrl = process.env.FRONTEND_URL || 'http://localhost:3000';
  return Markup.inlineKeyboard([
    [Markup.button.webApp('🎯 Открыть приложение', frontendUrl)]
  ]);
};
```

### Обработчик кнопки
```typescript
bot.hears('🎯 Открыть приложение', async (ctx: Context) => {
  // ... код обработки
  await ctx.reply(
    '🎯 Открываю приложение...',
    Markup.inlineKeyboard([
      [Markup.button.webApp('🎯 Открыть приложение', frontendUrl)]
    ])
  );
});
```

## Проверка
После настройки URL фронтенда, кнопка "🎯 Открыть приложение" должна открывать ваше приложение в Telegram WebApp.
