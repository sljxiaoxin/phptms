//#######可能不满足带有表头和明细的单据，到时候再改，分表头和明细两部分处理
jqRefManager = {
		url : CONST.BASE_ROOT+"refmanager/getData",
		intTablePK : 0,
		colModel : null,    //字段为key模式
		refDatas : null,   //{strField:{el:元素对象,value:''}}
		intRefFieldCount : 0,   //引用字段总数
		intRefFieldCountLoaded : 0,
		loadEl : [],
		init : function(intTablePK, colModelBase){
				this.intTablePK = intTablePK;
				this.intRefFieldCount = 0;
				this.intRefFieldCountLoaded = 0;
				this.colModel = {};
				this.refDatas = {};
				this.loadEl = [];
				for(var i=0;i<colModelBase.length;i++){
						this.colModel[colModelBase[i]['strField']] = colModelBase[i];
						//if(colModelBase[i]['intType'] == '5' || colModelBase[i]['intType'] == '17'){
						if(colModelBase[i]['intType'] == '17' || colModelBase[i]['intType'] == '18'){
								this.refDatas[colModelBase[i]['strField']] = {
										el : null,
										value : '',
										isLoad : false
								};
								this.intRefFieldCount += 1;
						}

				}
		},
		//每个字段初始创建的时候调用
		load : function(el, strField, val){
				console.log("load:",strField);
				var fieldInfo = this.colModel[strField];
				//if(fieldInfo['intType']!= '5' && fieldInfo['intType']!= '17'){
				if(fieldInfo['intType']!= '17' && fieldInfo['intType']!= '18'){
						return;
				}
				this.refDatas[strField]['el'] = el;
				this.refDatas[strField]['value'] = val;
				this.intRefFieldCountLoaded += 1;
				if(fieldInfo['strRefTrigger'] == 'load'){
						this.loadEl.push(strField);
				}
				console.log("count is:",this.intRefFieldCountLoaded,"#",this.intRefFieldCount);
				if(this.intRefFieldCountLoaded == this.intRefFieldCount){
						this.loadDetail();
				}
		},
		loadDetail : function(){
				console.log("----------loadDetail--------------");
				for(var i=0;i<this.loadEl.length;i++){
						var strField = this.loadEl[i];
						this.loadOne('load', strField);
				}
		},
		//一个fieldload完成后，检测是否出发其他字段load
		loadCheck : function(triggerType, strTriggerField){
				var obj = this.refDatas;
				var self = this;
				$.each(obj,function(key, val){
						//if(!val['isLoad']){
								//检测是否是参数所属的出发字段
								if(self.colModel[key]['strRefTrigger'] == strTriggerField){
										if(triggerType == 'change'){
												self.refDatas[key]['value'] = '';
										}
										self.loadOne(triggerType, key);
								}
						//}
				});
		},
		//triggerType目前可能为：load / change :字段值change触发，置空也会进来触发后面的联动置空
		loadOne : function(triggerType, strField){
				var value = this.refDatas[strField]['value'];
				var intType = this.colModel[strField]['intType'];
				var self = this;
				$.post(this.url, {
						intTablePK : this.intTablePK,
						intType :  intType,
						strField : strField,
						strRefFilter : this.filterHelper(this.colModel[strField]['strRefFilter'])   //TODO 需要解析[]中的栏位为具体值带进去
				},function(result){
						console.log(strField,'loadOne result is :',result);
						if(result != '' && result != 'null'){
								var objResult = $.parseJSON(result);
								console.log(strField,'loadOne obj is :',objResult);
								jqRefManager.refDatas[strField]['isLoad'] = true;     //load过后标记
								if(intType == 17){
										//el元素设置值
										var html = ["<option value=''></option>"];
										for(var i=0;i<objResult.data.length;i++){
												var selected = "";
												var opVal =objResult.data[i][objResult['strValueField']];
												var opName =objResult.data[i][objResult['strShowField']];
												if(opVal == value){
														selected = "selected";
												}
												var itemHtml = "<option value="+opVal+" "+selected+">"+opName+"</option>";
												html.push(itemHtml);
										}
										var el = jqRefManager.refDatas[strField]['el'];   //select 或者点选 对象
										el.html(html.join(''));
										el.trigger("chosen:updated");
										console.log('html:',html);
								}else if(intType == 18){
										var html = [];
										var arrValue = value.split(",");
										for(var i=0;i<objResult.data.length;i++){
												var selected = "";
												var opVal =objResult.data[i][objResult['strValueField']];
												var opName =objResult.data[i][objResult['strShowField']];
												//if(opVal == value){
												console.log("-------------type18----------->>>",opVal,arrValue);
												if($.inArray(opVal.toString(), arrValue) >= 0){
														selected = "selected";
												}
												var itemHtml = "<option value="+opVal+" "+selected+">"+opName+"</option>";
												html.push(itemHtml);
										}
										var el = jqRefManager.refDatas[strField]['el'];   //select 或者点选 对象
										el.html(html.join(''));
										el.multiselect('rebuild');
										console.log('html:',html);
								}


								if(value != '' || triggerType == 'change'){
										jqRefManager.loadCheck(triggerType, strField);
								}
						}
				});
		},
		//每个字段change或者做值设定的时候调用，包括load的时候设置值也要调用
		change : function(strField, val){
				console.log("---------jqRefManager change-----------");
				console.log(strField);
				console.log(val);
				this.refDatas[strField]['value'] = val;   //先变更该字段值
				this.loadCheck('change', strField);									//然后触发联动
		},
		//过滤条件[]中的字段替换为目前的字段值
		filterHelper : function(strFilter){
				console.log("strFilter:",strFilter);
				if(strFilter == '' || strFilter == null){
						return '';
				}
				var arr = strFilter.split(";");
				var arrBack = [];
				for(var i=0;i<arr.length;i++){
						var arrDetail = arr[i].split("=");
						var val = $.trim(arrDetail[1]);
						var valLeft = val.substr(0,1);
						var valRight = val.substr(-1,1);
						var strField = val.substring(1,val.length-1);
						if(valLeft == '['){
								if(typeof this.refDatas[strField] != 'undefined'){
										arrBack.push(arrDetail[0]+" = '"+this.refDatas[strField]['value']+"'");
										continue;
								}
						}
						arrBack.push(arr[i]);
				}
				return arrBack.join(";");
		}
};
