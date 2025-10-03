# Инструкции по запуску Таро Telegram Mini App

## 🚀 Быстрый старт

### 1. Запуск бэкенда
```bash
cd backend
npm install
npm run dev
```
Сервер будет доступен на http://localhost:3001

### 2. Запуск фронтенда
```bash
cd frontend
npm install
npm run dev
```
Приложение будет доступно на http://localhost:3000

## 📱 Тестирование в Telegram

### Для локального тестирования:
1. Установите ngrok: `npm install -g ngrok`
2. Запустите ngrok: `ngrok http 3000`
3. Используйте полученный URL в настройках бота

### Настройка бота:
1. Создайте бота через @BotFather
2. Выполните команду `/newapp`
3. Укажите URL вашего приложения
4. Загрузите иконку и описание

## 🔧 Настройка базы данных

### MongoDB (локально):
```bash
# Установка MongoDB через Homebrew
brew install mongodb-community

# Запуск MongoDB
brew services start mongodb-community
```

### MongoDB Atlas (облако):
1. Создайте аккаунт на https://cloud.mongodb.com
2. Создайте кластер
3. Получите connection string
4. Обновите MONGODB_URI в .env файле

## 🌐 Деплой

### Frontend (Vercel):
1. Подключите GitHub репозиторий
2. Настройте переменные окружения
3. Деплой автоматически

### Backend (Railway):
1. Подключите GitHub репозиторий
2. Настройте переменные окружения
3. Подключите MongoDB
4. Деплой

## 📋 Переменные окружения

### Backend (.env):
```env
PORT=3001
NODE_ENV=development
MONGODB_URI=mongodb://localhost:27017/taro-tg-app
JWT_SECRET=your-super-secret-jwt-key-change-in-production
FRONTEND_URL=http://localhost:3000
TELEGRAM_BOT_TOKEN=your-telegram-bot-token
```

### Frontend (.env.local):
```env
NEXT_PUBLIC_API_URL=http://localhost:3001/api
```

## 🐛 Решение проблем

### Ошибка подключения к базе данных:
- Убедитесь, что MongoDB запущен
- Проверьте правильность MONGODB_URI

### Ошибки CORS:
- Проверьте FRONTEND_URL в настройках бэкенда
- Убедитесь, что фронтенд запущен на правильном порту

### Telegram WebApp не загружается:
- Проверьте, что приложение доступно по HTTPS
- Убедитесь, что URL правильно настроен в боте

## 📞 Поддержка

При возникновении проблем:
1. Проверьте логи в консоли браузера
2. Проверьте логи сервера
3. Создайте Issue в репозитории
