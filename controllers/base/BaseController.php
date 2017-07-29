<?php
	class BaseController{
		protected $_controller = '';
		protected $_method = '';
		protected $_tablePK = '';

		function __construct($controller, $method, $tablePK){
				$this->_controller = $controller;
				$this->_method = $method;
				$this->_tablePK = $tablePK;
		}

		//load view
		protected function display($name, $data = array()){
			define("LOADING_VIEWNAME", $name);
			//print_r($data);
			//echo $this->_tablePK, $this->_controller, $this->_method;
			//die();
			$this->model("Menu_m");
			$obj = new Menu_m();
			$arrLeftMenu = $obj->getMenuByAction($this->_tablePK, $this->_controller, $this->_method);
			$arrBigMenu = $obj->getBigMenuByAction($arrLeftMenu['top']);
			$data['arrCommonData'] = array(
					'arrLeftMenu' => $arrLeftMenu,
					'arrBigMenu' => $arrBigMenu
			);
			if(!empty($data)){
				extract($data);
			}
			require_once(APP_PATH . "/views/index.php");
		}

		//load model
		protected function model($name){
			require_once(APP_PATH . "/models/".$name.".php");
		}

	}
?>
