<%@ Page Language="C#" AutoEventWireup="true" CodeFile="left.aspx.cs" Inherits="left" %>


<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <SCRIPT language=JavaScript src="Js/crossbrowser.js" type=text/javascript></SCRIPT>

<SCRIPT language=JavaScript src="Js/outlook.js" type=text/javascript>
</SCRIPT>

<SCRIPT>
  //create OutlookBar
  var o = new createOutlookBar('Bar',0,0,screenSize.width,screenSize.height,'#f7f7f7','blue');
  var p;
   p = new createPanel("f", "系统用户管理");
      p.addButton('images/main/top/menu/logo_01.gif','管理员添加','javascript:top.fs_main.location="edituser.aspx";setFrame();');
      p.addButton('images/main/top/menu/logo_01.gif','管理员管理','javascript:top.fs_main.location="listuser.aspx";setFrame();');
      
      p.addButton('images/main/top/menu/logo_06.gif','个人密码管理','javascript:top.fs_main.location="mod.aspx";setFrame();');
      
    o.addPanel(p);
   p = new createPanel("a", "学生管理");
      p.addButton('images/main/top/menu/logo_01.gif','学生添加','javascript:top.fs_main.location="xueshengxinxi_add.aspx";setFrame();');
      p.addButton('images/main/top/menu/logo_02.gif','学生查询','javascript:top.fs_main.location="xueshengxinxi_list.aspx";setFrame();');

   o.addPanel(p);
    p = new createPanel("a", "题库管理");
      p.addButton('images/main/top/menu/logo_01.gif','选择题添加','javascript:top.fs_main.location="xuanzeti_add.aspx";setFrame();');
      p.addButton('images/main/top/menu/logo_02.gif','选择题查询','javascript:top.fs_main.location="xuanzeti_list.aspx";setFrame();');
      p.addButton('images/main/top/menu/logo_01.gif','填空题添加','javascript:top.fs_main.location="tiankongti_add.aspx";setFrame();');
      p.addButton('images/main/top/menu/logo_02.gif','填空题查询','javascript:top.fs_main.location="tiankongti_list.aspx";setFrame();');
      p.addButton('images/main/top/menu/logo_01.gif','判断题添加','javascript:top.fs_main.location="panduanti_add.aspx";setFrame();');
      p.addButton('images/main/top/menu/logo_02.gif','判断题查询','javascript:top.fs_main.location="panduanti_list.aspx";setFrame();');
   o.addPanel(p);
   p = new createPanel("b", "试卷管理");
      p.addButton('images/main/top/menu/logo_05.gif','试卷生成','javascript:top.fs_main.location="shijuanshengcheng_add.aspx";setFrame();');
      p.addButton('images/main/top/menu/logo_06.gif','试卷管理','javascript:top.fs_main.location="shijuanshengcheng_list.aspx";setFrame();');
   o.addPanel(p);
   p = new createPanel("b", "成绩管理");
      p.addButton('images/main/top/menu/logo_05.gif','成绩管理','javascript:top.fs_main.location="cj2.aspx";setFrame();');
     // p.addButton('images/main/top/menu/logo_06.gif','分类报表','javascript:top.fs_main.location="Vcd_Report_R.aspx";setFrame();');
   o.addPanel(p);
   
    p = new createPanel("b", "系统管理");
      p.addButton('images/main/top/menu/logo_13.gif','数据备份','javascript:top.fs_main.location="databack.aspx";setFrame();');
      
   o.addPanel(p);

 o.draw();         //draw the OutlookBar

 // top.fs_main.setyou.cols="150,10,*,10,0";

//-----------------------------------------------------------------------------
//functions to manage window resize
//-----------------------------------------------------------------------------
//resize OP5 (test screenSize every 100ms)
function resize_op5() {
  o.showPanel(0);
  if (bt.op5) {
    o.showPanel(o.aktPanel);
    var s = new createPageSize();
     if (s.height>200){
       o.resize(0,0,s.width,s.height);
     }

    if ((screenSize.width!=s.width) || (screenSize.height!=s.height)) {
      screenSize=new createPageSize();
      //need setTimeout or resize on window-maximize will not work correct!
      //ben鰐ige das setTimeout oder das Maximieren funktioniert nicht richtig
      setTimeout("o.resize(0,0,screenSize.width,screenSize.height)",100);
    }
    setTimeout("resize_op5()",100);
  }
}

//resize IE & NS (onResize event!)
function myOnResize() {
  if (bt.ie4 || bt.ie5 || bt.ns5) {
    var s=new createPageSize();
     if (s.height>200){
	    o.resize(0,0,s.width,s.height);
	}
  }
  else
    if (bt.ns4) location.reload();
}
function Test()
{
   alert(top.bottomFrame.cols);
  if(top.bottomFrame.cols="150,10,*"){
     top.bottomFrame.cols="0,10,*";
  }
}
</SCRIPT>
<SCRIPT language=javascript>
//显示/隐藏左边帧( 默认情况下为显示左边帧 2003.4 )
var currentChoice = true;
function setFrame(){
//alert (top.fs_main.news.cols);
	if(currentChoice){
		if (parent.setyou.cols=="150,10,*,10,198"){
			parent.setyou.cols="150,10,*,10,0";
			//document.img1.src=arrow2.src;
			//document.img1.alt="显示菜单";
		}
	}
}
setFrame();
</SCRIPT>
</head>
<BODY onmousewheel=Onwheel() onresize=myOnResize(); onload=resize_op5();></BODY>
    <style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>
</html>
