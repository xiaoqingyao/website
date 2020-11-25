<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="SysManage_Login" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>社区水电费管理信息系统</title>
<style type="text/css">
body 
{
	margin:0;
	font-size:14px;
	color:#db0000;background:url(images/bg.jpg) repeat;
}
.textbox
{
	border:1px solid #ccc;
	margin-left:2px;
}
</style>
</head>
<body>
<form id="form1" runat="server">

<table style="WIDTH:100%; HEIGHT:100%">
            <tr>
                <td align="center">
                    <img src="images/logo.png" width="150" />
                    <p style="color:#0065ab; font-size:30px; font-weight:bold;line-height:50px;">
                    社区水电费管理信息系统
                    </p>
                </td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <table align="center" style="margin-top:30px;">
                        <tr>
                            <td style="height:45px" align="center">登录帐号：</td>
                            <td><asp:TextBox ID="Txtuid" runat="server" CssClass="textbox" Width="160px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="height:45px" align="center">登录密码：</td>
                            <td><asp:TextBox ID="Txtpwd" runat="server" CssClass="textbox" TextMode="Password" Width="160px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="height:45px" align="center">用户角色：</td>
                            <td>
                                <asp:DropDownList ID="grade" runat="server">
                                <asp:ListItem Value="1">系统管理员</asp:ListItem>
                                <asp:ListItem Value="2">普通管理员</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top:10px;" colspan="2">
                                &nbsp;<asp:ImageButton ID="btnLogin" runat="server" ImageUrl="images/btn_login.gif" OnClick="imbtnSubmit_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                                <input onclick="javascript:window.location.href=window.location.href;" type="image" src="images/btn_reset.gif">
                            </td>
                        </tr>
                        <tr>
                            <td style="color:#db0000;" colspan="2">
                                <asp:Literal ID="ltlMess" runat="server"></asp:Literal></td>
                        </tr>
                    </table>
                </td>
            </tr>
            
        </table>









</form>
</body>
</html>