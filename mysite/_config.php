<?php

global $project;
$project = 'mysite';

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
define('SS_ENVIRONMENT_TYPE', 'dev');
