﻿<%@ Page Language="C#"   AutoEventWireup="true" CodeFile="AddMoney.aspx.cs" Inherits="AddMoney" Title="Untitled Page" %>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>家庭理财管理系统</title>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css" />
<link rel="stylesheet" type="text/css" href="skin/css/main.css" />
    <script src="../JavaScript/WdatePicker.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
<table width="100%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px;margin-top:8px;">
  <tr>
    <td  class='title'>
        <asp:Label runat="server" ID="title" Text="新增收入"></asp:Label>

    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="left">
    
    
<table cellpadding="0" cellspacing="0" style="width:100%;">
    <tr>
        <td rowspan="3" valign="top" style="width: 715px" align="center" >
            <table style="width:100%;">
                <tr>
                    <td style="text-align: left; height: 368px;" valign="top" align="left">
                        <table border="0" cellpadding="0" cellspacing="0" class="text008" width="100%">
                            <tr align="center">
                                <td align="right" style="height: 43px" width="12%">
                                    <asp:Label runat="server" ID="xiangmu">收入科目：</asp:Label></td>
                                <td align="left" style="height: 43px" width="88%">
                                    <asp:DropDownList ID="drpParentItem" runat="server" Width="150px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr align="center" runat="server" id="trSubItem">
                                <td align="right" style="height: 35px">
                                     收支类型：
                                </td>
                                <td align="left" style="height: 35px">
                                    <asp:DropDownList ID="drpSubItem" runat="server" Width="100px">
                                        <asp:ListItem Value="收入">收入</asp:ListItem>
                                        <asp:ListItem  Value="支出">支出</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                             <tr align="center">
                                <td align="right" style="height: 35px">
                                      <asp:Label runat="server" ID="fsr">收入人：</asp:Label>
                                </td>
                                <td align="left" style="height: 35px">
                                    <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>   
                                </td>
                            </tr>
                             <tr align="center">
                                <td align="right" style="height: 35px">
                                     <asp:Label runat="server" ID="fsrq">收入日期：</asp:Label>
                                </td>
                                <td align="left" style="height: 35px">
                                    <asp:TextBox ID="txtDate" runat="server" onclick="WdatePicker()" ></asp:TextBox>   
                                </td>
                            </tr>
                            <tr align="center">
                                <td align="right" style="height: 35px">
                                      <asp:Label runat="server" ID="fszh">收入到：</asp:Label>
                                </td>
                                <td align="left" style="height: 35px">
                                    <asp:DropDownList ID="drpAccount" runat="server" Height="16px" Width="152px" >
                                    </asp:DropDownList>资金账户</td>
                            </tr>
                            <tr align="center" class="bg04">
                                <td align="right" height="35">
                                      <asp:Label runat="server" ID="je">收入金额：</asp:Label></td>
                                <td align="left">
                                    <asp:TextBox ID="TxtMoney" runat="server"></asp:TextBox>(元)
                                </td>
                            </tr>
                            <tr align="center">
                                <td align="right" height="168" valign="top">
                                    <div class="mar009">
                                        备注：</div>
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
