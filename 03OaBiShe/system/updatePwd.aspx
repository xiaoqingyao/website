<%@ Page Language="C#" AutoEventWireup="true" CodeFile="updatePwd.aspx.cs" Inherits="system_updatePwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-image: url(../image/rightFrame.gif)">
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <table class="css" style="width: 261px; height: 51px" align="center" border="1">
            <tr>
                <td style="width: 80px; height: 18px">
                    登录账户：</td>
                <td colspan="2" style="height: 18px">
                    <asp:Label ID="Label1" runat="server" CssClass="cssTitle" Text="Label" Width="144px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 80px">
                    新密码：</td>
                <td colspan="2">
                    <asp:TextBox ID="TextBox1" runat="server" Width="140px" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 80px">
                    确认新密码：</td>
                <td colspan="2">
                    <asp:TextBox ID="TextBox2" runat="server" Width="139px" TextMode="Password"></asp:TextBox><asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox1"
                        ControlToValidate="TextBox2" ErrorMessage="** 两次输入的密码不一致"></asp:CompareValidator></td>
            </tr>
            <tr>
                <td align="center" colspan="3" style="height: 34px">
                    <asp:Button ID="Button1" runat="server" Text="提　交" OnClick="Button1_Click" CssClass="redButtonCss" />
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" Text="重　置" CssClass="redButtonCss" />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
