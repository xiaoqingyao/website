<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myinfos.aspx.cs" Inherits="users_myinfos" %>

<%@ Register Src="side.ascx" TagName="side" TagPrefix="uc3" %>
<%@ Register Src="bot.ascx" TagName="bot" TagPrefix="uc2" %>
<%@ Register Src="top.ascx" TagName="top" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>心灵阶梯博客</title>
    <link href="../users/Css/ys.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <table width="999px" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2">
                    <uc1:top ID="Top1" runat="server" />
                </td>
            </tr>
            <tr>
                <td width="787" style="min-height: 700px;" align="center" valign="top" bgcolor="#e4e4e4">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 780px">
                        <tr>
                            <td>
                                <table cellspacing="1" cellpadding="5" width="90%" align="center" border="0">
                                    <tbody>
                                        <tr>
                                            <td align="right">
                                                姓名
                                            </td>
                                            <td style="" align="left">
                                                <asp:Label ID="lblusername" runat="server" Text=""></asp:Label></td>
                                            <td align="right">
                                            </td>
                                            <td rowspan="3" style="" align="left" valign="middle">
                                                <img runat="server" id="Photos" alt="" src="images/no.gif" width="80" height="90" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                帐号
                                            </td>
                                            <td style="" align="left">
                                                <asp:Label ID="lbllogname" runat="server" Text=""></asp:Label></td>
                                            <td align="right">
                                                照片
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                昵称
                                            </td>
                                            <td style="" align="left">
                                                <asp:Label ID="lblnicheng" runat="server" Text=""></asp:Label></td>
                                            <td align="right">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                &nbsp;性别</td>
                                            <td style="" align="left">
                                                <asp:Label ID="lblsex" runat="server" Text=""></asp:Label></td>
                                            <td align="right">
                                                &nbsp;</td>
                                            <td style="" align="left">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                电话号码
                                            </td>
                                            <td style="" align="left">
                                                &nbsp;<asp:Label ID="lbltel" runat="server" Text=""></asp:Label></td>
                                            <td align="right">
                                                移动电话
                                            </td>
                                            <td style="" align="left">
                                                &nbsp;<asp:Label ID="lblmobile" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                生日&nbsp;</td>
                                            <td style="" align="left">
                                                <asp:Label ID="lblbirthday" runat="server" Text=""></asp:Label></td>
                                            <td align="right">
                                                邮箱&nbsp;</td>
                                            <td style="" align="left">
                                                <asp:Label ID="lblemail" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                职业&nbsp;</td>
                                            <td style="" align="left">
                                                <asp:Label ID="lblzhiye" runat="server" Text=""></asp:Label></td>
                                            <td align="right">
                                                注册日期&nbsp;</td>
                                            <td style="" align="left">
                                                <asp:Label ID="lblregisdate" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                &nbsp;现居住地</td>
                                            <td style="" align="left">
                                                <asp:Label ID="lbladss" runat="server" Text=""></asp:Label></td>
                                            <td align="right">
                                                &nbsp;</td>
                                            <td style="" align="left">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                &nbsp;简介
                                            </td>
                                            <td colspan="4" style="" align="left">
                                                <asp:Label ID="lbljianjie" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td colspan="5" align="center">
                                                &nbsp;&nbsp;
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="212" align="center" valign="top" bgcolor="#e4e4e4">
                    <uc3:side ID="Side1" runat="server"></uc3:side>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <uc2:bot ID="Bot1" runat="server" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
