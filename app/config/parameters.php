<?php

$container->setParameter('database_url', getenv('DATABASE_URL'));
$container->setParameter('secret', getenv('SECRET'));
$container->setParameter('mailer_transport', 'gmail');
$container->setParameter('mailer_user', 'assomaker@bde-insa-lyon.fr');
$container->setParameter('mailer_password', 'mldjqesmofkljqz');
$container->setParameter('locale', 'fr');
$container->setParameter('admin_email', 'support@bde-insa-lyon.fr');
$container->setParameter('node_bin', '/usr/bin/node');
$container->setParameter('oauth.google.id', getenv('GOOGLE_ID'));
$container->setParameter('oauth.google.secret', getenv('GOOGLE_SECRET'));
$container->setParameter('android.api.key', getenv('ANDROID_API_KEY'));