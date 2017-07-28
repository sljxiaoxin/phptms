<?php
	class basedata extends BaseController{
		public function index($tablePK = '1'){
				$this->model("Menu_m");
				$obj = new Menu_m();
				$data = array(
						'tablePK' => $tablePK,
						'arrSysMenu' => $obj->getMenuByAction($tablePK, 'basedata', 'index')
				);
				//print_r($data);
				$arrView = array(
						'1' => 'subcompany_v',
						'2' => ''
				);
				$this->display($arrView[$tablePK], $data);
		}
	}
?>
