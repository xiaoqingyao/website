﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zhuceyonghu_updt2.aspx.cs" Inherits="zhuceyonghu_updt2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title><script language="javascript" src="js/Calendar.js"></script>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" borderColorDark="#9cc7ef" cellPadding="4" width="100%" align="center"
				borderColorLight="#145aa0" border="1">
				<tr bgColor="#4296e7">
					<td colSpan="2">
						<div align="center"><font color="#ffffff">修改个人资料</font></div>
					</td>
				</tr>
				<tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>用户名:</FONT></td><td width='79%'><asp:textbox id='yonghuming' runat='server' ReadOnly="True"></asp:textbox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatoryonghuming" runat="server" ControlToValidate="yonghuming" ErrorMessage="必填"></asp:RequiredFieldValidator>此项不得修改<tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>密码:</FONT></td><td width='79%'><asp:textbox id='mima' runat='server'></asp:textbox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatormima" runat="server" ControlToValidate="mima" ErrorMessage="必填"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>姓名:</FONT></td><td width='79%'><asp:textbox id='xingming' runat='server'></asp:textbox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorxingming" runat="server" ControlToValidate="xingming" ErrorMessage="必填"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>电话:</FONT></td><td width='79%'><asp:textbox id='dianhua' runat='server'></asp:textbox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatordianhua" runat="server" ControlToValidate="dianhua" ErrorMessage="必填"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>邮箱:</FONT></td><td width='79%'><asp:textbox id='youxiang' runat='server'></asp:textbox></td></tr><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>身份证:</FONT></td><td width='79%'><asp:textbox id='shenfenzheng' Width='395px' runat='server'></asp:textbox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorshenfenzheng" runat="server" ControlToValidate="shenfenzheng" ErrorMessage="必填"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>性别:</FONT></td><td width='79%'><asp:DropDownList ID='xingbie' runat='server'></asp:DropDownList></td></tr><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>备注:</FONT></td><td width='79%'><asp:textbox id='beizhu' Width='400px' Height='100px' TextMode='MultiLine' runat='server' ></asp:textbox></td></tr>
				<tr>
					<td noWrap width="164" height="25" style="WIDTH: 164px">
						<div align="right"><FONT face="宋体"></FONT>&nbsp;</div>
					</td>
					<td width="59%" height="25">&nbsp;
						<asp:button id="Button1" runat="server" Text="修改" OnClick="Button1_Click"></asp:button><FONT face="宋体">&nbsp;</FONT>
                        <input id="Reset1" type="reset" value="重置" /></td>
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
