﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CopmanyInfo.aspx.cs" Inherits="Admin_CopmanyInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>物业信息</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR"/>
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE"/>
		<meta content="JavaScript" name="vs_defaultClientScript"/>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema"/>
		<link href="../CSS/master.css" type="text/css" rel="stylesheet"/>
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<font face="宋体">
				<table id="Table1" cellspacing="1" cellpadding="1" width="642" align="center" border="1"
					style="WIDTH: 642px; position: absolute; top: 0px;">
					<tr>
						<td id="Terr" style="HEIGHT: 13.7%" align="left" width="750" colspan="4" runat="server"><font face="宋体"></font></td>
					</tr>
					<tr>
						<td class="bt12b" style="HEIGHT: 13.7%" align="center" width="750" colspan="4">
                            <span style="font-family: 宋体">物业信息</span></td>
					</tr>
                    <tr>
                        <td align="center" style="width: 20%; height: 21px;">
                            物业名称：</td>
                        <td id="T政治面貌" align="left" width="30%" style="height: 21px">
                            <asp:TextBox ID="TextBox9" runat="server" Width="178px"></asp:TextBox></td>
                        <td align="center" width="20%" style="height: 21px">
                            负责人：</td>
                        <td id="T籍贯" align="left" style="height: 21px">
                            <asp:TextBox ID="TextBox10" runat="server" Width="178px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 20%">
                            人员规模：</td>
                        <td align="left" width="30%" id="T专业">
                            <asp:TextBox ID="TextBox4" runat="server" Width="178px"></asp:TextBox></td>
                        <td align="center" width="20%">
                            联系电话：</td>
                        <td align="left" id="T学历">
                            <asp:TextBox ID="TextBox1" runat="server" Width="178px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 20%; height: 26px;">
                            物业地址：</td>
                        <td align="left" colspan="3">
                            <asp:TextBox ID="TextBox2" runat="server" Width="498px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 20%; height: 63px;">
                            宗旨介绍：</td>
                        <td id="Td4" runat="server" align="left" colspan="3" style="height: 63px">
                            <asp:TextBox ID="TextBox8" runat="server" Height="51px" TextMode="MultiLine" Width="498px"></asp:TextBox></td>
                    </tr>
					<tr>
						<td align="center" colspan="4" style="HEIGHT: 43px">
							<asp:button id="Button1" runat="server" Width="68px" Text="保存信息" OnClick="Button1_Click"></asp:button>&nbsp;
							</td>
					</tr>
				</table>
			</font>
		</form>
	</body>
</html>