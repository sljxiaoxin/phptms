<?php
	class RefManager_m extends BaseModel{
		private $_intTablePK = "";
		private $config = array(
				//本配置为需要特殊处理的，需要连表才能拿到pk对应名字的表
				//货物表
				'4' => array(
						'intDefaultUnitPK' => array(
								//基本计量单位
								'strShowField' =>'TBU_strName',
								'strValueField' => 'TBUCD_intUnitPK',
								'sql' => 'select TBU.strName as TBU_strName, TBUCD.intUnitPK as TBUCD_intUnitPK
													from tbl_base_unit_convert_detail as TBUCD
													inner join tbl_base_unit as TBU on TBUCD.intUnitPK = TBU.PK '
						),
						'intOrderDefaultUnitPK' => array(
								//订单常用计量单位
								'strShowField' =>'TBU_strName',
								'strValueField' => 'TBUCD_intUnitPK',
								'sql' => 'select TBU.strName as TBU_strName, TBUCD.intUnitPK as TBUCD_intUnitPK
													from tbl_base_unit_convert_detail as TBUCD
													inner join tbl_base_unit as TBU on TBUCD.intUnitPK = TBU.PK '
						)
				)
		);
		function __construct($intTablePK){
			parent::__construct();
			$this->_intTablePK = $intTablePK;
		}

		public function getData($cfg){
				$intType = $cfg['intType'];
				$intTablePK = $cfg['intTablePK'];
				$strField = $cfg['strField'];
				$strRefFilter = $cfg['strRefFilter'];
				if(isset($this->config[$intTablePK][$strField])){
						//走上面特殊处理
						$sql = $this->config[$intTablePK][$strField]['sql'];
						if($strRefFilter != ''){
								$arrFileters = explode(";", $strRefFilter);
								$sql .= " and ".implode(" and ", $arrFileters);   //增加过滤条件
						}
						//echo $sql;
						$data = $this->db->query($sql);
						return array(
								'strShowField' => $this->config[$intTablePK][$strField]['strShowField'],
								'strValueField' => $this->config[$intTablePK][$strField]['strValueField'],
								'data' => $data
						);

				}else{
						//单表无需连接走公共处理
						$sql = "select * from tbl_sys_field where intTablePK = '".$intTablePK."' and strField = '".$strField."'";
						$arrFieldInfo = $this->db->query($sql);
						$intTablePK_Ref = $arrFieldInfo[0]['intTablePK_Ref'];
						$strTable_Ref = $arrFieldInfo[0]['strTable_Ref'];
						$strField_Ref = $arrFieldInfo[0]['strField_Ref'];
						$strFileldShow_Ref = $arrFieldInfo[0]['strFileldShow_Ref'];
						$sql = "select strTableAbbr from tbl_sys_table where PK = '".$intTablePK_Ref."'";
						$arrRefTable = $this->db->query($sql);
						$Abbr = $arrRefTable[0]['strTableAbbr'];
						$sql = "select `".$Abbr."`.".$strField_Ref." as ".$Abbr."_".$strField_Ref.", `".$Abbr."`.".$strFileldShow_Ref." as ".$Abbr."_".$strFileldShow_Ref." from $strTable_Ref as $Abbr where 1";
						//echo $sql;
						if($strRefFilter != ''){
								$arrFileters = explode(";", $strRefFilter);
								$sql .= " and ".implode(" and ", $arrFileters);   //增加过滤条件
						}
						//echo $sql;
						$data = $this->db->query($sql);
						return array(
								'strShowField' => $Abbr."_".$strFileldShow_Ref,
								'strValueField' => $Abbr."_".$strField_Ref,
								'data' => $data
						);
				}
		}

	}
?>
