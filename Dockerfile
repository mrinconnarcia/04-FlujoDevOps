FROM node:14

# Crear directorio de trabajo
WORKDIR /app

# Crear el directorio de caché y establecer permisos
RUN mkdir -p /home/node/.npm-cache && chown -R node:node /home/node/.npm-cache

# Copiar y instalar dependencias como root para evitar problemas de permisos
COPY package*.json ./
RUN npm install

# Cambiar a usuario node después de instalar dependencias
USER node

# Configurar el caché de npm
RUN npm config set cache /home/node/.npm-cache --global

# Copiar el resto del código
COPY . .

# Exponer el puerto 3000
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD ["node", "index.js"]
