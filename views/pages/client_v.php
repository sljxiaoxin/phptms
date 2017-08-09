<?php
//print_r($arrCommonData);
require_once("tpl/client.tpl.php");
//echo file_get_contents("tpl/subcompany.tpl.php");
$arrFieldsInfo = array();
$colNamesBase = array();
$arrFieldsMain = $arrFields['mainTable']['fields'];
foreach($arrFieldsMain as $val){
    $arrFieldsInfo[] = $val;
    $colNamesBase[] = $val['strName'];
}
 ?>
<script type="text/javascript">
  //数据准备，js初始化和页面调用
  var grid_data =
  			[
  				{myac:"1", PK:"1",strName:"2|天津分公司",strLinkMan:"杨建新",sdate:"2007-12-03"},
          {myac:"3", PK:"3",strName:"3|北京分公司",strLinkMan:"王艳芳",sdate:"2012-11-15"}
  			];
  $(function($) {
      var setting = {
          grid_selector : "#grid-table",
          pager_selector : "#grid-pager",
          colNamesBase : <?php echo json_encode($colNamesBase);?>,
          colModelBase : <?php echo json_encode($arrFieldsInfo);?>
      };
      jqGridEdit.createGrid(setting);
  });
</script>
