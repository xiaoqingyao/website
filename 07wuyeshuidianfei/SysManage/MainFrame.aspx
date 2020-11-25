<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainFrame.aspx.cs" Inherits="SysManage_MainFrame" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>社区水电费管理信息系统</title>
    <link href="css/style.css" type="text/css" rel="stylesheet" />
    <link href="css/style_left.css" type="text/css" rel="stylesheet" />
    <script language="javaScript" src="js/menu.js" type="text/javascript"></script>
<style type="text/css">
<!--
ul{margin:0px;padding:0px;}
li{list-style-type:none;}
td{font-size: 12px;}
a{color: #135294;text-decoration: none;cursor: pointer;}
a:hover{color: #ff6600;text-decoration: underline;}
body
{
	font-size:12px;
	margin:0;
	color: #333;
	font-family: tahoma, 宋体, fantasy;
}
.main_left_top
{
	background: url(images/left_menu_bg.gif);
}
.main_left_title
{
	font-weight: bold;
	font-size:14px;
	color: #333;
	text-align: center;
}

#menubar ul{margin:0px;}
#menubar ul li
{
	float:left;margin:0;
	padding:0px 0 0px 0;
}
#menubar a
{
	display: block;
	padding-left:10px;
	float:left;
	margin:0px;
	width:165px!important;
	width:186px;
	color:#0650A5;
	padding-top:5px;
	height:20px!important;
	height:22px;
	text-align:left;
	text-decoration: none;
	border-bottom:dashed 1px #ddd;
}
#menubar a:hover{color:#ff6600;text-decoration:underline;}
#menubar .tit{cursor:auto;border-top:solid 2px #0650A5; color:#0650A5;
	width:175px!important; width:196px;}
#menubar .clia{padding-left:20px; background:url(images/rminus.gif) 0 0 no-repeat;}
-->
</style>
</head>
<body>
    <form id="form1" runat="server">
        <!--导航部分-->
        <div class="top_table">
            <div class="SysManage_logo"><img src="images/cmsv31_01.gif"></div>
            <div style="float:right;padding-top:30px;">
                <table cellspacing="0" cellpadding="0" width="360" border="0">
                    <tr height="25">
                            <td style="color:#fff; text-align:right; padding:5px 30px 0 0;" >
                                <%--您好，<asp:Label ID="Label1" runat="server" Font-Bold="true" ForeColor="#D8F7FE"></asp:Label>--%>&nbsp;&nbsp;&nbsp;&nbsp;
                                <%--<a href="Sys_Settings_Pwd.aspx" target="frmright"><font color="#ffffff">修改密码</font></a>&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="logout.aspx"><font color="#ffffff">退出系统</font></a>--%>
                            </td>
                    </tr>
                </table>
            </div>
        </div>

        <!--导航部分结束-->
        <table style="background:#fff" cellspacing="0" cellpadding="0" width="100%" border="0" id="tab">
            <tbody>
                <tr>
                    <td class="main_left" id="frmTitle" valign="top" align="middle" name="fmTitle">
                        <table class="main_left_top" cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tbody>
                                <tr height="32">
                                    <td class="main_left_title">
                                        您好，<asp:Label ID="Label1" runat="server" Font-Bold="true" ForeColor="red"></asp:Label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <table cellspacing="0" cellpadding="0" class="left_iframe" border="0">
                            <tbody>
                                <tr>
                                    <td id="menubar" valign="top">

<ul>
    <%if (Request.Cookies["loginuser"]["Grade"] == "1")
      { %>
    <li><a class="tit"><b>系统工具</b></a></li>
    <li><a href="managerManage.aspx" class="clia" target="frmright">用户及权限管理</a></li>
    <%} %>
    
    <li><a class="tit"><b>基础设置</b></a></li>
    <li><a href="suitypemanage.aspx?parentid=1" class="clia" target="frmright">水价类别设置</a></li>
    <li><a href="suitypemanage.aspx?parentid=2" class="clia" target="frmright">台区设置</a></li>
    <li><a href="suitypemanage.aspx?parentid=3" class="clia" target="frmright">电价类别设置</a></li>
    
    
    <li><a class="tit"><b>收费管理</b></a></li>
    <li><a href="ShouFeiOper.aspx" class="clia" target="frmright">抄表</a></li>
    <li><a href="ShouFeiManage.aspx" class="clia" target="frmright">收费管理</a></li>
    
    
    <li><a class="tit"><b>历史数据查询</b></a></li>
    <li><a href="ShouFeiManage.aspx" class="clia" target="frmright">历史抄表查询</a></li>
    <li><a href="ShouFeilist.aspx" class="clia" target="frmright">统计抄表情况</a></li>
    
    <li><a class="tit"><b>统计分析</b></a></li>
    <li><a href="tongji.aspx" class="clia" target="frmright">用电/用水统计分析</a></li>
    
    <%--<li><a class="tit"><b>注册用户管理</b></a></li>
    <li><a href="ZhuHuManage.aspx" class="clia" target="frmright">注册用户管理</a></li>--%>
    
    <%--<li><a class="tit"><b>用户投诉管理</b></a></li>
    <li><a href="TouShuManage.aspx" class="clia" target="frmright">用户投诉管理</a></li>--%>
    
    <%--<li><a class="tit"><b>设备信息维护管理</b></a></li>
    <li><a href="weihuManage.aspx" class="clia" target="frmright">设备维护管理</a></li>--%>
    
    <%--<li><a class="tit"><b>住房维护管理</b></a></li>
    <li><a href="zhufangManage.aspx" class="clia" target="frmright">住房维护管理</a></li>--%>
    
    <%--<li><a class="tit"><b>站内信息</b></a></li>
    <li><a href="newsManage.aspx?typeid=1" class="clia" target="frmright">站内公告管理</a></li>
    <li><a href="newsManage.aspx?typeid=2" class="clia" target="frmright">站内新闻管理</a></li>
    <li><a href="newsManage.aspx?typeid=3" class="clia" target="frmright">站内链接管理</a></li>--%>
    
    
    
    
    <li><a class="tit"><b>系统管理</b></a></li>
    <li><a href="Sys_Settings_Pwd.aspx" class="clia" target="frmright">修改密码</a></li>
    <li><a href="logout.aspx" class="clia">安全退出</a></li>



    <%--<li><a class="tit"><b>费用查询和缴费</b></a></li>
    <li><a href="ShouFeiManage.aspx" class="clia" target="frmright">费用查询和缴费</a></li>
    
    <li><a class="tit"><b>用户投诉</b></a></li>
    <li><a href="TouShuManage.aspx" class="clia" target="frmright">用户投诉</a></li>
    
    <li><a class="tit"><b>设备报修</b></a></li>
    <li><a href="weihuManage.aspx" class="clia" target="frmright">设备报修</a></li>
    
    <li><a class="tit"><b>我的信息</b></a></li>
    <li><a href="ZhuHuInfo.aspx" class="clia" target="frmright">个人信息</a></li>
    <li><a href="logout.aspx" class="clia">安全退出</a></li>--%>

</ul>


                                    </td>
                                </tr>
                                
                            </tbody>
                        </table>
                    </td>
                    <td style="width: 10px" bgcolor="#dddddd">
                        <table height="100%" cellspacing="0" cellpadding="0" border="0">
                            <tbody>
                                <tr>
                                    <td style="height:100%" onclick="switchSysBar()">
                                        <span class="navPoint" id="switchPoint" title="关闭/打开左栏"><img src="images/right.gif"></span></td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                    <td valign="top" width="100%">
                        <iframe class="main_iframe" id="frmright" name="frmright" src="Right.html" frameborder="0"></iframe>
                    </td>
                </tr>
            </tbody>
        </table>
        
<script type="text/javascript">
var tab=document.getElementById("tab");
        tab.style.height=document.body.clientHeight-70+"px";
        var status = 1;
        var Menus = new DvMenuCls;
        document.onclick=Menus.Clear;
        function switchSysBar(){
             if (1 == window.status){
		          window.status = 0;
                  switchPoint.innerHTML = '<img src="images/left.gif">';
                  document.all("frmTitle").style.display="none"
             }
             else{
		          window.status = 1;
                  switchPoint.innerHTML = '<img src="images/right.gif">';
                  document.all("frmTitle").style.display=""
             }
        }
</script>
</form>
</body>
</html>