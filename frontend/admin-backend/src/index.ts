import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import morgan from 'morgan';
import dotenv from 'dotenv';
import { db } from './utils/database';
import { telegramService } from './services/telegram';
import authRoutes from './routes/auth';
import messageRoutes from './routes/messages';

// Загружаем переменные окружения
dotenv.config();

const app = express();
const PORT = process.env.PORT || 3002;

// Middleware
app.use(helmet());
app.use(cors({
  origin: ['http://localhost:3000', 'http://localhost:3005', 'http://localhost:3003'],
  credentials: true
}));
app.use(morgan('combined'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Health check
app.get('/health', (req, res) => {
  res.json({ 
    status: 'OK', 
    timestamp: new Date().toISOString(),
    service: 'admin-backend'
  });
});

// Telegram webhook endpoint
app.post('/webhook/telegram', async (req, res) => {
  try {
    const update = req.body;
    
    if (update.message) {
      const message = update.message;
      const chatId = message.chat.id.toString();
      const text = message.text;
      const userId = message.from.id.toString();
      
      // Сохраняем сообщение в БД
      const result = await db.query(
        'INSERT INTO messages (user_id, text, status) VALUES ($1, $2, $3) RETURNING *',
        [userId, text, 'new']
      );
      
      // Отправляем уведомление админу
      await telegramService.sendMessageToAdmin(
        `📨 Новое сообщение от пользователя ${userId}:\n\n${text}`
      );
      
      console.log(`📨 Received message from user ${userId}: ${text}`);
    }
    
    res.status(200).json({ ok: true });
  } catch (error) {
    console.error('Error processing webhook:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/messages', messageRoutes);

// Error handling middleware
app.use((err: any, req: express.Request, res: express.Response, next: express.NextFunction) => {
  console.error('Error:', err);
  res.status(500).json({ 
    error: 'Internal server error',
    message: process.env.NODE_ENV === 'development' ? err.message : 'Something went wrong'
  });
});

// 404 handler
app.use('*', (req, res) => {
  res.status(404).json({ error: 'Route not found' });
});

// Инициализация и запуск сервера
async function startServer() {
  try {
    // Инициализируем базу данных
    await db.initializeTables();
    console.log('✅ Database initialized');

    // Проверяем подключение к Telegram
    const botInfo = await telegramService.getBotInfo();
    if (botInfo) {
      console.log(`✅ Telegram bot connected: @${botInfo.result.username}`);
      
      // Настраиваем webhook
      const webhookUrl = `https://your-domain.com/webhook/telegram`; // Замените на ваш домен
      const webhookSet = await telegramService.setWebhook(webhookUrl);
      if (webhookSet) {
        console.log(`✅ Webhook configured: ${webhookUrl}`);
      } else {
        console.warn('⚠️ Failed to set webhook');
      }
    } else {
      console.warn('⚠️ Telegram bot not configured or not accessible');
    }

    // Запускаем сервер
    app.listen(PORT, () => {
      console.log(`🚀 Admin backend server running on port ${PORT}`);
      console.log(`📊 Environment: ${process.env.NODE_ENV || 'development'}`);
    });
  } catch (error) {
    console.error('❌ Failed to start server:', error);
    process.exit(1);
  }
}

// Graceful shutdown
process.on('SIGINT', async () => {
  console.log('\n🛑 Shutting down server...');
  await db.close();
  process.exit(0);
});

process.on('SIGTERM', async () => {
  console.log('\n🛑 Shutting down server...');
  await db.close();
  process.exit(0);
});

startServer();
