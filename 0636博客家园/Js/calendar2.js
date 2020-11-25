 
var myC_x,myC_y;
var myC_timeset=null,myC_timeset1=null;
var divObj=null;
var inputName;
var myYearOfToday = new Date().getFullYear();
var myMonthOfToday = new Date().getMonth() + 1;
var myDayOfToday = new Date().getDate();
var myYearOfInputDate=null;
var myMonthOfInputDate=null;
var myDayOfInputDate=null;
function myCalendar()//构建对象
{    	
    var myDate=new Date();
	
    this.year=myDate.getFullYear();	
    this.month=myDate.getMonth()+1;	
    this.date=myDate.getDate();	
	
    this.format="yyyy-mm-dd";
	
    this.style=myStyle(1);
	　
    this.render=createCalendar;	
    this.input=createInput;	    	
}

function myStyle(num)//设置样式
{    	
    if(!num||isNaN(num))
    {    		
	    alert('参数不对,采用默认样式！');		
	    num=1;		
    }
    var style=new Array();	
	style.push(".c_week{background-color:#DfDfff;font-size:12px;width:140px;}");
	style.push(".c_ds{width:140px;font-size:12px;cursor:hand;}");
	style.push(".c_mover{background-color:#909EFF;}");
	style.push(".c_deco{color:#03c;text-decoration:underline;}");
	style.push(".c_deco2{color:#03c;text-decoration:none;}");
	style.push(".aa{color:#03c;}");
	style.push("label.gray{color:#ccc}");
	style.push(".c_move1{border:1px solid #5d5d5d;background-color:#f4f4f4;color:#909eff;font-size:12px}");
	style.push(".c_tit{background-color:#909EFF;width:140px;font-size:12px;color:white;cursor:default}");
	style.push(".c_cs{position:absolute;;border:1px solid #909eff;width:140px;left:0px;top:0px;z-index:9999;}");
	style.push(".c_shadow{position:absolute;left:0px;top:0px;font-family: Arial Black;font-size:50px;color:#d4d4d4;z-index:1;text-align:center;}");    	
	
    document.write("<style type='text/css'>");
	
    document.write(style.join(""));
	
    document.write("</style>");	    	
}

