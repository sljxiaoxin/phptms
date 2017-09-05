<?php
	$arrBaseDataPageCss = array(
		'<link rel="stylesheet" href="/'.APP_FOLDER.'/views/assets/css/tms-add.css"  />',
		 '<link rel="stylesheet" href="/'.APP_FOLDER.'/views/components/_mod/jquery-ui/jquery-ui.css" />',
		 '<link rel="stylesheet" href="/'.APP_FOLDER.'/views/components/chosen/chosen.css" />',
		 '<link rel="stylesheet" href="/'.APP_FOLDER.'/views/components/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" />',
		 '<link rel="stylesheet" href="/'.APP_FOLDER.'/views/components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" />',
		 '<link rel="stylesheet" href="/'.APP_FOLDER.'/views/components/_mod/jqgrid/ui.jqgrid.css" />'
	);
	$arrPageCss = array(
		'dashboard' => array(
							'<link rel="stylesheet" href="/'.APP_FOLDER.'/views/assets/css/tms-add.css"  />',
							'<link rel="stylesheet" href="/'.APP_FOLDER.'/views/assets/css/bootstrap-datetimepicker.min.css"  />'
					),
		 'subcompany_v' => $arrBaseDataPageCss,
		 'client_v' => $arrBaseDataPageCss,
		 'goods_v' => $arrBaseDataPageCss,
		 'receiver_v' => $arrBaseDataPageCss,
		  //单据
		 'order_v' => $arrBaseDataPageCss
	);
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>phptms</title>

		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="/<?=APP_FOLDER?>/views/assets/css/bootstrap.css" />
		<link rel="stylesheet" href="/<?=APP_FOLDER?>/views/components/font-awesome/css/font-awesome.css" />

		<!-- page specific plugin styles -->
		<?php
			if(!empty($arrPageCss[LOADING_VIEWNAME])){
				echo implode(' ', $arrPageCss[LOADING_VIEWNAME]);
			}
		?>
		<!-- text fonts -->
		<link rel="stylesheet" href="/<?=APP_FOLDER?>/views/assets/css/ace-fonts.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="/<?=APP_FOLDER?>/views/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="/<?=APP_FOLDER?>/views/assets/css/ace-part2.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="/<?=APP_FOLDER?>/views/assets/css/ace-skins.css" />
		<link rel="stylesheet" href="/<?=APP_FOLDER?>/views/assets/css/ace-rtl.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="/<?=APP_FOLDER?>/views/assets/css/ace-ie.css" />
		<![endif]-->

		<!-- inline styles related to this page -->
		<link rel="stylesheet" href="/<?=APP_FOLDER?>/views/assets/css/phptms.css" />
		<!-- ace settings handler -->
		<script src="/<?=APP_FOLDER?>/views/assets/js/ace-extra.js"></script>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="/<?=APP_FOLDER?>/views/components/html5shiv/dist/html5shiv.min.js"></script>
		<script src="/<?=APP_FOLDER?>/views/components/respond/dest/respond.min.js"></script>
		<![endif]-->
		<script>
				var CONST = {
						APP_FOLDER : "<?php echo APP_FOLDER;?>",
						BASE_ROOT : "<?php echo BASE_ROOT;?>"
				};
		</script>

	</head>

	<body class="no-skin">
	<!-- /section:custom/content-slider -->
		<div id="top-menu" class="modal aside" data-fixed="true" data-placement="top" data-background="true" data-backdrop="invisible" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body container">
						<div class="row">

							<div class="col-sm-12 text-center line-height-2">
								<?php
									 $arrBigMenu = $arrCommonData['arrBigMenu'];
									 //print_r($arrBigMenu);
									 foreach($arrBigMenu as $bigMenu){
										 	$url = BASE_ROOT.$bigMenu['strController'].'/'.$bigMenu['strAction'];
										 	if($bigMenu['selected'] == '1'){
													?>
														<a class="btn btn-info btn-app  no-radius" href="<?php echo $url;?>">
															<i class="ace-icon fa fa-pencil-square-o bigger-230"></i>
															<?php echo $bigMenu['strName'];?>
														</a>&nbsp; &nbsp;
													<?php
											}else{
												?>
													<a class="btn btn-app btn-light no-radius" href="<?php echo $url;?>">
														<i class="ace-icon fa fa-print bigger-230"></i>
														<?php echo $bigMenu['strName'];?>
													</a>&nbsp; &nbsp;
												<?php
											}
									 }
								?>

							</div>
						</div>
					</div>
				</div><!-- /.modal-content -->

				<button class="btn btn-inverse btn-app btn-xs ace-settings-btn aside-trigger" data-target="#top-menu" data-toggle="modal" type="button">
					<i data-icon1="fa-chevron-down" data-icon2="fa-chevron-up" class="ace-icon fa fa-chevron-down bigger-110 icon-only"></i>
				</button>
			</div><!-- /.modal-dialog -->
		</div>
	<!-- #section:basics/navbar.layout -->
		<div id="navbar" class="navbar navbar-default          ace-save-state">
			<div class="navbar-container ace-save-state" id="navbar-container">
				<!-- #section:basics/sidebar.mobile.toggle -->
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>

				<!-- /section:basics/sidebar.mobile.toggle -->
				<div class="navbar-header pull-left">
					<!-- #section:basics/navbar.layout.brand -->
					<a href="#" class="navbar-brand">
						<small>
							<i class="fa fa-leaf"></i>
							Ace Admin
						</small>
					</a>

					<!-- /section:basics/navbar.layout.brand -->

					<!-- #section:basics/navbar.toggle -->

					<!-- /section:basics/navbar.toggle -->
				</div>

				<!-- #section:basics/navbar.dropdown -->
				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="grey dropdown-modal">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-tasks"></i>
								<span class="badge badge-grey">4</span>
							</a>

							<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-check"></i>
									4 Tasks to complete
								</li>

								<li class="dropdown-content">
									<ul class="dropdown-menu dropdown-navbar">
										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">Task Name</span>
													<span class="pull-right">65%</span>
												</div>

												<div class="progress progress-mini">
													<div style="width:65%" class="progress-bar"></div>
												</div>
											</a>
										</li>
									</ul>
								</li>

								<li class="dropdown-footer">
									<a href="#">
										See tasks with details
										<i class="ace-icon fa fa-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

						<li class="purple dropdown-modal">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-bell icon-animated-bell"></i>
								<span class="badge badge-important">8</span>
							</a>

							<ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-exclamation-triangle"></i>
									8 Notifications
								</li>

								<li class="dropdown-content">
									<ul class="dropdown-menu dropdown-navbar navbar-pink">
										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-pink fa fa-comment"></i>
														New Comments
													</span>
													<span class="pull-right badge badge-info">+12</span>
												</div>
											</a>
										</li>
									</ul>
								</li>

								<li class="dropdown-footer">
									<a href="#">
										See all notifications
										<i class="ace-icon fa fa-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

						<li class="green dropdown-modal">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
								<span class="badge badge-success">5</span>
							</a>

							<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-envelope-o"></i>
									5 Messages
								</li>

								<li class="dropdown-content">
									<ul class="dropdown-menu dropdown-navbar">
										<li>
											<a href="#" class="clearfix">
												<img src="/<?=APP_FOLDER?>/views/assets/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar" />
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Alex:</span>
														Message Summary
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>Message Time</span>
													</span>
												</span>
											</a>
										</li>
									</ul>
								</li>

								<li class="dropdown-footer">
									<a href="inbox.html">
										See all messages
										<i class="ace-icon fa fa-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

						<!-- #section:basics/navbar.user_menu -->
						<li class="light-blue dropdown-modal">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="/<?=APP_FOLDER?>/views/assets/avatars/user.jpg" alt="Jason's Photo" />
								<span class="user-info">
									<small>Welcome,</small>
									Jason
								</span>

								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
								<li>
									<a href="#">
										<i class="ace-icon fa fa-cog"></i>
										Settings
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a id="header_logout" href="#">
										<i class="ace-icon fa fa-power-off"></i>
										退出
									</a>
								</li>
							</ul>
						</li>

						<!-- /section:basics/navbar.user_menu -->
					</ul>
				</div>

				<!-- /section:basics/navbar.dropdown -->
			</div><!-- /.navbar-container -->
		</div>
