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
					$arrType18BaseDatas = array();    //多选下拉基础数据表 key => value
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
									//主键
									$strMainKey = $key;
									if($order === null){
											$order = " order by ".$strMainTableAbbr.".".$val['strField']." desc ";
									}
							}
							if($val['intType'] == '18'){
									//多选下拉需要特殊处理
									$arrType18BaseDatas[$key] = array();
									$sqlTmp = "select * from ".$val['strTable_Ref'];
									$dataTmp = $this->db->query($sqlTmp);
									for($i=0;$i<count($dataTmp);$i++){
											$arrType18BaseDatas[$key][$dataTmp[$i][$val['strField_Ref']]] = $dataTmp[$i][$val['strFileldShow_Ref']];
									}
							}
					}
					foreach ($arrFields['joinTables'] as $key => $val) {
							$arrJoinTable[] = " left join ".$val['tableName']." as ".$val['abbr']." on ".$val['joinField'];
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
					for($i=0;$i<count($data);$i++){
							//引用多选下拉处理
							foreach($arrType18BaseDatas as $strFieldName=>$arrVal){
									if($data[$i][$strFieldName] != ''){
											$arrPKs = explode(",", $data[$i][$strFieldName]);
											$arrNames = array();
											for($j=0;$j<count($arrPKs);$j++){
													$arrNames[] = $arrVal[$arrPKs[$j]];
											}
											//引用多选下拉，填充下拉名称
											$data[$i][$strFieldName] = $data[$i][$strFieldName]."|".implode(",", $arrNames);
									}
							}
					}
					return array(
							'strMainKey' => $strMainKey,
							'rows' => $data
					);

			}

			//获取只有表头信息的表单字段，如基础数据的
			public function getFields($intTablePK){
					$sql = "select * from tbl_sys_field where intTablePK = '".$intTablePK."' order by intOrder";
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
							'joinTables' => array(),
							'joinedTable' => array()
					);
					for($i=0;$i<count($data);$i++){
							$intType = $data[$i]['intType'];
							$fieldKey = $mainTableAbbr."_".$data[$i]['strField'];
							$back['mainTable']['fields'][$fieldKey] = $data[$i];
							$back['mainTable']['fields'][$fieldKey]['id'] = $fieldKey;
							//echo $data[$i]['strField_Ref']."@".$data[$i]['strFileldShow_Ref']."<br>";
							//if($intType != '5' && $intType != '6' && $intType != '17'){
							if($data[$i]['intTablePK_Ref'] == '0'){
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
									//可带出的栏位也会进到这
									$back['mainTable']['fields'][$fieldKey]['strFileldSqlShow'] = $refTableAbbr."_".$data[$i]['strFileldShow_Ref'];
									$back['mainTable']['fields'][$fieldKey]['strFileldSqlHide'] = $refTableAbbr."_".$data[$i]['strField_Ref'];
									if($intType == '5' || $intType == '17'){
											$endFix = "";
											if(isset($back['joinedTable'][$refTable])){
													//主表连该基本表两次
													$endFix = "_".$data[$i]['PK'];
													$refTableAbbr = $refTableAbbr.$endFix;
											}else{
													$back['joinedTable'][$refTable] = true;
											}
											$back['mainTable']['fields'][$fieldKey]['strFileldSqlShow'] = $refTableAbbr."_".$data[$i]['strFileldShow_Ref'];
											$back['mainTable']['fields'][$fieldKey]['strFileldSqlHide'] = $refTableAbbr."_".$data[$i]['strField_Ref'];
											$back['joinTables'][$data[$i]['PK']] = array(
													'tableName' => $refTable,
													'abbr' => $refTableAbbr,
													'joinField' => $mainTableAbbr.".".$data[$i]['strField']." = ".$refTableAbbr.".".$data[$i]['strField_Ref'],
													'fields' => array()
											);
											$fields = array();
											for($j=0;$j<count($arrRefData);$j++){
													$refFieldKey = $refTableAbbr."_".$arrRefData[$j]['strField'];
													$fields[$refFieldKey] = $arrRefData[$j];
											}
											$back['joinTables'][$data[$i]['PK']]['fields'] = $fields;
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
									'主表关联字段的PK' => array(
											'tableName' => 'tbl_base_subcompany',
											'abbr' => 'TBSC',
											'joinField' => 'TBC.TBC_intSubCompanyPK = TBSC.TBSC_PK',
											'fields' => array(
													//结构同上，此处是关联表的所有关联字段
											)
									),
									'主表关联字段的PK' => array(
											...
											如果关联两次同样的基础表，则会abbr加后缀来避免
									)
							),
					);
					*/
			}

			//获取带有表头和明细，这种单据类型的字段信息
			public function getSheetFields($intTablePK){
					//结构信息
					/*
					return array(
							'headerTable' => array(
									'tableName' => 'tbl_sheet_order',
									'abbr' => 'TSO',
									'strSheetIndex' => 'strSheetNo',
									'fields' => array(
											'TSO_PK' => array(
													'strField' => PK,
													'strName' => '主键',
													'intType' => 8,
													'intTablePK_Ref' =>0,
													'strFileldSql' => 'TBC_PK'
													'strFileldSqlShow' => '',
													'intFieldClass' => '0表头，1明细，2状态',
													'isUsed' => 1
											),
											'TSO_intSubCompanyPK'=>array(
													'strField' => intSubCompanyPK,
													'strName' => 分公司名称,
													'intType' => 5,
													'intTablePK_Ref' =>1,
													'strFileldSql' => 'TBC_intSubCompanyPK'
													'strFileldSqlShow' => 'TBSC_strName',
													'intFieldClass' => '0表头，1明细，2状态',
													'isUsed' => 1
											)
									),
									'joinTables' => array(
											'主表关联字段的PK' => array(
													'tableName' => 'tbl_base_subcompany',
													'abbr' => 'TBSC',
													'joinField' => 'TBC.TBC_intSubCompanyPK = TBSC.TBSC_PK',
													'fields' => array(
															//结构同上，此处是关联表的所有关联字段
													)
											),
											array(
												...
												如果关联两次同样的基础表，则会abbr加后缀来避免
											)
									)
							),
							'detailTable' => array(
									//与上面结构相同
									'tableName' => 'tbl_sheet_order_detail',
									'abbr' => 'TSOD',
									'strSheetIndex' => 'strSheetNo_Detail',
									'fields' => array(//与上面结构相同),
									'joinTables' => array(//与上面结构相同)

							),
					);
					*/
			}

	}
?>
