<?php
	class login extends BaseController{
		function __construct($controller, $method){
			parent::__construct($controller, $method, 0);  //10 is tablePK
		}

		public function index(){
			$strID = Tms_Session::getGlobal('strID');
			if($strID != ''){
				header("Location:/".APP_FOLDER."");
				return;
			}
			$this->display('login');
		}

		public function logout(){
			session_destroy();
			header("Location:/".APP_FOLDER."/login");
		}

		public function getToken(){
			$token = md5(session_id().time());
			Tms_Session::setGlobal('token', $token);
			echo $token;
		}

		//登录检测
		public function checkLogin(){
			$user = $_GET['username'];
			$pass = $_GET['password'];
			$dbUser = "yjx";
			$dbPass = md5("666666");
			$strName = "杨建新";  //数据库获取用户姓名
			$token = Tms_Session::getGlobal('token');
			if(md5($token.$dbPass) == $pass){
				Tms_Session::setGlobal('strID', $user);
				Tms_Session::setGlobal('strName', $strName);
				echo "ok";
			}else{
				echo "fail";
			}
		}

		//add user
		public function addUser(){
			$this->model("Login_m");
			$obj = new Login_m();
			$obj->add();
		}

	}
?>
