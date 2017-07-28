<?php
	//echo 'LOADING_VIEWNAME is :'.LOADING_VIEWNAME;
	//echo 'data is :'.$data;
	switch(LOADING_VIEWNAME){
		case 'login':
			require_once(APP_PATH . "/views/login.php");
			break;
		default:
			require_once(APP_PATH . "/views/main.php");
			break;
	}
?>