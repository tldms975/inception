FROM debian:buster

RUN apt-get update && \
    apt-get -y install nginx openssl && \
    rm -rf /var/lib/apt/lists/*

# Remove default nginx config
RUN rm /etc/nginx/sites-enabled/default

# Copy nginx config file
COPY ./conf/nginx.conf /etc/nginx/sites-enabled/

# Create SSL certificate and key
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=jaeskim/CN=jaeskim" \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt

# Remove nginx welcome page
RUN echo "" > /var/www/html/index.nginx-debian.html

# Expose ports
EXPOSE 80
EXPOSE 443

# Start nginx service
CMD ["nginx", "-g", "daemon off;"]
