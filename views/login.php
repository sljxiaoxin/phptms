<?php
	
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>Login Page - Tms Admin</title>

		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="/<?=APP_FOLDER?>/views/assets/css/bootstrap.css" />
		<link rel="stylesheet" href="/<?=APP_FOLDER?>/views/components/font-awesome/css/font-awesome.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="/<?=APP_FOLDER?>/views/assets/css/ace-fonts.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="/<?=APP_FOLDER?>/views/assets/css/ace.css" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="/<?=APP_FOLDER?>/views/assets/css/ace-part2.css" />
		<![endif]-->
		<link rel="stylesheet" href="/<?=APP_FOLDER?>/views/assets/css/ace-rtl.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="/<?=APP_FOLDER?>/views/assets/css/ace-ie.css" />
		<![endif]-->

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="/<?=APP_FOLDER?>/views/components/html5shiv/dist/html5shiv.min.js"></script>
		<script src="/<?=APP_FOLDER?>/views/components/respond/dest/respond.min.js"></script>
		<![endif]-->
	</head>

	<body class="login-layout light-login">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<i class="ace-icon fa fa-leaf green"></i>
									<span class="red">Ace</span>
									<span class="white" id="id-text2">Application</span>
								</h1>
								<h4 class="blue" id="id-company-text">&copy; Company Name</h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="ace-icon fa fa-coffee green"></i>
												Please Enter Your Information
											</h4>

											<div class="space-6"></div>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="username" type="text" class="form-control" placeholder="用户名" />
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="password" type="password" class="form-control" placeholder="密码" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<div class="space"></div>

													<div class="clearfix">
														<label class="inline">
															<input type="checkbox" class="ace" />
															<span class="lbl"> Remember Me</span>
														</label>

														<button id='btn_login' type="button" class="width-35 pull-right btn btn-sm btn-primary">
															<i class="ace-icon fa fa-key"></i>
															<span class="bigger-110">Login</span>
														</button>
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>

											
										</div><!-- /.widget-main -->

										<div class="toolbar clearfix">
											<div>
												<a href="#" data-target="#forgot-box" class="forgot-password-link">
													<i class="ace-icon fa fa-arrow-left"></i>
													I forgot my password
												</a>
											</div>

											<div>
												<a href="#" data-target="#signup-box" class="user-signup-link">
													I want to register
													<i class="ace-icon fa fa-arrow-right"></i>
												</a>
											</div>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.login-box -->

								<div id="forgot-box" class="forgot-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header red lighter bigger">
												<i class="ace-icon fa fa-key"></i>
												Retrieve Password
											</h4>

											<div class="space-6"></div>
											<p>
												Enter your email and to receive instructions
											</p>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" />
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>

													<div class="clearfix">
														<button type="button" class="width-35 pull-right btn btn-sm btn-danger">
															<i class="ace-icon fa fa-lightbulb-o"></i>
															<span class="bigger-110">Send Me!</span>
														</button>
													</div>
												</fieldset>
											</form>
										</div><!-- /.widget-main -->

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												Back to login
												<i class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.forgot-box -->

								<div id="signup-box" class="signup-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header green lighter bigger">
												<i class="ace-icon fa fa-users blue"></i>
												New User Registration
											</h4>

											<div class="space-6"></div>
											<p> Enter your details to begin: </p>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" />
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="Username" />
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="Password" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="Repeat password" />
															<i class="ace-icon fa fa-retweet"></i>
														</span>
													</label>

													<label class="block">
														<input type="checkbox" class="ace" />
														<span class="lbl">
															I accept the
															<a href="#">User Agreement</a>
														</span>
													</label>

													<div class="space-24"></div>

													<div class="clearfix">
														<button type="reset" class="width-30 pull-left btn btn-sm">
															<i class="ace-icon fa fa-refresh"></i>
															<span class="bigger-110">Reset</span>
														</button>

														<button type="button" class="width-65 pull-right btn btn-sm btn-success">
															<span class="bigger-110">Register</span>

															<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
														</button>
													</div>
												</fieldset>
											</form>
										</div>

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												<i class="ace-icon fa fa-arrow-left"></i>
												Back to login
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.signup-box -->
							</div><!-- /.position-relative -->
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="/<?=APP_FOLDER?>/views/components/jquery/dist/jquery.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="/<?=APP_FOLDER?>/views/components/jquery.1x/dist/jquery.js"></script>
<![endif]-->
		<script src="/<?=APP_FOLDER?>/views/assets/js/jQuery.md5.js"></script>
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='/<?=APP_FOLDER?>/views/components/_mod/jquery.mobile.custom/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			$(function($) {
			 $(document).on('click', '.toolbar a[data-target]', function(e) {
				e.preventDefault();
				var target = $(this).data('target');//$(this).attr('data-target');//
				alert(target);
				$('.widget-box.visible').removeClass('visible');//hide others
				$(target).addClass('visible');//show target
			 });
			 $("#btn_login").on('click',function(e){
					e.preventDefault();
					/*
					var getToken = function(dtd){
				　　　　var dtd = $.Deferred(); //在函数内部，新建一个Deferred对象
				　　　　
						var tasks = function(){
				　　　　　　alert("执行完毕！");
				　　　　　　dtd.resolve(); // 改变Deferred对象的执行状态
				　　　　};

				　　　　setTimeout(tasks,5000);
				　　　　return dtd.promise(); // 返回promise对象
				　　};
				*/
					//alert("mm:"+$.md5("666666"));return;
					var user = $.trim($("#username").val());
					var pass = $.trim($("#password").val());  
					pass = $.md5(pass);
				　　$.when($.ajax({
							url : "/<?=APP_FOLDER?>/login/getToken"
					}))
					.then(function(data){
						var qPass = $.md5(data+pass);
						return $.ajax({
							url : "/<?=APP_FOLDER?>/login/checkLogin/?password="+qPass+"&username="+user
						});
					})
					.done(function(data){
						if(data == 'ok'){
							location.href = "/<?=APP_FOLDER?>";
						}else{
							alert("用户名或密码错误！");
						}
					});
					/*
				　　.done(function(){ alert("哈哈，成功了！"); }).fail(function(){ alert("出错啦！"); });
					location.href = "/<?=APP_FOLDER?>";
					*/
			 });
			});
			
		</script>
	</body>
</html>
