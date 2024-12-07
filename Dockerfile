# Используем базовый образ Node.js
FROM node:20

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем исходный код приложения
COPY . .

# Сборка приложения
RUN npm run build

# Запуск сервера для продакшена
CMD ["npx", "serve", "-s", "dist"]

# Открываем порт
EXPOSE 5000
