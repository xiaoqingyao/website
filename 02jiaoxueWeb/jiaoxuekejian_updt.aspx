<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jiaoxuekejian_updt.aspx.cs" Inherits="jiaoxuekejian_updt" %>

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
						<div align="center"><font color="#ffffff">�޸Ľ�ѧ�μ�</font></div>
					</td>
				</tr>
				<tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>���:</FONT></td><td width='79%'><asp:textbox id='bianhao' runat='server'></asp:textbox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorbianhao" runat="server" ControlToValidate="bianhao" ErrorMessage="����"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>����:</FONT></td><td width='79%'><asp:textbox id='mingcheng' Width='395px' runat='server'></asp:textbox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatormingcheng" runat="server" ControlToValidate="mingcheng" ErrorMessage="����"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>�γ�:</FONT></td><td width='79%'><asp:textbox id='kecheng' runat='server'></asp:textbox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorkecheng" runat="server" ControlToValidate="kecheng" ErrorMessage="����"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>�ļ�:</FONT></td><td width='79%'><asp:textbox id='wenjian' Width='395px' runat='server'></asp:textbox>&nbsp;<a href="javaScript:OpenScript('hsgupfile.aspx?Result=wenjian',500,30)"><img src='Images/Upload.gif' width='30' height='16' border='0' align='absmiddle' /></a>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorwenjian" runat="server" ControlToValidate="wenjian" ErrorMessage="����"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>���:</FONT></td><td width='79%'><asp:textbox id='jianjie' Width='400px' Height='100px' TextMode='MultiLine' runat='server' ></asp:textbox></td></tr><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>������:</FONT></td><td width='79%'><asp:textbox id='faburen' runat='server'></asp:textbox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorfaburen" runat="server" ControlToValidate="faburen" ErrorMessage="����"></asp:RequiredFieldValidator>
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

