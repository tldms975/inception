FROM alpine:3.16

RUN apk update && apk upgrade && \
    apk add php8 && \
    apk add php8-fpm && \
    apk add php8-phar && \
    apk add php8-json && \
    apk add php8-exif && \
    apk add php8-mysqli && \
	apk add php8-mysqlnd && \
    apk add php8-openssl && \
    apk add mariadb-client && \
    apk add curl iputils
    
EXPOSE 9000

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN	mv wp-cli.phar /usr/bin/wp

ADD conf/www.conf /etc/php8/php-fpm.d/www.conf
ADD conf/wp-config.php /tmp/wp-config.php
ADD tools/wordpress.sh /tmp/wordpress.sh

CMD ["/bin/sh", "/tmp/wordpress.sh"]

WORKDIR /var/www/html

# FROM debian:buster-slim

# # Install necessary packages
# RUN apt-get update && \
#     apt-get install -y \
#     curl \
#     wget \
#     unzip \
#     php8 \
#     php8-fpm \
#     php8-mysql \
#     php8-gd \
#     php8-curl \
#     php8-json \
#     php8-mbstring \
#     php8-xml \
#     php8-xmlrpc

# # Create directory for PID file
# RUN mkdir -p /run/php

# # Copy WordPress files
# COPY . /var/www/html
# COPY conf/php-fpm.conf /etc/php/8/fpm

# # Set ownership and permissions
# RUN chown -R www-data:www-data /var/www/html && \
#     chmod -R 755 /var/www/html
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

# COPY ./tools/wpsetup.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/wpsetup.sh
# ENTRYPOINT ["/usr/local/bin/wpsetup.sh"]


# EXPOSE 9000

# # Start services
# CMD ["/usr/sbin/php-fpm7.3", "-F"]

# WORKDIR /var/www/html/