function createCalendar()
{    	
    var week=new Array('日','一','二','三','四','五','六');	
	
    document.write("<div class='c_cs' onselectstart='return false' oncontextmenu='return false' onmousedown='if(event.button==2)this.style.display=\"none\"' id='myC_div'><iframe id='ifrmLayer' style=\"width:100%; height:100%;\" scrolling=\"no\" frameborder=\"0\"></iframe><div class='c_shadow' ></div><div style='position:absolute;left:0px;top:0px;z-index:1'>");	
	
    //创建头部
    document.write("<table class='c_tit' id='myC_Top' onmousedown='myC_x=event.x-parentNode.parentNode.style.pixelLeft;myC_y=event.y-parentNode.parentNode.style.pixelTop;setCapture()' onmouseup='releaseCapture();' onmousemove='myCMove(this.parentElement.parentElement);'><tr><td width=10 onmouseover='this.style.color=\"black\"' onmouseout='this.style.color=\"\"' onclick='cutYear()' style='font-family: Webdings;cursor:hand;' title='减少年份'>7</td><td title='减少月份' onmouseover='this.style.color=\"black\"' onclick='cutMonth()' onmouseout='this.style.color=\"\"' width=10 style='font-family: Webdings;cursor:hand;'>3</td><td align=center style='border:solid 1px #909EFF;cursor:hand;' onmouseover=this.className='c_move1'; onmouseout=this.className='';divHidden(myC.parentElement.nextSibling); onclick='createyear("+this.year+",this);divShow(myC.parentElement.nextSibling);'></td><td align=center style='border:solid 1px #909EFF;cursor:hand;' onclick='createmonth("+this.month+",this);divShow(myC.parentElement.nextSibling)' onmouseover=this.className='c_move1'; onmouseout=this.className='';divHidden(myC.parentElement.nextSibling);></td><td  width=10 onmouseover='this.style.color=\"black\"' onmouseout='this.style.color=\"\"' onclick='addMonth()' style='font-family: Webdings;cursor:hand;' title='增加月份'>4</td><td width=10 style='font-family: Webdings;cursor:hand;' onmouseover='this.style.color=\"black\"' onmouseout='this.style.color=\"\"' onclick='addYear()' title='增加年份'>8</td></tr></table>");	
	
    //创建星期条目
    document.write("<table class='c_week'><tr>");	
    for(i=0;i<7;i++)
    document.write("<td align=center>"+week[i]+"</td>");
    document.write("</tr></table>");
	
    //创建日期条目
    document.write("<table class='c_ds' id='myC' cellspacing=2 cellpadding=0>");
    for(i=0;i<6;i++)
    {    		
	    document.write("<tr>");		
	    for(j=0;j<7;j++)
	        document.write("<td width=10% height=16 align=center onmouseover='c_mOver(this)' onmouseout='c_mOut(this)'></td>");
	    document.write("</tr>");
    }
    document.write("</table>");
	
    //关闭 今日
    document.write("<table class='c_ds' id='myClose' cellspacing=2 cellpadding=0>");
    document.write("<tr>");
    document.write("<td colspan='3' class='aa' onmouseover='this.className=\"c_deco\"' onmouseout='this.className=\"c_deco2\"' align='center' onclick='javascript:document.getElementById(inputName).value=getToday();myC_div.style.display=\"none\";myC.parentElement.nextSibling.innerHTML = \"\";'>今日</td>");
    document.write("<td colspan='3' class='aa'  onmouseover='this.className=\"c_deco\"' onmouseout='this.className=\"c_deco2\"' align='center' onclick='javascript:document.getElementById(\"myC_div\").style.display=\"none\";myC.parentElement.nextSibling.innerHTML = \"\";'>关闭</td>");
    document.write("</tr>");
    document.write("</table>");
	
    //建建水印
    document.write("</div>");
	
    //创建选择图层 year month
    document.write("<div style='position:absolute;left:0px;top:0px;z-index:1;' onmouseover=divShow(this) onmouseout=divHidden(this)></div>");   
    document.write("</div>");
    
    //显示日期
    showDate(this.year,this.month);
    myC_div.style.display='none';  
	
}
function getValue(obj,value)
{    	
    document.getElementById(obj).value = parseInt(myC_Top.cells[2].innerText)+"-"+parseInt(myC_Top.cells[3].innerText)+"-"+value;
    //eval(obj).value=parseInt(myC_Top.cells[2].innerText)+"-"+parseInt(myC_Top.cells[3].innerText)+"-"+value;	
}
function showDate(year,month)
{    	
    var myDate=new Date(year,month-1,1);	
    var today=new Date();	
    var day=myDate.getDay();	
    var length=new Array(31,30,31,30,31,30,31,31,30,31,30,31);	
    length[1]=((year%4==0)&&(year%100!=0)||(year%400==0))?29:28;	
	
    for(i=0;i<myC.cells.length;i++)
    {
        myC.cells[i].innerHTML="";
        myC.cells[i].className = "";
    }
    
    for(i=0;i<length[month-1];i++)
    {    		
	    var _dayHTML = new Array();
	    _dayHTML.push("<label width='100%' height='100%'");
	    if((i+1) == myDayOfToday && myYearOfToday == year && myMonthOfToday == month)
	    {
	        _dayHTML.push(" style='color:blue;cursor:hand'");  
	     
	    }
	    if((i+1) == myDayOfInputDate && myYearOfInputDate == year && myMonthOfInputDate == month)
	    {
	        _dayHTML.push(" EqualDayOfToday='true'"); 
	        myC.cells[i+day].className='c_mover';
	    }
	    _dayHTML.push(" onclick='if(this.innerText!=\"\")getValue(inputName,this.innerText);myC_div.style.display=\"none\";myC.parentElement.nextSibling.innerHTML =\"\";' >");
	    _dayHTML.push(i+1);
	    _dayHTML.push('</label>');
	    myC.cells[i+day].innerHTML=_dayHTML.join("");
	    //myC.cells[i+day].innerHTML=(i+1);
		//onmouseover='c_mOver(this)' onmouseout='c_mOut(this)' onclick='if(this.innerText!=\"\")getValue(inputName,this.innerText);myC_div.style.display=\"none\"'

	    if(new Date(year,month-1,i+1).getDay()==6||new Date(year,month-1,i+1).getDay()==0)
	    {    			
		    myC.cells[i+day].style.color='red';
	    }	        
    }
    for(i=0;i<day;i++)
    {
        var _month =month - 1;
        switch(_month)
        {
            case 0:_month=11;break;/*1月的上一个月份*/
            case 1:_month=0;break;/*2月的上一个月份*/
            default:_month = _month -1;break;
        }
        myC.cells[day-1-i].innerHTML="<label class=\"gray\" style='cursor:default; width:100%; height:100%;'>" +(length[_month]-(i)) + "</label>";
    }
    
	var _lastPos = length[month-1] + day -1 ;/*最后一个日期的下一个位置 index:0*/
	var _index =0;
	for(i=_lastPos;i<41;i++)
	{
	    _index ++;
        myC.cells[i+1].innerHTML="<label class=\"gray\" style='cursor:default; width:100%; height:100%;'>" + _index + "</label>";
	}
    myC_Top.cells[2].innerHTML=year+"年";	
    myC_Top.cells[3].innerHTML=month+"月";	
	
    with(myC.parentNode.previousSibling.style)
    {    		
	    pixelLeft=myC.offsetLeft;		
	    pixelTop=myC.offsetTop;		
	    height=myC.clientHeight;		
	    width=myC.clientWidth;	    		
    }
    myC.parentElement.parentElement.style.height=myC.parentElement.offsetHeight;	
    myC.parentElement.previousSibling.innerHTML=year;   	
}

