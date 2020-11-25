<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Create.aspx.cs" Inherits="WorkFlow_Create" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
     <script language="javascript" type="text/javascript" src="../script/WdatePicker.js"></script>  
</head>
<body style="background-image: url(../image/rightFrame.gif); background-size: cover;">
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            <br />
            <table style="height: 200px" align="center" id="TABLE1" class="css" border="1">
                <tr>
                    <td colspan="4" style="text-align: center; font-size: large">OA事务审批系统-流程发起
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;">标题：</td>
                    <td colspan="3">
                        <asp:TextBox ID="title" runat="server" Width="560px" CssClass="InputCss"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>流程类型：</td>
                    <td>
                        <asp:DropDownList ID="ddlwfType" runat="server" Width="200px" CssClass="InputCss"></asp:DropDownList></td>
                    <td style="width: 100px;">申请时间：</td>
                    <td>
                        <asp:TextBox ID="txtDate" runat="server" Width="200px" CssClass="InputCss" onclick="WdatePicker()" ></asp:TextBox></td>
                </tr>
                <tr>
                    <td>制单人：</td>
                    <td>
                        <asp:TextBox ID="txtbillUser" runat="server" Width="200px" CssClass="InputCss" ReadOnly="true"></asp:TextBox></td>
                    <td>所属班级：</td>
                    <td>
                        <asp:TextBox ID="txtDept" runat="server" Width="200px" CssClass="InputCss" ReadOnly="true"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>申请说明：</td>
                    <td colspan="3">
                        <asp:TextBox ID="billContent" runat="server" Width="600px" Height="200px" CssClass="InputCss" TextMode="MultiLine"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>审批类型：</td>
                    <td colspan="3">
                        <asp:RadioButton ID="rb_Zc" GroupName="type" runat="server" Text="正常流程" OnCheckedChanged="RadioButton1_CheckedChanged" AutoPostBack="true" Checked="true"/>
                        <asp:RadioButton ID="rb_Ddd" GroupName="type" runat="server" Text="点对点审批" OnCheckedChanged="RadioButton1_CheckedChanged" AutoPostBack="true"/>
                    </td>
                </tr>
                <tr runat="server" id="ddd" visible="false">
                    <td>选择审批人：</td>
                    <td colspan="3">
                        <asp:DropDownList runat="server" ID="shenpiren"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <asp:Button ID="btnSave" runat="server" Text="提交至审批流" OnClick="btnSave_Click" CommandName="blueButtonCss" />
                        </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
