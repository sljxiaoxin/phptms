		$(function($) {
			var grid_selector = "#grid-table";
			var pager_selector = "#grid-pager";


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
			function formatOptions(cellValue, options, rawObject){
				  console.log("--------------formatOptions-------------------");
					console.log("cellValue",cellValue);
					console.log("options",options);
					console.log("rawObject",rawObject);
					var arrButtons = [];
					if(cellValue == ""){
							arrButtons.push('<div title="保存" style="float:left;cursor:pointer;" class="ui-pg-div ui-inline-edit" onclick="actionDo(this,\'save\',\'' + options.rowId + '\')"><span class="ui-icon ui-icon-disk"></span></div>');
							arrButtons.push('<div title="取消" style="float:left;cursor:pointer;" class="ui-pg-div ui-inline-edit" onclick="actionDo(this,\'delCancel\',\'' + options.rowId + '\')"><span class="ui-icon ui-icon-cancel"></span></div>');
					}else{
						arrButtons.push('<div opType="edit" title="编辑" style="float:left;cursor:pointer;" class="ui-pg-div ui-inline-edit" onclick="actionDo(this,\'edit\',\'' + options.rowId + '\')"><span class="ui-icon ui-icon-pencil"></span></div>');
						arrButtons.push('<div opType="del" title="删除" style="float:left;cursor:pointer;" class="ui-pg-div ui-inline-edit" onclick="actionDo(this,\'del\',\'' + options.rowId + '\')"><span class="ui-icon ui-icon-trash"></span></div>');
						//arrButtons.push('<button class="btn btn-white btn-warning btn-bold"><i class="ace-icon fa fa-trash-o bigger-120 orange"></i>Delete</button>');

					}
					arrButtons.push("<input type='hidden' value='"+options.rowId+"'>");
					return arrButtons.join("&nbsp;&nbsp;");
		}

		function unformatOptions(cellvalue, options, cell){
				console.log("---------unformatOptions-------------");
				console.log("cellvalue:",cellvalue);
				console.log(cell.innerHTML);
				var val = $(cell).find("input:hidden").val();
				var elEdit = $(cell).find("div[opType='edit']");
				var elDel = $(cell).find("div[opType='del']");
				console.log("elEdit:",elEdit.html());
				console.log("val= ",val);
				console.log("rowId",options.rowId);
				//$(cell).html("");
				elEdit.html('<span class="ui-icon ui-icon-disk"></span>');
				elEdit.attr("onclick","actionDo(this,'save'," + options.rowId + ")");
				elEdit.attr("data-original-title","保存");
				elEdit.tooltip('hide');
				elDel.html('<span class="ui-icon ui-icon-cancel"></span>');
				elDel.attr("onclick","actionDo(this,'cancel'," + options.rowId + ")");
				elDel.attr("data-original-title","取消");
				elDel.tooltip('hide');
				return val;
		}
			//dataGrid初始化
			$(grid_selector).jqGrid({
				data: grid_data,
				datatype: "local",
				height: 250,
				colNames:['<input type="button" value="新增" onclick="addRow()" />', 'PK','名称','联系人','日期'],
				colModel :[
						{name:'myac',index:'myac', width:80, fixed:true, sortable:false, resize:false,
							formatter:formatOptions,
							unformat : unformatOptions
							/*
							editoptions: {
									 custom_value: getOptionsElementValue,
									 custom_element: createOptionsEditElement
							 }
							 */
							/*formatter:'actions',
							formatoptions:{
								keys:true,
								delOptions:{recreateForm: true, beforeShowForm:beforeDeleteCallback},
								delbutton: true,
								editbutton:true,
								editformbutton:false   //弹出dialog
							}*/
						},
						{name:'PK',index:'PK', width:60, sorttype:"int", editable: false,hidden:true, valueType : 1},
						{name:'strName',index:'strName', width:150,editable: true,edittype: "custom",
						editoptions: {
													 custom_value: getFreightElementValue,
													 custom_element: createFreightEditElement
											 },
						formatter:freightFormatter,
						unformat:unfreightFormatter,
						valueType : 5
						},
						{name:'strLinkMan',index:'strLinkMan', width:150,editable: true,edittype: "text",
						editoptions: {size:10,maxlength:20},
						valueType : 2
						},
						{name:'sdate',index:'sdate',width:90, editable:true, sorttype:"date",unformat: pickDate, valueType:3}

				],
				/*
				colModel:[
					{name:'myac',index:'', width:80, fixed:true, sortable:false, resize:false,
						formatter:'actions',
						formatoptions:{
							keys:true,
							//delbutton: false,//disable delete button

							delOptions:{recreateForm: true, beforeShowForm:beforeDeleteCallback}
						}
					},
					{name:'id',index:'id', width:60, sorttype:"int", editable: false},
					{name:'sdate',index:'sdate',width:90, editable:true, sorttype:"date",unformat: pickDate},
					{name:'name',index:'name', width:150,editable: true,edittype: "custom",
					editoptions: {
												 custom_value: getFreightElementValue,
												 custom_element: createFreightEditElement
										 },
					valueType : 5
					},
					{name:'stock',index:'stock', width:70, editable: true,edittype:"checkbox",editoptions: {value:"Yes:No"},unformat: aceSwitch},
					{name:'ship',index:'ship', width:90, editable: true,edittype:"select",editoptions:{value:"FE:FedEx;IN:InTime;TN:TNT;AR:ARAMEX"}},
					{name:'note',index:'note', width:150, sortable:false,editable: true,edittype:"textarea", editoptions:{rows:"2",cols:"10"}}
				],
				*/

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
						updatePagerIcons(table);
						enableTooltips(table);
					}, 0);
				},
				editurl: "../dummy.php"//nothing is saved
				//,caption: "分公司列表"

			});
			$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size



			//enable search/filter toolbar
			//$(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
			//$(grid_selector).filterToolbar({});
			function freightFormatter(cellvalue, options, rowObject){
					console.log(cellvalue);
					console.log(options);
					console.log(rowObject);
					if(cellvalue == ""){
						var textValue = '';
						var realValue = '';
					}else{
						var arrValues = cellvalue.split('|');
						var textValue = arrValues[1];
						var realValue = arrValues[0];
					}

					return "<span pk='"+realValue+"'>"+textValue+"</span>";//"<span>"+textValue+"</span><input type='hidden' value='"+realValue+"'>aa";
			}
			function unfreightFormatter(cellvalue, options, cell){
					console.log("***********unfreightFormatter*************");
					console.log(cellvalue);
					console.log(options);
					console.log(cell.innerHTML);
					//var rowDatas = $(grid_selector).jqGrid('getRowData', 1);
					//console.log(rowDatas);
					var textValue = $(cell).find("span").html();
					var realValue = $(cell).find("span").attr("pk");
					return realValue+"|"+textValue;
			}
			function createFreightEditElement(value, editOptions) {
					console.log('###################createFreightEditElement###################');
					console.log(value);
					console.log(editOptions);
					var columnArray = $(grid_selector).jqGrid('getGridParam','colModel');
					var obj = null;
					for(var i=0;i<columnArray.length;i++){
							if(columnArray[i].name == editOptions.name){
									obj = columnArray[i];
							}
					}
					console.log(obj.valueType);
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
					/*
					var html = '<div style="width:200px;" class="input-group date" id="clientNo">';
						  html += '<input type="text"  class="form-control input-sm" />';
						  html += '<span class="input-group-addon">';
							html += '<span class="glyphicon glyphicon-search"></span></span></div>';
					span.append(html);
					*/
					return span;


					/*
          var span = $("<span />");
          var label = $("<span />", { html: "0" });
          var radio = $("<input>", { type: "radio", value: "0", name: "freight", id: "zero", checked: (value != 25 && value != 50 && value != 100) });
          var label1 = $("<span />", { html: "25" });
          var radio1 = $("<input>", { type: "radio", value: "25", name: "freight", id: "fifty", checked: value == 25 });
          var label2 = $("<span />", { html: "50" });
          var radio2 = $("<input>", { type: "radio", value: "50", name: "freight", id: "fifty", checked: value == 50 });
          var label3 = $("<span />", { html: "100" });
          var radio3 = $("<input>", { type: "radio", value: "100", name: "freight", id: "hundred", checked: value == 100 });
          span.append(label).append(radio).append(label1).append(radio1).append(label2).append(radio2).append(label3).append(radio3);
          return span;
					*/
      }

			function getFreightElementValue(elem, oper, value) {
					console.log('-----------getFreightElementValue-----------------');
					console.log(elem, oper, value);
          if (oper === "set") {
              var radioButton = $(elem).find("input:radio[value='" + value + "']");
              if (radioButton.length > 0) {
                  radioButton.prop("checked", true);
              }
          }

          if (oper === "get") {
							var textValue = $(elem).find("input:text").val();
							var realValue = $(elem).find("input:hidden").val();
              return realValue+"|"+textValue;
          }
      }

			//switch element when editing inline
			function aceSwitch( cellvalue, options, cell ) {
				///*
				setTimeout(function(){
					$(cell) .find('input[type=checkbox]')
						.addClass('ace ace-switch ace-switch-5')
						.after('<span class="lbl"></span>');
				}, 0);
				//*/
			}
			//enable datepicker
			function pickDate( cellvalue, options, cell ) {
				//console.log(cellvalue, options, cell);
				setTimeout(function(){
					$(cell).find('input[type=text]').datepicker({format:'yyyy-mm-dd' , autoclose:true});
				}, 0);
			}

			function style_delete_form(form) {
				var buttons = form.next().find('.EditButton .fm-button');
				buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
				buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
				buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
			}

			function beforeDeleteCallback(e) {
				//alert(1);
				var form = $(e[0]);
				if(form.data('styled')) return false;

				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
				style_delete_form(form);

				form.data('styled', true);
			}

			//replace icons with FontAwesome icons like above
			function updatePagerIcons(table) {
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
			}

			function enableTooltips(table) {
				$('.navtable .ui-pg-button').tooltip({container:'body'});
				$(table).find('.ui-pg-div').tooltip({container:'body'});
			}

			//var selr = $(grid_selector).jqGrid('getGridParam','selrow');

			$(document).one('ajaxloadstart.page', function(e) {
				$.jgrid.gridDestroy(grid_selector);
				$('.ui-jqdialog').remove();
			});

			$("#btn_getall").click(function(){
					var rowDatas = $(grid_selector).jqGrid('getRowData');
					console.log("-----------rowDatas--------------");
					console.log(rowDatas);
			});


	});

	function addRow()
	{
	 var ids = jQuery("#grid-table").jqGrid('getDataIDs');
	 //获得当前最大行号（数据编号）
	 var rowid = Math.max.apply(Math,ids);
	 //获得新添加行的行号（数据编号）
	 var newrowid = rowid+1;
			var dataRow = {
			 myac:"",
			 PK: "",
			 strName:"",
			 strLinkMan:'',
			 sdate:''
			};

			//将新添加的行插入到第一列
			$("#grid-table").jqGrid("addRowData", newrowid, dataRow, "first");
			//设置grid单元格不可编辑
			$("#grid-table").setGridParam({cellEdit:false});
			//设置grid单元格可编辑
			$("#grid-table").jqGrid('editRow', newrowid, false);
			//确定按钮可用
		 // $("#confirm_btn").attr("disabled",false);
			//给添加的列加选择按钮
		 // var $zoneInput = $("#"+newrowid+"_zoneName");
		 // $zoneInput.attr("disabled",true).css("width",100);
		//	$zoneInput.after("<input type='button' value='选择' onclick='fnCallDialogForEidt()' />");

	}

	function actionDo(obj, oprate, rowId){
			console.log("actionDo:",oprate,",",rowId);
			$(obj).tooltip('hide');
			if(oprate == "delCancel"){
					$('#grid-table').jqGrid('delRowData',rowId);
			}
			if(oprate == "cancel"){
					//$('#grid-table').jqGrid('restoreRow',rowId);
					//var html =$(this).html();
					$("#grid-table").trigger("reloadGrid");
			}
			if(oprate == 'edit'){
				$('#grid-table').jqGrid('editRow',rowId,{
							keys : false,        //这里按[enter]保存
							url: "",
							mtype : "POST",
							restoreAfterError: true,
							extraparam: {
									"ware.id": rowId,
									"ware.warename": "aa",
									"ware.createDate": "bb",
									"ware.number": '2',
									"ware.valid": 'cc'
							},
							oneditfunc: function(rowid){
									console.log("oneditfunc:",rowid);
							},
							succesfunc: function(response){
									alert("save success");
									return true;
							},
							errorfunc: function(rowid, res){
									console.log(rowid);
									console.log(res);
							}
					});
			}

	}
