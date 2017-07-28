<?php
	class main extends BaseController{
		function __construct(){
			parent::__construct();
		}

		public function index(){
			$this->display('dashboard');
		}
	}
?>