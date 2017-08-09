<?php
	class Client_m extends BaseModel{
		private $_intTablePK = "";
		function __construct($intTablePK){
			$this->_intTablePK = $intTablePK;
			parent::__construct();
		}
		
	}
?>
