<?php
	class Basedata_m extends BaseModel{
		private $_intTablePK = "";
		private $_strTable = "";
		function __construct($intTablePK){
			parent::__construct();
			$this->_intTablePK = $intTablePK;
			$sql  = "select * from tbl_sys_table where PK = '".$this->_intTablePK."'";
			$data = $this->db->query($sql);
			$this->_strTable = $data[0]['strTable'];
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
				$sql  = "insert into ".$this->_strTable." set ";
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
				$sql  = "update ".$this->_strTable." set ";
				$sql .= implode(" , ", $arrSet);
				$sql .= " where PK = '".$PK."'";
				$this->db->query($sql);
		}

	}
?>
