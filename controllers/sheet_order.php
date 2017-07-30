<?php
	class sheet_order extends BaseController{

		function __construct($controller, $method){
			parent::__construct($controller, $method, 10);  //10 is tablePK
		}

		public function index(){
				$this->display('order_v', $data);
		}

		public function add(){
				$this->display('order_v', $data);
		}
	}
?>
