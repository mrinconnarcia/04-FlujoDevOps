FROM node:22.2.0-alpine

WORKDIR /app

COPY . .

RUN npm install
# Instalar mocha globalmente
RUN npm install -g mocha

EXPOSE 3000

CMD ["node", "index.js"]
