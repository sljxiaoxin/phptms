<?php
	class BaseModel{
		public $db = null;
		function __construct(){
			$this->db = new Tms_Db(DB_HOST, DB_NAME, DB_USER, DB_PASS);
		}

	}
?>
