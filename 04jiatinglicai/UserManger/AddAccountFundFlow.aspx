<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddAccountFundFlow.aspx.cs" Inherits="UserManger_AddAccountFundFlow" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>家庭理财管理系统</title>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css" />
    <link rel="stylesheet" type="text/css" href="skin/css/main.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width="100%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom: 8px; margin-top: 8px;">
                <tr>
                    <td class='title' style="width: 1158px"><span>资金账户变更</span></td>
                </tr>
                <tr bgcolor="#FFFFFF">
                    <td align="left" style="width: 1158px">
                        <table cellpadding="0" cellspacing="0" style="width: 100%;">
                            <tr>
                                <td rowspan="3" valign="top" style="width: 930px" align="center">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="text-align: left;" valign="top" align="left">
                                                <table border="0" cellpadding="0" cellspacing="0" class="text008" width="100%">
                                                    <tr align="center" class="bg04">
                                                        <td align="right" height="35" style="width: 128px">转入账户：</td>
                                                        <td align="left">
                                                            <asp:DropDownList runat="server" ID="inAccount" Height="16px" Width="150px"></asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" height="35" style="width: 128px">资金来源：</td>
                                                        <td align="left">
                                                            <asp:RadioButton runat="server" GroupName="a" ID="qichu" Text="初始资金录入" Checked="true" AutoPostBack="true" OnCheckedChanged="qichu_CheckedChanged" />
                                                            <asp:RadioButton runat="server" GroupName="a" ID="account" Text="其他账户转入" Checked="false"  AutoPostBack="true" OnCheckedChanged="qichu_CheckedChanged"/>
                                                        </td>
                                                    </tr>
                                                    <tr align="center" class="bg04" runat="server" id="trOutAccount" visible="false">
                                                        <td align="right" height="35" style="width: 128px">转出账户：</td>
                                                        <td align="left">
                                                            <asp:DropDownList runat="server" ID="outAccount" Height="16px" Width="146px"></asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr align="center" class="bg04">
                                                        <td align="right" height="35" style="width: 128px">发生金额：</td>
                                                        <td align="left">
                                                            <asp:TextBox ID="txtJe" runat="server" Width="145px"></asp:TextBox>
                                                            (元)
                                                        </td>
                                                    </tr>
                                                      <tr align="center" class="bg04">
                                                        <td align="right" height="35" style="width: 128px">变更备注：</td>
                                                        <td align="left">
                                                            <asp:TextBox ID="txtBz" runat="server" Width="392px" TextMode="MultiLine" Height="200px"></asp:TextBox>
                                                        </td>
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
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
