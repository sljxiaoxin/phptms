<?php
	class sheet_client extends BaseController{
		private $objMo = null;
		function __construct($controller, $method){
				parent::__construct($controller, $method, 2);  //1 is tablePK
				$this->model("Client_m");
				$this->objMo = new Client_m(2);
		}

		public function index(){
				$arrFields = $this->objMo->getFields(2);
				$data = array(
						'arrFields' => $arrFields
				);
				$this->display('client_v', $data);
		}

		public function getList(){
				//print_r($_GET);
				$arrFields = $this->objMo->getFields(2);
			//	print_r($arrFields);
				$rows = $_GET["rows"];   //每次请求多少行
				$page = $_GET["page"];   //第几页
				$start = ($page - 1)*$rows;
				$arrData = $this->objMo->getData('2', array('start'=>$start,'limit'=>$rows));
				$arrAllData = $this->objMo->getData('2');
				$intTotal = count($arrAllData['rows']);
				$data = $arrData['rows'];
				$strMainKey = $arrData['strMainKey'];
				//print_r($data);die();
				$arrRows = array();
				$mianTableFields = $arrFields['mainTable']['fields'];
				for($i=0;$i<count($data);$i++){
						$val = $data[$i];
						foreach($val as $key=>$vval){
								if(isset($mianTableFields[$key]) && $mianTableFields[$key]['intType'] == '5'){
										$showKey = $mianTableFields[$key]['strFileldSqlShow'];
										if(isset($val[$showKey])){
												$val[$key] = $vval."|".$val[$showKey];
										}
								}
						}
						$val['myac'] = $data[$i][$strMainKey];
						$arrRows[] = array(
								'id' => $data[$i][$strMainKey],
								'cell' => $val
						);
				}
				/*
				$arrRows = array(
						array(
								'id' => '1',
								'cell' =>array(
										"myac"=>"1",
										"TBC_PK"=>"1",
										"TBC_strName"=>"我的客户1",
										"TBC_strPhone"=>"13820052732",
										"TBC_intSaveStatus"=>"1",
										"TBC_intSubCompanyPK"=>"1|天津分公司",
										"TBC_strSubCompanyLinkman"=>"杨建新"
								)
							),
							array(
									'id' => '2',
									'cell' =>array(
											"myac"=>"2",
											"TBC_intSubCompanyPK"=>"2|北京分公司",
											"TBC_strName"=>"我的客户2",
											"TBC_strPhone"=>"13820052734",
											"TBC_intSaveStatus"=>"4",
											"TBC_PK"=>"2",
											"TBC_strSubCompanyLinkman"=>"王艳芳"
									)
								)
				);
				*/
				$data = array(
					"total" => ceil($intTotal/$rows),
					"page" =>$page,
					"records" => $intTotal,
					"rows" => $arrRows
				);
				echo json_encode($data);
		}

		public function save(){
				print_r($_POST);
				$arrFields = $this->objMo->getFields(2);
				$arrFieldsInfo = $arrFields['mainTable']['fields'];
				$arrValues = array();
				foreach($arrFieldsInfo as $key=>$val){
						if(isset($_POST[$key])){
								$arrValues[$val['strField']] = $_POST[$key];
								if($val['intType'] == '5'){
										$arrV = explode('|', $_POST[$key]);
										$arrValues[$val['strField']] = $arrV[0];
								}
						}
				}
				print_r($arrValues);
				$id = $_POST['id'];
				$op = 'edit';
				if($id == '0'){
						$op = 'add';
				}
				$this->objMo->save($op, $id, $arrValues);
				/*
				Array
				(
				    [TBC_intSubCompanyPK] => 1|北京分公司
				    [TBC_strName] => 张三
				    [TBC_strPhone] => 13672051068
				    [TBC_intSaveStatus] => 1
				    [TBC_strSubCompanyLinkman] => 杨建新
				    [oper] => edit
				    [id] => 1
				    [op] => edit
				)
				*/
		}
	}
?>
