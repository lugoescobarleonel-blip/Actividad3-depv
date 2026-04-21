# Usa nginx ligero
FROM nginx:alpine

# Copia todos los archivos del proyecto al servidor web
COPY . /usr/share/nginx/html

# Expone el puerto 80 (interno del contenedor)
EXPOSE 80