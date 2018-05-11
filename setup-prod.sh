#!/bin/bash
php /var/www/symfony/app/console doctrine:schema:update --force
cp -rf * /assets/
