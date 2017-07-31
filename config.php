<?php
session_start();
error_reporting(E_ERROR | E_WARNING);

define("BASE_URL", "");    //网站网址
define("APP_FOLDER", basename(dirname(__FILE__))); //网址后到app根
define("APP_PATH", $_SERVER["DOCUMENT_ROOT"]."/".APP_FOLDER);
define("BASE_ROOT", "/phptms/");   //如果直接放htdocs目录下则置为 "/"

define("TMS_DEBUG", true);


//DB

define("DB_HOST", '127.0.0.1');
define("DB_NAME", 'phptms');
define("DB_USER", 'phptms');
define("DB_PASS", 'phptmsphptms');
?>
