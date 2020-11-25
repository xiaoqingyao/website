<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="Admin_AddUser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="vertical-align: middle; width: 536px; text-align: center">
            <tr>
                <td style="vertical-align: middle; width: 122px; text-align: center">
                </td>
                <td colspan="2">
                    添加管理员</td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 122px">
                </td>
                <td style="width: 108px">
                </td>
                <td style="width: 103px">
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 122px">
                </td>
                <td style="width: 108px">
                    用户名:</td>
                <td style="width: 103px">
                    <asp:TextBox ID="txtUserName" runat="server" Width="150px"></asp:TextBox></td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 122px; height: 26px">
                </td>
                <td style="width: 108px; height: 26px">
                    密码:</td>
                <td style="width: 103px; height: 26px">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="150px"></asp:TextBox></td>
                <td style="height: 26px">
                </td>
            </tr>
            <tr>
                <td style="width: 122px; height: 26px">
                </td>
                <td style="width: 108px; height: 26px">
                    确认密码:</td>
                <td style="width: 103px; height: 26px">
                    <asp:TextBox ID="txtSurePassword" runat="server" TextMode="Password" Width="150px"></asp:TextBox></td>
                <td style="height: 26px">
                </td>
            </tr>
            <tr>
                <td style="width: 122px; height: 30px">
                </td>
                <td colspan="2" style="height: 30px">
                    <asp:Button ID="bnOk" runat="server" OnClick="bnOk_Click" Text="添加" Width="56px" /></td>
                <td style="height: 30px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
