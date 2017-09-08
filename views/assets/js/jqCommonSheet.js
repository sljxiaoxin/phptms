jqCommonSheet = {
		op : 'add',    //操作类型，add / edit / info
		/*
			{
				TSO_PK : {
						tbl_sys_field表的那些字段
				},
				TSO_strSheetNo : {},
				TSO_intSubcompanyPK :{}
		}
		*/
		colModel : null,
		/*
			一、结构同cloModel，只取header部分
			二、表头字段因为要增加单个组件状态控制，如日期和引用类型，需要控制按钮和输入框状态，所以colHeader里需要记录各种按钮对象
				1、单输入组件，记录对象key名为：elInput
				2、引用和日期类型的组件：elGroup,elInput,elBtn
				3、引用单选和引用多选：elSelect
			三、组件当前状态字段：isDisabled
		*/
		colHeader : null,
		/*
			结构同cloModel，只取Detail部分，通过这个生成jqGrid 的colModel
		*/
		colDetail : null,
		/*
			存储公式，结构可以以后再设计,TODO
		*/
		colFormula : null,



		init : function(cfg){
				//1、初始化模型参数和数据参数
				//2、初始化表头区域
				//3、初始化明细区域
				//4、数据初始化，包括组件默认load数据和op = edit时的回显数据。
				//5、组件状态初始化，增加事件注册等处理。
		},

		oHeader : {
				data : null,    //{}  op == edit各组件值，由参数传进来
				/*
					初始化表头区域
				*/
				init : function(){
						//1、关联tpl模板中各组件元素到内存对象，组件事件注册和设置组件状态（如是否可修改，是否可点击）
						//2、初始化组件
						//	for  colHeader 按不同字段类型调用不同字段init
						//  initElement.x
				},
				initElement : {
						Type5 : function(){
								//引用类型组件关联到内存，事件注册，判断如果是disabled则不执行事件
								//如果op==add || op == edit初始化下拉类型的数据选择范围、
								//如果op == add 初始化下拉默认值，分公司默认值和日期控件默认日期
						},
						Type17 : function(){},
						Type18 : function(){},
						TypeDate : function(){},
						TypeInput : function(){},
						TypeSelect : function(){}
				},
				setValue : function(){
						//按不同字段类型调用不同的设置值
						//setType5Value
						//setType17Value
						//setType18value
						//setTypeDateValue
						//setTypeInputValue
				},
				setTypeValue : {
						Type5 : function(){},
						Type17 : function(){},
						Type18 : function(){},
						TypeDate : function(){},
						TypeInput : function(){},
						TypeSelect : function(){}
				},
				getValue : function(){
						//按不同字段类型获取不同类型返回值
				},
				getTypeValue : function(){
						Type5 : function(){},
						Type17 : function(){},
						Type18 : function(){},
						TypeDate : function(){},
						TypeInput : function(){},
						TypeSelect : function(){}
				}
		},
		oDetail : {
				/*
					初始化明细区域
				*/
				init : function(){

				}
		},
		getAllValues : function(){
				//获取当前表头和明细所有值
		},
		setDisabled : function(strFieldKey){

		},
		//return jqGrid的colModel
		makeJqGridModel : function(){

		}
};
