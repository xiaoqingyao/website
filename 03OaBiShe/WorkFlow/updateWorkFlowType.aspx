<%@ Page Language="C#" AutoEventWireup="true" CodeFile="updateWorkFlowType.aspx.cs" Inherits="WorkFlow_updateWorkFlowType" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-image: url(../image/rightFrame.gif);background-size: cover;">
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <br />
        <br />
        <table style="width: 500px; height: 100px" align="center" class="css" border="1">
            <tr>
                <td align="center" class="cssTitle" colspan="3" style="height: 17px">
                    －＝修改流程类型信息＝－</td>
            </tr>
            <tr>
                <td style="width: 91px">
                    <asp:Label ID="Label1" runat="server" Font-Size="Small" Text="流程类型编号：" Width="91px"></asp:Label></td>
                <td colspan="2">
                    <asp:TextBox ID="code" runat="server" Width="206px" Font-Size="Small" CssClass="InputCss" ReadOnly="true"></asp:TextBox> 编号不允许修改
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="code"
                        ErrorMessage="RequiredFieldValidator" SetFocusOnError="True" Width="37px">**</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 81px; height: 26px;" align="right">
                    流程类型名称：</td>
                <td align="left" colspan="2" style="height: 26px">
                    <asp:TextBox ID="name" runat="server" Width="200px" CssClass="InputCss"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="name"
                        ErrorMessage="RequiredFieldValidator" SetFocusOnError="True" Width="37px">**</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 77px" align="right">
                    <asp:Label ID="Label2" runat="server" Font-Size="Small" Text="描述：" Width="73px"></asp:Label></td>
                <td colspan="2">
                    <asp:TextBox ID="note" runat="server" Width="308px" Font-Size="Small" Height="59px" TextMode="MultiLine" CssClass="InputCss"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:Button ID="btnSave" runat="server" Text="保　存" OnClick="btnSave_Click" CommandName="blueButtonCss" />
                    <asp:Button ID="btnReturn" runat="server"  Text="返　回" UseSubmitBehavior="False" OnClick="btnReturn_Click" CommandName="blueButtonCss" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
