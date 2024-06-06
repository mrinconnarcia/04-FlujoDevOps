FROM node:14

# Crear directorio de trabajo
WORKDIR /app

# Crear el directorio de caché y establecer permisos
RUN mkdir -p /home/node/.npm-cache && chown -R node:node /home/node/.npm-cache

# Copiar y instalar dependencias
COPY package*.json ./

# Cambiar a usuario node
USER node

# Configurar el caché de npm
RUN npm config set cache /home/node/.npm-cache --global

# Instalar dependencias
RUN npm install

# Copiar el resto del código
COPY . .

# Exponer el puerto 3000
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD ["node", "index.js"]
