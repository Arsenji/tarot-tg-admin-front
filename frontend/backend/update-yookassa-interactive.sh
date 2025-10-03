#!/bin/bash

echo "🔧 Обновление настроек Юкассы на реальные данные"
echo "================================================"

# Проверяем текущие настройки
echo "🔍 Текущие настройки:"
grep -E "YOOKASSA" .env

echo ""
echo "📝 Введите ваши реальные данные Юкассы:"
echo ""

# Запрашиваем Shop ID
read -p "🏪 Shop ID: " SHOP_ID
if [ -z "$SHOP_ID" ]; then
    echo "❌ Shop ID не может быть пустым"
    exit 1
fi

# Запрашиваем Secret Key
read -p "🔑 Secret Key: " SECRET_KEY
if [ -z "$SECRET_KEY" ]; then
    echo "❌ Secret Key не может быть пустым"
    exit 1
fi

echo ""
echo "🔄 Обновляем настройки..."

# Создаем резервную копию
cp .env .env.backup.$(date +%Y%m%d_%H%M%S)
echo "📁 Создана резервная копия"

# Обновляем настройки
sed -i '' "s/YOOKASSA_SHOP_ID=.*/YOOKASSA_SHOP_ID=$SHOP_ID/" .env
sed -i '' "s/YOOKASSA_SECRET_KEY=.*/YOOKASSA_SECRET_KEY=$SECRET_KEY/" .env

echo "✅ Настройки обновлены"
echo ""
echo "📋 Новые настройки:"
grep -E "YOOKASSA" .env

echo ""
echo "🔄 Перезапустите бэкенд:"
echo "   pkill -f 'ts-node src/index.ts' && npm run dev"
echo ""
echo "🧪 После перезапуска бот будет работать с реальными платежами!"
