<?php

	$r = new Router();
	$r->dispatch();

	class Router{

		private $uriParams = array();

		public function dispatch(){
			$this->getUriParams();
			$this->invoke();
		}

		private function invoke() {
			if(empty($this->uriParams)){
				//跳转到默认页
				$this->uriParams = array("main","index");
			}
			$ClassName = $this->uriParams[0];
			if(count($this->uriParams)== 1){
				$methodName = "index";
				$params = array();
			}elseif(count($this->uriParams)== 2){
				$methodName = $this->uriParams[1];
				$params = array();
			}else{
				$methodName = $this->uriParams[1];
				$params = array_slice($this->uriParams,2);
			}
			//echo $methodName;
			//print_r($params);
			$classFile = APP_PATH."/controllers/".$ClassName.".php";
			if (! file_exists($classFile)) {
				//TODO 跳转到404
				echo "error 404!";die();
			}else{
				//echo $ClassName;
				require_once($classFile);
				//类反射
				$rc = new ReflectionClass($ClassName);
				if(!$rc->hasMethod($methodName)){
					//TODO 跳转到404
					echo "error 404!";die();
				}else{
					$instance = $rc->newInstance($ClassName, $methodName);
					//var_dump($instance);
					$method = $rc->getMethod($methodName);
					$method->invokeArgs($instance, $params);
				}

			}


		}

		/*
		*  获取URL参数，并拆分成数组返回
		*/
		public function getUriParams(){
			//echo $_SERVER['REQUEST_URI']."<br>";
			//echo APP_FOLDER."<br>";
			$request_uri = ltrim($_SERVER['REQUEST_URI'], "/");
			$request_uri = str_replace(APP_FOLDER,"",$request_uri);
			$ma = array();
			if($request_uri != ""){
				//[^\/]表示非/的字符 +加号表示匹配的次数是1次或多次，\/?\??直到发现反斜杠或问号一次或0次结束

				//preg_match_all("/[^\/]+\/?/", $request_uri, $ma);
				//preg_match_all("/[^\/]+[\/?\??]/", $request_uri, $ma);
				preg_match_all("/[^\/]+\/?\??/", $request_uri, $ma);
				//print_r($ma);
				if(!empty($ma)){
					$ma = array_map(function($str){
									if(strpos($str, "?") !== false){
											$arrStr = explode("?", $str);
											$str = $arrStr[0];
									}
									$str = rtrim($str, "?");
									return trim($str,"/");
								}, $ma[0]
							);
				}
			}
			//print_r($ma);
			$this->uriParams = $ma;
		}
	}












?>
