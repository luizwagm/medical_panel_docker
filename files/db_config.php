<?php

$dir = '/var/www/bwcs';
include_once  $dir . '/db-control/composer/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable('/var/www/bwcs_private/config/');

$dotenv->load();

if ( strpos( gethostname(), '-dev') !== false && strpos( gethostname(), 'cabm-dev') === false ) {

	$data_db_name = $_ENV['DB_DEVELOPMENT_DATABASE'];
	$data_db_host = $_ENV['DB_DEVELOPMENT_HOST'];
	$data_db_pass = $_ENV['DB_DEVELOPMENT_PASSWORD'];
	$data_db_user = $_ENV['DB_DEVELOPMENT_USERNAME'];
	$data_db_readpass = $_ENV['DB_DEVELOPMENT_READPASS'];
	$data_db_readuser = $_ENV['DB_DEVELOPMENT_READUSER'];

} elseif ( strpos( gethostname(), '-homolog') !== false ) {

	$data_db_name = $_ENV['DB_STAGING_DATABASE'];
	$data_db_host = $_ENV['DB_STAGING_HOST'];
	$data_db_pass = $_ENV['DB_STAGING_PASSWORD'];
	$data_db_user = $_ENV['DB_STAGING_USERNAME'];    
	$data_db_readpass = $_ENV['DB_STAGING_READPASS'];
	$data_db_readuser = $_ENV['DB_STAGING_READUSER'];

} else {

	$data_db_name = $_ENV['DB_PRODUCTION_DATABASE'];
	$data_db_host = $_ENV['DB_PRODUCTION_HOST'];
	$data_db_pass = $_ENV['DB_PRODUCTION_PASSWORD'];
	$data_db_user = $_ENV['DB_PRODUCTION_USERNAME'];   
	$data_db_readpass = $_ENV['DB_PRODUCTION_READPASS'];
	$data_db_readuser = $_ENV['DB_PRODUCTION_READUSER'];	
}
