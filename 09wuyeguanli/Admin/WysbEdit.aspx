<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WysbEdit.aspx.cs" Inherits="Admin_WysbEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>YGInfoAdd</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR"/>
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE"/>
		<meta content="JavaScript" name="vs_defaultClientScript"/>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema"/>
		<link href="../CSS/master.css" type="text/css" rel="stylesheet"/>
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<font face="宋体">
				<table id="Table1" cellspacing="1" cellpadding="1" align="center" border="1"
					style="WIDTH: 480px;">
					<tr>
						<td id="Terr" style="HEIGHT: 13.7%" align="left" width="750" colspan="4" runat="server"><font face="宋体"></font></td>
					</tr>
					<tr>
						<td class="bt12b" style="HEIGHT: 13.7%" align="center" width="750" colspan="4">
                            <span style="font-family: 宋体">设备信息</span></td>
					</tr>
                    <tr>
                        <td align="center" style="width: 20%; height: 26px;">
                            设备名称：</td>
                        <td align="left" colspan="3" style="width: 379px">
                            <asp:TextBox ID="TextBox2" runat="server" Width="354px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 20%; height: 8px;">
                            购买时间：</td>
                        <td id="Td4" align="left" colspan="3" style="height: 8px; width: 379px;">
                            <asp:TextBox ID="TextBox1" runat="server" Width="355px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 20%; height: 8px">
                            数量</td>
                        <td align="left" colspan="3" style="width: 379px; height: 8px">
                            <asp:TextBox ID="TextBox3" runat="server" Width="354px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 20%; height: 8px">
                            设备描述</td>
                        <td align="left" colspan="3" style="width: 379px; height: 8px">
                            <asp:TextBox ID="TextBox4" runat="server" Height="123px" TextMode="MultiLine" Width="354px"></asp:TextBox></td>
                    </tr>
					<tr>
						<td align="center" colspan="4" style="HEIGHT: 35px">
							<asp:button id="Button1" runat="server" Width="68px" Text="保存" OnClick="Button1_Click"></asp:button>&nbsp;
                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="返回" Width="68px" /></td>
					</tr>
				</table>
			</font>
		</form>
	</body>
</html>
