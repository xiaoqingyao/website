<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CharLinkTemplate.aspx.cs"
    Inherits="AllPower.WEB.main.Plus.FriendLink.CharLinkTemplate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>文字链接模板</title>
    <link href="link.css" rel="Stylesheet" type="text/css" />
</head>
<body>
    <form id="frmCharLink" runat="server">
    <div id="link">
        <ul id="link_1" class="link_list">
            <asp:Repeater ID="rptCharLink" runat="server">
                <ItemTemplate>
                    <li><a title='<%#Eval("WebName") %>' target="_blank" href='LinkClickCount.aspx?Action=CLICK&LinkId=<%#Eval("ID") %>'>
                        <%#Eval("WebName") %></a></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    </form>
</body>
</html>
