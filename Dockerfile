FROM php:8.3-apache

RUN apt-get update \
    && apt-get install -y --no-install-recommends libpq-dev libzip-dev unzip \
    && docker-php-ext-install pgsql pdo_pgsql pdo_mysql zip \
    && a2enmod rewrite headers \
    && rm -rf /var/lib/apt/lists/*

COPY --chown=www-data:www-data . /var/www/html/

RUN mkdir -p app/data app/upload app/avatars app/plugins \
    && chown -R www-data:www-data /var/www/html

EXPOSE 80
