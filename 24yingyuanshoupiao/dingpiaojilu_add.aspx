<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dingpiaojilu_add.aspx.cs" Inherits="dingpiaojilu_add" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>�ޱ���ҳ</title><script language="javascript" src="js/Calendar.js"></script>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" borderColorDark="#9cc7ef" cellPadding="4" width="100%" align="center"
				borderColorLight="#145aa0" border="1">
				<tr bgColor="#4296e7">
					<td colSpan="2">
						<div align="center"><font color="#ffffff">��Ӷ�Ʊ��¼</font></div>
					</td>
				</tr>
				
			<tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>��Ʊ��:</FONT></td><td width='79%'><asp:TextBox ID='dingpiaoren' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatordingpiaoren" runat="server" ControlToValidate="dingpiaoren" ErrorMessage="����"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>ӰƬ���:</FONT></td><td width='79%'><asp:TextBox ID='yingpianbianhao' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatoryingpianbianhao" runat="server" ControlToValidate="yingpianbianhao" ErrorMessage="����"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>ӰƬ����:</FONT></td><td width='79%'><asp:TextBox ID='yingpianmingcheng' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatoryingpianmingcheng" runat="server" ControlToValidate="yingpianmingcheng" ErrorMessage="����"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>��ӳʱ��:</FONT></td><td width='79%'><asp:TextBox ID='fangyingshijian' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorfangyingshijian" runat="server" ControlToValidate="fangyingshijian" ErrorMessage="����"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>��ӳ�ص�:</FONT></td><td width='79%'><asp:TextBox ID='fangyingdidian' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorfangyingdidian" runat="server" ControlToValidate="fangyingdidian" ErrorMessage="����"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>��λ:</FONT></td><td width='79%'><asp:TextBox ID='zuowei' runat='server'></asp:TextBox></td></tr><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>Ʊ��:</FONT></td><td width='79%'><asp:TextBox ID='piaojia' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorpiaojia" runat="server" ControlToValidate="piaojia" ErrorMessage="����"></asp:RequiredFieldValidator>
				
				
				
				<tr>
					<td noWrap width="164" height="25" style="WIDTH: 164px">
						<div align="right"><FONT face="����"></FONT>&nbsp;</div>
					</td>
					<td width="59%" height="25">&nbsp;
						<asp:button id="Button1" runat="server" Text="���" onclick="Button1_Click"></asp:button><FONT face="����">&nbsp;</FONT>
                        <input id="Reset1" type="reset" value="����" /></td>
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
