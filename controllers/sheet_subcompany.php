<?php
	class sheet_subcompany extends BaseController{

		function __construct($controller, $method){
			parent::__construct($controller, $method, 1);  //1 is tablePK
		}

		public function index(){
				$this->display('subcompany_v', $data);
		}

		public function add(){
				$this->display('subcompany_add_v', $data);
		}

		public function save(){
				print_r($_POST);
				print_r($_GET);
		}
	}
?>