//一些附加函数--------------------
//---------Begin-------------------
function c_mOver(obj)
{
    obj.className='c_mover';    	
}
function c_mOut(obj)
{
    if(obj.firstChild.getAttribute("EqualDayOfToday") !=null)
    {
        return;
    }  
    if(obj.className=='c_mover')obj.className=''; 	
}
function addYear()
{
    var year=parseInt(myC_Top.cells[2].innerText);
    var month=parseInt(myC_Top.cells[3].innerText);
    year++;
    showDate(year,month);    	
}
function addMonth()
{
    var year=parseInt(myC_Top.cells[2].innerText);
    var month=parseInt(myC_Top.cells[3].innerText);
    month++;
    if(month>12)
    {
	    month=1;
	    year++;    		
    }
    showDate(year,month);    	
}
function cutYear()
{
    var year=parseInt(myC_Top.cells[2].innerText);
    var month=parseInt(myC_Top.cells[3].innerText);
    year--;
    showDate(year,month);    	
}
function cutMonth()
{
    var year=parseInt(myC_Top.cells[2].innerText);
    var month=parseInt(myC_Top.cells[3].innerText);
    month--;
    if(month<1)
    {
	    month=12;
	    year--;
		
    }
    showDate(year,month);    	
}
function divS(obj)
{    	
    if(obj!=divObj)
    {    		
	    obj.style.backgroundColor="#909eff";		
	    obj.style.color='black';	
    }
    if(divObj!=null)
    {    		
	    divObj.style.backgroundColor='';		
	    divObj.style.color='';		
    }
    divObj=obj;
}

