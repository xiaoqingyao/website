<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myarinfos.aspx.cs" Inherits="users_myarinfos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Src="bot.ascx" TagName="bot" TagPrefix="uc2" %>
<%@ Register Src="top.ascx" TagName="top" TagPrefix="uc1" %>
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
                <td width="999"  align="center" valign="top" bgcolor="#e4e4e4">
                    <table border='0' cellpadding='0' cellspacing='0' style='width: 100%; background-color: White;
                        line-height: 30px;'>
                        <tr>
                            <td align='left' height='30' style="padding-left: 20px; padding-right: 20px; font-size: 20px;
                                font-weight: bold; color: White" bgcolor="#005577">
                                <%=title %>
                            </td>
                        </tr>
                        <tr>
                            <td align='left' height='25' style="padding-left: 20px; padding-right: 20px;" bgcolor="#b4889e">
                                <%=date %>
                                |<%=type%>
                            </td>
                        </tr>
                        <tr>
                            <td align='left' style="padding-left: 20px; padding-right: 20px;">
                                <%=cnt%>
                            </td>
                        </tr>
                        <tr>
                            <td align='left' height='10' bgcolor='#e4e4e4'>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td width="999" align="center" valign="top" bgcolor="#e4e4e4">
                    <asp:Repeater ID="repInfo" runat="server">
                        <ItemTemplate>
                            <table border='0' cellpadding='0' cellspacing='0' style='width: 100%; background-color: White;
                                line-height: 30px;'>
                                <tr>
                                    <td align='left' height='30' style="padding-left: 20px; background-color: White; padding-right: 20px; font-size: 14px;">
                                        <%#Eval("CommentDate")%>
                                        |<%#GetUserName(Eval("CommentUser").ToString())%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align='left' height='25' style="padding-left: 20px; background-color: White; padding-right: 20px;">
                                        <%#Eval("StrContent") %>
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
            <tr>
                <td width="999" height="300" align="center" valign="top" bgcolor="#e4e4e4">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 700px" bgcolor="#e4e4e4">
                        <tr>
                        <td width="100" bgcolor="#e4e4e4">
                            我要评论
                        </td>
                            <td bgcolor="#e4e4e4">
                                <asp:TextBox ID="TextBox1" runat="server" Height="300px" TextMode="MultiLine" Width="634px"></asp:TextBox><br />
                                <br />
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="发 表" /><br />
                                <br />
                            
                            </td>
                        </tr>
                    </table>
                    <br />
                
                </td>
            </tr>
            <tr>
                <td>
                    <uc2:bot ID="Bot1" runat="server" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
