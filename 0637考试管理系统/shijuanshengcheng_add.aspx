<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shijuanshengcheng_add.aspx.cs" Inherits="shijuanshengcheng_add" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
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
						<div align="center"><font color="#ffffff">����Ծ�����</font></div>
					</td>
				</tr>
				
			<tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>�Ծ���:</FONT></td><td width='79%'><asp:TextBox ID='shijuanbianhao' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorshijuanbianhao" runat="server" ControlToValidate="shijuanbianhao" ErrorMessage="����"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>��Ŀ:</FONT></td><td width='79%'><asp:DropDownList ID='zhangjie' runat='server'></asp:DropDownList></td></tr><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>ѡ������:</FONT></td><td width='79%'><asp:TextBox ID='xuanzetishu' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorxuanzetishu" runat="server" ControlToValidate="xuanzetishu" ErrorMessage="����"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>ѡ�����ֵ:</FONT></td><td width='79%'><asp:TextBox ID='xuanzetifenzhi' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorxuanzetifenzhi" runat="server" ControlToValidate="xuanzetifenzhi" ErrorMessage="����"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>�ж�����:</FONT></td><td width='79%'><asp:TextBox ID='panduantishu' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorpanduantishu" runat="server" ControlToValidate="panduantishu" ErrorMessage="����"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>�ж����ֵ:</FONT></td><td width='79%'><asp:TextBox ID='panduantifenzhi' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorpanduantifenzhi" runat="server" ControlToValidate="panduantifenzhi" ErrorMessage="����"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>�������:</FONT></td><td width='79%'><asp:TextBox ID='tiankongtishu' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatortiankongtishu" runat="server" ControlToValidate="tiankongtishu" ErrorMessage="����"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='����'>������ֵ:</FONT></td><td width='79%'><asp:TextBox ID='tiankongtifenzhi' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatortiankongtifenzhi" runat="server" ControlToValidate="tiankongtifenzhi" ErrorMessage="����"></asp:RequiredFieldValidator>
				
				
				
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
