FROM debian:buster-slim

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    nginx

# for SSL certificate
RUN mkdir /etc/nginx/ssl
RUN openssl x509 -req -in sielee.csr -signkey sielee.key -out sielee.crt -days 365 -sha256 \
-keyout /etc/nginx/ssl/sielee.key \
-out /etc/nginx/ssl/sielee.crt \
-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Lee/CN=sielee"

# Copy nginx configuration
COPY conf/nginx.conf /etc/nginx/sites-available/default

# Create SSL folder and copy certificates
COPY ./tools/sielee.crt /etc/nginx/ssl/sielee.crt
COPY ./tools/sielee.key /etc/nginx/ssl/sielee.key

# Expose port
EXPOSE 443

# Start services
CMD ["nginx", "-g", "daemon off;"]
