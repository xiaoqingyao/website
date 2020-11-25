<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogoLinkTemplate.aspx.cs"
    Inherits="AllPower.WEB.main.Plus.FriendLink.LogoLinkTemplate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Í¼Æ¬Á´½ÓÄ£°å</title>
    <link href="link.css" rel="Stylesheet" type="text/css" />
</head>
<body>
    <form id="frmLogoLink" runat="server">
    <div id="link">
        <ul id="link_1" class="link_list">
            <asp:Repeater ID="rptLogoLink" runat="server">
                <ItemTemplate>
                    <li><a title='<%#Eval("WebName") %>' target="_blank" href='LinkClickCount.aspx?Action=CLICK&LinkId=<%#Eval("ID") %>'>
                        <img src='<%=uploadPath %><%#Eval("logo") %>' width="88" height="30" alt='<%#Eval("WebName") %>' /></a></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    </form>
</body>
</html>
