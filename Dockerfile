FROM ubuntu:14.04

RUN apt-get -y update && apt-get -y install \
	nginx \
	git \
	curl \
	php5-apcu php5-cli php5-common php5-curl \
	php5-fpm php5-intl php5-json \
	php5-readline php5-pgsql

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

