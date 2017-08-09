jqGridEdit = {
		gridCommData : {

		},
		createGrid : function(setting){
				console.log('--------------------------setting---------------------------->');
				console.log(setting);
				var grid_selector  = setting.grid_selector;//"#grid-table";
				var pager_selector = setting.pager_selector;//"#grid-pager";
				jqGridEdit.gridCommData[grid_selector] = {};
				var colNames = (function(colNamesBase){
						colNamesBase.splice(0, 0, '<input type="button" value="新增" onclick="jqGridEdit.addRow(\''+grid_selector+'\')" />');
						return colNamesBase;
				})(setting.colNamesBase);
				var formaters = {
						formatOptions : function(cellValue, options, rawObject){
								var arrButtons = [];
								if(cellValue == ""){
										//cellValue一般都是赋予PK的值 myac : 1，代表如果没有赋值则不出编辑删除按钮
								}else{
										arrButtons.push('<div opType="edit" title="编辑" style="float:left;cursor:pointer;" class="ui-pg-div ui-inline-edit" onclick="jqGridEdit.actionDo(this,\'edit\',\'' + options.rowId + '\')"><span class="ui-icon ui-icon-pencil"></span></div>');
										arrButtons.push('<div opType="del" title="删除" style="float:left;cursor:pointer;" class="ui-pg-div ui-inline-edit" onclick="jqGridEdit.actionDo(this,\'del\',\'' + options.rowId + '\')"><span class="ui-icon ui-icon-trash"></span></div>');
										arrButtons.push("<input type='hidden' value='"+options.rowId+"'>");
								}
								return arrButtons.join("&nbsp;&nbsp;");
						},
						unformatOptions : function(cellvalue, options, cell){
								var elEdit = $(cell).find("div[opType='edit']");
								var elDel = $(cell).find("div[opType='del']");
								var val = "";
								if(elEdit.length > 0){
										//数据库获取过来的数据，点击编辑按钮，需要出下面的按钮
										var val = $(cell).find("input:hidden").val();
										elEdit.html('<span class="ui-icon ui-icon-disk"></span>');
										elEdit.attr("onclick","jqGridEdit.actionDo(this,'save'," + options.rowId + ")");
										elEdit.attr("data-original-title","保存");
										elEdit.tooltip('hide');
										elDel.html('<span class="ui-icon ui-icon-cancel"></span>');
										elDel.attr("onclick","jqGridEdit.actionDo(this,'cancel'," + options.rowId + ")");
										elDel.attr("data-original-title","取消");
										elDel.tooltip('hide');
								}else{
										//点击新增按钮，出下面的
										var elSave = $('<div title="保存" style="float:left;cursor:pointer;" class="ui-pg-div ui-inline-edit" onclick="jqGridEdit.actionDo(this,\'save\',\'' + options.rowId + '\')"><span class="ui-icon ui-icon-disk"></span></div>&nbsp;&nbsp;');
										var elCancel = $('<div title="取消" style="float:left;cursor:pointer;" class="ui-pg-div ui-inline-edit" onclick="jqGridEdit.actionDo(this,\'delCancel\',\'' + options.rowId + '\')"><span class="ui-icon ui-icon-cancel"></span></div>');
										$(cell).append(elSave).append(elCancel);
										elSave.tooltip();
										elCancel.tooltip();
								}
								return val;
						},
						createType5Element : function(value, editOptions){
								var columnArray = $(grid_selector).jqGrid('getGridParam','colModel');
								var obj = null;
								for(var i=0;i<columnArray.length;i++){
										if(columnArray[i].name == editOptions.name){
												obj = columnArray[i];
										}
								}
								var arrValues = value.split('|');
								var textValue = arrValues[1];
								var realValue = arrValues[0];
								var span = $("<span />");
								var elGroup = $("<div />", {style : "width:200px;", class:"input-group date"});
								var elInput = $("<input>", {type:"text", readOnly:true, value:textValue, class:"form-control input-sm"});
								var elBtn = $('<span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>');
								var elHidden = $("<input>", {type:"hidden", value:realValue});
								elBtn.click(function(){
										alert("realValue:"+realValue);
										elHidden.val(55);
										elInput.val("青岛分公司");
								});
								span.append(elGroup.append(elInput).append(elBtn),elHidden);
								return span;
						},
						getType5ElementValue : function(elem, oper, value){
								if (oper === "set") {

								}
								if (oper === "get") {
										var textValue = $(elem).find("input:text").val();
										var realValue = $(elem).find("input:hidden").val();
										return realValue+"|"+textValue;
								}
						}
				};
				var colModel = (function(colModelBase){
						var modelRet = [];
						var emptyRow = {};
						modelRet.push({
							name:'myac',index:'myac', width:80, fixed:true, sortable:false, resize:false,
							formatter: formaters.formatOptions,
							unformat : formaters.unformatOptions
						});
						emptyRow['myac'] = "";
						for(var i=0;i<colModelBase.length;i++){
								emptyRow[colModelBase[i]['id']] = "";
								var obj = {
										name  : colModelBase[i]['id'],
										index : colModelBase[i]['id'],
										valueType : colModelBase[i]['intType'],
										width : 80,
										editable : true

								};
								if(colModelBase[i]['intType'] == 8){
										obj['hidden'] = true;
										obj['editable'] = false;
								}else if(colModelBase[i]['intType'] == 5){
										obj['width'] = 150;
										obj['edittype'] = 'custom';
										obj['editoptions'] = {
												custom_value : formaters.getType5ElementValue,
												custom_element : formaters.createType5Element
										};
								}else{
										obj['edittype'] = 'text';
										obj['editoptions'] = {size:20,maxlength:20};
								}
								modelRet.push(obj);
						}
						jqGridEdit.gridCommData[grid_selector]['emptyRow'] = emptyRow;
						console.log(modelRet);
						return modelRet;
				})(setting.colModelBase);
				var helperFn = {
						updatePagerIcons : function(table) {
								var replacement =
								{
									'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
									'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
									'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
									'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
								};
								$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
									var icon = $(this);
									var $class = $.trim(icon.attr('class').replace('ui-icon', ''));

									if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
								})
						},
						enableTooltips : function(table){
							$('.navtable .ui-pg-button').tooltip({container:'body'});
							$(table).find('.ui-pg-div').tooltip({container:'body'});
						}
				};
				////////////////////////////////////////////////////////////////////////////////////
				var parent_column = $(grid_selector).closest('[class*="col-"]');
				//resize to fit page size
				$(window).on('resize.jqGrid', function () {
					$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
				});

				//resize on sidebar collapse/expand
				$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
					if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
						//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
						setTimeout(function() {
							$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
						}, 20);
					}
				});
				$(grid_selector).jqGrid({
						data: [
		  				{myac:"1", "TBC_PK":"1","TBC_intSubCompanyPK":"2|天津分公司", "TBC_strName":"我的客户1","TBC_strPhone":"13820052732","TBC_intSaveStatus":"1","TBC_strSubCompanyLinkman":"杨建新"},
		          {myac:"3", "TBC_PK":"3","TBC_intSubCompanyPK":"3|北京分公司", "TBC_strName":"我的客户2","TBC_strPhone":"13820052732","TBC_intSaveStatus":"1","TBC_strSubCompanyLinkman":"王艳芳"}
		  			],
						datatype: "local",
						height: 250,
						colNames : colNames,
						colModel : colModel,
						viewrecords : true,  // 显示总条数
						rowNum:20,
						height : '400px',
						rowList:[10,20,30],
						pager : pager_selector,
						altRows: true,
						//toppager: true,
						multiselect: false,
						//multikey: "ctrlKey",
						multiboxonly: true,

						loadComplete : function() {
							var table = this;
							setTimeout(function(){
								helperFn.updatePagerIcons(table);
								helperFn.enableTooltips(table);
							}, 0);
						},
						editurl: "../dummy.php"//nothing is saved
						//,caption: "分公司列表"
					});
					$(window).triggerHandler('resize.jqGrid');
					$(document).one('ajaxloadstart.page', function(e) {
						$.jgrid.gridDestroy(grid_selector);
						$('.ui-jqdialog').remove();
					});


				return {
						getAllData : function(){

						}
				};
		},
		addRow : function(grid_selector){
				var ids = jQuery(grid_selector).jqGrid('getDataIDs');
			  //获得当前最大行号（数据编号）
			  var rowid = Math.max.apply(Math,ids);
			  //获得新添加行的行号（数据编号）
		 		var newrowid = rowid+1;
				var dataRow = jqGridEdit.gridCommData[grid_selector]['emptyRow'];
				/*{
				 myac:"",
				 PK: "",
				 strName:"",
				 strLinkMan:'',
				 sdate:''
				};
				*/
				//将新添加的行插入到第一列
				$(grid_selector).jqGrid("addRowData", newrowid, dataRow, "first");
				//设置grid单元格不可编辑
				$(grid_selector).setGridParam({cellEdit:false});
				//设置grid单元格可编辑
				$(grid_selector).jqGrid('editRow', newrowid, false);
		},
		actionDo : function(){}

};
