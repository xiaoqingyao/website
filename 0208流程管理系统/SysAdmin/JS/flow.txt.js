(function($){
var myflow = $.myflow;

$.extend(true,myflow.config.rect,{
	attr : {
	r : 8,
	fill : '#F6F7FF',
	stroke : '#03689A',
	"stroke-width" : 2
}
});

$.extend(true,myflow.config.props.props,{
	name : {name:'name', label:'名称', value:'新建流程', editor:function(){return new myflow.editors.inputEditor();}},
	key : {name:'key', label:'标识', value:'', editor:function(){return new myflow.editors.inputEditor();}},
	desc : {name:'desc', label:'描述', value:'', editor:function(){return new myflow.editors.inputEditor();}}
});


$.extend(true,myflow.config.tools.states,{
	start : {
				showType: 'image',
				type : 'start',
				name : {text:'<<start>>'},
				text : {text:'开始'},
				img : {src : '../Images/48/start_event_empty.png',width : 30, height:30},
				attr : {width:32 ,heigth:32 },
				props : {
					text: {name:'text',label: '名称', value:'', editor: function(){return new myflow.editors.textEditor();}, value:'开始'}
				}},
			end : {showType: 'image',type : 'end',
				name : {text:'<<end>>'},
				text : {text:'结束'},
				img : {src : '../Images/48/end_event_terminate.png',width : 30, height:30},
				attr : {width:32 ,heigth:32 },
				props : {
					text: {name:'text',label: '名称', value:'', editor: function(){return new myflow.editors.textEditor();}, value:'结束'}
				}},
			'end-cancel' : {showType: 'image',type : 'end-cancel',
				name : {text:'<<end-cancel>>'},
				text : {text:'取消'},
				img : {src : '../Images/48/end_event_cancel.png',width : 30, height:30},
				attr : {width:32 ,heigth:32 },
				props : {
					text: {name:'text',label: '名称', value:'', editor: function(){return new myflow.editors.textEditor();}, value:'取消'},
					temp2: {name:'temp2', label : '原因指向', value:'', editor: function(){return new myflow.editors.selectEditor([{name:'未通过',value:1},{name:'中断任务',value:2}]);}}
				}},
			'end-error' : {showType: 'image',type : 'end-error',
				name : {text:'<<end-error>>'},
				text : {text:'错误'},
				img : {src : '../Images/48/end_event_error.png',width : 30, height:30},
				attr : {width:32 ,heigth:32 },
				props : {
					text: {name:'text',label: '名称', value:'', editor: function(){return new myflow.editors.textEditor();}, value:'错误'},
					temp2: {name:'temp2', label : '原因指向', value:'', editor: function(){return new myflow.editors.selectEditor([{name:'走向出错',value:1},{name:'系统异常',value:2}]);}}
				}},
			state : {showType: 'text',type : 'state',
				name : {text:'<<state>>'},
				text : {text:'状态'},
				img : {src : '../Images/48/task_empty.png',width : 30, height:30},
				props : {
					text: {name:'text',label: '名称', value:'', editor: function(){return new myflow.editors.textEditor();}, value:'状态'},
					temp2: { name: 'temp2', label: '选择', value: '', editor: function () { return new myflow.editors.selectEditor([{ name: '等待', value: 1 }, { name: '通过', value: 2 }, { name: '不通过', value: 3}]); } }
				}},
			fork : {showType: 'image',type : 'fork',
				name : {text:'<<fork>>'},
				text : {text:'分支'},
				img : {src : '../Images/48/gateway_parallel.png',width :30, height:30},
				attr : {width:32 ,heigth:32 },
				props : {
				    text: { name: 'text', label: '名称', value: '', editor: function () { return new myflow.editors.textEditor(); }, value: '分支' },
				    temp1: { name: 'temp1', label: '描述', value: '', editor: function () { return new myflow.editors.inputEditor(); },value:"两种类型:1.'与'执行，2.'或'执行" },
					temp2: { name: 'temp2', label: '类型', value: '', editor: function () { return new myflow.editors.selectEditor([{ name: '与', value: 1 }, { name: '或', value: 2}]); } }
				}},
			join : {showType: 'image',type : 'join',
				name : {text:'<<join>>'},
				text : {text:'合并'},
				img: { src: '../Images/48/gateway_exclusive.png', width: 30, height: 30},
				attr : {width:32 ,heigth:32 },
				props : {
					text: {name:'text', label: '名称', value:'', editor: function(){return new myflow.editors.textEditor();}, value:'合并'},
					temp1: {name:'temp1', label: '描述', value:'', editor: function(){return new myflow.editors.inputEditor();},value:'同步进行或异步进行'},
					temp2: { name: 'temp2', label: '类型', value: '', editor: function () { return new myflow.editors.selectEditor([{ name: '同步', value: 1 }, { name: '异步', value: 2}]); } }
				}},
			task : {showType: 'text',type : 'task',
				name : {text:'<<task>>'},
				text : {text:'任务'},
				img : {src : '../Images/48/task_empty.png',width :30, height:30},
				props : {
					text: {name:'text', label: '名称', value:'', editor: function(){return new myflow.editors.textEditor();}, value:'任务'},
					temp1: { name: 'temp1', label: '描述', value: '', editor: function () { return new myflow.editors.inputEditor(); }, value: '多少人执行，是否所有人必须执行还是某个人执行就可通过' },
					temp2: { name: 'temp2', label: '执行人数', value: '', editor: function () { return new myflow.editors.selectEditor([{ name: '1个', value: 1 }, { name: '2个', value: 2 }, { name: '3个', value: 3 }, { name: '4个', value: 4 }, { name: '5个', value: 5}]); } },
					temp3: { name: 'temp3', label: '状态', value: '', editor: function () { return new myflow.editors.selectEditor([{ name: '或', value: 1 }, { name: '与', value: 2 }]); } }
				}}
});
})(jQuery);