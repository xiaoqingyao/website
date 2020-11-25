<%@ Control Language="C#" AutoEventWireup="true" CodeFile="login.ascx.cs" Inherits="usercontrols_login" %>
<div id="divLogin" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" width="230" style="text-align: left;
        line-height: 30px; font-size: 14px;">
        <tr>
            <td>
                &nbsp;&nbsp;帐号：
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtLogName" runat="server" Height="25" Width="230"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                &nbsp;&nbsp;密码：
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtLogPwd" runat="server" Height="25" Width="230" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="center" valign="bottom" height="40">
                <asp:ImageButton ID="imgLogin" runat="server" ImageUrl="~/images/login.jpg" OnClick="imgLogin_Click" />
            </td>
        </tr>
        <tr>
            <td style="border-bottom: #cccccc 1px dotted; height: 15px">
            </td>
        </tr>
        <tr>
            <td align="center" style="color: #666666">
                还没开通您的XX帐号么？
            </td>
        </tr>
        <tr>
            <td align="center">
                <a href="regis.aspx" style="text-decoration: underline; color: #3366cc; font-weight: bold;">
                    立即注册</a>
            </td>
        </tr>
        <tr>
            <td style="border-top: #cccccc 1px dotted; height: 15px">
            </td>
        </tr>
    </table>
</div>
<div id="divLoged" runat="server" visible="false">
    <table border="0" cellpadding="0" cellspacing="0" width="230" style="text-align: left;
        line-height: 30px; font-size: 14px;">
        <tr>
            <td align="center">
                <img src="../images/welcomback.jpg" /></td>
        </tr>
        <tr>
            <td>
                &nbsp;&nbsp;帐号：<asp:Label ID="lblLogName" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;&nbsp;昵称：<asp:Label ID="lblNickName" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <a href="users/mycenter.aspx">
                    <img src="../images/in.jpg" /></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="users/logout.aspx">
                        <img src="../images/out.jpg" /></a>
            </td>
        </tr>
        <tr>
            <td style="border-top: #cccccc 1px dotted; height: 15px">
            </td>
        </tr>
    </table>
</div>
