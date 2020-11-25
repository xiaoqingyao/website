<%@ Page Language="C#" AutoEventWireup="true" CodeFile="topMenu.aspx.cs" Inherits="Admin_topMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" rel="stylesheet" href="Styles/style.css" />
    <!--<base target='main'>-->

    <script language="JavaScript" type="text/JavaScript">
        function preloadImg(src) {
            var img = new Image();
            img.src = src;
        }
        preloadImg('Images/open.gif');

        var displayBar = true;
        function switchBar(obj) {
            if (displayBar) {
                parent.frame.cols = '0,*';
                displayBar = false;
                obj.src = 'Images/open.gif';
                obj.title = '打开左边管理导航菜单';
            }
            else {
                parent.frame.cols = '200,*';
                displayBar = true;
                obj.src = 'Images/close.gif';
                obj.title = '关闭左边管理导航菜单';
            }
        }

        //退出后台管理
        function LoginOut() {
            if (document.all) {
                ht = parent.document.getElementsByTagName("html");
                ht[0].style.filter = "progid:dXImageTransform.Microsoft.BasicImage(grayscale=1)";
                if (!confirm('您确定要退出管理吗?')) {
                    ht[0].style.filter = "";
                    return false;
                }
            }
            return true;
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <table class="C_Headerbg" cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td class="C_HeaderLeft" width="12">
                &nbsp;
            </td>
            <td width="130">
                <a href="http://www.bcbbs.net" target="_blank">
                    <img height="34" alt="成绩分析统计系统" src="Images/Admin_08.gif" width="130" border="0"></a>
            </td>
            <td valign="top" align="right" width="55">
                <img title="关闭左边管理导航菜单" style="cursor: hand" onclick="switchBar(this)" src="Images/open.gif">
            </td>
            <td width="420" align="left" valign="bottom">
                <iframe src="Bbs.aspx" frameborder="0" width="297" height="25" scrolling="no" style="display: none"
                    id="Bbs"></iframe>
                <table width="99%" height="31" border="0">
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td class="LoginText" style="width: 475px">
                            欢迎 [<%=username%>]登录后台管理系统
                        </td>
                    </tr>
                </table>
            </td>
            <td class="C_HeaderMiddle" style="font-weight: bold" valign="top" align="center"
                width="154">
                <a href="welcome.aspx" target="main">管理首页</a> | <a href="../Default.aspx" target="_blank">
                    前台首页</a>|
                <asp:LinkButton ID="LoginOut" runat="server" OnClick="LoginOut_Click">退出</asp:LinkButton>
            </td>
            <td class="C_HeaderRight" width="12">
                &nbsp;
            </td>
        </tr>
    </table>
    </form>
    <div id="menu">
    </div>

    <script>
        var jc = null;
    </script>

</body>
</html>
