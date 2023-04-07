FROM debian:buster

RUN apt-get update && \
    apt-get install -y php7.4-fpm php7.4-mysql php7.4-gd php7.4-curl php7.4-xml php7.4-mbstring && \
    rm -rf /var/lib/apt/lists/*

# Copy WordPress files
COPY ./cont/wordpress /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

CMD ["php-fpm7.4", "-F"]

