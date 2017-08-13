<?php
	class BaseModel{
			public $db = null;
			function __construct(){
				$this->db = new Tms_Db(DB_HOST, DB_NAME, DB_USER, DB_PASS);
			}

			//根据intTablePK和元数据获取单据存储的数据
			public function getData($intTablePK, $arrSetting=array()){
					//根据getFields返回的数据结构，拼接获取数据sql，并执行。
					//TODO
					$start = null;
					$limit = null;
					$order = null;
					$where = null;
					if(isset($arrSetting['start'])){
							$start = $arrSetting['start'];
							$limit = 10;
							if(isset($arrSetting['limit'])){
									$limit = $arrSetting['limit'];
							}
					}
					//echo "start=".$start;
					//echo "intTablePK = ".$intTablePK."\r\n";
					$arrFields = $this->getFields($intTablePK);
					//print_r($arrFields);
					$strMainTable = $arrFields['mainTable']['tableName'];
					$strMainTableAbbr = $arrFields['mainTable']['abbr'];
					$arrQueryFields = array();
					$arrJoinTable = array();
					$strMainKey = "";   //主键字段标识
					foreach ($arrFields['mainTable']['fields'] as $key => $val) {
							$arrQueryFields[] = $strMainTableAbbr.".".$val['strField']." as ".$key;
							if($val['intType'] == '8'){
									$strMainKey = $key;
									if($order === null){
											$order = " order by ".$strMainTableAbbr.".".$val['strField']." desc ";
									}
							}
					}
					foreach ($arrFields['joinTables'] as $key => $val) {
							$arrJoinTable[] = " left join ".$key." as ".$val['abbr']." on ".$val['joinField'];
							//所有关联表的
							foreach($val['fields'] as $key2 => $val2){
									$arrQueryFields[] = $val['abbr'].".".$val2['strField']." as ".$key2;
							}
					}
					$sql  = "select ";
					$sql .= implode(",", $arrQueryFields);
					$sql .= " from ".$strMainTable." as ".$strMainTableAbbr;
					$sql .= implode(" ", $arrJoinTable);
					$sql .= " where 1 ";
					if($order !== null){
							$sql .= $order;
					}
					if($start !== null){
							$sql .= " limit ".$start.",".$limit;
					}
					//echo $sql;
					$data = $this->db->query($sql);
					//print_r($data);
					return array(
							'strMainKey' => $strMainKey,
							'rows' => $data
					);

			}

			//根据intTablePK获取单据的描述数据，元数据
			public function getFields($intTablePK){
					$sql = "select * from tbl_sys_field where intTablePK = '".$intTablePK."'";
					$data = $this->db->query($sql);
					$sql = "select strTableAbbr,strTable from tbl_sys_table where PK = '".$intTablePK."'";
					$sysTable = $this->db->query($sql);
					$mainTableAbbr = $sysTable[0]['strTableAbbr'];
					$mainTable = $sysTable[0]['strTable'];
					$back = array(
							'mainTable' => array(
									'tableName' => $mainTable,
									'abbr' => $mainTableAbbr,
									'fields' => array()
							),
							'joinTables' => array()
					);
					for($i=0;$i<count($data);$i++){
							$intType = $data[$i]['intType'];
							$fieldKey = $mainTableAbbr."_".$data[$i]['strField'];
							$back['mainTable']['fields'][$fieldKey] = $data[$i];
							$back['mainTable']['fields'][$fieldKey]['id'] = $fieldKey;
							if($intType != '5' && $intType != '6'){
									$back['mainTable']['fields'][$fieldKey]['strFileldSqlShow'] = '';
									$back['mainTable']['fields'][$fieldKey]['strFileldSqlHide'] = '';
							}else{
									$intTablePK_Ref = $data[$i]['intTablePK_Ref'];
									$sql = "select * from tbl_sys_field where intTablePK = '".$intTablePK_Ref."'";
									$arrRefData = $this->db->query($sql);
									$sql = "select strTableAbbr,strTable from tbl_sys_table where PK = '".$intTablePK_Ref."'";
									$refTable = $this->db->query($sql);
									$refTableAbbr = $refTable[0]['strTableAbbr'];
									$refTable = $refTable[0]['strTable'];
									$back['mainTable']['fields'][$fieldKey]['strFileldSqlShow'] = $refTableAbbr."_".$data[$i]['strFileldShow_Ref'];
									$back['mainTable']['fields'][$fieldKey]['strFileldSqlHide'] = $refTableAbbr."_".$data[$i]['strField_Ref'];
									if($intType == '5'){
											$back['joinTables'][$refTable] = array(
													'abbr' => $refTableAbbr,
													'joinField' => $mainTableAbbr.".".$data[$i]['strField']." = ".$refTableAbbr.".".$data[$i]['strField_Ref'],
													'fields' => array()
											);
											$fields = array();
											for($j=0;$j<count($arrRefData);$j++){
													$refFieldKey = $refTableAbbr."_".$arrRefData[$j]['strField'];
													$fields[$refFieldKey] = $arrRefData[$j];
											}
											$back['joinTables'][$refTable]['fields'] = $fields;
									}
							}
					}
					//print_r($back);
					return $back;
					/*
					return array(
							'mainTable' => array(
									'tableName' => 'tbl_base_client',
									'abbr' => 'TBC',
									'fields' => array(
											'TBC_PK' => array(
													'strField' => PK,
													'strName' => '主键',
													'intType' => 8,
													'intTablePK_Ref' =>0,
													'strFileldSql' => 'TBC_PK'
													'strFileldSqlShow' => '',
													'intFieldClass' => '0表头，1明细，2状态',
													'isUsed' => 1
											),
											'TBC_intSubCompanyPK'=>array(
													'strField' => intSubCompanyPK,
													'strName' => 分公司名称,
													'intType' => 5,
													'intTablePK_Ref' =>1,
													'strFileldSql' => 'TBC_intSubCompanyPK'
													'strFileldSqlShow' => 'TBSC_strName',
													'intFieldClass' => '0表头，1明细，2状态',
													'isUsed' => 1
											),
											'TBC_strSubCompanyLinkman' => array(
													'strField' => strSubCompanyLinkman,
													'strName' => 分公司联系人,
													'intType' => 6,
													'intTablePK_Ref' =>1,
													'strFileldSql' => 'TBC_strSubCompanyLinkman'
													'strFileldSqlShow' => 'TBSC_strLinkman',
													'intFieldClass' => '0表头，1明细，2状态',
													'isUsed' => 1
											)
									)
							),
							'joinTables' => array(
									'tbl_base_subcompany' => array(
											'abbr' => 'TBSC',
											'joinField' => 'TBC.TBC_intSubCompanyPK = TBSC.TBSC_PK',
											'fields' => array(
													//结构同上，此处是关联表的所有关联字段
											)
									),
									'tbl_base_subcompany1' => array(
											...
									)
							),
					);
					*/
			}

	}
?>
