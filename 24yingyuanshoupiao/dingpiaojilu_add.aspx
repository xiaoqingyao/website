<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dingpiaojilu_add.aspx.cs" Inherits="dingpiaojilu_add" %>
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
						<div align="center"><font color="#ffffff">添加订票记录</font></div>
					</td>
				</tr>
				
			<tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>订票人:</FONT></td><td width='79%'><asp:TextBox ID='dingpiaoren' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatordingpiaoren" runat="server" ControlToValidate="dingpiaoren" ErrorMessage="必填"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>影片编号:</FONT></td><td width='79%'><asp:TextBox ID='yingpianbianhao' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatoryingpianbianhao" runat="server" ControlToValidate="yingpianbianhao" ErrorMessage="必填"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>影片名称:</FONT></td><td width='79%'><asp:TextBox ID='yingpianmingcheng' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatoryingpianmingcheng" runat="server" ControlToValidate="yingpianmingcheng" ErrorMessage="必填"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>放映时间:</FONT></td><td width='79%'><asp:TextBox ID='fangyingshijian' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorfangyingshijian" runat="server" ControlToValidate="fangyingshijian" ErrorMessage="必填"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>放映地点:</FONT></td><td width='79%'><asp:TextBox ID='fangyingdidian' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorfangyingdidian" runat="server" ControlToValidate="fangyingdidian" ErrorMessage="必填"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>座位:</FONT></td><td width='79%'><asp:TextBox ID='zuowei' runat='server'></asp:TextBox></td></tr><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>票价:</FONT></td><td width='79%'><asp:TextBox ID='piaojia' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorpiaojia" runat="server" ControlToValidate="piaojia" ErrorMessage="必填"></asp:RequiredFieldValidator>
				
				
				
				<tr>
					<td noWrap width="164" height="25" style="WIDTH: 164px">
						<div align="right"><FONT face="宋体"></FONT>&nbsp;</div>
					</td>
					<td width="59%" height="25">&nbsp;
						<asp:button id="Button1" runat="server" Text="添加" onclick="Button1_Click"></asp:button><FONT face="宋体">&nbsp;</FONT>
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
