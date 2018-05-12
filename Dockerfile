FROM php:5-fpm

MAINTAINER BdE INSA Lyon - Équipe OrgaIF <orgaif.equipe@bde-insa-lyon.fr>

RUN apt-get update -y && apt-get dist-upgrade -y && apt-get autoremove --purge -y && apt-get autoclean -y
RUN apt-get install -y \
    openssl \
    git \
    unzip \
    libpng-dev zlib1g-dev libicu-dev g++ libxslt-dev

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

# Set timezone
RUN ln -snf /usr/share/zoneinfo/Europe/Paris /etc/localtime && echo Europe/Paris > /etc/timezone
RUN printf '[PHP]\ndate.timezone = "%s"\n', Europe/Paris > /usr/local/etc/php/conf.d/tzone.ini
RUN "date"

# Type docker-php-ext-install to see available extensions
RUN docker-php-ext-install pdo pdo_mysql bcmath gd exif opcache && docker-php-ext-enable opcache


# install xdebug
RUN pecl install xdebug-2.3.3 apcu-4.0.11
RUN docker-php-ext-enable xdebug apcu
RUN echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "display_startup_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.idekey=\"PHPSTORM\"" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_port=9001" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-configure xsl
RUN docker-php-ext-install xsl


RUN echo 'alias sf="php app/console"' >> ~/.bashrc

WORKDIR /var/www/symfony
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
COPY ./composer.json .
RUN php -d memory_limit=-1 ./composer.phar install
COPY . .
RUN php vendor/sensio/distribution-bundle/Sensio/Bundle/DistributionBundle/Resources/bin/build_bootstrap.php
RUN chmod +x /var/www/symfony/setup-prod.sh
CMD ["/var/www/symfony/setup-prod.sh"]
