<%@ Page Language="C#" AutoEventWireup="true" CodeFile="notice.aspx.cs" Inherits="BaseInfo_notice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link rel ="stylesheet" type="text/css" href="../CSS/CSS.css" />
</head>
<body style="background-image: url(../image/rightFrame.gif);background-size: cover;">
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <br />
        <table border="1" style="width: 500px; height: 40px" class="css" align="center">
            <tr>
                <td align="center" colspan="3" class="cssTitle">
                    －＝发布公告＝－</td>
            </tr>
            <tr>
                <td style="width: 62px">
                    标题：</td>
                <td colspan="2">
                    <asp:TextBox ID="TextBox1" runat="server" Width="418px" CssClass="InputCss"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 62px">
                    内容：<br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
                <td colspan="2">
                    <asp:TextBox ID="TextBox2" runat="server" Height="145px" TextMode="MultiLine" Width="418px" CssClass="InputCss"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:Button ID="Button1" runat="server" Text="发　布" OnClick="Button1_Click" CssClass="blueButtonCss" />
                    <asp:Button ID="Button2" runat="server" Text="重　置" CausesValidation="False" OnClick="Button2_Click" CssClass="blueButtonCss" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
