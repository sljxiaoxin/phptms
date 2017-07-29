<?php
	class sheet_subcompany extends BaseController{

		function __construct($controller, $method){
			parent::__construct($controller, $method, 1);  //1 is tablePK
		}

		public function index(){
				$this->display('subcompany_v', $data);
		}
	}
?>
