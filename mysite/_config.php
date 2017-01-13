<?php

global $project;
$project = 'Seagro';

global $database;
$database = '';

// Use _ss_environment.php file for configuration
require_once("conf/ConfigureFromEnv.php");

// Set the site locale
i18n::set_locale('es_ES');
Security::setDefaultAdmin('administrador','admin1234');
Director::set_environment_type("dev");

define('SENDGRIDMAILER_USERNAME', 'premperhn');
define('SENDGRIDMAILER_PASSWORD', 'pr3mper2015');
define('SENDGRIDMAILER_MAIL', 'Seagro <noreply@seagro.com>');
FulltextSearchable::enable();