function divShow(obj)
{    	
    if(myC_timeset!=null)clearTimeout(myC_timeset);	
    obj.style.display='block';    	
}
function divHidden(obj)
{    	
    myC_timeset=window.setTimeout(function (){
	    obj.style.display='none'
    },500);
}
function createyear(year,obj)//创建年份选择
{    	
    var ystr = new Array();	
    var oDiv_y;	
    ystr.push("<table class='c_move1' style='position:absolute;left:0px;top:0px;z-index:1' cellspacing=0 cellpadding=2 width=" + (obj.offsetWidth + 4) + ">");
    ystr.push("<tr><td style='cursor:hand' onclick='createyear("+(year-20)+",myC_Top.cells[2])' align=center>上翻</td></tr>");
    for(i=year-10;i<year+10;i++)
    if(year==i)
        ystr.push("<tr style='background-color:#909eff'><td style='color:black;height:16px;cursor:hand' align=center onclick='myC_Top.cells[2].innerText=this.innerText;showDate("+i+",parseInt(myC_Top.cells[3].innerText));myC.parentElement.nextSibling.innerHTML=\"\"'>"+i+"年</td></tr>");
    else 
        ystr.push("<tr><td align=center style='cursor:hand' onmouseover=divS(this) onclick='myC_Top.cells[2].innerText=this.innerText;showDate("+i+",parseInt(myC_Top.cells[3].innerText));myC.parentElement.nextSibling.innerHTML=\"\"'>"+i+"年</td></tr>");
    ystr.push("<tr><td style='cursor:hand' onclick='createyear("+(year+20)+",myC_Top.cells[2])' align=center>下翻</td></tr>");
    ystr.push("</table>");
    ystr.push("<iframe id='ifrmLayerYear' style=\"height:315px;\" scrolling=\"no\" frameborder=\"0\" width=" + (obj.offsetWidth + 4) + "></iframe>");
	
    oDiv_y=myC.parentElement.nextSibling;
    oDiv_y.innerHTML='';
    oDiv_y.innerHTML=ystr.join("");
    oDiv_y.id="div_year";
	oDiv_y.style.display="block";
    showDiv(oDiv_y,obj.offsetTop+obj.offsetHeight,obj.offsetLeft);    	
}
function createmonth(month,obj)//创建月份选择
{    	
    var mstr = new Array();	
    var oDiv_m;	
    mstr.push("<table class='c_move1' style='position:absolute;left:0px;top:0px;z-index:1' cellspacing=0 cellpadding=2 width="+(obj.offsetWidth + 5)+">");	
    for(i=1;i<13;i++)
    if(month==i)
        mstr.push("<tr style='background-color:#909eff'><td style='color:black;height:16px;cursor:hand' align='center' onclick='myC_Top.cells[3].innerText=this.innerText;showDate(parseInt(myC_Top.cells[2].innerText),"+i+");myC.parentElement.nextSibling.innerHTML=\"\"'>"+i+"月</td></tr>");
    else 
        mstr.push("<tr><td align=center style='cursor:hand' onmouseover='divS(this)' onclick='myC_Top.cells[3].innerText=this.innerText;showDate(parseInt(myC_Top.cells[2].innerText),"+i+");myC.parentElement.nextSibling.innerHTML=\"\"'>"+i+"月</td></tr>");
    mstr.push("</table>");
    mstr.push("<iframe id='ifrmLayerMonth' style=\"height:175px;\" scrolling=\"no\" frameborder=\"0\" width=" + (obj.offsetWidth + 4) + "></iframe>");
    oDiv_m=myC.parentElement.nextSibling;
    oDiv_m.innerHTML='';
    oDiv_m.innerHTML=mstr.join("");
    oDiv_m.id="div_month";
    oDiv_m.style.display="block";
    showDiv(oDiv_m,obj.offsetTop+obj.offsetHeight,obj.offsetLeft);
}

function showDiv(obj,top,left)
{    	
    obj.style.pixelTop=top;	
    obj.style.pixelLeft=left;
}
function myCMove(obj)
{
    if(event.button==1)
    {    		
	    var X=obj.clientLeft;		
	    var Y=obj.clientTop;		
	    obj.style.pixelLeft=X+(event.x-myC_x);		
	    obj.style.pixelTop=Y+(event.y-myC_y);		
	    //window.status=myC_y;				
	    //window.status=obj.style.pixelTop;
    }
}
function showDiv2(obj)
{    	
    inputName=obj.id;	
    var e=obj;	
    var ot=getTop(e);	
    var ol=getLeft(e); 
    if(isContent)
    {
        myC_div.style.pixelTop=ot+e.offsetHeight - getTop(document.getElementById(contentID));
        myC_div.style.pixelLeft=ol - getLeft(document.getElementById(contentID));
    }       
    else
    {
        myC_div.style.pixelTop=ot+e.offsetHeight;	
        myC_div.style.pixelLeft=ol;
    }
		
    myC_div.style.display="block";	        
}
function hiddenDiv2()
{    	
    if(myC_div)
    {    		
	    var curActiveEle=document.activeElement;		
	    while(curActiveEle)
	    {    			
		    if(curActiveEle.id=='myC_div')
		    {    				
			    return ;
		    }
		    curActiveEle=curActiveEle.parentNode;
	    }
	    myC_div.style.display="none";
	    myC.parentElement.nextSibling.innerHTML = '';
    }
}
function showDateControl(obj)
{
    var myDate=new Date();	
    var __year=myDate.getFullYear();	
    var __month=myDate.getMonth()+1;
    if(checkDateOfYMD(obj.value))
    {
        var dateList = new Array();
        dateList = obj.value.split('-');
        if(isNaN(parseInt(dateList[0])) ||
            isNaN(parseInt(dateList[1]))||
            isNaN(parseInt(dateList[2])))
        {
            dateList = getToday().split('-');
        }
        __year = parseInt(dateList[0],10);
        __month = parseInt(dateList[1],10); 
        myYearOfInputDate = parseInt(dateList[0],10);
        myMonthOfInputDate = parseInt(dateList[1],10);
        myDayOfInputDate = parseInt(dateList[2],10);          
    }            	
    showDiv2(obj);
    showDate(__year,__month);
}
function createInput(name)
{    	
    myC_div.style.display='none';	
    document.write("<input type='text' name='"+name+"' size=20 onfocus='showDiv2(this)' > "); 
}

