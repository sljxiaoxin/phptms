<?php
	class sheet_client extends BaseController{

		function __construct($controller, $method){
			parent::__construct($controller, $method, 2);  //1 is tablePK
		}

		public function index(){
				$this->model("Client_m");
				$obj = new Client_m(2);
				$arrFields = $obj->getFields(2);
				$data = array(
						'arrFields' => $arrFields
				);
				$this->display('client_v', $data);
		}

		public function save(){
				print_r($_POST);
				print_r($_GET);
		}
	}
?>
