FROM debian:buster-slim

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    unzip \
    php7.3 \
    php7.3-fpm \
    php7.3-mysql \
    php7.3-gd \
    php7.3-curl \
    php7.3-json \
    php7.3-mbstring \
    php7.3-xml \
    php7.3-xmlrpc

RUN useradd -ms /bin/bash myuser
USER myuser

# Create directory for PID file
RUN mkdir -p /run/php

# Copy WordPress files
COPY . /var/www/html
COPY conf/php-fpm.conf /etc/php/7.3/fpm

# Set ownership and permissions
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Expose port
EXPOSE 9000

# Start services
CMD ["php-fpm7.3", "-F"]
