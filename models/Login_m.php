<?php
	class Login_m extends BaseModel{
		function __construct(){
			parent::__construct();
		}

		public function add(){
			$this->db->query("INSERT INTO user(strID,strPassword,strName) VALUES (:id,:pass,:name)",array("id"=>"yjx","pass"=>"666666","name"=>"杨建新"));
		}

		public function select(){
			return $this->db->query("select * from user");
		}
		
	}
?>