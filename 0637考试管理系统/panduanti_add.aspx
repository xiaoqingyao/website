<%@ Page Language="C#" AutoEventWireup="true" CodeFile="panduanti_add.aspx.cs" Inherits="panduanti_add" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title><script language="javascript" src="js/Calendar.js"></script>
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
						<div align="center"><font color="#ffffff">添加判断题</font></div>
					</td>
				</tr>
				
			<tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>题目:</FONT></td><td width='79%'><asp:TextBox ID='timu' Width='400px' Height='100px' TextMode='MultiLine' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatortimu" runat="server" ControlToValidate="timu" ErrorMessage="必填"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>难易程度:</FONT></td><td width='79%'><asp:DropDownList ID='nanyichengdu' runat='server'></asp:DropDownList>*<asp:RequiredFieldValidator ID="RequiredFieldValidatornanyichengdu" runat="server" ControlToValidate="nanyichengdu" ErrorMessage="必填"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>科目:</FONT></td><td width='79%'><asp:DropDownList ID='zhangjie' runat='server'></asp:DropDownList></td></tr><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>答案:</FONT></td><td width='79%'><asp:DropDownList ID='daan' runat='server'></asp:DropDownList></td></tr>
				
				
				
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
