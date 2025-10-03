#!/bin/bash

echo "🔧 Обновление настроек Юкассы на реальные данные"
echo "================================================"

# Проверяем текущие настройки
echo "🔍 Текущие настройки:"
grep -E "YOOKASSA" .env

echo ""
echo "📝 Для обновления настроек выполните:"
echo "   ./update-real-yookassa.sh <ваш_shop_id> <ваш_secret_key>"
echo ""
echo "📋 Пример:"
echo "   ./update-real-yookassa.sh 123456 test_secret_key_123"
echo ""
echo "💡 Или отредактируйте файл .env вручную:"
echo "   nano .env"
echo ""
echo "🔄 После обновления перезапустите бэкенд:"
echo "   pkill -f 'ts-node src/index.ts' && npm run dev"
