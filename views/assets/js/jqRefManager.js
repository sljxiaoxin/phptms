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
						if(colModelBase[i]['intType'] == '17'){
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
				if(fieldInfo['intType']!= '17'){
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
						var value = this.refDatas[strField]['value'];
						$.post(this.url, {
								intTablePK : this.intTablePK,
								strField : strField,
								strRefFilter : this.colModel[strField]['strRefFilter']
						},function(result){
								//TODO 元素置值
								console.log(strField,'loadDetail result is :',result);

								jqRefManager.refDatas[strField]['isLoad'] = true;
								//
								if(value != ''){
										jqRefManager.loadCheck(strField);
								}
						});

				}
		},
		//一个fieldload完成后，检测是否出发其他字段load
		loadCheck : function(strTriggerField){
				var obj = this.refDatas;
				var self = this;
				$.each(obj,function(key, val){
						if(!val['isLoad']){
								//检测是否是参数所属的出发字段
								if(self.colModel[key]['strRefTrigger'] == strTriggerField){
										self.loadOne(key);
								}
						}
				});
		},
		loadOne : function(strField){
				var value = this.refDatas[strField]['value'];
				$.post(this.url, {
						intTablePK : this.intTablePK,
						strField : strField,
						strRefFilter : this.colModel[strField]['strRefFilter']   //TODO 需要解析[]中的栏位为具体值带进去
				},function(result){
						//TODO 元素置值
						console.log(strField,'loadOne result is :',result);

						jqRefManager.refDatas[strField]['isLoad'] = true;
						//
						if(value != ''){
								jqRefManager.loadCheck(strField);
						}
				});
		},
		//每个字段change或者做值设定的时候调用，包括load的时候设置值也要调用
		change : function(strField, val){

		}
};
