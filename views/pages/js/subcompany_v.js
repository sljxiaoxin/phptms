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

			//dataGrid初始化
			$(grid_selector).jqGrid({
				data: grid_data,
				datatype: "local",
				height: 250,
				colNames:[' ', 'ID','Last Sales','Name', 'Stock', 'Ship via','Notes'],
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
					{name:'name',index:'name', width:150,editable: true,editoptions:{size:"20",maxlength:"30"}},
					{name:'stock',index:'stock', width:70, editable: true,edittype:"checkbox",editoptions: {value:"Yes:No"},unformat: aceSwitch},
					{name:'ship',index:'ship', width:90, editable: true,edittype:"select",editoptions:{value:"FE:FedEx;IN:InTime;TN:TNT;AR:ARAMEX"}},
					{name:'note',index:'note', width:150, sortable:false,editable: true,edittype:"textarea", editoptions:{rows:"2",cols:"10"}}
				],

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

				editurl: "../dummy.php",//nothing is saved
				caption: "分公司列表"

			});
			$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size



			//enable search/filter toolbar
			//$(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
			//$(grid_selector).filterToolbar({});


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
				setTimeout(function(){
					$(cell) .find('input[type=text]')
						.datepicker({format:'yyyy-mm-dd' , autoclose:true});
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
	});
