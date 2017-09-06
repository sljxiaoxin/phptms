<?php
//print_r($arrCommonData);
//print_r($arrFields);
require_once("tpl/user.tpl.php");
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
$strListUrl = "/".APP_FOLDER."/sheet_user/getList";
$strSaveUrl = "/".APP_FOLDER."/sheet_user/save";

 ?>

<script type="text/javascript">
  $(function($) {
      var setting = {
          intTablePK : 11,
          url : '<?php echo $strListUrl;?>',
          datatype : 'json',
          editurl : '<?php echo $strSaveUrl;?>',
          grid_selector : "#grid-table",
          pager_selector : "#grid-pager",
          colNamesBase : <?php echo json_encode($arrFields['colNamesBase']);?>,
          colModelBase : <?php echo json_encode($arrFields['arrFieldsInfo']);?>
      };
      jqGridEdit.createGrid(setting);
  });
</script>
