<?php
	class Menu_m extends BaseModel{
		function __construct(){
			parent::__construct();
		}

		public function getBigMenu($arrWhere = array()){
					$sql = "select * from tbl_menu_big where 1 ";
					if(!empty($arrWhere)){
							foreach($arrWhere as $subSql){
									$sql .= ' and '.$subSql;
							}
					}
					$data = $this->db->query($sql);
					$arrMap = array();
					for($i=0;$i<count($data);$i++){
							$arrMap[$data[$i]['PK']] = $data[$i];
					}
					return $arrMap;
		}

		public function getLeftMenu($arrWhere = array()){
					$sql = "select * from tbl_menu_left where 1 ";
					if(!empty($arrWhere)){
							//TODO
							foreach($arrWhere as $subSql){
									$sql .= ' and '.$subSql;
							}
					}
					return $this->db->query($sql);
		}

		public function getBigByLeft($intLeftPK){
				$sql = "select intTopParent from tbl_menu_left where PK = '".$intLeftPK."'";
				$data = $this->db->query($sql);
				$intTopParent = $data[0]['intTopParent'];
				$sql = "select * from tbl_menu_big where concat(',',strLeftPK,',') like '%,".$intTopParent.",%'";
				$data = $this->db->query($sql);
				return $data[0];
		}

		public function getBigMenuByAction($arrTopLeftMenu = array()){
				$arrBig = $this->getBigMenu();
				$intOneTopLeftMenu = $arrTopLeftMenu[0];
				foreach($arrBig as $key => $val){
						$sql = "select * from tbl_menu_action where PK = '".$val['intDefaultActionPK']."'";
						$data = $this->db->query($sql);
						$arrBig[$key]['strController'] = $data[0]['strController'];
						$arrBig[$key]['strAction'] = $data[0]['strAction'];
						$arrBig[$key]['selected'] = 0;
						$arrCurrBigofLeft = explode(',', $val['strLeftPK']);
						if(in_array($intOneTopLeftMenu, $arrCurrBigofLeft)){
								$arrBig[$key]['selected'] = 1;
						}
				}
				return $arrBig;
		}

		public function getMenuByAction($tablePK, $controller, $action){
				$sql = "select * from tbl_menu_action where intTablePK='".$tablePK."' and strController ='".$controller."' and  strAction = '".$action."'";
				$arrAction = $this->db->query($sql);
				$intActionPK = $arrAction[0]['intLeftmenuPK'];
				//echo $sql;
				$arrBigInfo = $this->getBigByLeft($intActionPK);
				$strLeftTopMenus = $arrBigInfo['strLeftPK'];
				$arrLeftMenu = $this->getLeftMenu(array("intTopParent in (".$strLeftTopMenus.")"));
				//print_r($arrLeftMenu);

				$arrMap = array();
				$arrTopMenu = array();
				for($i=0;$i<count($arrLeftMenu);$i++){
						$arrMap[$arrLeftMenu[$i]['PK']] = $arrLeftMenu[$i];
						$arrMap[$arrLeftMenu[$i]['PK']]['children'] = array();
						$arrMap[$arrLeftMenu[$i]['PK']]['isOpen'] = 0;
				}
				foreach($arrMap as $key => $val){
						if($val['intParentPK'] != '0'){
								$arrMap[$val['intParentPK']]['children'][] = $key;
						}else{
								$arrTopMenu[] = $key;
						}
				}
				$curr = $arrMap[$intActionPK];
				while ($curr != NULL) {
						//echo $curr['PK']."\r\n";
						$arrMap[$curr['PK']]['isOpen'] = 1;
						$curr = $arrMap[$curr['intParentPK']];
				}
				return array(
						'top' =>$arrTopMenu,
						'detail' => $arrMap
				);

		}

	}
?>
