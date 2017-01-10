<?php

global $project;
$project = 'Seagro';

global $databaseConfig;
$databaseConfig = array(
	'type' => 'MySQLDatabase',
	'server' => 'localhost',
	'username' => 'root',
	'password' => 'root',
	'database' => 'seagro',
	'path' => ''
);

// Set the site locale
i18n::set_locale('es_ES');
Security::setDefaultAdmin('administrador','admin1234');
Director::set_environment_type("dev");

define('SENDGRIDMAILER_USERNAME', 'premperhn');
define('SENDGRIDMAILER_PASSWORD', 'pr3mper2015');
define('SENDGRIDMAILER_MAIL', 'Seagro <noreply@seagro.com>');
FulltextSearchable::enable();
