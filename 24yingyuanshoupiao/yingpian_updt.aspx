<%@ Page Language="C#" AutoEventWireup="true" CodeFile="yingpian_updt.aspx.cs" Inherits="yingpian_updt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>�ޱ���ҳ</title><script language="javascript" src="js/Calendar.js"></script>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
		<script language="javascript">	
function OpenScript(url,width,height)
{
  var win = window.open(url,"SelectToSort",'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=yes' );
}
	function OpenDialog(sURL, iWidth, iHeight)
{
   var oDialog = window.open(sURL, "_EditorDialog", "width=" + iWidth.toString() + ",height=" + iHeight.toString() + ",resizable=no,left=0,top=0,scrollbars=no,status=no,titlebar=no,toolbar=no,menubar=no,location=no");
   oDialog.focus();
}
</script>
	<body>
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" borderColorDark="#9cc7ef" cellPadding="4" width="100%" align="center"
				borderColorLight="#145aa0" border="1">
				<tr bgColor="#4296e7">
					<td colSpan="2">
						<div align="center"><font color="#ffffff">�޸�ӰƬ</font></div>
					</td>
				</tr>
				<tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>���:</FONT></td><td width='79%'><asp:textbox id='bianhao' runat='server'></asp:textbox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorbianhao" runat="server" ControlToValidate="bianhao" ErrorMessage="����"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>ӰƬ����:</FONT></td><td width='79%'><asp:textbox id='yingpianmingcheng' Width='395px' runat='server'></asp:textbox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatoryingpianmingcheng" runat="server" ControlToValidate="yingpianmingcheng" ErrorMessage="����"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>��ӳʱ��:</FONT></td><td width='79%'><asp:TextBox ID='shangyingshijian' runat='server' onclick="getDate(Form1.shangyingshijian,'2')" need="1"></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorshangyingshijian" runat="server" ControlToValidate="shangyingshijian" ErrorMessage="����"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>Ʊ��:</FONT></td><td width='79%'><asp:textbox id='piaoshu' runat='server'></asp:textbox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorpiaoshu" runat="server" ControlToValidate="piaoshu" ErrorMessage="����"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>�ص�:</FONT></td><td width='79%'><asp:textbox id='didian' Width='395px' runat='server'></asp:textbox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatordidian" runat="server" ControlToValidate="didian" ErrorMessage="����"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>ӰƬ����:</FONT></td><td width='79%'><asp:DropDownList ID='yingpianleixing' runat='server'></asp:DropDownList></td></tr><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>Ʊ��:</FONT></td><td width='79%'><asp:textbox id='piaojia' runat='server'></asp:textbox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorpiaojia" runat="server" ControlToValidate="piaojia" ErrorMessage="����"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>ͼƬ:</FONT></td><td width='79%'>
                    <asp:TextBox ID="tupian" runat="server" Width="395px"></asp:TextBox>
                    <a href="javaScript:OpenScript('hsgupfile.aspx?Result=tupian',500,30)">
                        <img align="absMiddle" border="0" height="16" src="Images/Upload.gif" width="30" /></a></td></tr><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>��ע:</FONT></td><td width='79%'><asp:textbox id='beizhu' Width='400px' Height='100px' TextMode='MultiLine' runat='server' ></asp:textbox></td></tr>
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

