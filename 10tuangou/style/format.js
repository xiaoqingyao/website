// JScript 文件

var begin,end;
function format(txt_control_id){ //开始写入代码
    
	if((document.selection)&&(document.selection.type == "Text"))
	{
		var range = document.selection.createRange();
		var ch_text=range.text;
		range.text = begin + ch_text + end;
		var txt_control
		txt_control = document.getElementById(txt_control_id);
		txt_control.focus();
	}
	else {
		var txt_control
		txt_control = document.getElementById(txt_control_id);
		if(null!=txt_control)
		{
			txt_control.value =begin+txt_control.value+end;
			txt_control.focus();	
		}	
	}
}
function insert(txt_control_id,text){
	var range = document.selection.createRange();
	var ch_text=range.text;
	range.text = text;
	var txt_control
	txt_control = document.getElementById(txt_control_id);
	txt_control.focus();
}
function bold(txt_control_id) {
	begin="<B>";
	end="</B>";
	format(txt_control_id);
}
function center(txt_control_id) {
	begin="<div align=center>";
	end="</div>";
	format(txt_control_id);
}
function left(txt_control_id) {
	begin="<div align=left>";
	end="</div>";
	format(txt_control_id);
}
function right(txt_control_id) {
	begin="<div align=right>";
	end="</div>";
	format(txt_control_id);
}
function br(txt_control_id) {
	begin="";
	end="<br>";
	insert(txt_control_id);
}
function space(txt_control_id) {
	begin="";
	end="&nbsp;";
	insert(txt_control_id);
}
function italic(txt_control_id) {
	begin="<I>";
	end="</I>";
	format(txt_control_id);
}
function under(txt_control_id) {
	begin="<U>";
	end="</U>";
	format(txt_control_id);
}

function url(txt_control_id) {
	var txt_control;
	txt_control = document.getElementById(txt_control_id); 
	var arr = showModalDialog("/sender/editor_insertlink.php", "", "dialogWidth:31em; dialogHeight:12em; help: no; scroll: no; status: no");  
	if (arr != null && null!=txt_control){
		txt_control.focus();		
		var range = document.selection.createRange();
		var ss=arr.split("$$$");
		var ch_text=range.text;
		range.text="<a href='"+ss[0]+"' target='"+ss[2]+"'>"+ch_text+ss[1]+"</a>";
	}
}

function pic(group,txt_control_id,txt_subject_id){
	var txt_control
	txt_control = document.getElementById(txt_control_id); 
	txt_subject = document.getElementById(txt_subject_id); 
	var arr = showModalDialog("/sender/editor_insertpic.php?group_id="+group, "", "dialogWidth:620px; dialogHeight:360px; help: no; scroll: no; status: no");  
	if (arr != null && null!=txt_control){
		var ss=arr.split("|");
		var pos=txt_subject.value.search(/请填调查表：/)
		if(pos<0) pos=txt_subject.value.search(/视频：/)
		if(pos<0) pos=txt_subject.value.search(/文件：/)
		if(pos<0) pos=txt_subject.value.search(/图片：/)
		if(pos<0)	txt_subject.value=" 图片："+txt_subject.value;
		txt_control.focus();
		var range = document.selection.createRange();
		var ch_text=range.text;
		range.text=arr;
		txt_control.focus();
	}
}

function img(txt_control_id)
{
	var txt_control
	txt_control = document.getElementById(txt_control_id); 
	var arr = showModalDialog("/sender/editor_insertimgurl.php", "", "dialogWidth:30em; dialogHeight:15em; help: no; scroll: no; status: no");  

	if (arr != null && null!=txt_control){
		txt_control.focus();
		var range = document.selection.createRange();
		var ch_text=range.text;
		range.text=arr;
		txt_control.focus();
	}
}