function getToday()
{    	
    var _date=new Date();	
    var _year=_date.getFullYear();	
    var _month=_date.getMonth()+1;	
    var _day=_date.getDate();	
	
    return _year+'-'+(_month)+'-'+_day;
}
//获取元素的纵坐标
function getTop(e){
    var offset=e.offsetTop;
    if(e.offsetParent!=null) offset+=getTop(e.offsetParent);
    return offset;
}
//获取元素的横坐标
function getLeft(e){
    var offset=e.offsetLeft;
    if(e.offsetParent!=null) offset+=getLeft(e.offsetParent);
    return offset;
}
function c_MouseClick()
{
    //window.status=window.event.srcElement.tagName + "/hello";
    if(myC_div)
    {    		
	    var curActiveEle=window.event.srcElement;		
	    while(curActiveEle)
	    {    			
		    if(curActiveEle.id=='myC_div' || curActiveEle.id==inputName || curActiveEle.tagName == "IMG")
		    {    				
			    return ;
		    }
		    curActiveEle=curActiveEle.parentNode;
	    }
	    myC_div.style.display="none";
	    myC.parentElement.nextSibling.innerHTML = '';
    }
}
function checkDateOfYMD(str)
{
    var re = new RegExp("^([0-9]{4})(-)([0-9]{1,2})(-)([0-9]{1,2})$");
	    var ar;
	    var res = true;
    	
	    if(str != '')
	    {
	        if ((ar = re.exec(str)) != null){
		        var i;
		        i = parseFloat(ar[2]);
		        // verify dd
		        if (i <= 0 || i > 31){
			        res = false;
		        }
		        i = parseFloat(ar[3]);
		        // verify mm
		        if (i <= 0 || i > 12){
			        res = false;
		        }
	        }
	        else
	        {
	            res = false;
	        }
	    }
	    else
	    {
	        return false;
	    }
	    return res;
}
document.attachEvent("onclick",c_MouseClick);
  
function getoffsetTop(e) 
{ 
    var t=e.offsetTop; 
    while(e=e.offsetParent) 
    { 
        t+=e.offsetTop; 
    }
    
    return t;
}
 
function getoffsetLeft(e) 
{ 
    var l=e.offsetLeft; 
    while(e=e.offsetParent) 
    { 
        l+=e.offsetLeft; 
    }
    return l;
}
 
function getPosition(e) 
{
    e = e || window.event;
    var cursor = {x:0, y:0};
    if (e.pageX || e.pageY) 
    {
        cursor.x = e.pageX;
        cursor.y = e.pageY;
    } 
    else 
    {
        var de = document.documentElement;
        var b = document.body;
        cursor.x = e.clientX + 
            (de.scrollLeft || b.scrollLeft) - (de.clientLeft || 0);
        cursor.y = e.clientY + 
            (de.scrollTop || b.scrollTop) - (de.clientTop || 0);
    }
    return cursor;
}
function checkDate(str)
{
    /*var re = new RegExp("^([0-9]{4})(-)([0-9]{1,2})(-)([0-9]{1,2})$");
	    var ar;
	    var res = true;
    	
	    if(str != '')
	    {
	        if ((ar = re.exec(str)) != null){
		        var i;
		        i = parseFloat(ar[2]);
		        // verify dd
		        if (i <= 0 || i > 31){
			        res = false;
		        }
		        i = parseFloat(ar[3]);
		        // verify mm
		        if (i <= 0 || i > 12){
			        res = false;
		        }
	        }
	        else
	        {
	            res = false;
	        }
	    }*/
	    return validateDate(str);
}
function validateDate()
{
     var iaMonthDays = [31,28,31,30,31,30,31,31,30,31,30,31]
     var iaDate = new Array(3)
     var year, month, day
     var result = true;
     var obj;
     if(arguments.length > 2 || arguments.length < 1)
     {
          alert('参数个数应为1或2个');
     }
     
     for(i = 0;i < arguments.length;i++)
     {
     
         var dateInput = arguments[i];
         var strValue = dateInput;
         var reg = /(^\s*)|(\s*$)/g;
         strValue = strValue.replace(reg, '');  
         dateInput = strValue;
         if(strValue.length == 0)
         {
                  continue;
         }               
         iaDate = dateInput.split("-")
         if (iaDate.length != 3 || iaDate[1].length > 2 || iaDate[2].length > 2 || iaDate[1].length < 1 || iaDate[2].length < 1)
         {
                  //obj = dateInput;
                  result = false;
                  break;
         }                   
         year = parseFloat(iaDate[0])
         month = parseFloat(iaDate[1])
         day=parseFloat(iaDate[2]) 
         if (year < 1900 || year > 2100)
         {
                  //obj = dateInput;
                  result = false;
                  break;
         }                 
         if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) iaMonthDays[1]=29;
         if (month < 1 || month > 12 || day < 1 || day > iaMonthDays[month - 1])
         {
                  //obj = dateInput;
                  result = false;
                  break;
         }
     }        
     if(result == false)
     { 
           event.returnValue = false; 
            return result;
     }
     else if(arguments.length == 2 )
     {
     //reFormatDateString(arguments[1].value) < reFormatDateString(arguments[0].value)
           if(arguments[1].value< arguments[0].value && arguments[1].value.length > 0 )
           {
                    alert('结束时间应该大于等于开始时间');
                    //arguments[0].select();
                    //arguments[0].focus();
                    event.returnValue = false; 
                    result = false;
           }
     }
     return result;
} 
var cal1; 
var CalendarContainerDivID = 'divCalenderContainer';
 
