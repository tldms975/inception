FROM debian:buster-slim

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    php7.3 \
    php7.3-fpm \
    php7.3-mysql \
    php7.3-gd \
    php7.3-curl \
    php7.3-json \
    php7.3-mbstring \
    php7.3-xml \
    php7.3-xmlrpc

# Create directory for PID file
RUN mkdir -p /run/php

# Copy WordPress files
COPY . /var/www/html
COPY conf/www.conf /etc/php/8/fpm

# Set ownership and permissions
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wordpress.sh
ENTRYPOINT ["/usr/local/bin/wordpress.sh"]

#We go the html directory
WORKDIR /var/www/html/

EXPOSE 9000

# Start services