﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WyfEdit.aspx.cs" Inherits="Yg_WyfEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>YGInfoAdd</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR"/>
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE"/>
		<meta content="JavaScript" name="vs_defaultClientScript"/>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema"/>
		<link href="../CSS/master.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <font face="宋体">
				<table id="Table1" cellspacing="1" cellpadding="1" width="642" align="center" border="1"
					style="WIDTH: 642px; position: absolute; top: 0px;">
					<tr>
						<td id="Terr" style="HEIGHT: 13.7%" align="left" width="750" colspan="4" runat="server"><font face="宋体"></font></td>
					</tr>
					<tr>
						<td class="bt12b" style="HEIGHT: 13.7%" align="center" width="750" colspan="4">
                            <span style="font-family: 宋体">收取物业费</span></td>
					</tr>
                    <tr>
                        <td align="center" style="width: 20%; height: 21px;">
                            住户信息：</td>
                        <td id="T政治面貌" align="left" style="height: 21px" valign="middle" colspan="3">
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="505px">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 20%; height: 21px">
                            收费年度：</td>
                        <td align="left" style="height: 21px" valign="middle" width="30%">
                            <asp:TextBox ID="TextBox1" runat="server" Width="178px"></asp:TextBox></td>
                        <td align="center" style="height: 21px" width="20%">
                            收费金额：</td>
                        <td align="left" style="height: 21px">
                            <asp:TextBox ID="TextBox3" runat="server" Width="178px" Enabled="false" Text="0"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 20%; height: 21px">
                            收费内容：</td>
                        <td align="left" colspan="3" style="height: 21px">
                            <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
                                onselectedindexchanged="CheckBoxList1_SelectedIndexChanged" RepeatColumns="3" 
                                Width="400px" AutoPostBack="True">
                                <asp:ListItem Value="200">管理费 200元</asp:ListItem>
                                <asp:ListItem Value="45">绿化养护费 45元</asp:ListItem>
                                <asp:ListItem Value="50">道路养护费 50元</asp:ListItem>
                                <asp:ListItem Value="200">安保费 200元</asp:ListItem>
                                <asp:ListItem Value="100">设备折旧费 100元</asp:ListItem>
                            </asp:CheckBoxList>
                            </td>
                    </tr>
					<tr>
						<td align="center" colspan="4" style="HEIGHT: 43px">
							<asp:button id="Button1" runat="server" Width="68px" Text="完成录入" OnClick="Button1_Click"></asp:button>&nbsp;</td>
					</tr>
                    
                    </tr>
				</table>
			</font>
    </div>
    </form>
</body>
</html>