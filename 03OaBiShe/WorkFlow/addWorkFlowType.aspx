﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addWorkFlowType.aspx.cs" Inherits="WorkFlow_addWorkFlowType" %>

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
        <br />
        <br />
        <table style="width: 400px; height: 100px" align=center id="TABLE1" class="css" border="1"> 
            <tr>
                <td align="center" colspan="3" style="height: 20px" class="cssTitle">
                    新建流程类型</td>
            </tr>
            <tr>
                <td style="width: 100px; height: 26px;" align="right">
                    流程类型编号：</td>
                <td align="left" colspan="2" style="height: 26px">
                    <asp:TextBox ID="code" runat="server" Width="200px" CssClass="InputCss"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="code"
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
                <td style="width: 81px; height: 26px;" align="right">
                    描述：</td>
                <td colspan="2" style="height: 26px">
                    <asp:TextBox ID="note" runat="server" Width="294px" Height="100px" Rows="8" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:Button ID="btnAdd" runat="server" Text="添　加" OnClick="btnAdd_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="重　置" OnClick="btnCancel_Click" CausesValidation="False" UseSubmitBehavior="False" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
