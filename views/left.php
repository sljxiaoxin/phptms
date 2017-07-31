<?php
	//echo '-------------------<br>';
	//print_r($arrSysMenu);
	//echo '-------------------<br>';
?>

<!-- #section:basics/sidebar -->
			<div id="sidebar" class="sidebar                  responsive                    ace-save-state">
				<script type="text/javascript">
					try{ace.settings.loadState('sidebar')}catch(e){}
				</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success">
							<i class="ace-icon fa fa-signal"></i>
						</button>

						<button class="btn btn-info">
							<i class="ace-icon fa fa-pencil"></i>
						</button>

						<!-- #section:basics/sidebar.layout.shortcuts -->
						<button class="btn btn-warning">
							<i class="ace-icon fa fa-users"></i>
						</button>

						<button class="btn btn-danger">
							<i class="ace-icon fa fa-cogs"></i>
						</button>

						<!-- /section:basics/sidebar.layout.shortcuts -->
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><!-- /.sidebar-shortcuts -->

				<ul class="nav nav-list">
					<li class="">
						<a href="<?php echo BASE_ROOT;?>main">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text"> 仪表板 </span>
						</a>

						<b class="arrow"></b>
					</li>

					<?php
						$arrSysMenu = $arrCommonData['arrLeftMenu'];
						function createMenu($arrSysMenu, $menu){
								$url = "#";
								$classToggle = "dropdown-toggle";
								if(isset($menu['strController'])){
										$url = BASE_ROOT.$menu['strController']."/".$menu['strAction'];
										$classToggle = "";
								}
								if(!empty($menu['children'])){
										$class = $menu['isOpen'] == 1?'open':'';
								}else{
										$class = $menu['isOpen'] == 1?'active':'';
								}
								if($menu['intParentPK'] == '0'){
										$iClass = 'fa-desktop';
								}else{
										$iClass = 'fa-caret-right';
								}
								echo '<li class="'.$class.'">';
								echo '	<a href="'.$url.'" class="'.$classToggle.'">';
								echo '		<i class="menu-icon fa '.$iClass.'"></i>';
								if(!empty($menu['children'])){
										echo '<span class="menu-text"> '.$menu['strName'].' </span>';
										echo '<b class="arrow fa fa-angle-down"></b>';
								}else{
										echo $menu['strName'];
								}
								echo '	</a>';
								echo '	<b class="arrow"></b>';
								if(!empty($menu['children'])){
										echo '<ul class="submenu">';
								}
								for($i=0;$i<count($menu['children']);$i++){
										createMenu($arrSysMenu, $arrSysMenu['detail'][$menu['children'][$i]]);
								}
								if(!empty($menu['children'])){
										echo '</ul>';
								}
								echo '</li>';
						}

						for($i=0;$i<count($arrSysMenu['top']);$i++){
								$topMenuPK = $arrSysMenu['top'][$i];
								$arrTopMenu = $arrSysMenu['detail'][$topMenuPK];
								//$strOpen = $arrTopMenu['isOpen'] == 1?'open':'';
								createMenu($arrSysMenu, $arrTopMenu);
						}
					?>
				<!-- /.nav-list -->

				<!-- #section:basics/sidebar.layout.minimize -->
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				<!-- /section:basics/sidebar.layout.minimize -->
			</div>
<!-- /section:basics/sidebar -->
