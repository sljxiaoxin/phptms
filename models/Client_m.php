<?php
	class Client_m extends BaseModel{
		private $_intTablePK = "";
		function __construct($intTablePK){
			$this->_intTablePK = $intTablePK;
			parent::__construct();
		}

		public function save($op, $PK, $arrValues = array()){
				if($op == 'add'){
						$this->insert($arrValues);
				}elseif($op == 'edit'){
						$this->update($PK, $arrValues);
				}
		}

		private function insert($arrValues){
				if(empty($arrValues))return;
				$arrSet = array();
				foreach($arrValues as $k=>$v){
						$arrSet[] = $k." = '".$v."'";
				}
				$sql  = "insert into tbl_base_client set ";
				$sql .= implode(" , ", $arrSet);
				$sql .= ";";
				echo $sql;
				$this->db->query($sql);
		}

		private function update($PK, $arrValues){
				if(empty($arrValues))return;
				$arrSet = array();
				foreach($arrValues as $k=>$v){
						$arrSet[] = $k." = '".$v."'";
				}
				$sql  = "update tbl_base_client set ";
				$sql .= implode(" , ", $arrSet);
				$sql .= " where PK = '".$PK."'";
				$this->db->query($sql);
		}

	}
?>
