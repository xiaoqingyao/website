<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainFrame.aspx.cs" Inherits="SysManage_MainFrame" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>个人博客系统[毕业设计]</title>
    <link href="css/style.css" type="text/css" rel="stylesheet" />
    <link href="css/style_left.css" type="text/css" rel="stylesheet" />
    <script language="javaScript" src="js/menu.js" type="text/javascript"></script>
    <style type="text/css">
<!--
ul{margin:0px;padding:0px;}
li{list-style-type:none;}
td{font-size: 12px;}


#menubar ul{margin:0px;}
#menubar ul li
{
	float:left;margin:0;
	padding:2px 0 3px 0;
}

#menubar .tit{cursor:auto; background:#c7d78c; color:#2d7e17;}
#menubar .clia{padding-left:20px; background:url(images/rminus.gif) 0 0 no-repeat;}
-->
</style>
</head>
<body>
    <form id="form1" runat="server">
        <!--导航部分-->
        <div class="top_table">
            <div class="SysManage_logo"><img src="../images/logo.jpg" width="100%" height="100"></div>
            <div style="float:left;width:100%; text-align:center;">
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr height="25">
                            <td style="color:#333; text-align:right; background:#c7d78c;padding:5px 30px 0 0;" >
                                当前登录人：<asp:Label ID="Label1" runat="server" Font-Bold="true" ForeColor="#db0000"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="Sys_Settings_Pwd.aspx" target="frmright">修改密码</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="logout.aspx">退出系统</a>
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
                                    <td class="main_left_title">后台管理目录</td>
                                </tr>
                            </tbody>
                        </table>
                        <table cellspacing="0" cellpadding="0" class="left_iframe" border="0">
                            <tbody>
                                <tr>
                                    <td valign="top">
                                        <table class="alpha">
                                            <tbody>
                                                <tr>
                                                    <td class="menu_l" id="menubar" valign="top">
                                                        <ul>
                                                            <li><a class="tit"><b>用户管理</b></a></li>
                                                            <li><a class="clia" href="membermanage.aspx" target="frmright">注册用户管理</a></li>
                                                            
                                                            <li><a class="tit"><b>相册管理</b></a></li>
                                                            <li><a class="clia" href="PicClassManage.aspx" target="frmright">相册分类管理</a></li>
                                                            <li><a class="clia" href="PicManage.aspx" target="frmright">相册信息管理</a></li>
                                                            
                                                            <li><a class="tit"><b>博客及评论管理</b></a></li>
                                                            <li><a class="clia" href="blogManage.aspx" target="frmright">博客管理</a></li>
                                                            <li><a class="clia" href="commentManage.aspx" target="frmright">博客评论管理</a></li>
                                                            
                                                            <li><a class="tit"><b>系统广播管理</b></a></li>
                                                            <li><a class="clia" href="newsManage.aspx?typeid=1" target="frmright">系统广播管理</a></li>
                                                            
                                                            <li><a class="tit"><b>非法词语管理</b></a></li>
                                                            <li><a class="clia" href="feifaManage.aspx" target="frmright">非法词语管理</a></li>
                                                            
                                                            <li><a class="tit"><b>系统管理</b></a></li>
                                                            <li><a class="clia" href="Sys_Settings_Pwd.aspx" target="frmright">修改密码</a></li>
                                                            <li><a class="clia" href="logout.aspx" target="_top">退出系统</a></li>
                                                            
                                                            
                                                        </ul>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                
                            </tbody>
                        </table>
                    </td>
                    <td style="width: 10px" bgcolor="#c7d78c">
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
                        <iframe class="main_iframe" id="frmright" name="frmright" src="membermanage.aspx"frameborder="0"></iframe>
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