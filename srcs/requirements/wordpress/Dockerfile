FROM debian:buster-slim

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    unzip \
    php \
    php-fpm \
    php-mysql \
    php-gd \
    php-curl \
    php-json \
    php-mbstring \
    php-xml \
    php-xmlrpc

# Copy WordPress files
COPY conf/ /var/www/html

# Set ownership and permissions
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Expose port
EXPOSE 9000

# Start services
CMD ["/bin/sh", "php-fpm", "-F"]