function font(font,txt_control_id){
	begin="<font face="+font+">";
	end="</font>";
	format(txt_control_id);
}	
function newsize(size,txt_control_id){
	begin="<font size="+size+">";
	end="</font>";
	format(txt_control_id);
}
function newface(facenum,txt_control_id){
	var ToAdd = "[wdb" + facenum + "]";
		var txt_control
	txt_control = document.getElementById(txt_control_id);
	if(null!=txt_control)
	{
		txt_control.value+=ToAdd;
		txt_control.focus();
	}
}
function newcard(facenum,txt_control_id){
	var txt_control
	txt_control = document.getElementById(txt_control_id);
	if(null!=txt_control)
	{
		var reg  = new RegExp("card[0-9]{1,2}","gi");
		if(txt_control.value.match(reg)){
			txt_control.value=txt_control.value.replace(reg,"card"+facenum);
		}
		else{
			txt_control.value+="[card"+facenum+"]"
		}
		txt_control.focus();
	}
}
function foreColor(txt_control_id)
{
  var arr = showModalDialog("/sender/editor_selcolor.php", "", "dialogWidth:18.5em; dialogHeight:17.5em; help: no; scroll: no; status: no");
  if (arr != null){
	begin = "<font color="+arr+">";
	end="</font>";
	var txt_control
	txt_control = document.getElementById(txt_control_id);
	format(txt_control_id);
  }
}
function nnpic(group)
{
	openDialog("/sender/uploadphoto_nn.php?group_id="+group,400,200);  
}
function openDialog(str,width,height)
{
	window.open(str,"","resizable=0,scrollbars=1,status=no,toolbar=no,location=no,menu=no,width="+width+",height="+height+",left=0,top=0")
}

function storeCursorPosition (elem) {
	if (elem.createTextRange) {
		elem.caretPos = document.selection.createRange().duplicate();
	}
}
function insertText (elem, text) {
	elem.focus();
	if (elem.createTextRange && elem.caretPos) {
		alert("aaaa");
		var caretPos = elem.caretPos;
		caretPos.text = caretPos.text.charAt(caretPos.text.length - 1) == ' ' ? text + ' ' : text;
	} else {
		alert("bbbbbbbbb");
		elem.value = elem.value + text;
	}
}

function swf(group,txt_control_id,txt_subject_id)
{
	var txt_control
	txt_control = document.getElementById(txt_control_id); 	
	txt_subject = document.getElementById(txt_subject_id); 
    var arr = showModalDialog("/sender/editor_insertflash.php?group_id="+group, "", "dialogWidth:33em; dialogHeight:19em; help: no; scroll: no; status: no"); 
	if (arr != null && null!=txt_control){
		txt_subject.value=txt_subject.value.replace(/文件：/,"视频：")
		txt_subject.value=txt_subject.value.replace(/图片：/,"视频：")
		var pos=txt_subject.value.search(/请填调查表：/)
		if(pos<0)   pos=txt_subject.value.search(/视频：/)
		if(pos<0)	txt_subject.value=" 视频："+txt_subject.value;		
		txt_control.focus();
		var range = document.selection.createRange();
		var ch_text=range.text;
		range.text=arr;
		txt_control.focus();
	}
}

function wmv(group,txt_control_id,txt_subject_id)
{
	var txt_control
	txt_control = document.getElementById(txt_control_id); 	
	txt_subject = document.getElementById(txt_subject_id); 
    var arr = showModalDialog("/sender/editor_insertmedia.php?group_id="+group, "", "dialogWidth:33em; dialogHeight:19em; help: no; scroll: no; status: no"); 
	if (arr != null && null!=txt_control){
		txt_subject.value=txt_subject.value.replace(/文件：/,"视频：")
		txt_subject.value=txt_subject.value.replace(/图片：/,"视频：")
		var pos=txt_subject.value.search(/请填调查表：/)
		if(pos<0)   pos=txt_subject.value.search(/视频：/)
		if(pos<0)	txt_subject.value=" 视频："+txt_subject.value;		
		txt_control.focus();
		var range = document.selection.createRange();
		var ch_text=range.text;
		range.text=arr;
		txt_control.focus();
	}
}


