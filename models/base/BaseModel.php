<?php
	class BaseModel{
			public $db = null;
			function __construct(){
				$this->db = new Tms_Db(DB_HOST, DB_NAME, DB_USER, DB_PASS);
			}

			//根据intTablePK和元数据获取单据存储的数据
			public function getData($intTablePK){
					//根据getFields返回的数据结构，拼接获取数据sql，并执行。
					//TODO
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
							if($intType != '5'){
									$back['mainTable']['fields'][$fieldKey]['strFileldSqlShow'] = '';
							}else{
									$intTablePK_Ref = $data[$i]['intTablePK_Ref'];
									$sql = "select * from tbl_sys_field where intTablePK = '".$intTablePK_Ref."'";
									$arrRefData = $this->db->query($sql);
									$sql = "select strTableAbbr,strTable from tbl_sys_table where PK = '".$intTablePK_Ref."'";
									$refTable = $this->db->query($sql);
									$refTableAbbr = $refTable[0]['strTableAbbr'];
									$refTable = $refTable[0]['strTable'];
									$back['mainTable']['fields'][$fieldKey]['strFileldSqlShow'] = $refTableAbbr."_".$data[$i]['strFileldShow_Ref'];
									$back['joinTables'][$refTable] = array(
											'abbr' => $refTableAbbr,
											'joinField' => $mainTableAbbr.".".$mainTableAbbr."_".$data[$i]['strField']." = ".$refTableAbbr.".".$refTableAbbr."_".$data[$i]['strField_Ref'],
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
