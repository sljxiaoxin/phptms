
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<div class="tmstpl-add-container">
			<div class="tmstpl-add-left">
				<div class='tmstpl-add-row info-bar color-orange'>1、基本表头</div>
				<div class='tmstpl-add-row row'>
					<div class='col-sm-6'>
						<div class='tmstpl-form-group'>
							<label for="firstname" class="control-label">单据编号：</label>
							<input type="text" disabled class="form-control input-sm" id="firstname" placeholder="系统自动生成" value="系统自动生成">
						</div>
					</div>
					<div class='col-sm-6'>
						<div class='tmstpl-form-group'>
							<label for="datetimepicker1" class="control-label">开单日期：</label>

							<div class='input-group date' id='datetimepicker1'>
								<input type='text' class="form-control input-sm" />
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>

					</div>
				</div>
				<div class='tmstpl-add-row row'>
					<div class='col-sm-6'>
						<div class='tmstpl-form-group'>
							<label for="firstname1" class="control-label">开单人*：</label>
							<input type="text" class="form-control input-sm" id="firstname1" placeholder="">
						</div>
					</div>
					<div class='col-sm-6'>
						<div class='tmstpl-form-group'>
							<label for="clientNo" class="control-label">分公司：</label>

							<div class='input-group date' id='clientNo'>
								<input type='text' class="form-control input-sm" />
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-search"></span>
								</span>
							</div>
						</div>
					</div>
				</div>
				<div class='tmstpl-add-row info-bar color-orange'>2、客户信息</div>
				<div class='tmstpl-add-row row'>
					<div class='col-sm-6'>
						<div class='tmstpl-form-group'>
							<label for="clientNo" class="control-label">客户名称：</label>

							<div class='input-group date' id='clientNo'>
								<input type='text' class="form-control input-sm" />
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-search"></span>
								</span>
							</div>
						</div>
					</div>
					<div class='col-sm-6'>
						<div class='tmstpl-form-group'>
							<label for="clientname" class="control-label">客户联系人：</label>
							<input type="text" class="form-control input-sm" id="clientname" placeholder="">
						</div>
					</div>
				</div>
				<div class='tmstpl-add-row info-bar color-orange'>3、收货方信息</div>
				<div class='tmstpl-add-row row'>
					<div class='col-sm-6'>
						<div class='tmstpl-form-group'>
							<label for="clientNo" class="control-label">收货方名称：</label>

							<div class='input-group date' id='clientNo'>
								<input type='text' class="form-control input-sm" />
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-search"></span>
								</span>
							</div>
						</div>
					</div>
					<div class='col-sm-6'>
						<div class='tmstpl-form-group'>
							<label for="clientname" class="control-label">收货方联系人：</label>
							<input type="text" class="form-control input-sm" id="clientname" placeholder="">
						</div>
					</div>
				</div>
				<div class='tmstpl-add-row row'>
					<div class='col-sm-6'>
						<div class='tmstpl-form-group'>
							<label for="phone" class="control-label">联系电话：</label>
							<input type="text" class="form-control input-sm" id="phone" placeholder="">
						</div>
					</div>
					<div class='col-sm-6'>
						<div class='tmstpl-form-group'>
							<label for="person" class="control-label">送达地址：</label>
							<input type="text" class="form-control input-sm" id="person" placeholder="">
						</div>
					</div>
				</div>
				<div class='tmstpl-add-row row'>
					<div class='col-sm-12'>
						<div class='tmstpl-form-group'>
							<label for="phone" class="control-label">线路里程：</label>
							<input type="text" class="form-control input-sm" id="phone" placeholder="">
						</div>
					</div>
				</div>
				<!--  独占一行
				<div class='tmstpl-add-row row'>
					<div class='col-sm-12'>
						<div class='tmstpl-form-group-2'>
							<label for="addr" class="control-label">备注：</label>
							<input type="text" class="form-control input-sm" id="addr" placeholder="">
						</div>
					</div>
				</div>
				-->
			</div>
			<div class="tmstpl-add-center">
				<div class='tmstpl-add-row info-bar color-gray'>4、 信息类型</div>
				<div class='tmstpl-add-row row'>
						<div class='col-sm-12'>
							<div class='tmstpl-form-group'>
								<label for="weight" class="control-label">累计重量：</label>
								<input type="text" class="form-control input-sm" id="weight" placeholder="">
							</div>
						</div>
				</div>
				<div class='tmstpl-add-row row'>
						<div class='col-sm-12'>
							<div class='tmstpl-form-group'>
								<label for="column" class="control-label">累计体积：</label>
								<input type="text" class="form-control input-sm" id="column" placeholder="">
							</div>
						</div>
				</div>
				<div class='tmstpl-add-row row'>
						<div class='col-sm-12'>
							<div class='tmstpl-form-group'>
								<label for="datetimepicker3" class="control-label">要求送达日期：</label>
								<div class='input-group date' id='datetimepicker3'>
									<input type='text' class="form-control input-sm" />
									<span class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
						</div>
				</div>
				<div class='tmstpl-add-row row'>
						<div class='col-sm-12'>
							<div class='tmstpl-form-group'>
									<label for="form-field-9">备  注：</label>
									<textarea class="form-control limited" id="form-field-9" maxlength="50"></textarea>
									<!--inputlimiter
									<script src="../components/jquery-inputlimiter/jquery.inputlimiter.js"></script>
									$('textarea.limited').inputlimiter({
											remText: '%n character%s remaining...',
											limitText: 'max allowed : %n.'
									});
								 	-->
							</div>
						</div>
				</div>
			</div>
			<div class="tmstpl-add-right">
				<div class='tmstpl-add-row info-bar color-gray' style="width:100%">5、 操作</div>
				<button class="btn btn-app btn-light btn-xs radius-4">
					<i class="ace-icon fa fa-floppy-o bigger-160"></i>
					暂存
					<span class="badge badge-transparent">
						<i class="light-red ace-icon fa fa-asterisk"></i>
					</span>
				</button>
				<button class="btn btn-app btn-primary btn-xs radius-4">
					<i class="ace-icon fa fa-floppy-o bigger-160"></i>
					保存
				</button>
				<button class="btn btn-app btn-warning btn-xs radius-4">
					<i class="ace-icon fa fa-undo bigger-160"></i>
					取消
				</button>
			</div>
		</div>

		<table id="grid-table"></table>

		<div id="grid-pager"></div>
		<!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
</div><!-- /.row -->
