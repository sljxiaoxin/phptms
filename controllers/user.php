<?php
	class user{
		public function index(){
			echo "user index";
		}

		public function getName($name){
			echo "---------------\r\n";
			print_r($_GET);
			echo "user name:".$name;
		}
	}
?>