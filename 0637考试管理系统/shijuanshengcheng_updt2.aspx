<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shijuanshengcheng_updt2.aspx.cs" Inherits="shijuanshengcheng_updt2" %>

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
						<div align="center"><font color="#ffffff">手工修改试卷生成</font></div>
					</td>
				</tr>
                <tr>
                    <td height="25" nowrap="nowrap" style="width: 164px" width="164">
                        选择题：</td>
                    <td height="25" width="59%">
                        <asp:TextBox ID="xuanzeti" runat="server" Width="422px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td height="25" nowrap="nowrap" style="width: 164px" width="164">
                        判断题：</td>
                    <td height="25" width="59%">
                        <asp:TextBox ID="panduanti" runat="server" Width="422px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td height="25" nowrap="nowrap" style="width: 164px" width="164">
                        填空题：</td>
                    <td height="25" width="59%">
                        <asp:TextBox ID="tiankongti" runat="server" Width="422px"></asp:TextBox></td>
                </tr>
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

