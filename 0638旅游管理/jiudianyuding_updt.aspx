<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jiudianyuding_updt.aspx.cs" Inherits="jiudianyuding_updt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>�ޱ���ҳ</title><script language="javascript" src="js/Calendar.js"></script>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" borderColorDark="#9cc7ef" cellPadding="4" width="100%" align="center"
				borderColorLight="#145aa0" border="1">
				<tr bgColor="#4296e7">
					<td colSpan="2">
						<div align="center"><font color="#ffffff">�޸ľƵ�Ԥ��</font></div>
					</td>
				</tr>
				<tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>�Ƶ�����:</FONT></td><td width='79%'><asp:textbox id='jiudianmingcheng' runat='server'></asp:textbox>�ͷ���ţ�<asp:TextBox
                        ID="kefangbianhao" runat="server"></asp:TextBox></td></tr><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>Ԥ��ʱ��:</FONT></td><td width='79%'><asp:TextBox ID='yudingshijian' runat='server' onclick="getDate(Form1.yudingshijian,'2')" need="1"></asp:TextBox></td></tr><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>Ԥ������:</FONT></td><td width='79%'><asp:textbox id='yudingtianshu' runat='server'></asp:textbox></td></tr><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>��������:</FONT></td><td width='79%'><asp:textbox id='nindexingming' runat='server'></asp:textbox></td></tr><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>���ĵ绰:</FONT></td><td width='79%'><asp:textbox id='nindedianhua' runat='server'></asp:textbox></td></tr><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>�������֤:</FONT></td><td width='79%'><asp:textbox id='nindeshenfenzheng' Width='395px' runat='server'></asp:textbox></td></tr><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>��ע:</FONT></td><td width='79%'><asp:textbox id='beizhu' Width='400px' Height='100px' TextMode='MultiLine' runat='server' ></asp:textbox></td></tr>
				<tr>
					<td noWrap width="164" height="25" style="WIDTH: 164px">
						<div align="right"><FONT face="����"></FONT>&nbsp;</div>
					</td>
					<td width="59%" height="25">&nbsp;
						<asp:button id="Button1" runat="server" Text="�޸�" OnClick="Button1_Click"></asp:button><FONT face="����">&nbsp;</FONT>
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

