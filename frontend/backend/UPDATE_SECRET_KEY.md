# 🔑 Обновление Secret Key Юкассы

## ✅ Shop ID обновлен: 1168307

## 🔧 Следующий шаг: обновить Secret Key

### Способ 1: Через редактор
```bash
cd backend
nano .env
```

Найдите строку:
```
YOOKASSA_SECRET_KEY=test_secret_key
```

Замените на ваш реальный Secret Key:
```
YOOKASSA_SECRET_KEY=ваш_реальный_secret_key
```

### Способ 2: Через sed (если знаете Secret Key)
```bash
cd backend
sed -i '' 's/YOOKASSA_SECRET_KEY=.*/YOOKASSA_SECRET_KEY=ваш_реальный_secret_key/' .env
```

## 🔄 После обновления Secret Key

```bash
pkill -f 'ts-node src/index.ts'
npm run dev
```

## 🧪 Проверка

После перезапуска бот должен перейти в режим реальных платежей:
- Вместо "🧪 Это тестовый режим" появится переход на страницу оплаты Юкассы
- Пользователи смогут оплачивать тестовыми картами

## 📋 Текущие настройки:
```
YOOKASSA_SHOP_ID=1168307
YOOKASSA_SECRET_KEY=test_secret_key  ← нужно обновить
```
