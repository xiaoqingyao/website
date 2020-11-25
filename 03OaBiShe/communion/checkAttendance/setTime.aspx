<%@ Page Language="C#" AutoEventWireup="true" CodeFile="setTime.aspx.cs" Inherits="checkAttendance_setTime" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-image: url(../../image/rightFrame.gif)" class="css">
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <table id="TABLE1" class="css" style="width: 312px; height: 1px" align="center" border="1" cellspacing="0">
            <tr>
                <td align="center" colspan="3" style="height: 13px" class="cssTitle">
                    学生上下课时间设置</td>
            </tr>
            <tr>
                <td style="width: 85px">
                    学生上课时间：</td>
                <td style="width: 84px">
                    <asp:TextBox ID="TextBox1" runat="server" Width="80px" CssClass="InputCss">08:00:00</asp:TextBox></td>
                <td>
                    格式例如：08:30:00<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="** 格式不正确" ControlToValidate="TextBox1" ValidationExpression="^(0?[0-9]|1[0-9]|2[0-3]):([0-5])+([0-9]):([0-5])+([0-9])"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td style="width: 85px">
                    学生下课时间：</td>
                <td style="width: 84px">
                    <asp:TextBox ID="TextBox2" runat="server" Width="80px" CssClass="InputCss">17:00:00</asp:TextBox></td>
                <td>
                    格式例如：16:30:00<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                        ControlToValidate="TextBox2" ErrorMessage="** 格式不正确" ValidationExpression="^(0?[0-9]|1[0-9]|2[0-3]):([0-5])+([0-9]):([0-5])+([0-9])"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td align="right" colspan="3">
                    <asp:Button ID="btnSave" runat="server" Text="设　置" OnClick="btnSave_Click" CssClass="blueButtonCss" />
                    &nbsp; &nbsp;
                    <asp:Button ID="btnClear" runat="server" CausesValidation="False" Text="重　置" CssClass="blueButtonCss" OnClick="btnClear_Click" />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
