<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdatePassword.aspx.cs" Inherits="UpdatePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>找回密码</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="100%">
            <tr>
                <td colspan="3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" style="height: 24px; background-color: #00cc99">
                </td>
            </tr>
            <tr>
                <td style="width: 268px">
                </td>
                <td style="width: 118px">
                    用户名：</td>
                <td style="width: 442px">
                    <asp:Label ID="lblPerName" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 268px">
                </td>
                <td style="width: 118px">
                    原密码：</td>
                <td style="width: 442px">
                    <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password" Width="150px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 268px; height: 20px">
                </td>
                <td style="width: 118px; height: 20px">
                    新密码：</td>
                <td style="width: 442px; height: 20px">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 268px; height: 28px">
                </td>
                <td style="width: 118px; height: 28px">
                    确认新密码：</td>
                <td style="width: 442px; height: 28px">
                    <asp:TextBox ID="txtSurePassword" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                    <asp:CompareValidator ID="cvPassword" runat="server" ControlToCompare="txtPassword"
                        ControlToValidate="txtSurePassword" ErrorMessage="两次输入密码不一致"></asp:CompareValidator></td>
            </tr>
            <tr>
                <td style="width: 268px; height: 26px">
                </td>
                <td style="width: 118px; height: 26px">
                    <asp:Button ID="btnOk" runat="server" OnClick="btnOk_Click" Text="确定" Width="71px" /></td>
                <td style="width: 442px; height: 26px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>