# Gunakan Node.js base image
FROM node:18

# Install Nginx
RUN apt-get update && apt-get install -y nginx && apt-get clean

# Set working directory
WORKDIR /app

# Salin semua file Superalgos
COPY . /app

# Salin konfigurasi nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Install dependensi Node.js
RUN npm install

# Expose port 80 (Render hanya izinkan 80/443)
EXPOSE 80

# Jalankan Superalgos dan Nginx secara bersamaan
CMD bash -c "./run minMemo & sleep 15 && nginx -g 'daemon off;'"
