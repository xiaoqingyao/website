<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="admin_main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>心灵阶梯博客网站管理系统后台</title>
    <link href="../css/custom-theme/jquery-ui-1.7.2.custom.css" rel="Stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="images/style.css" />

    <script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery-ui-1.7.2.custom.min.js"></script>

    <script type="text/javascript" src="js/manager.js"></script>

    <script>
function windowHeight() {
    var de = document.documentElement;
    return self.innerHeight||(de && de.clientHeight)||document.body.clientHeight;
}
window.onload=window.onresize=function(){
var wh=windowHeight();
document.getElementById("mainLeft").style.height = (wh-128)+"px";
document.getElementById("sysMain").style.height=document.getElementById("mainLeft").style.height;
}
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" style="background: #EBF5FC; width: 100%;
            height: 100%;">
            <tr>
                <td colspan="3" style="background: url(images/head_bg.gif); height: 70px;">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="24%" height="70">
                                <img src="images/head_logo.gif" width="233" height="50">
                            </td>
                            <td width="76%" valign="bottom">
                                <!--导航菜单,与下面的相关联,修改时注意参数-->
                                <div id="tabs">
                                    <ul>
                                        <li onclick="tabs(0);"><a href="default.aspx" target="sysMain"><span>管理首页</span></a></li>
                                        <li onclick="tabs(1);"><a href="News/list.aspx" target="sysMain"><span>新闻管理</span></a></li>
                                        <li onclick="tabs(2);"><a href="Article/list.aspx" target="sysMain"><span>文章管理</span></a></li>
                                        <li onclick="tabs(3);"><a href="Users/list.aspx" target="sysMain"><span>会员管理</span></a></li>
                                        <li onclick="tabs(4);"><a href="Part/part.aspx" target="sysMain"><span>栏目管理</span></a></li>
                                        <li onclick="tabs(5);"><a href="Mag/myself.aspx" target="sysMain"><span>个人中心</span></a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="padding: 0px 10px; font-size: 12px; height: 30px; background: url(images/navsub_bg.gif) repeat-x;">
                    <div style="float: right; line-height: 20px;">
                        <a href="default.aspx" target="sysMain">管理中心</a> | <a target="_blank" href="../index.aspx">
                            预览网站</a> |
                        <asp:LinkButton ID="lbtnExit" runat="server" OnClick="lbtnExit_Click">安全退出</asp:LinkButton>
                    </div>
                    <div style="padding-left: 20px; line-height: 20px; background: url(images/siteico.gif) 0px 0px no-repeat;">
                        当前登录用户：<font color="#FF0000"><asp:Label ID="lblAdminName" runat="server" Text=""></asp:Label></font>您好，欢迎光临。</div>
                </td>
            </tr>
            <tr>
                <td align="center" id="mainLeft" valign="top" style="background: #FFF; height: 100%">
                    <div style="text-align: left; width: 185px; height: 100%; font-size: 12px;">
                        <!--导航顶部-->
                        <div style="padding-left: 10px; height: 29px; line-height: 29px; background: url(images/menu_bg.gif) no-repeat;">
                            <span style="padding-left: 15px; font-weight: bold; color: #039; background: url(images/menu_dot.gif) no-repeat;">
                                功能导航</span>
                        </div>
                        <!--导航菜单,修改时注意顺序-->
                        <div class="left_menu">
                            <ul>
                                <li onclick="tabs(1);"><a href="News/list.aspx" target="sysMain">新闻管理</a></li>
                                <li onclick="tabs(2);"><a href="Article/list.aspx" target="sysMain">文章管理</a></li>
                                <li onclick="tabs(3);"><a href="Users/list.aspx" target="sysMain">会员管理</a></li>
                                <li onclick="tabs(4);"><a href="Part/part.aspx" target="sysMain">栏目管理</a></li>
                                <li onclick="tabs(5);"><a href="Mag/myself.aspx" target="sysMain">个人中心</a></li>
                            </ul>
                        </div>
                        <div class="left_menu">
                            <ul>
                                <li><a href="News/add.aspx" target="sysMain">发布新闻</a></li>
                                <li><a href="News/list.aspx" target="sysMain">新闻管理</a></li>
                            </ul>
                        </div>
                        <div class="left_menu">
                            <ul>
                                <li><a href="Article/list.aspx" target="sysMain">会员文章管理</a></li>
                            </ul>
                        </div>
                        <div class="left_menu">
                            <ul>
                                <li><a href="Users/list.aspx" target="sysMain">会员管理</a></li>
                            </ul>
                        </div>
                        <div class="left_menu">
                            <ul>
                                <li><a href="Part/add.aspx" target="sysMain">增加栏目</a></li>
                                <li><a href="Part/part.aspx" target="sysMain">栏目管理</a></li>
                            </ul>
                        </div>
                        <div class="left_menu">
                            <ul>
                                <li><a target="sysMain" href="Mag/myself.aspx">个人信息管理</a></li>
                                <li><a target="sysMain" href="Mag/udpwd.aspx">修改密码</a></li>
                            </ul>
                        </div>
                    </div>
                </td>
                <td valign="middle" style="width: 8px; background: url(Images/main_cen_bg.gif) repeat-x;">
                    <div id="sysBar" style="cursor: pointer;">
                        <img id="barImg" src="Images/butClose.gif" alt="关闭/打开左栏" /></div>
                </td>
                <td style="width: 100%; height: 100%" valign="top">
                    <iframe frameborder="0" id="sysMain" name="sysMain" scrolling="yes" src="default.aspx"
                        style="width: 100%; height: 100%; visibility: inherit; z-index: 1;"></iframe>
                </td>
            </tr>
            <tr>
                <td colspan="3" bgcolor="#EBF5FC" style="padding: 0px 10px; font-size: 10px; height: 28px;
                    color: #2C89AD; background: url(images/foot_bg.gif) repeat-x;">
                    心灵阶梯博客网站交友平台 Copyright Right © 2010-2011 xxblog.cn Powered By xxblog Inc
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
