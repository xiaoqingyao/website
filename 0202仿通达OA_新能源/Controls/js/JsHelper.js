Ext.namespace("JsHelper");

// 加载tab页时 需要的重绘操作
JsHelper.ExtTabDoLayout = function(o) {
	var tab = Ext.getCmp("Main_MasterPage_TabMain").getActiveTab();
	tab.add(o);
	tab.doLayout();
};

// 一般性的错误提示信息 msg:消息内容;animEl:从什么DOM飞出;fn:事件
JsHelper.ShowWarning = function(msg, animEl, fn) {
	Ext.Msg.show({
				title : '系统消息',
				msg : msg,
				buttons : Ext.Msg.OK,
				fn : fn,
				animEl : animEl,
				icon : Ext.MessageBox.WARNING
			});
}

// 系统出错提示信息 msg:消息内容;animEl:从什么DOM飞出;fn:事件
JsHelper.ShowError = function(msg, animEl, fn) {
	Ext.Msg.show({
				title : '系统错误',
				msg : msg,
				buttons : Ext.Msg.OK,
				fn : fn,
				animEl : animEl,
				icon : Ext.MessageBox.ERROR
			});
}

// 删除确认框 fn:事件;animEl:从什么DOM飞出
JsHelper.DelConfirm = function(fn, animEl) {
	Ext.Msg.show({
				title : '系统提示',
				msg : '确定要删除所选项吗?',
				buttons : Ext.Msg.YESNO,
				fn : fn,
				animEl : animEl,
				icon : Ext.MessageBox.QUESTION
			});
}
// 操作确认框  msg: 提示消息；fn:事件;animEl:从什么DOM飞出
JsHelper.Confirm = function(msg ,fn, animEl) {
	Ext.Msg.show({
				title : '系统提示',
				msg : msg,
				buttons : Ext.Msg.YESNO,
				fn : fn,
				animEl : animEl,
				icon : Ext.MessageBox.QUESTION
			});
}
// .Net Json序列化后的datetime ext无法识别 用此方法转化
JsHelper.DateFormat = function(date) {
	return eval("new " + date.substr(1, date.length - 2)).toLocaleString();
};
// Grid的Datetime字段转换 { header: "创建时间", dataIndex: 'CreateTime', renderer:
// JsHelper.dateRenderer() }
JsHelper.dateRenderer = function() {
	return function(v) {
		return JsHelper.DateFormat(v);
	};
};

// 获取排序List类型的array
JsHelper.GetFilterListData = function(r, idField, textField) {
	var resultArray = [];
	if (r) {
		var rlen = r.length;
		for (var i = 0; i < rlen; i++) {
			resultArray.push({
						id : r[i].get(idField),
						text : r[i].get(textField)
					});

		}
	}
	return resultArray;
};

// 金额格式化
JsHelper.MoneyFormat = function(v) {
	v = (Math.round((v - 0) * 100)) / 100;
	v = (v == Math.floor(v)) ? v + ".00" : ((v * 10 == Math.floor(v * 10)) ? v
			+ "0" : v);
	v = String(v);
	var ps = v.split('.');
	var whole = ps[0];
	var sub = ps[1] ? '.' + ps[1] : '.00';
	var r = /(\d+)(\d{3})/;
	while (r.test(whole)) {
		whole = whole.replace(r, '$1' + ',' + '$2');
	}
	v = whole + sub;
	if (v.charAt(0) == '-') {
		return '-' + v.substr(1);
	}
	return "" + v;
};
// 获取对象成员个数
JsHelper.GetObjectLength = function(o) {
	var i = 0;
	for (var c in o) {
		i++;
	}
	return i;
}
