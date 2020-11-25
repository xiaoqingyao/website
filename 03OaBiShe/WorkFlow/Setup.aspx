<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Setup.aspx.cs" Inherits="WorkFlow_Setup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>设置审批流</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-image: url(../image/rightFrame.gif); background-size: cover;">
    <body>
        <form id="form1" runat="server">
            <div>
                <table style="width: 500px; height: 100px" align="center" id="TABLE1" class="css" border="1">
                    <tr>
                    <td colspan="2" style="text-align: center; font-size: large">审批节点设置
                    </td>
                </tr>
                    <tr>
                        <td>流程类型：</td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlWfType" OnSelectedIndexChanged="ddlWfType_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>第一审批人：</td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlAuditor1"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>第二审批人：</td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlAuditor2"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>第三审批人：</td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlAuditor3"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>第四审批人：</td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlAuditor4"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>说明：</td>
                        <td>
                            <asp:TextBox runat="server" ID="note" TextMode="MultiLine" Width="300px" Height="200px"> </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="btnSave" runat="server" Text="提　交" OnClick="btnSave_Click" CssClass="blueButtonCss" />
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>
