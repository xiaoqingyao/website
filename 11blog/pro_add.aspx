<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pro_add.aspx.cs" Inherits="pro_add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" borderColorDark="#9cc7ef" cellPadding="4" width="60%" align="center"
				borderColorLight="#145aa0" border="1">
				<tr bgColor="#4296e7">
					<td colSpan="2">
						<div align="center"><font color="#ffffff">添加专辑</font></div>
					</td>
				</tr>
				<tr>
					<td noWrap width="30" style="WIDTH: 164px">
						<FONT face="宋体">专辑名称:</FONT>
					</td>
					<td width="79%">
						<asp:textbox id="mc" runat="server" Width="304px"></asp:textbox></td>
				</tr>
				<TR>
					<TD style="WIDTH: 164px" noWrap width="164" height="25"><FONT face="宋体">专辑类别:</FONT></TD>
					<TD width="59%" height="25">
						<asp:DropDownList id="lb" runat="server"></asp:DropDownList></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 164px" noWrap width="164" height="25"><FONT face="宋体">专辑图片:</FONT></TD>
					<TD width="59%" height="25"><INPUT id="UploadFile" type="file" size="50" name="UploadFile" runat="server"></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 164px; HEIGHT: 72px" noWrap width="164" height="72"><FONT face="宋体">专辑简介:</FONT></TD>
					<TD style="HEIGHT: 72px" width="59%" height="72"><FONT face="宋体">
							<asp:TextBox id="content" runat="server" Width="328px" Height="93px" TextMode="MultiLine"></asp:TextBox></FONT></TD>
				</TR>
				<tr>
					<td noWrap width="164" height="25" style="WIDTH: 164px">
						<div align="right"><FONT face="宋体"></FONT>&nbsp;</div>
					</td>
					<td width="59%" height="25">&nbsp;
						<asp:button id="Button1" runat="server" Text="添加" onclick="Button1_Click"></asp:button><FONT face="宋体">&nbsp;</FONT>
						<asp:button id="Button2" runat="server" Text="重填"></asp:button></td>
				</tr>
				<tr>
					<td colSpan="2">
						<div align="center"></div>
					</td>
				</tr>
				<tr bgColor="#4296e7">
					<td colSpan="2">&nbsp;</td>
				</tr>
			</table>
			<br>
		</form>
	</body>
</HTML>
