<?php
	class Tms_Session {
		private $page = null;

		function __construct($_page){
			$this->page = $_page;
		}

		public function get($key){
			if(!isset($_SESSION[$this->page][$key])){
				return "";
			}
			return $_SESSION[$this->page][$key];
		}

		public function set($key, $val){
			$_SESSION[$this->page][$key] = $val;
		}

		public static function getGlobal($key){
			if(!isset($_SESSION[$key])){
				return "";
			}
			return $_SESSION[$key];
		}

		public static function setGlobal($key, $val){
			$_SESSION[$key] = $val;
		}
	}
?>