<?php
//print_r($arrCommonData);
require_once("tpl/receiver.tpl.php");
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
$strListUrl = "/".APP_FOLDER."/sheet_receiver/getList";

 ?>

<script type="text/javascript">
  $(function($) {
      var setting = {
          intTablePK : 3,
          url : '<?php echo $strListUrl;?>',
          datatype : 'json',
          editurl : "/<?php echo APP_FOLDER;?>/sheet_receiver/save",
          grid_selector : "#grid-table",
          pager_selector : "#grid-pager",
          colNamesBase : <?php echo json_encode($arrFields['colNamesBase']);?>,
          colModelBase : <?php echo json_encode($arrFields['arrFieldsInfo']);?>
      };
      jqGridEdit.createGrid(setting);
  });
</script>
