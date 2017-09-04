<?php
	class refmanager extends BaseController{
		private $objMo = null;
		private $intTablePK = 0;
		private $intType = 0;
		private $strField = '';
		private $strRefFilter = '';
		function __construct($controller, $method){
				//print_r($_POST);
				$this->intTablePK = $_POST['intTablePK'];
				$this->strField =  $_POST['strField'];
				$this->intType =  $_POST['intType'];
				$this->strRefFilter = $_POST['strRefFilter'];
				///*
				parent::__construct($controller, $method, $this->intTablePK);
				$this->model("RefManager_m");
				$this->objMo = new RefManager_m($this->intTablePK);
				//*/
		}

		public function getData(){
				//$arrSqlCfg = $this->config[$this->intTablePK][$this->strField];
				$data = $this->objMo->getData(array(
						'intType' => $this->intType,
						'strRefFilter' => $this->strRefFilter,
						'intTablePK' => $this->intTablePK,
						'strField' => $this->strField
				));
				echo json_encode($data);
		}
	}
?>
