<?php
	require_once("header.php");
	$arrBaseDataPageJs = array(
		'<script src="/'.APP_FOLDER.'/views/assets/js/jqRefManager.js"></script>',
		'<script src="/'.APP_FOLDER.'/views/assets/js/jqGridEdit.js"></script>',
		'<script src="/'.APP_FOLDER.'/views/assets/js/jqBaseSelectDialog.js"></script>',
		'<script src="/'.APP_FOLDER.'/views/components/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>',
		'<script src="/'.APP_FOLDER.'/views/components/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>',
		'<script src="/'.APP_FOLDER.'/views/components/jqGrid/js/jquery.jqGrid.js"></script>',
		'<script src="/'.APP_FOLDER.'/views/components/jqGrid/js/i18n/grid.locale-cn.js"></script>',
		'<script src="/'.APP_FOLDER.'/views/components/chosen/chosen.jquery.js"></script>'
	);
	$arrPageJs = array(
			'dashboard' => array(
						'<script src="/'.APP_FOLDER.'/views/assets/js/moment-with-locales.min.js"></script> ',
						'<script src="/'.APP_FOLDER.'/views/assets/js/bootstrap-datetimepicker.min.js"></script>  '
				),
				'subcompany_v' => $arrBaseDataPageJs,
				'client_v' => $arrBaseDataPageJs,
				'goods_v' => $arrBaseDataPageJs,
				'receiver_v' => $arrBaseDataPageJs
	);
?>
<!-- basic scripts -->

<!--[if !IE]> -->
<script src="/<?=APP_FOLDER?>/views/components/jquery/dist/jquery.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="/<?=APP_FOLDER?>/views/components/jquery.1x/dist/jquery.js"></script>
<![endif]-->
<script type="text/javascript">
	if('ontouchstart' in document.documentElement) document.write("<script src='/<?=APP_FOLDER?>/views/components/_mod/jquery.mobile.custom/jquery.mobile.custom.js'>"+"<"+"/script>");
</script>
<script src="/<?=APP_FOLDER?>/views/components/bootstrap/dist/js/bootstrap.js"></script>
<script src="/<?=APP_FOLDER?>/views/components/jquery-ui/jquery-ui.js"></script>
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<?php
			require_once("left.php");
		?>
		<div class="main-content">
			<?php
				require_once("breadcrumbs.php");
			?>
			<div class="page-content">
				<?php
					require_once("pages/" . LOADING_VIEWNAME . ".php");
				?>
			</div><!-- /.page-content -->
		</div><!-- /.main-content -->
	</div><!-- /.main-container -->

		<!-- page specific plugin scripts -->

		<!-- ace scripts -->
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/elements.scroller.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/elements.colorpicker.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/elements.fileinput.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/elements.typeahead.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/elements.wysiwyg.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/elements.spinner.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/elements.treeview.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/elements.wizard.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/elements.aside.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/ace.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/ace.basics.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/ace.scrolltop.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/ace.ajax-content.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/ace.touch-drag.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/ace.sidebar.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/ace.sidebar-scroll-1.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/ace.submenu-hover.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/ace.widget-box.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/ace.settings.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/ace.settings-rtl.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/ace.settings-skin.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/ace.widget-on-reload.js"></script>
		<script src="/<?=APP_FOLDER?>/views/assets/js/src/ace.searchbox-autocomplete.js"></script>

		<?php
			if(!empty($arrPageJs[LOADING_VIEWNAME])){
				echo implode(' ', $arrPageJs[LOADING_VIEWNAME]);
			}
		?>


		<script>
			$('.aside').ace_aside();
			$('#header_logout').on('click', function(){
				location.href = "/<?=APP_FOLDER?>/login/logout";
			});
		</script>
		<?php
			$page_js = APP_PATH."/views/pages/js/".LOADING_VIEWNAME.".js";
			if(is_file($page_js)){
				echo '<script src="/'.APP_FOLDER.'/views/pages/js/'.LOADING_VIEWNAME.'.js"></script>';
			}
		?>

	</body>
</html>
