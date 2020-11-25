<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LeftMenu.aspx.cs" Inherits="Admin_LeftMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>leftMenu</title>
    <link type="text/css" rel="stylesheet" href="Styles/style.css" />

    <script language="JavaScript" type="text/JavaScript">
        function showMenu(obj) {
            //alert()
            var ob = event.srcElement;
            if (ob.tagName == "TD") {
                ob = ob.parentNode.childNodes[1].childNodes[0]
            }
            if (ob.tagName == "A") {
                ob = ob.parentNode.parentNode.childNodes[1].childNodes[0]
            }
            if (obj.style.display == "") {
                obj.style.display = "none"
                ob.src = "Images/up.gif"
            }
            else {
                obj.style.display = ""
                ob.src = "Images/down.gif"
            }
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <table width="178" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="8" valign="top" class="C_Left_03">
                <img src="Images/Admin_22.gif" width="8" height="7">
            </td>
            <td class="C_Left_01">
                &nbsp;
            </td>
            <td width="8" valign="top" class="C_Left_04">
                <img src="Images/Admin_25.gif" width="8" height="7">
            </td>
        </tr>
        <tr>
            <td class="C_Left_03">
                &nbsp;
            </td>
            <td valign="top">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Left_Item01">
                    <tr onclick="showMenu(a2,this)">
                        <td class="Left_Item01_Title" style="cursor: hand">
                            <a href="Cp_List.aspx">用户管理</a>
                        </td>
                        <td style="cursor: hand">
                            <img alt="显示/隐藏子菜单" src="Images/down.gif">
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Left_boder"
                    id="a2">
                    <tr>
                        <td class="Left_Item02">
                            <a href="PersonalManager.aspx" target="main">会员管理</a>&nbsp;
                        </td>
                    </tr>
                    <tr>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Left_Item01">
                    <tr onclick="showMenu(a4,this)">
                        <td class="Left_Item01_Title" style="cursor: hand">
                            产品管理
                        </td>
                        <td style="cursor: hand">
                            <img alt="显示/隐藏子菜单" src="Images/down.gif">
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Left_boder"
                    id="a4">
                    <tr>
                        <td class="Left_Item02">
                            <a href="PerGatherManager.aspx" target="main">个人团购管理</a>
                            <br />
                            <a href="OrderMang.aspx" target="main">订单管理</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="Left_Item02">
                            <a href="ProductManager.aspx" target="main">产品管理</a>&nbsp;<br />
                            <a href="GatherManager.aspx" target="main">团购管理</a>
                            <br />
                            <a href="companyManager.aspx" target="main">公司管理</a>
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Left_Item01">
                    <tr onclick="showMenu(a5,this)">
                        <td class="Left_Item01_Title" style="cursor: hand; height: 27px;">
                            新闻管理
                        </td>
                        <td style="cursor: hand; height: 27px;">
                            <img alt="显示/隐藏子菜单" src="Images/down.gif">
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Left_boder"
                    id="a5">
                    <tr>
                        <td class="Left_Item02">
                            <a href="NewsManager.aspx" target="main">发布新闻</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="Left_Item02">
                            <a href="NewsList.aspx" target="main">新闻管理</a>
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Left_Item01">
                    <tr onclick="showMenu(a6,this)">
                        <td class="Left_Item01_Title" style="cursor: hand">
                            系统管理
                        </td>
                        <td style="cursor: hand">
                            <img alt="显示/隐藏子菜单" src="Images/down.gif">
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Left_boder"
                    id="Table1">
                    <tr>
                        <td class="Left_Item02" colspan="2">
                            <a href="UserManger.aspx" target="main">账号管理</a><br />
                            <a href="AddUser.aspx" target="main">添加账号</a>
                            <br />
                            <a href="ChangePassword.aspx" target="main">密码修改</a>
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Left_Item01">
                    <tr>
                        <td class="Left_Item01_Title">
                            系统说明
                        </td>
                        <td>
                            <img src="Images/down.gif">
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Left_boder">
                    <tr>
                        <td id="version" class="Left_Item02" align="center">
                            团购网后台管系统
                        </td>
                    </tr>
                </table>
            </td>
            <td class="C_Left_04">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td width="8" valign="bottom" class="C_Left_03">
                <img src="Images/Admin_48.gif" width="8" height="8">
            </td>
            <td class="C_Left_02">
                &nbsp;
            </td>
            <td width="8" valign="bottom" class="C_Left_04">
                <img src="Images/Admin_51.gif" width="8" height="8">
            </td>
        </tr>
    </table>
    </form>

    <script language="JavaScript" type="text/JavaScript">
        var table = document.getElementById("LeftMenu");
        if (table != null) {
            for (var i = 0; i < table.rows.length; i++) {
                table.rows[i].onclick = function() {
                    var e = event.srcElement;
                    e = e.parentNode.parentNode;
                    for (var i = 0; i < table.rows.length; i++) {
                        table.rows[i].className = "C_Left_Menu_default";
                    }
                    e.className = "C_Left_Menu_current";
                }
            }
        }
    </script>

</body>
</html>
