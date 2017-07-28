<?php
	class Menu_m extends BaseModel{
		function __construct(){
			parent::__construct();
		}

		public function getLeftMenu($arrWhere = array()){
					$sql = "select * from tbl_leftmenu where 1 ";
					if(!empty($arrWhere)){
							//TODO
					}
					return $this->db->query($sql);
		}

		public function getMenuByAction($tablePK, $controller, $action){
				$sql = "select * from tbl_action where intTablePK='".$tablePK."' and strController ='".$controller."' and  strAction = '".$action."'";
				$arrAction = $this->db->query($sql);
				$intActionPK = $arrAction[0]['intLeftmenuPK'];
				//echo $sql;
				$arrLeftMenu = $this->getLeftMenu();
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
