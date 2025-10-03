#!/bin/bash

echo "🧪 Тестирование реальных платежей Юкассы"
echo "========================================"

# Цвета для вывода
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Функция для проверки статуса
check_status() {
    if [ $1 -eq 0 ]; then
        echo -e "${GREEN}✅ $2${NC}"
    else
        echo -e "${RED}❌ $2${NC}"
    fi
}

echo -e "${BLUE}📋 Инструкция по тестированию:${NC}"
echo "1. Убедитесь, что бэкенд запущен с реальными данными Юкассы"
echo "2. Откройте бота: @tarolog_app_bot"
echo "3. Выберите 'Купить подписку'"
echo "4. Выберите любой тариф"
echo "5. Используйте тестовую карту: 5555 5555 5555 4444"
echo "6. Срок: любая будущая дата, CVC: любые 3 цифры"
echo ""

# Проверяем, что бэкенд запущен
echo "🔍 Проверяем статус бэкенда..."
curl -s http://localhost:3001/api/health > /dev/null
check_status $? "Бэкенд запущен"

# Проверяем настройки Юкассы
echo "🔍 Проверяем настройки Юкассы..."
YOOKASSA_SHOP_ID=$(grep "YOOKASSA_SHOP_ID" .env | cut -d'=' -f2)
YOOKASSA_SECRET_KEY=$(grep "YOOKASSA_SECRET_KEY" .env | cut -d'=' -f2)

if [ "$YOOKASSA_SHOP_ID" = "test_shop_id" ] || [ "$YOOKASSA_SECRET_KEY" = "test_secret_key" ]; then
    echo -e "${YELLOW}⚠️  Используются тестовые данные Юкассы${NC}"
    echo "Запустите ./update-yookassa.sh для обновления на реальные данные"
else
    echo -e "${GREEN}✅ Используются реальные данные Юкассы${NC}"
fi

echo ""
echo -e "${BLUE}🧪 Тестовые карты:${NC}"
echo "• Успешная оплата: 5555 5555 5555 4444"
echo "• Отклоненная оплата: 5555 5555 5555 4477"
echo "• Недостаточно средств: 5555 5555 5555 4455"
echo ""
echo -e "${BLUE}📱 Тестирование в боте:${NC}"
echo "1. Откройте @tarolog_app_bot"
echo "2. Выберите 'Купить подписку'"
echo "3. Выберите тариф"
echo "4. Оплатите тестовой картой"
echo "5. Проверьте активацию подписки"
echo ""
echo -e "${BLUE}🔍 Мониторинг:${NC}"
echo "• Логи бэкенда: tail -f logs/app.log"
echo "• Статус webhook: проверьте в личном кабинете Юкассы"
echo "• Тестовые уведомления: должны приходить автоматически"
