FROM ubuntu:16.04 as base_layer

LABEL maintainer="tiennguyenhoang339@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    software-properties-common \
    locales

RUN locale-gen en_US.UTF-8 && \
    echo "LANGUAGE=en_US.UTF-8" >> /etc/default/locale && \
    echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale && \
    echo "LC_CTYPE=UTF-8" >> /etc/default/locale && \
    export LANG=en_US.UTF-8 && \
    apt-add-repository ppa:ondrej/php

FROM base_layer

RUN apt-get update && apt-get install -y --force-yes \
    php7.2-cli \
    php7.2-dev \
    php7.2-common \
    php7.2-curl \
    php7.2-json \
    php7.2-soap \
    php7.2-xml \
    php7.2-mbstring \
    php7.2-mysql \
    php7.2-pgsql \
    php7.2-sqlite \
    php7.2-sqlite3 \
    php7.2-zip \
    php7.2-gd \
    php7.2-xdebug \
    php7.2-bcmath \
    php7.2-intl \
    php7.2-dev \
    php7.2-fpm \
    php-pear \
    php-memcached \
    php-redis \
    php-apcu \
    libcurl4-openssl-dev \
    libedit-dev \
    libssl-dev \
    libxml2-dev \
    xz-utils \
    sqlite3 \
    libsqlite3-dev \
    libmcrypt-dev \
    libreadline-dev \
    git \
    curl \
    vim \
    zip \
    unzip \
    supervisor

# Installing mcrypt on PHP 7.2
RUN pecl install mcrypt-1.0.1 && \
    bash -c "echo extension=mcrypt.so > /etc/php/7.2/mods-available/mcrypt.ini"

# Remove load xdebug extension
RUN sed -i 's/^/;/g' /etc/php/7.2/cli/conf.d/20-xdebug.ini

RUN mkdir -p /var/run/php && \
    mkdir -p /var/log/php-fpm && \
    touch /var/run/php/php7.2-fpm.sock

# Install Composer, PHPCS
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    ln -s /root/.composer/vendor/bin/phpcs /usr/bin/phpcs

# Install Nodejs
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g bower

# Clean up
RUN apt-get clean && apt-get autoclean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /var/www/app

COPY . .

ADD .docker/web/supervisor.conf /etc/supervisor/conf.d/supervisor.conf

CMD ["/usr/bin/supervisord"]

EXPOSE 9000
