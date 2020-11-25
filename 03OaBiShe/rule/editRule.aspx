<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editRule.aspx.cs" Inherits="rule_editRule" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-image: url(../image/rightFrame.gif)">
    <form id="form1" runat="server">
    <div>
        <table class="css" style="width: 497px; height: 1px" border="1" align="center">
            <tr>
                <td align="center" class="cssTitle" colspan="3">
                    编辑班级规章制度</td>
            </tr>
            <tr>
                <td style="height: 392px" colspan="3">
                    <asp:TextBox ID="TextBox1" runat="server" Height="400px" TextMode="MultiLine" Width="720px" CssClass="InputCss"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="center" colspan="3" style="height: 17px">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="提　交" CssClass="redButtonCss" />
                    <asp:Button ID="Button2" runat="server" Text="重　置" CssClass="redButtonCss" OnClick="Button2_Click" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
