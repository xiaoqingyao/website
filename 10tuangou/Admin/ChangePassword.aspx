<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Admin_ChangePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="vertical-align: middle; width: 543px; text-align: center">
            <tr>
                <td style="width: 137px">
                </td>
                <td style="width: 94px">
                </td>
                <td style="width: 88px">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 137px; height: 21px">
                </td>
                <td style="width: 94px; height: 21px">
                    修改密码</td>
                <td style="width: 88px; height: 21px">
                    <asp:Label ID="lblUserName" runat="server"></asp:Label></td>
                <td style="height: 21px">
                </td>
            </tr>
            <tr>
                <td style="width: 137px; height: 26px">
                </td>
                <td style="width: 94px; height: 26px">
                    原密码:</td>
                <td style="width: 88px; height: 26px">
                    <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password"></asp:TextBox></td>
                <td style="height: 26px">
                </td>
            </tr>
            <tr>
                <td style="width: 137px; height: 21px">
                </td>
                <td style="width: 94px; height: 21px">
                    新密码:</td>
                <td style="width: 88px; height: 21px">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox></td>
                <td style="height: 21px">
                </td>
            </tr>
            <tr>
                <td style="width: 137px">
                </td>
                <td style="width: 94px">
                    确定密码:</td>
                <td style="width: 88px">
                    <asp:TextBox ID="txtSurePassword" runat="server" TextMode="Password"></asp:TextBox></td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 137px">
                </td>
                <td colspan="2">
                    <asp:Button ID="btnOK" runat="server" OnClick="btnOK_Click" Text="确定" Width="71px" /></td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 137px">
                </td>
                <td style="width: 94px">
                </td>
                <td style="width: 88px">
                </td>
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
