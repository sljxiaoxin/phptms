<?php
	class refmanager extends BaseController{
		private $objMo = null;
		private $intTablePK = 0;
		private $strField = '';
		private $strRefFilter = '';
		private $config = array(
				//货物=》的基本计量单位
				'4' => array(
						'intDefaultUnitPK' => array(
								'strShowField' =>'TBU_strName',
								'strValueField' => 'TBUCD_intUnitPK',
								'table' => "tbl_base_unit_convert_detail",
								'join' => array(
										array(
												'table' => 'tbl_base_unit',
												'onMainField' => 'intUnitPK',
												'onJoinField' => 'PK'
										)
										/*,
										array(...)
										*/
								)
						)
				)
		);
		function __construct($controller, $method){
				print_r($_POST);
				$this->intTablePK = $_POST['intTablePK'];
				$this->strField =  $_POST['strField'];
				///*
				parent::__construct($controller, $method, $this->intTablePK);
				$this->model("RefManager_m");
				$this->objMo = new RefManager_m($this->intTablePK);
				//*/
		}

		public function getData(){
				echo "test";
		}
	}
?>
