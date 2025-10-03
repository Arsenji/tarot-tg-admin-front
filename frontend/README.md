# Таро Telegram Mini App

Telegram Mini App для гадания на картах Таро, созданный на основе iOS приложения.

## 🚀 Особенности

- **Telegram WebApp API** - Полная интеграция с Telegram
- **Аутентификация через Telegram** - Вход через Telegram аккаунт
- **Два типа раскладов**:
  - Одна карта (Совет дня)
  - Три карты (Прошлое-Настоящее-Будущее)
- **Категории раскладов**: Любовь, Карьера, Личное
- **Анимации и эффекты** - Плавные анимации с Framer Motion
- **Адаптивный дизайн** - Оптимизирован для мобильных устройств
- **История раскладов** - Сохранение всех гаданий
- **Премиум подписка** - Расширенные возможности

## 🛠 Технологии

### Frontend
- **Next.js 15** - React фреймворк с App Router
- **TypeScript** - Типизированный JavaScript
- **Tailwind CSS** - Utility-first CSS фреймворк
- **Framer Motion** - Библиотека анимаций
- **Telegram WebApp SDK** - Интеграция с Telegram

### Backend
- **Node.js** - JavaScript runtime
- **Express.js** - Web фреймворк
- **MongoDB** - База данных
- **Mongoose** - ODM для MongoDB
- **JWT** - Аутентификация
- **TypeScript** - Типизированный JavaScript

## 📁 Структура проекта

```
Таро-tg-app/
├── frontend/                 # Next.js приложение
│   ├── src/
│   │   ├── app/             # App Router страницы
│   │   ├── components/      # React компоненты
│   │   ├── screens/         # Экраны приложения
│   │   ├── hooks/           # Custom React hooks
│   │   ├── services/        # API сервисы
│   │   ├── types/           # TypeScript типы
│   │   └── utils/           # Утилиты
│   ├── public/              # Статические файлы
│   └── package.json
├── backend/                  # Express.js сервер
│   ├── src/
│   │   ├── controllers/     # Контроллеры
│   │   ├── models/          # Mongoose модели
│   │   ├── routes/          # API маршруты
│   │   ├── services/        # Бизнес логика
│   │   ├── utils/           # Утилиты
│   │   └── data/            # Данные карт Таро
│   └── package.json
└── README.md
```

## 🚀 Запуск проекта

### Предварительные требования
- Node.js 18+
- MongoDB
- Telegram Bot Token (для продакшена)

### Backend

1. Перейдите в папку backend:
```bash
cd backend
```

2. Установите зависимости:
```bash
npm install
```

3. Создайте файл `.env` на основе `.env.example`:
```bash
cp .env.example .env
```

4. Запустите сервер разработки:
```bash
npm run dev
```

Backend будет доступен на `http://localhost:3001`

### Frontend

1. Перейдите в папку frontend:
```bash
cd frontend
```

2. Установите зависимости:
```bash
npm install
```

3. Запустите сервер разработки:
```bash
npm run dev
```

Frontend будет доступен на `http://localhost:3000`

## 🔧 Конфигурация

### Переменные окружения

#### Backend (.env)
```env
PORT=3001
NODE_ENV=development
MONGODB_URI=mongodb://localhost:27017/taro-tg-app
JWT_SECRET=your-super-secret-jwt-key
FRONTEND_URL=http://localhost:3000
TELEGRAM_BOT_TOKEN=your-telegram-bot-token
```

#### Frontend (.env.local)
```env
NEXT_PUBLIC_API_URL=http://localhost:3001/api
```

## 📱 Использование в Telegram

1. Создайте бота через [@BotFather](https://t.me/botfather)
2. Настройте Web App URL в боте
3. Разместите приложение на хостинге
4. Обновите Web App URL в настройках бота

## 🎨 Дизайн

Приложение использует:
- Градиентные фоны (фиолетовый, синий, индиго)
- Анимации карт и элементов
- Telegram-совместимые цвета
- Адаптивный дизайн для мобильных устройств

## 📊 API Endpoints

### Аутентификация
- `POST /api/auth/telegram` - Аутентификация через Telegram
- `GET /api/auth/me` - Получение текущего пользователя

### Таро
- `POST /api/tarot/single-card` - Расклад одной карты
- `POST /api/tarot/three-cards` - Расклад трех карт
- `GET /api/tarot/history` - История раскладов
- `GET /api/tarot/cards` - Все карты (премиум)

### Платежи
- `POST /api/payment/create-invoice` - Создание счета
- `POST /api/payment/payment-success` - Обработка успешного платежа
- `GET /api/payment/premium-status` - Статус премиум подписки

## 🔒 Безопасность

- JWT токены для аутентификации
- Валидация данных на сервере
- CORS настройки
- Helmet для безопасности заголовков

## 🚀 Деплой

### Frontend (Vercel)
1. Подключите репозиторий к Vercel
2. Настройте переменные окружения
3. Деплой автоматически

### Backend (Railway/Heroku)
1. Подключите репозиторий
2. Настройте переменные окружения
3. Подключите MongoDB
4. Деплой

## 📝 Лицензия

MIT License

## 🤝 Вклад в проект

1. Форкните репозиторий
2. Создайте ветку для новой функции
3. Зафиксируйте изменения
4. Отправьте Pull Request

## 📞 Поддержка

Если у вас есть вопросы или проблемы, создайте Issue в репозитории.
