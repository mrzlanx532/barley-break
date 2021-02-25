FROM php:8.0-fpm
WORKDIR /var/www/data

RUN apt-get update && apt-get install -y \
    libonig-dev \
    libzip-dev \
    libmcrypt-dev \
    libicu-dev \
    libpq-dev \
    unzip \
    bash \
    nano

RUN docker-php-ext-configure intl && \
    docker-php-ext-install \
    bcmath \
    mysqli \
    pdo \
    pdo_mysql \
    pdo_pgsql \
    gettext \
    zip \
    mbstring \
    intl

COPY --chown=www-data:www-data . /var/www/data
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN chown -R www-data:www-data /var/www
RUN echo "alias ls='ls -la'" >> ~/.bashrc && echo "alias ll='ls -la'" >> ~/.bashrc
RUN usermod -u 1000 www-data
