<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myarticle.aspx.cs" Inherits="users_myarticle" %>

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
                                <asp:Repeater ID="repInfo" runat="server">
                                    <ItemTemplate>
                                        <table border='0' cellpadding='0' cellspacing='0' style='width: 100%; background-color: White;
                                            line-height: 30px;'>
                                            <tr>
                                                <td align='left' height='30' style="padding-left: 20px; padding-right: 20px; font-size: 20px;
                                                    font-weight: bold; color: White" bgcolor="#005577">
                                                    <%#Eval("StrTitle")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align='left' height='25' style="padding-left: 20px; padding-right: 20px;" bgcolor="#b4889e">
                                                    <%#Eval("ReleaseDate") %>
                                                    |<%#GetTyName(Eval("StrType").ToString())%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align='left' style="padding-left: 20px; padding-right: 20px;">
                                                    <%#Eval("StrContent") %>[<a href="myarinfos.aspx?id=<%#Eval("Id")%>" style="color: Red;" target="_blank">详细</a>]
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align='left' height='10' bgcolor='#e4e4e4'>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:Repeater>
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
