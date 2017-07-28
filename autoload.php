<?php
function __autoload($classname){
	$filename = APP_PATH."/inc/". $classname .".php";
	if(is_file($filename)){
		include_once($filename);
		return true;
	}
	$filename = APP_PATH."/controllers/base/". $classname .".php";
	if(is_file($filename)){
		include_once($filename);
		return true;
	}
	$filename = APP_PATH."/models/base/". $classname .".php";
	if(is_file($filename)){
		include_once($filename);
		return true;
	}
}
?>