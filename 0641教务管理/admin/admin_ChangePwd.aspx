<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_ChangePwd.aspx.cs" Inherits="admin_AdminChangePwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
    <link href="../Mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
<div style="text-align: center">
        &nbsp;<br />
        <br />
        <br />
        &nbsp;<fieldset style="width: 344px; height: 178px; text-align:center">
            <legend class="mailTitle"><strong>管理员修改密码</strong></legend>
            <br />
            &nbsp;<br />
        <table align="center" border="0" cellpadding="0" cellspacing="0"  height="145"
            width="316">
            <tr>
                <td style="width: 220px; text-align: right">
                    &nbsp;输入旧密码：</td>
                <td width="281">
        <asp:TextBox ID="txtOldPwd" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 220px; text-align: right">
                    &nbsp;输入新密码：</td>
                <td>
        <asp:TextBox ID="txtNewPwd" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 220px; text-align: right">
                    &nbsp;验证新密码：</td>
                <td>
                    <asp:TextBox ID="txtNewPwdA" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    &nbsp;<asp:Button ID="btnchange" runat="server" OnClick="btnchange_Click" Text="确定修改" /></td>
            </tr>
        </table>
        </fieldset>
    </div>
    </form>
</body>
</html>
