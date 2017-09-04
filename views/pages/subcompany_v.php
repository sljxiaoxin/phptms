<?php
//print_r($arrCommonData);
require_once("tpl/client.tpl.php");
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
$strListUrl = "/".APP_FOLDER."/sheet_subcompany/getList";

 ?>

<script type="text/javascript">
  $(function($) {
      var setting = {
          intTablePK : 1,
          url : '<?php echo $strListUrl;?>',
          datatype : 'json',
          editurl : "/<?php echo APP_FOLDER;?>/sheet_subcompany/save",
          grid_selector : "#grid-table",
          pager_selector : "#grid-pager",
          colNamesBase : <?php echo json_encode($arrFields['colNamesBase']);?>,
          colModelBase : <?php echo json_encode($arrFields['arrFieldsInfo']);?>
      };
      jqGridEdit.createGrid(setting);
  });
</script>
