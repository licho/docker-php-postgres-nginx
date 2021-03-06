FROM php:5-fpm

RUN apt-get update && apt-get install -y \
	libbz2-dev \
	libfreetype6-dev \ 
	libjpeg62-turbo-dev \ 
	libmcrypt-dev \ 
	libpng12-dev \ 
	libghc-postgresql-libpq-dev

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/include/postgresql/ \ 
	&& docker-php-ext-install gd pgsql pdo_pgsql
RUN apt-get -y install curl

WORKDIR /var/www/html/api

COPY ./ /var/www/html/