var HideID='';
 
function ShowCalender(txtID)
{
    var txt = document.getElementById(txtID);
    if(!checkDate(txt.value))
    {
        txt.value='';
    }
    cal1 = null;
     
    var container = document.getElementById(CalendarContainerDivID);
    if(container == null)
    { 
        container = document.createElement("DIV");
        container.id = CalendarContainerDivID;
        container.style.display = 'none';
        container.style.position = 'absolute';
        container.style.border = '0';
        container.style.zIndex = '1000';
        container.style.backgroundColor = 'Transparent';
        container.onmouseout = OnCalenderDivMouseOut;
        container.onmouseover = OnCalenderDivMouseOver;
        
        document.body.appendChild(container);
    }
    
    
    
    container.innerHTML = '';
     
    var ifrm = document.createElement("IFRAME");
    ifrm.frameborder = 0;
    ifrm.scrolling = 'no';
    ifrm.src = '';
    ifrm.style.position = 'absolute';
    ifrm.zIndex = 1000;
    container.appendChild(ifrm);
     
     
    container.style.top = getoffsetTop(txt) + txt.offsetHeight;
    container.style.left = getoffsetLeft(txt)

    if(txt.value != '')
    {
    
        var timeStrs = txt.value.split('-');
        cal1 = new YAHOO.widget.Calendar('cal1', CalendarContainerDivID, 
                    timeStrs[1] + '/' + timeStrs[0],
                    timeStrs[1] + '/' + timeStrs[2] + '/' + timeStrs[0]);    
    }
    else
    {
        cal1 = new YAHOO.widget.Calendar('cal1', CalendarContainerDivID);
    }
    
    cal1.title = '请选择日期：';
    cal1.bindTextBoxID = txtID;
    cal1.onSelect = SelectCalender;
    cal1.render();
     
    container.style.display = '';
    ifrm.top = 0;
    ifrm.left = 0;
    ifrm.height = document.getElementById('cal1').offsetHeight;
    ifrm.width = document.getElementById('cal1').offsetWidth;
}
 
function SelectCalender()
{
    var txt = document.getElementById(cal1.bindTextBoxID);
    
    var date1 = cal1.getSelectedDates()[0];
	var month = date1.getMonth() + 1;
	var day = date1.getDate();
	var year = date1.getYear();
	
	txt.value = year + '-' + month + '-' + day;
	
	var container = document.getElementById(CalendarContainerDivID);
    container.style.display = 'none';
}
 
function OnCalenderDivMouseOut()
{
    HideID = window.setTimeout(HideContainer, 500);
}

function OnCalenderDivMouseOver()
{
    window.clearTimeout(HideID);
    var container = document.getElementById(CalendarContainerDivID);
    container.style.display = '';
}

function HideContainer()
{
    var container = document.getElementById(CalendarContainerDivID);
    container.style.display = 'none';
}

