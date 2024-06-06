FROM node:14
WORKDIR /app
COPY package*.json ./
# Ejecutar npm install como root
USER root
RUN npm install
# Cambiar de nuevo al usuario node
USER node
COPY . .
EXPOSE 3000
CMD ["node", "index.js"]
