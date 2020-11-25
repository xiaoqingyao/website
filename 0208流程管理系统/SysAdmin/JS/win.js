// JavaScript Document
function alert(opt) {
    $.Dialog.showAlert(opt);    
}
function alertClose(opt, callback) {
	 $.Dialog.showAlert(opt,callback);
}

function selfconfirm(opt) {
	$.Dialog.showConfirm(opt,function(data){
		opt.fn(data.toString());
	});
}
function prompt(opt){
	$.Dialog.showPrompt(opt,function(data){
		if(data.toString()){
			opt.fn(data.toString());
		}else{
			opt.fn('null');
			}		
	});
}
function openframe(opt){
	$.Dialog.showAuto(opt);
}
var getStrRegExp=function(str){	
	str=str.replace(/&/g,'&amp;');
	str=str.replace(/</g,'&lt;');
	str=str.replace(/>/g,'&gt;');	
	str=str.replace(/'/g,'\'');
	str=str.replace(/"/g,'&quot;');
	str=str.replace(/\n/g,'<br />');
	return str;	
}
