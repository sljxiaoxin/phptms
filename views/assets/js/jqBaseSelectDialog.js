var jqBaseSelectDialog = {
		showDialog : function(setting){
				var dialogSelecter = typeof setting.dialogSelecter == 'undefined'?'#dialog-baseselect':setting.dialogSelecter;
				var intTablePK_Ref = setting.intTablePK_Ref;
				var callback = typeof setting.callback == 'undefined'?function(){}:setting.callback;
				var arrMap = {
						'1':{
								title : '分公司选择',
								url : "/"+CONST.APP_FOLDER+"/sheet_subcompany/getList",
								editurl : "/"+CONST.APP_FOLDER+"/sheet_subcompany/save",
								colModelUrl : "/"+CONST.APP_FOLDER+"/sheet_subcompany/getColModel"
						},
						'2':{
								title : '客户选择',
								url : "/"+CONST.APP_FOLDER+"/sheet_client/getList",
								editurl : "/"+CONST.APP_FOLDER+"/sheet_client/save",
								colModelUrl : "/"+CONST.APP_FOLDER+"/sheet_client/getColModel"
						}
				};
				var title = typeof arrMap[intTablePK_Ref] == 'undefined'?"数据选择":arrMap[intTablePK_Ref]['title'];
				var containerId = "dialog-selecttable-"+intTablePK_Ref;
				var gridSelector = 'dialog-grid-table-'+intTablePK_Ref;
				var pagerSelector = 'dialog-grid-pager-'+intTablePK_Ref;
				var tpl_container = [
					'<div id="'+containerId+'" class="hide">',
						'<div class="row">',
							'<div class="col-xs-12">',
								'<div class="well well-sm">',
									'放置查询条',
								'</div>',
								'<table id="'+gridSelector+'"></table>',
								'<div id="'+pagerSelector+'"></div>',
							'</div>',
						'</div>',
					'</div>'
				].join('');
				$(document.body).append(tpl_container);
				var dialog = $( "#"+containerId ).removeClass('hide').dialog({
						modal: true,
						width:800,
						height:550,
						title: title,
						open : function(event, ui){
								var dialogThs = this;
								$.get(arrMap[intTablePK_Ref]['colModelUrl'],function(data,status){
										console.log("--------------get colModelUrl-----------------");
										console.log(status);
										var backData = $.parseJSON(data);
										if(status == 'success'){
												var setting = {
														url : arrMap[intTablePK_Ref]['url'],
														height : '280px',
														datatype : 'json',
														editurl : arrMap[intTablePK_Ref]['editurl'],
														grid_selector : "#"+gridSelector,
														pager_selector : "#"+pagerSelector,
														colNamesBase : backData.colNamesBase,
														colModelBase : backData.arrFieldsInfo,
														isSelect : true,  //是选择页
														onSelect : function(data){
																callback.call(this, 'success', data);
																$(dialogThs).dialog("close");
														}
												};
												console.log(setting);
												jqGridEdit.createGrid(setting);
										}
								});

						},
						close : function( event, ui ) {
								$.jgrid.gridDestroy("#"+gridSelector);
								$('.ui-jqdialog').remove();
								$(this).remove();
						},
						buttons: [
							{
								text: "取消",
								"class" : "btn btn-minier",
								click: function() {
									 $( this ).dialog( "close" );
									 //$(this).dialog('destroy');
								}
							},
							{
								text: "清空",
								"class" : "btn btn-primary btn-minier",
								click: function() {
									$( this ).dialog( "close" );
									 //$(this).dialog('destroy');
								}
							}
						]
				});
				return dialog;
		}
};
