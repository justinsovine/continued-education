# We're using the alpine build for the nginx container as well since it's a lightweight "______" and helps cut down on space our containers take up
FROM php:8-fpm-alpine

ENV PHPGROUP=laravel
ENV PHPUSER=laravel

RUN adduser -g ${PHPGROUP} -s /bin/sh -D ${PHPUSER}

RUN sed -i "s/user = www-data/user = ${PHPUSER}/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/group = www-data/group = ${PHPGROUP}/g" /usr/local/etc/php-fpm.d/www.conf

RUN mkdir -p /var/www/html/public

# This command will download any extenstion files we need, make any adjustments to the config files, and load them in
RUN docker-php-ext-install pdo pdo_mysql

# Exec form
CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]