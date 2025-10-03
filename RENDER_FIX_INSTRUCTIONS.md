# Инструкция по исправлению 404 ошибки на Render

## Проблема
Фронтенд на Render возвращает 404 ошибку при попытке открыть WebApp.

## Решение

### 1. Обновить настройки Render
В панели Render измените следующие настройки:

**Build Command:**
```
npm run build
```

**Publish Directory:**
```
out
```

**Root Directory:**
```
(оставить пустым)
```

### 2. Что было исправлено в коде

#### next.config.js
```javascript
const nextConfig = {
  output: 'export',           // Статический экспорт
  trailingSlash: true,        // Добавляет слэш в конце URL
  images: {
    unoptimized: true,        // Отключает оптимизацию изображений
    domains: ['localhost'],
  },
  // ... остальные настройки
}
```

#### package.json
Перенесены зависимости из `devDependencies` в `dependencies`:
- `tailwindcss`
- `postcss` 
- `autoprefixer`
- `typescript`
- `@types/node`
- `@types/react`
- `@types/react-dom`

### 3. Проверка
После обновления настроек Render:
1. Дождитесь завершения деплоя
2. Проверьте URL: `https://tarot-frontend-lr0t.onrender.com`
3. Должен открываться фронтенд вместо 404

### 4. Альтернативные настройки Render
Если статический экспорт не работает, попробуйте:

**Build Command:**
```
npm run build
```

**Publish Directory:**
```
.next
```

**Start Command:**
```
npm start
```

## Текущий статус
- ✅ Локальная сборка работает
- ✅ Статический экспорт настроен
- 🔄 Требуется обновление настроек Render
- ⏳ Ожидается тестирование после деплоя
