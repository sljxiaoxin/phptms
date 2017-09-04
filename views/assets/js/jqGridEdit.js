
jqGridEdit = {
		isGlobalInit : false,
		gridCommData : {
				//以grid_selector为key放置外部函数需要访问的数据，防止污染全局空间
		},
		createGrid : function(setting){
				console.log('--------------------------setting---------------------------->');
				console.log(setting);
				var grid_selector  = setting.grid_selector;//"#grid-table";
				var pager_selector = setting.pager_selector;//"#grid-pager";
				var height = typeof setting.height == 'undefined'?'350px':setting.height;
				var url = typeof setting.url == 'undefined'?"":setting.url;
				var editurl = typeof setting.editurl == 'undefined'?"":setting.editurl;
				var datatype = typeof setting.datatype == 'undefined'?"local":setting.datatype;
				var isSelect = typeof setting.isSelect == 'undefined'?false:true;
				var onSelect = typeof setting.onSelect == 'undefined'?null:setting.onSelect;

				jqGridEdit.gridCommData[grid_selector] = {
						intTablePK : setting.intTablePK,
						editingRowId : -1,
						editurl : editurl,
						colModelBase : setting.colModelBase
				};
				var colNames = (function(colNamesBase){
						colNamesBase.splice(0, 0, '<span class="ui-action-span" style="margin-left: 10px;" title="新增" onclick="jqGridEdit.addRow(\''+grid_selector+'\')"><i class="ace-icon fa fa-plus  bigger-150 blue" ></i></span>');
						return colNamesBase;
				})(setting.colNamesBase);

				//所有类型的formater集中放置
				var formaters = {
						formatOptions : function(cellValue, options, rawObject){
								console.log('------------------formatOptions---------------------->');
								var arrButtons = [];
								if(cellValue == ""){
										//cellValue一般都是赋予PK的值 myac : 1，代表如果没有赋值则不出编辑删除按钮
								}else{
										arrButtons.push('<div opType="edit" title="编辑" style="float:left;cursor:pointer;" class="ui-pg-div ui-inline-edit" onclick="jqGridEdit.actionDo(\'' + grid_selector + '\',this,\'edit\',\'' + options.rowId + '\')"><span class="ui-icon ui-icon-pencil"></span></div>');
										arrButtons.push('<div opType="del" title="删除" style="float:left;cursor:pointer;" class="ui-pg-div ui-inline-edit" onclick="jqGridEdit.actionDo(\'' + grid_selector + '\',this,\'del\',\'' + options.rowId + '\')"><span class="ui-icon ui-icon-trash"></span></div>');
										arrButtons.push("<input type='hidden' value='"+options.rowId+"'>");
								}
								return arrButtons.join("&nbsp;&nbsp;");
						},
						unformatOptions : function(cellvalue, options, cell){
								console.log('------------------unformatOptions---------------------->');
								var elEdit = $(cell).find("div[opType='edit']");
								var elDel = $(cell).find("div[opType='del']");
								var val = "";
								if(elEdit.length > 0){
										//数据库获取过来的数据，点击编辑按钮，需要出下面的按钮
										var val = $(cell).find("input:hidden").val();
										elEdit.html('<span class="ui-icon ui-icon-disk"></span>');
										elEdit.attr("onclick","jqGridEdit.actionDo('"+grid_selector+"',this,'save'," + options.rowId + ")");
										elEdit.attr("data-original-title","保存");
										elEdit.tooltip('close');
										elDel.html('<span class="ui-icon ui-icon-cancel"></span>');
										elDel.attr("onclick","jqGridEdit.actionDo('"+grid_selector+"',this,'cancel'," + options.rowId + ")");
										elDel.attr("data-original-title","取消");
										elDel.tooltip('close');
								}else{
										//点击新增按钮，出下面的
										var elSave = $('<div title="保存" style="float:left;cursor:pointer;" class="ui-pg-div ui-inline-edit" onclick="jqGridEdit.actionDo(\'' + grid_selector + '\',this,\'save\',\'' + options.rowId + '\')"><span class="ui-icon ui-icon-disk"></span></div>&nbsp;&nbsp;');
										var elCancel = $('<div title="取消" style="float:left;cursor:pointer;" class="ui-pg-div ui-inline-edit" onclick="jqGridEdit.actionDo(\'' + grid_selector + '\',this,\'delCancel\',\'' + options.rowId + '\')"><span class="ui-icon ui-icon-cancel"></span></div>');
										$(cell).append(elSave).append(elCancel);
										elSave.tooltip({container:'body'});
										elCancel.tooltip({container:'body'});
								}
								return val;
						},
						createType5Element : function(value, editOptions){
								console.log('------------------createType5Element---------------------->');
								var columnArray = $(grid_selector).jqGrid('getGridParam','colModel');
								console.log(columnArray);
								var obj = null;
								var intTablePK_Ref_t = 0;
								var realValueKey = "";
								var textValueKey = "";
								for(var i=0;i<columnArray.length;i++){
										if(columnArray[i].name == editOptions.name){
												obj = columnArray[i];
												intTablePK_Ref_t = columnArray[i].intTablePK_Ref;
												realValueKey = columnArray[i].strFileldSqlHide;
												textValueKey = columnArray[i].strFileldSqlShow;
										}
								}
								var arrValues = value.split('|');
								var textValue = arrValues[1];
								var realValue = arrValues[0];
								var span = $("<span />");
								var elGroup = $("<div />", {style : "width:200px;", class:"btnGroupEditable input-group date"});
								var elInput = $("<input>", {/*val: "加载中。。。", */ type:"text", readOnly:true, value:textValue, class:"form-control input-sm"});
								var elBtn = $('<span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>');
								var elHidden = $("<input>", {type:"hidden", value:realValue});

								elBtn.click(function(){
										jqBaseSelectDialog.showDialog({
												intTablePK_Ref : intTablePK_Ref_t,
												callback : function(op, data){
														if(op =='success'){
																console.log("data:", data);
																console.log("columnArray:",columnArray);
																elHidden.val(data[realValueKey]);
																elInput.val(data[textValueKey]);
																for(var i=0;i<columnArray.length;i++){
																		if(columnArray[i]['isDragOut'] == '1'){
																				//带出类型处理
																				console.log('type 6 field is :',columnArray[i]['strFileldSqlShow']);
																				if(typeof data[columnArray[i]['strFileldSqlShow']] != 'undefined'){
																						if(columnArray[i]['valueType'] != '5' && columnArray[i]['valueType'] != '17'){
																								//非引用类型，直接置值
																								$(grid_selector).find("input[name='"+columnArray[i]['name']+"']").val(data[columnArray[i]['strFileldSqlShow']]);
																						}

																				}
																		}
																}
														}
												}
										});
										console.log("type5Click:",columnArray);
										//alert("realValue:"+realValue);


								});
								span.append(elGroup.append(elInput).append(elBtn),elHidden);
								return span;
						},
						getType5ElementValue : function(elem, oper, value){
								console.log('------------------getType5ElementValue---------------------->');
								if (oper === "set") {

								}
								if (oper === "get") {
										var textValue = $(elem).find("input:text").val();
										var realValue = $(elem).find("input:hidden").val();
										return realValue+"|"+textValue;
								}
						},
						type5Formatter : function(cellvalue, options, rowObject){
								console.log('------------------type5Formatter---------------------->');
								if(cellvalue == ""){
									var textValue = '';
									var realValue = '';
								}else{
									var arrValues = cellvalue.split('|');
									var textValue = arrValues[1];
									var realValue = arrValues[0];
								}
								return "<span pk='"+realValue+"'>"+textValue+"</span>";
						},
						untype5Formatter : function(cellvalue, options, cell){
								console.log('------------------untype5Formatter---------------------->');
								var textValue = $(cell).find("span").html();
								var realValue = $(cell).find("span").attr("pk");
								return realValue+"|"+textValue;
						},
						createType17Element : function(value, editOptions){
								console.log('------------------createType17Element---------------------->');
								var columnArray = $(grid_selector).jqGrid('getGridParam','colModel');
								console.log(columnArray);
								var obj = null;
								var intTablePK_Ref_t = 0;
								var realValueKey = "";
								var textValueKey = "";
								var strField = "";
								for(var i=0;i<columnArray.length;i++){
										if(columnArray[i].name == editOptions.name){
												obj = columnArray[i];
												intTablePK_Ref_t = columnArray[i].intTablePK_Ref;
												realValueKey = columnArray[i].strFileldSqlHide;
												textValueKey = columnArray[i].strFileldSqlShow;
												strField = columnArray[i].strField;
										}
								}
								var arrValues = value.split('|');
								var textValue = arrValues[1];
								var realValue = arrValues[0];
								var span = $("<span />");
								/*
								var elGroup = $("<div />", {style : "width:200px;", class:"btnGroupEditable input-group date"});
								var elInput = $("<input>", {type:"text", readOnly:true, value:textValue, class:"form-control input-sm"});
								var elBtn = $('<span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>');
								var elHidden = $("<input>", {type:"hidden", value:realValue});
								*/
								var elSelect = $('<select class="chosen-select form-control"  data-placeholder="请选择"></select>');
								span.append(elSelect);
								elSelect.chosen({allow_single_deselect:true}).on('change',function(evt, params){
										jqRefManager.change(strField, params['selected']);
								});
								elSelect.next().css({'width': 150});
								$(this).find("td").css({'overflow':'visible'});
								jqRefManager.load(elSelect, strField, realValue);   //引用类型辅助
								return span;
						},
						getType17ElementValue : function(elem, oper, value){
								console.log('------------------getType17ElementValue---------------------->');
								if (oper === "set") {

								}
								if (oper === "get") {
										var textValue = $(elem).find("input:text").val();
										var realValue = $(elem).find("input:hidden").val();
										return realValue+"|"+textValue;
								}
						},
						type17Formatter : function(cellvalue, options, rowObject){
								console.log('------------------type17Formatter---------------------->');
								if(cellvalue == ""){
									var textValue = '';
									var realValue = '';
								}else{
									var arrValues = cellvalue.split('|');
									var textValue = arrValues[1];
									var realValue = arrValues[0];
								}
								return "<span pk='"+realValue+"'>"+textValue+"</span>";
						},
						untype17Formatter : function(cellvalue, options, cell){
								console.log('------------------untype17Formatter---------------------->');
								var textValue = $(cell).find("span").html();
								var realValue = $(cell).find("span").attr("pk");
								return realValue+"|"+textValue;
						},
						undateFormatter : function( cellvalue, options, cell ) {
							//console.log(cellvalue, options, cell);
							setTimeout(function(){
								$(cell).find('input[type=text]').datetimepicker({
									format : 'yyyy-mm-dd',
									autoclose:true,
									minView: "month",
									todayBtn:true,
									language :'zh-CN'
								});
							}, 0);
						},
						undatetimeFormatter : function( cellvalue, options, cell ) {
							//console.log(cellvalue, options, cell);
							setTimeout(function(){
								$(cell).find('input[type=text]').datetimepicker({
									format : 'yyyy-mm-dd hh:ii:ss',
									autoclose:true,
									todayBtn:true,
									language :'zh-CN'
								});
							}, 0);
						}
				};
				//Model生成
				var colModel = (function(colModelBase){
						console.log('colModelBase:',colModelBase);
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
										strField : colModelBase[i]['strField'],
										index : colModelBase[i]['id'],
										valueType : colModelBase[i]['intType'],
										intTablePK_Ref : colModelBase[i]['intTablePK_Ref'],
										strFileldSqlHide : colModelBase[i]['strFileldSqlHide'],
										strFileldSqlShow : colModelBase[i]['strFileldSqlShow'],
										isDragOut : colModelBase[i]['isDragOut'],
										width : 120,
										editable : colModelBase[i]['isEditable']=='1'?true:false
								};
								if(colModelBase[i]['intType'] == 1 || colModelBase[i]['intType'] == 2){
										//数字 文本
										obj['edittype'] = 'text';
										obj['editoptions'] = {size:20,maxlength:20};
										var rules = {};
										if(colModelBase[i]['isMustHave'] == '1'){
												rules['required'] = true;
										}
										if(colModelBase[i]['intType'] == 1){
												//数字相关
												rules['number'] = true;
												rules['minValue'] = colModelBase[i]['intMinValue'];
												rules['maxValue'] = colModelBase[i]['intMaxValue'];
										}
										obj['editrules'] = rules;
								}else if(colModelBase[i]['intType'] == 3 || colModelBase[i]['intType'] == '4'){
										//日期
										var formaterFn = null;
										if(colModelBase[i]['intType'] == 3){
												formaterFn = formaters.undateFormatter;
										}else if(colModelBase[i]['intType'] == 4){
												formaterFn = formaters.undatetimeFormatter;
										}
										obj['edittype'] = 'text';
										obj['unformat'] =  formaterFn;
										var rules = {};
										if(colModelBase[i]['isMustHave'] == '1'){
												rules['required'] = true;
										}
										obj['editrules'] = rules;

								}else if(colModelBase[i]['intType'] == 8){
										//主键类型
										obj['hidden'] = true;
										obj['editable'] = false;
								}else if(colModelBase[i]['intType'] == 5){
										//引用类型
										obj['width'] = 220;
										obj['edittype'] = 'custom';
										obj['editoptions'] = {
												custom_value : formaters.getType5ElementValue,
												custom_element : formaters.createType5Element
										};
										var modelBase = colModelBase[i];
										obj['formatter'] =  formaters.type5Formatter;
										obj['unformat'] =  formaters.untype5Formatter;
										obj['editrules'] = {
												custom: true,
												custom_func: function (val, nm, valref) {
														console.log('----------editrules--------->>>');
														if(modelBase.isEditable == '1' && modelBase.isMustHave=='1' && val == '|'){
																return [false, "请填写"+modelBase.strName+"!"];
														}
														return [true, ""];
												}
										};
								}else if(colModelBase[i]['intType'] == 17){
										//引用单选下拉
										obj['width'] = 220;
										obj['edittype'] = 'custom';
										obj['editoptions'] = {
												custom_value : formaters.getType17ElementValue,
												custom_element : formaters.createType17Element
										};
										var modelBase = colModelBase[i];
										obj['formatter'] =  formaters.type17Formatter;
										obj['unformat'] =  formaters.untype17Formatter;
										obj['editrules'] = {
												custom: true,
												custom_func: function (val, nm, valref) {
														console.log('----------editrules--------->>>');
														if(modelBase.isEditable == '1' && modelBase.isMustHave=='1' && val == '|'){
																return [false, "请填写"+modelBase.strName+"!"];
														}
														return [true, ""];
												}
										};
								}else if(colModelBase[i]['intType'] == 11){
										//固定下拉
										obj['edittype'] = 'select';
										obj['formatter'] = 'select';
										var arrSelectText = colModelBase[i]['strSelectText'].split(',');
										var arrSelectValue = colModelBase[i]['strSelectValue'].split(',');
										var strDefaultValue = colModelBase[i]['strDefaultValue'];
										var eo = {};
										for(var j=0;j<arrSelectValue.length;j++){
												eo[arrSelectValue[j]] = arrSelectText[j];
										}
										var vals = [];
										var firstItem = "";
										for(var key in eo){
												if(strDefaultValue != key){
														vals.push(key+":"+eo[key]);
												}else{
														firstItem = key+":"+eo[key];
												}
										}
										vals.splice(0,0,firstItem);
										obj['editoptions'] = {value:vals.join(";")};
								}else{
										obj['edittype'] = 'text';
										obj['editoptions'] = {size:20,maxlength:20};
										obj['editrules'] = {required:true};
								}
								modelRet.push(obj);
						}
						jqGridEdit.gridCommData[grid_selector]['emptyRow'] = emptyRow;
						console.log('--------------model inited----------------');
						console.log(modelRet);
						return modelRet;
				})(setting.colModelBase);

				//辅助函数
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
							$(".ui-jqgrid-htable").find('.ui-action-span').tooltip({container:'body'});
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
						url : url,//组件创建完成之后请求数据的url
						datatype : datatype,
						//height: 220,
						colNames : colNames,
						colModel : colModel,
						viewrecords : true,  // 显示总条数
						rowNum:10,
						height : height,
						shrinkToFit:false,
						autoScroll: true,
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
								$( grid_selector ).closest(".ui-jqgrid-bdiv").css({ 'overflow-x' : 'auto' });
							}, 0);
						},
						onSelectRow : function(rowId, iRow,iCol,e){
								if(rowId<=0)return;
								if(isSelect){
										if(onSelect != null){
												var rowDatas = $(grid_selector).jqGrid('getRowData', rowId);
												console.log('ondblClickRow', rowDatas);
												onSelect.call(this, rowDatas);
										}

								}
						},
						editurl: ""//nothing is saved
						//,caption: "分公司列表"
					});

					/*
						高亮显示错误项，经过部分修改，因为链接里面的版本可能跟我用的不一样
						https://stackoverflow.com/questions/5988767/highlight-error-cell-or-input-when-validation-fails-in-jqgrid
					*/
					if(!jqGridEdit.isGlobalInit){
							var originalCheckValues = $.jgrid.checkValues,
									originalHideModal = $.jgrid.hideModal,
									iColWithError = 0;
							$.jgrid.checkValues = function(val, valref, customobject, nam) {
									console.log("-------$.jgrid.checkValues-----------");
									console.log(val, valref, g, customobject, nam);
									var g=this;
									var tr,td,
											ret = originalCheckValues.call(this,val, valref, customobject, nam);
									if (!ret[0]) {
											tr = g.rows.namedItem(jqGridEdit.gridCommData[grid_selector]['editingRowId']);
											if (tr) {
													$(tr).children('td').children('input.editable[type="text"]').removeClass("input-warning");
													$(tr).children('td').find('div.btnGroupEditable').removeClass("input-warning");
													iColWithError = valref; // save to set later the focus
													//error_td_input_selector = 'tr#'+editingRowId+' > td:nth-child('+(valref+1)+') > input.editable[type="text"]:first';
													td = tr.cells[valref];
													if (td) {
															$(td).find('input.editable[type="text"]').addClass("input-warning");
															$(td).find('div.btnGroupEditable').addClass("input-warning");
													}
											}
									}
									return ret;
							};
							$.jgrid.hideModal = function (selector,o) {
									var input, oldOnClose, td,
											tr = $(grid_selector)[0].rows.namedItem(jqGridEdit.gridCommData[grid_selector]['editingRowId']);
									if (tr) {
											td = tr.cells[iColWithError];
											if (td) {
													input = $(td).children('input.editable[type="text"]:first');
													if (input.length > 0) {
															oldOnClose = o.onClose;
															o.onClose = function(s) {
																	if ($.isFunction(oldOnClose)) {
																			oldOnClose.call(s);
																	}
																	setTimeout(function(){
																			input.focus();
																	},100);
															};
													}
											}
									}
									originalHideModal.call(this,selector,o);
							};
							jqGridEdit.isGlobalInit = true;
					}



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
				//新增和修改 初始化引用和引用下拉辅助方法
				jqRefManager.init(jqGridEdit.gridCommData[grid_selector]['intTablePK'], jqGridEdit.gridCommData[grid_selector]['colModelBase']);
				var ids = jQuery(grid_selector).jqGrid('getDataIDs');
			  //获得当前最大行号（数据编号）
			  var rowid = Math.max.apply(Math,ids);
			  //获得新添加行的行号（数据编号）
		 		//var newrowid = rowid+1;
				var newrowid = 0;
				jqGridEdit.gridCommData[grid_selector]['editingRowId'] = newrowid;
				//editingRowId = editingRowId;
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
		actionDo : function(grid_selector, obj, oprate, rowId){
				$(obj).tooltip('close');
				console.log(oprate);
				console.log(rowId);
				if(oprate == "save"){
						/*
						var rowDatas = $(grid_selector).jqGrid('getRowData', rowId);
						console.log("rowDatas:---------------->");
						//console.log(rowDatas);
						var myac = "";//rowDatas['myac'];
						var op = "edit";
						if(myac == ""){
								op = "add";
						}
						*/
						var parameter = {
							url : jqGridEdit.gridCommData[grid_selector].editurl, //代替jqgrid中的editurl
							mtype : "POST",
							extraparam : { // 额外 提交到后台的数据
										//"op" : op
							 },
							successfunc : function(XHR) { //在成功请求后触发;事件参数为XHR对象，需要返回true/false;
									alert(XHR.responseText);//接收后台返回的数据
									$(grid_selector).trigger("reloadGrid");
									jqGridEdit.gridCommData[grid_selector]['editingRowId'] = -1;
							}
					 };
					jQuery(grid_selector).saveRow(rowId, parameter);
				}
				if(oprate == "delCancel"){
						$(grid_selector).jqGrid('delRowData',rowId);
						jqGridEdit.gridCommData[grid_selector]['editingRowId'] = -1;
				}
				if(oprate == "cancel"){
						//$('#grid-table').jqGrid('restoreRow',rowId);
						//var html =$(this).html();
						$(grid_selector).trigger("reloadGrid");
						jqGridEdit.gridCommData[grid_selector]['editingRowId'] = -1;
				}
				if(oprate == 'edit'){
					jqRefManager.init(jqGridEdit.gridCommData[grid_selector]['intTablePK'], jqGridEdit.gridCommData[grid_selector]['colModelBase']);
					jqGridEdit.gridCommData[grid_selector]['editingRowId'] = rowId;
					$(grid_selector).jqGrid('editRow',rowId,{
								keys : false,        //这里按[enter]保存
								url: "",
								mtype : "POST",
								restoreAfterError: true
						});
				}
		}

};
