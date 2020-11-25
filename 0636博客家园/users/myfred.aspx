<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myfred.aspx.cs" Inherits="users_myfred" %>

<%@ Register Src="bot.ascx" TagName="bot" TagPrefix="uc2" %>
<%@ Register Src="top.ascx" TagName="top" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
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
                <td width="999" style="min-height: 700px;" align="center" valign="top" bgcolor="#e4e4e4">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 780px">
                        <tr>
                            <td>
                                <asp:Repeater ID="rptList" runat="server">
                                    <HeaderTemplate>
                                        <table cellpadding='0' cellspacing='0' border='0' class='pictb'>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:PlaceHolder ID="PlaceHolder1" runat="server" Visible='<%# (Container.ItemIndex + 1) % 8 ==1 %>'>
                                            <tr>
                                        </asp:PlaceHolder>
                                        <td align="left" style="padding: 20px;">
                                            <table cellpadding='0' cellspacing='0' border='0' class='pictbs'>
                                                <tr>
                                                    <td>
                                                        <a href="mysite.aspx?uid=<%#DataBinder.Eval(Container.DataItem, "Id") %>">
                                                            <img src="../UpFile/Photos/<%#DataBinder.Eval(Container.DataItem, "AvatarImg")%>"
                                                                width="80" height="80" style="border: solid 1px #cdcdcd;" alt="" /></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="border-bottom: solid 1px #cdcdcd;">
                                                        <a href="#"><strong>
                                                            <%#reftitlepic(DataBinder.Eval(Container.DataItem, "Nickname"), 10)%>
                                                        </strong></a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <asp:PlaceHolder ID="PlaceHolder2" runat="server" Visible='<%# (Container.ItemIndex + 1) % 8 ==0 %>'>
                                            </tr> </asp:PlaceHolder>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </table></FooterTemplate>
                                </asp:Repeater>
                            </td>
                        </tr>
                    </table>
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
