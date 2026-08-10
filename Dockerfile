FROM php:8.5-apache

RUN apt-get update \
    && apt-get install -y --no-install-recommends libpq-dev libzip-dev unzip \
    && docker-php-ext-install pgsql pdo_pgsql pdo_mysql zip \
    && a2enmod rewrite headers \
    && rm -rf /var/lib/apt/lists/* \
    && printf 'upload_max_filesize=8M\npost_max_size=16M\nlog_errors=On\nerror_log=/dev/stderr\n' > /usr/local/etc/php/conf.d/zz-app.ini

COPY --chown=www-data:www-data . /var/www/html/

RUN mkdir -p app/data app/upload app/avatars app/plugins \
    && chown -R www-data:www-data /var/www/html

EXPOSE 80
