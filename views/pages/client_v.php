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
  				{myac:"1", "TBC_PK":"1","TBC_intSubCompanyPK":"2|天津分公司", "TBC_strName":"我的客户1","TBC_strPhone":"13820052732","TBC_intSaveStatus":"1","TBC_strSubCompanyLinkman":"杨建新"},
          {myac:"3", "TBC_PK":"3","TBC_intSubCompanyPK":"3|北京分公司", "TBC_strName":"我的客户2","TBC_strPhone":"13820052732","TBC_intSaveStatus":"1","TBC_strSubCompanyLinkman":"王艳芳"}
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
