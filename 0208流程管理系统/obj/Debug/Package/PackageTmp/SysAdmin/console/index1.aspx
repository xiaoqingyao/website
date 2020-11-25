<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index1.aspx.cs" Inherits="AllPower.WEB.SysAdmin.console.index1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>AllPower CMS -- 全能系统</title>
      <link href="../../sysadmin/lib/LigerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <script src="../../sysadmin/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>  
    <script src="../../sysadmin/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../../sysadmin/js/init.js"></script>
    <link href="../lib/style.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/style1.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript">
         var data0 = new Array();
         var data1 = new Array();
         var data2 = new Array();
         var data3 = new Array();
         var data4 = new Array();
         var data5 = new Array();
         var data6 = new Array();
         var data7 = new Array();
         var data8 = new Array();

         var leftWidth = 180;
         var rightWidth = 0;
         //初始化树
         function f_initTree()
         {
//         data.push({ text: '我的工作平台', treelevel: 1, isleaf: 0 });
//         data.push({ text: '我的工作平台', treelevel: 2, isleaf: 1, tabid: 'tree1', url: '../console/Main.aspx?NodeCode=108005&IsFirst=1' });
//             data.push({ text: '修改密码', treelevel: 2, isleaf: 1, tabid: 'showmessage1', url: '../SysManage/SysUserChangePassword.aspx?NodeCode=108001&IsFirst=1' });
//             data.push({ text: '公告', treelevel: 2, isleaf: 1, tabid: 'resize', url: '../Model/Messagelist.aspx?NodeCode=108004&IsFirst=1' });
//             data.push({ text: '内部短消息', treelevel: 2, isleaf: 1, tabid: 'drag', url: '../SysManage/MsgReceiveList.aspx?NodeCode=108003&IsFirst=1' });
       
// alert('<%= stringdata %>');
                <%= stringdata %>

            for(var i=1;i<7;i++)
            {
            if(i==1){
                 $("#tree"+i).ligerTree({
                     data: data0,
                     callback: function (item) {
                         if (!item.url || !item.tabid) return;
                         f_addTabItem(item.tabid, item.url,item.text);
                     }
                 });
                 }
                 
                  if(i==2){
                 $("#tree"+i).ligerTree({
                     data: data1,
                     callback: function (item) {
                         if (!item.url || !item.tabid) return;
                         f_addTabItem(item.tabid, item.url,item.text);
                     }
                 });
                 }
                 
                  if(i==3){
                 $("#tree"+i).ligerTree({
                     data: data2,
                     callback: function (item) {
                         if (!item.url || !item.tabid) return;
                         f_addTabItem(item.tabid, item.url,item.text);
                     }
                 });
                 }
                 
                  if(i==4){
                 $("#tree"+i).ligerTree({
                     data: data3,
                     callback: function (item) {
                         if (!item.url || !item.tabid) return;
                         f_addTabItem(item.tabid, item.url,item.text);
                     }
                 });
                 }
                 
                  if(i==5){
                 $("#tree"+i).ligerTree({
                     data: data4,
                     callback: function (item) {
                         if (!item.url || !item.tabid) return;
                         f_addTabItem(item.tabid, item.url,item.text);
                     }
                 });
                 }
                 if(i==6){
                 $("#tree"+i).ligerTree({
                     data: data5,
                     callback: function (item) {
                         if (!item.url || !item.tabid) return;
                         f_addTabItem(item.tabid, item.url,item.text);
                     }
                 });
                 }
                 if(i==7){
                 $("#tree"+i).ligerTree({
                     data: data6,
                     callback: function (item) {
                         if (!item.url || !item.tabid) return;
                         f_addTabItem(item.tabid, item.url,item.text);
                     }
                 });
                 }
                 if(i==8){
                 $("#tree"+i).ligerTree({
                     data: data7,
                     callback: function (item) {
                         if (!item.url || !item.tabid) return;
                         f_addTabItem(item.tabid, item.url,item.text);
                     }
                 });
                 }
                                  if(i==9){
                 $("#tree"+i).ligerTree({
                     data: data8,
                     callback: function (item) {
                         if (!item.url || !item.tabid) return;
                         f_addTabItem(item.tabid, item.url,item.text);
                     }
                 });
                 }
            }
         }
         function f_addTabItem(tabid, url, text)
         {
             $("body")[0].manager.addTabItem(tabid, url, text);
         }
         $(function ()
         {
             f_initTree();
             $.ligerFrame({ tabItems: [{ tabid: 'home', url: 'Main.aspx', text: '我的主页', showClose: false},{tabid: 'mytable', url: '../MyTable.aspx', text: '我的桌面', showClose: false}],
                 leftHeader: '系统菜单'
             }); 
         });  
         function f_closeWindow(frame)
         { 
             for (var i = 0; i < document.frames.length; i++)
             {
                 if (document.frames[i] == frame)
                 { 
                     $(".l-window[framename=" + document.frames[i].name + "]").remove();
                     return;
                 }
             }
         }
         function f_openWindow(url, title,width, height)
         {
             return $.ligerWindow.show({ width: width, height: height, left: 100, top: 100, title: title, url: url });
         }
         function f_open(url)
         {
             $.ligerWindow.show({ width: 300, height: 300,left:100,top:100, title: '我的标题', url: url });
         }
         function f_openWithContent(content)
         {
             var chtml = "<div style='padding:10px'>" + content + "</div>";
             $.ligerWindow.show({ width: 300, height: 300, left: 200, top: 200, title: '我的标题', content: chtml });
         }
         
            function f_addTabItem1(url, text)
        {
            var tabid = "ligerui" + new Date().toDateString();
            f_addTabItem(tabid, url,text);
        }
        
        function treecontent(number)
        {
            for(var i=0;i<3;i++)
            {
                if(number==i)
                    document.getElementById("treecontent"+i).style.display="block";
                else
                    document.getElementById("treecontent"+i).style.display="none";
            }
        }
       
     </script>
     
     
   
    <style type="text/css">
        body{ padding:0; margin:0; background:#E5EDEF;}
    </style>
</head>
<body>

<div class="wrap">
      <!-- head star-->
      <div class="l-frame-top" >
          <div class="head">    
	     <h1><img src="../images/logo1.png" width="260" height="28"/></h1>
         <div class="nav">
         	<ul class="navlist">
         	    <%=strNode%>
            	<%--<li  id="aa1" class="hover">我的工作台</li>
            	<li  id="aa2" >内容管理</li>
            	<li  id="aa3" >系统管理</li>--%>
            </ul>
         </div>
         <div class="rhead">
         <div class="admin">你好：<strong><%=GetLoginAccountName()%></strong>！<div style="padding-top:5px;">所属角色: <span class="oo"><%=strUserGrop%></span></div></div>
         <div class="admin2"> <a href="../logout.aspx"><img src="../images/zhuxiao.jpg" width="16" height="15" align="top" /> 注销</a> <a href="http://www.AllPower.com/feedback/index.asp"> <img src="../images/help.jpg" width="17" height="15" align="absmiddle" /> 帮助</a></div>
         
         </div>
         
   </div></div><!-- head over-->
		<div class="l-frame-main" >
    <div class="l-frame-left"> 
         <div class="l-frame-left-content" >
         <%=strNodes%>
         </div>
    </div>
</div>
<%--<div class="l-frame-footer">
<p><span style="float:right">Copyright &copy; 2012 AllPower.com All rights reserved.&nbsp;&nbsp;</span><span style="float:left">&nbsp;&nbsp;客服邮箱：<a href="mailto:support@AllPower.com" target="_blank">support@AllPower.com</a>&nbsp;&nbsp;&nbsp;服务网站：<a href="http://www.AllPower.com/" target="_blank">www.AllPower.com</a></span></p>

</div>--%>
</div>

</body>
</html>
