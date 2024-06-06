FROM node:14

# Crear directorio de trabajo
WORKDIR /app

# Copiar y instalar dependencias
COPY package*.json ./

# Instalar dependencias como root
USER root
RUN npm install

# Cambiar el caché de npm a un directorio accesible
RUN npm config set cache /home/node/.npm-cache --global

# Cambiar de nuevo al usuario node
USER node

# Copiar el resto del código
COPY . .

# Exponer el puerto 3000
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD ["node", "index.js"]
