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

ARG USERNAME=myuser
ARG GROUPNAME=mygroup
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $GROUPNAME && \
    useradd --uid $USER_UID --gid $USER_GID -m $USERNAME && \
    chown -R $USERNAME:$GROUPNAME /home/$USERNAME && \
    # 디렉토리 생성
    mkdir -p /run/php && \
    # 소유자 및 그룹 변경
    chown myuser:mygroup /run/php && \
    # 권한 변경
    chmod 777 /run/php

# Create directory for PID file
RUN mkdir -p /run/php

# Copy WordPress files
COPY . /var/www/
COPY conf/php-fpm.conf /etc/php/7.3/fpm

# Set ownership and permissions
RUN chown -R www-data:www-data /var/www/ && \
    chmod -R 755 /var/www/

EXPOSE 9000

# Start services
CMD ["php-fpm7.3", "-F"]
