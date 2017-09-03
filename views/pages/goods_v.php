<?php
//print_r($arrCommonData);
//print_r($arrFields);
require_once("tpl/goods.tpl.php");
//echo file_get_contents("tpl/subcompany.tpl.php");
/*
$arrFieldsInfo = array();
$colNamesBase = array();
$arrFieldsMain = $arrFields['mainTable']['fields'];
foreach($arrFieldsMain as $val){
    $arrFieldsInfo[] = $val;
    $colNamesBase[] = $val['strName'];
}
*/
$strListUrl = "/".APP_FOLDER."/sheet_goods/getList";

 ?>

<script type="text/javascript">
  $(function($) {
      var setting = {
          url : '<?php echo $strListUrl;?>',
          datatype : 'json',
          editurl : "/<?php echo APP_FOLDER;?>/sheet_goods/save",
          grid_selector : "#grid-table",
          pager_selector : "#grid-pager",
          colNamesBase : <?php echo json_encode($arrFields['colNamesBase']);?>,
          colModelBase : <?php echo json_encode($arrFields['arrFieldsInfo']);?>
      };
      jqRefManager.init(4, setting.colModelBase);
      jqGridEdit.createGrid(setting);
  });
</script>
