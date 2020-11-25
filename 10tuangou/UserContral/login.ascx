<%@ Control Language="C#" AutoEventWireup="true" CodeFile="login.ascx.cs" Inherits="UserContral_login" %>
<table cellpadding="0" cellspacing="0" style="background-image: url(Image/6.jpg);
    vertical-align: middle; width: 200px; height: 146px; text-align: center">
    <tr>
        <td style="vertical-align: bottom; width: 35px; height: 35px">
            <img src="Image/icon_login.gif" /></td>
        <td colspan="2" style="vertical-align: bottom; height: 35px">
            用户登陆</td>
        <td style="width: 23px; height: 35px">
        </td>
    </tr>
    <tr>
        <td style="width: 35px; height: 29px">
        </td>
        <td style="width: 67px; height: 29px">
            用户名：</td>
        <td style="width: 67px; height: 29px">
            <asp:TextBox ID="txtUserName" runat="server" Width="87px"></asp:TextBox></td>
        <td style="width: 23px; height: 29px">
        </td>
    </tr>
    <tr>
        <td style="width: 35px; height: 22px">
        </td>
        <td style="width: 67px; height: 22px">
            密码：</td>
        <td style="width: 67px; height: 22px">
            <asp:TextBox ID="txtPassword" runat="server" Width="89px" TextMode="Password"></asp:TextBox></td>
        <td style="width: 23px; height: 22px">
        </td>
    </tr>
    <tr>
        <td style="width: 35px; height: 18px">
        </td>
        <td style="width: 67px; height: 18px">
        </td>
        <td style="width: 67px; height: 18px">
            <asp:CheckBox ID="ckRemPassword" runat="server" Text="记住密码" Width="88px" /></td>
        <td style="width: 23px; height: 18px">
        </td>
    </tr>
    <tr>
        <td style="width: 35px; height: 28px">
        </td>
        <td style="width: 67px; height: 28px">
            <asp:Button ID="btnLogin" runat="server" Text="登陆" OnClick="btnLogin_Click"/></td>
        <td style="width: 67px; height: 28px">
            <asp:Button ID="btnRegister" runat="server" Text="注册" OnClick="btnRegister_Click" /></td>
        <td style="width: 23px; height: 28px">
        </td>
    </tr>
</table>