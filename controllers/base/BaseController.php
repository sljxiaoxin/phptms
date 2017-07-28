<?php
	class BaseController{
		function __construct(){
			//print "<br>In BaseClass constructor\n";
		}

		//load view
		protected function display($name, $data = array()){
			define("LOADING_VIEWNAME", $name);
			if(!empty($data)){
				extract($data);
			}
			require_once(APP_PATH . "/views/index.php");
		}

		//load model
		protected function model($name){
			require_once(APP_PATH . "/models/".$name.".php");
		}

	}
?>
