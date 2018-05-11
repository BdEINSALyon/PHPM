#!/bin/bash
cp -f /assets/app/config/parameters.yml /var/www/symfony/app/config/
php /var/www/symfony/app/console doctrine:schema:update --force
cp -rf /var/www/symfony/ /assets/
