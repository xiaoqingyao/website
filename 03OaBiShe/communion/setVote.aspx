<%@ Page Language="C#" AutoEventWireup="true" CodeFile="setVote.aspx.cs" Inherits="communion_setVote" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link rel="stylesheet" type="text/css" href="../CSS/CSS.css" />
</head>
<body style="background-image: url(../image/rightFrame.gif);background-size: cover;">
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <table style="width: 500px; height: 100px" class="css" align="center" border="1">
            <tr>
                <td align="center" colspan="3" style="height: 9px" class="cssTitle">
                    －＝设置活动投票信息＝－</td>
            </tr>
            <tr>
                <td style="width: 432px; height: 4px;">
                    活动标题：</td>
                <td style="width: 294px; height: 4px;">
                    <asp:TextBox ID="TextBox1" runat="server" Width="335px" CssClass="InputCss"></asp:TextBox></td>
                <td style="width: 88px; height: 4px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="**　必填项！" Width="73px"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 432px; height: 49px">
                    活动描述：</td>
                <td style="width: 294px; height: 49px">
                    <asp:TextBox ID="TextBox2" runat="server" Height="80px" TextMode="MultiLine" Width="335px" CssClass="InputCss"></asp:TextBox></td>
                <td style="height: 49px; width: 88px;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                        ErrorMessage="**　必填项！" Width="73px"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="center" colspan="3" rowspan="2">
                    <asp:Button ID="btnSave" runat="server" Text="提　交" OnClick="btnSave_Click" CssClass="blueButtonCss" />
                    <asp:Button ID="btnClear" runat="server" CausesValidation="False" Text="重　置" CssClass="blueButtonCss" OnClick="btnClear_Click" /></td>
            </tr>
            <tr>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
