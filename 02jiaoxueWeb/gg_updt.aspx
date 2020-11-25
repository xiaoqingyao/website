<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gg_updt.aspx.cs" Inherits="gg_updt" %>
<%@Register TagPrefix="dntb" Namespace="DotNetTextBox" Assembly="DotNetTextBox"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
        <LINK href="StyleSheet.css" type=text/css rel=stylesheet>
    <link href="system_dntb/skin/xp/toolbar.css" rel="stylesheet" type="text/css" />
    <link href="E:\hsg计算机\NET05\my旅游管理系统/system_dntb/skin/xp/toolbar.css" rel="stylesheet"
        type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table border="0" style="width: 633px">
        <tr>
            <td align="left" style="height: 448px" valign="top">
                <table border="0" style="width: 633px">
                        <tr>
                            <td align="left" style="height: 17px">
                                &nbsp;<table bgcolor="#fbd79f" border="0" cellpadding="0" cellspacing="1" height="280"
                                    width="100%">
                                    <!--DWLayoutTable-->
                                    <tr>
                                        <td align="right" bgcolor="#fff5e1" style="height: 24px; width: 53px;" valign="middle">
                                            标题:</td>
                                        <td align="left" bgcolor="#fff5e1" colspan="1" style="width: 2px; height: 24px" valign="middle">
                                        </td>
                                        <td align="left" bgcolor="#fff5e1" colspan="3" style="height: 24px" valign="middle">
                                            &nbsp;
                                            <asp:TextBox ID="title" runat="server" Style="border-right: #ffcc00 1px solid;
                                                border-top: #ffcc00 1px solid; border-left: #ffcc00 1px solid; border-bottom: #ffcc00 1px solid"
                                                Width="341px"></asp:TextBox></td>
                                    </tr>

                                    <tr>
                                        <td align="right" bgcolor="#fff5e1" style="height: 353px; width: 53px;" valign="middle">
                                            内容</td>
                                        <td align="left" bgcolor="#fff5e1" colspan="1" style="width: 2px; height: 353px"
                                            valign="top">
                                        </td>
                                        <td align="left" bgcolor="#fff5e1" colspan="3" style="height: 353px" valign="top">
                                            &nbsp;&nbsp;
                                          <DNTB:WebEditor id="WebEditor1" Skin="skin/xp/" runat="server"></DNTB:WebEditor>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" bgcolor="#fff5e1" height="20" valign="middle" style="width: 53px">
                                            &nbsp;</td>
                                        <td bgcolor="#fff5e1" colspan="1" height="20" style="width: 2px">
                                        </td>
                                        <td bgcolor="#fff5e1" colspan="3" height="20">
                                            <asp:Button ID="Button1" runat="server"  Style="border-right: #003333 1px solid;
                                                border-top: #003333 1px solid; font: menu; border-left: #003333 1px solid; border-bottom: #003333 1px solid"
                                                Text="确定修改" Width="83px" OnClick="Button1_Click" />
                                            <asp:Button ID="Button2" runat="server"  Style="border-right: #003333 1px solid;
                                                border-top: #003333 1px solid; font: menu; border-left: #003333 1px solid; border-bottom: #003333 1px solid"
                                                Text="放弃返回" Width="83px" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
