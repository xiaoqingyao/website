// JScript 文件
var highlightcolor = '#edfee6';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement ? event.srcElement : event.target;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentNode;
source=source.parentNode;
cs  =  source.children;
if(cs[1]!=null)
{
    if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
    for(i=0;i<cs.length;i++){
        cs[i].style.backgroundColor=highlightcolor;
    }
}
}

function  changeback(){
if(document.all)
{
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return;
}
else
{
if  (source.id=="nc")
return;
}
if(cs!=null&&cs[1]!=null)
{
    if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
    for(i=0;i<cs.length;i++){
	    cs[i].style.backgroundColor="";
    }
}
}

if(!document.all)
tab_color_onload();
function tab_color_onload()
{
    if(document.readyState == "complete")
    {
        document.getElementById("GridView1").style.border="1px solid #B5D6E6";
    }
    else
    {
        setTimeout('tab_color_onload()',0);
    }
}

/*firefox*/ 
function __firefox(){ 
    HTMLElement.prototype.__defineGetter__("runtimeStyle", __element_style); 
    window.constructor.prototype.__defineGetter__("event", __window_event); 
    Event.prototype.__defineGetter__("srcElement", __event_srcElement); 
} 
function __element_style(){ 
    return this.style; 
} 
function __window_event(){ 
    return __window_event_constructor(); 
} 
function __event_srcElement(){ 
    return this.target; 
} 
function __window_event_constructor(){ 
    if(document.all){ 
        return window.event; 
    } 
    var _caller = __window_event_constructor.caller; 
    while(_caller!=null){ 
        var _argument = _caller.arguments[0]; 
        if(_argument){ 
            var _temp = _argument.constructor; 
            if(_temp.toString().indexOf("Event")!=-1){ 
                return _argument; 
            } 
        } 
        _caller = _caller.caller; 
    } 
    return null; 
} 
if(window.addEventListener){ 
    __firefox(); 
} 
/*end firefox*/ 