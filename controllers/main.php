<?php
	class main extends BaseController{
		function __construct($controller, $method){
			parent::__construct($controller, $method, 0);  //10 is tablePK
		}

		public function index(){
			$this->display('dashboard');
		}
	}
?>
