# Gunakan image Node.js
FROM node:18

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean

# Set working directory
WORKDIR /app

# Salin seluruh kode Superalgos
COPY . /app

# Copy nginx.conf ke dalam image
COPY nginx.conf /etc/nginx/nginx.conf

# Install dependencies
RUN npm install

# Expose port standar (Render hanya izinkan 80)
EXPOSE 80

# Jalankan Nginx + Superalgos secara bersamaan
CMD bash -c "node run minMemo & nginx -g 'daemon off;'"
