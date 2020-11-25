﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddJieKuan.aspx.cs" Inherits="AddJieKuan" Title="Untitled Page" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>家庭理财管理系统</title>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css" />
    <link rel="stylesheet" type="text/css" href="skin/css/main.css" />
    <script src="../JavaScript/WdatePicker.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width="100%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom: 8px; margin-top: 8px;">
                <tr>
                    <td class='title'>
                        <asp:Label runat="server" ID="title">新增借入款</asp:Label>
                    </td>
                </tr>
                <tr bgcolor="#FFFFFF">
                    <td align="left">


                        <table cellpadding="0" cellspacing="0" style="width: 100%;">
                            <tr>
                                <td rowspan="3" valign="top" style="width: 754px" align="center">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="text-align: left;" valign="top" align="left">
                                                <table border="0" cellpadding="0" cellspacing="0" class="text008" width="100%">
                                                    <tr align="center" class="bg04">
                                                        <td align="right" style="width: 128px; height: 35px;">
                                                            <asp:Label runat="server" ID="Label1">借入人：</asp:Label></td>
                                                        <td align="left" style="height: 35px">
                                                            <asp:TextBox ID="txtjkr" runat="server" Width="122px"></asp:TextBox></td>
                                                    </tr>
                                                    <tr align="center" class="bg04">
                                                        <td align="right" height="35" style="width: 128px">
                                                            <asp:Label runat="server" ID="Label2">借入日期：</asp:Label></td>
                                                        <td align="left">
                                                            <asp:TextBox ID="txtJksj" runat="server" onclick="WdatePicker()"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr align="center" class="bg04">
                                                        <td align="right" height="35" style="width: 128px"><asp:Label runat="server" ID="Label3">应还本息：</asp:Label></td>
                                                        <td align="left">
                                                            <asp:TextBox ID="TxtMoney" runat="server"></asp:TextBox>
                                                            （元）</td>
                                                    </tr>
                                                    <tr align="center" class="bg04">
                                                        <td align="right" height="35" style="width: 128px"><asp:Label runat="server" ID="Label4">归还日期：</asp:Label></td>
                                                        <td align="left">
                                                            <asp:TextBox ID="txtShrq" runat="server" onclick="WdatePicker()"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr align="center" class="bg04">
                                                        <td align="right" height="35" style="width: 128px"><asp:Label runat="server" ID="Label5">现已归还金额：</asp:Label></td>
                                                        <td align="left">
                                                            <asp:TextBox ID="txtYsh" runat="server"></asp:TextBox>(元)
                                                        </td>
                                                    </tr>
                                                    <tr align="center" class="bg04">
                                                        <td align="right" height="35" style="width: 128px"><asp:Label runat="server" ID="Label6">待归还金额：</asp:Label></td>
                                                        <td align="left">
                                                            <asp:TextBox ID="txtDsh" runat="server"></asp:TextBox>(元)
                                                        </td>
                                                    </tr>
                                                    <tr align="center" class="bg04" style="display:none">
                                                        <td align="right" height="35" style="width: 128px">借贷类型：</td>
                                                        <td align="left">
                                                           <asp:DropDownList ID="DropDownList1" runat="server" Width="125px" Height="19px">
                                                                <asp:ListItem Value="借出款">借出款</asp:ListItem>
                                                                <asp:ListItem Value="借入款">借入款</asp:ListItem>
                                                            </asp:DropDownList></td>
                                                    </tr>
                                                    <tr align="center">
                                                        <td align="right" height="168" style="width: 128px" valign="top">
                                                            <div class="mar009">
                                                                备注
                                                            </div>
                                                        </td>
                                                        <td align="left" valign="top">
                                                            <asp:TextBox ID="TxtStatement" runat="server" Height="157px" TextMode="MultiLine"
                                                                Width="545px"></asp:TextBox>
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr align="center">
                                                        <td align="center" colspan="2" style="height: 21px" valign="top">
                                                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确认" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>


                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