function rm(group,txt_control_id,txt_subject_id)
{
	var txt_control
	txt_control = document.getElementById(txt_control_id);
	txt_subject = document.getElementById(txt_subject_id); 
    var arr = showModalDialog("/sender/editor_insertrm.php?group_id="+group, "", "dialogWidth:33em; dialogHeight:19em; help: no; scroll: no; status: no"); 
	
	if (arr != null && null!=txt_control)
	{
		txt_subject.value=txt_subject.value.replace(/文件：/,"视频：")
		txt_subject.value=txt_subject.value.replace(/图片：/,"视频：")
		var pos=txt_subject.value.search(/请填调查表：/)
		if(pos<0)   pos=txt_subject.value.search(/视频：/)
		if(pos<0)	txt_subject.value=" 视频："+txt_subject.value
		txt_control.focus();
		var range = document.selection.createRange();
		var ch_text=range.text;
		range.text=arr;
		txt_control.focus();
	}

}
function attach(group,txt_control_id,txt_subject_id)
{
	var txt_control,txt_subject
	txt_subject = document.getElementById(txt_subject_id); 
	txt_control = document.getElementById(txt_control_id); 
    var arr = showModalDialog("/sender/editor_insertattach.php?group_id="+group, "", "dialogWidth:33em; dialogHeight:19em; help: no; scroll: no; status: no"); 
	if (arr != null && null!=txt_control)
	{
		txt_subject.value=txt_subject.value.replace(/图片：/,"文件：")
		var pos=txt_subject.value.search(/请填调查表：/)
		if(pos<0)   pos=txt_subject.value.search(/视频：/)
		if(pos<0) 	pos=txt_subject.value.search(/文件：/)
		if(pos<0)	txt_subject.value=" 文件："+txt_subject.value;
		txt_control.focus();
		var range = document.selection.createRange();
		var ch_text=range.text;
		range.text=arr;
		txt_control.focus();
	}
}
function vote(group,txt_control_id,txt_subject_id)
{
	var txt_control,txt_subject
	txt_subject = document.getElementById(txt_subject_id); 
	txt_control = document.getElementById(txt_control_id); 
    var arr = showModalDialog("/sender/editor_insertvote.php?group_id="+group, "", "dialogWidth:45em; dialogHeight:30em; help: no; scroll: no; status: no"); 
	if (arr != null && null!=txt_control)
	{
		txt_subject.value=txt_subject.value.replace(/图片：/,"请填调查表：")
		txt_subject.value=txt_subject.value.replace(/文件：/,"请填调查表：")
		txt_subject.value=txt_subject.value.replace(/视频：/,"请填调查表：")
		pos=txt_subject.value.search(/请填调查表：/);
		
		if(pos<0){txt_subject.value=" 请填调查表："+txt_subject.value;}
		txt_control.focus();
		var range = document.selection.createRange();
		var ch_text=range.text;
		range.text=arr;
		txt_control.focus();
	}
}

/**
 * 上传视频
 */
function focus_video(info, txt_control_id, txt_subject_id) {
	var txt_control = document.getElementById(txt_control_id);
	var txt_subject = document.getElementById(txt_subject_id); 
  
	var sUrl = 'http://upload.focus.cn/my_upload.php?';
	for (var i in info) {
		sUrl += '&' + i + '=' + info[i];
	}
	var info = modalDialog(sUrl, '上传视频', '400px', '400px');	
	if (info != null && null != txt_control) {
		var sPrefix = '视频：';
		if (txt_subject.value.match(/^\s*$/)) {
			txt_subject.value = sPrefix + info.title;
		}
		else {
			txt_subject.value = txt_subject.value.replace(/^(文件|图片|请填调查表)：/, sPrefix);
			if (txt_subject.value.indexOf(sPrefix) != 0) {
				txt_subject.value = sPrefix + txt_subject.value;
			}
		}
		txt_control.focus();
		document.selection.createRange().text = info.HTML;
		txt_control.focus();
	}

}
