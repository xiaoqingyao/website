<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jipiaoyuding_updt.aspx.cs" Inherits="jipiaoyuding_updt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
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
						<div align="center"><font color="#ffffff">修改机票预订</font></div>
					</td>
				</tr>
				<tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>班机编号:</FONT></td><td width='79%'><asp:textbox id='banjibianhao' runat='server'></asp:textbox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorbanjibianhao" runat="server" ControlToValidate="banjibianhao" ErrorMessage="必填"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>出发城市:</FONT></td><td width='79%'><asp:textbox id='chufachengshi' runat='server'></asp:textbox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorchufachengshi" runat="server" ControlToValidate="chufachengshi" ErrorMessage="必填"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>到达城市:</FONT></td><td width='79%'><asp:textbox id='daodachengshi' runat='server'></asp:textbox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatordaodachengshi" runat="server" ControlToValidate="daodachengshi" ErrorMessage="必填"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>预订时间:</FONT></td><td width='79%'><asp:TextBox ID='yudingshijian' runat='server' onclick="getDate(Form1.yudingshijian,'2')" need="1"></asp:TextBox></td></tr><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>预订票数:</FONT></td><td width='79%'><asp:textbox id='yudingpiaoshu' runat='server'></asp:textbox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatoryudingpiaoshu" runat="server" ControlToValidate="yudingpiaoshu" ErrorMessage="必填"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>您的姓名:</FONT></td><td width='79%'><asp:textbox id='nindexingming' runat='server'></asp:textbox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatornindexingming" runat="server" ControlToValidate="nindexingming" ErrorMessage="必填"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>您的电话:</FONT></td><td width='79%'><asp:textbox id='nindedianhua' runat='server'></asp:textbox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatornindedianhua" runat="server" ControlToValidate="nindedianhua" ErrorMessage="必填"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>您的身份证:</FONT></td><td width='79%'><asp:textbox id='nindeshenfenzheng' runat='server'></asp:textbox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatornindeshenfenzheng" runat="server" ControlToValidate="nindeshenfenzheng" ErrorMessage="必填"></asp:RequiredFieldValidator><tr><td noWrap width='30' style='WIDTH: 164px'><FONT face='宋体'>备注:</FONT></td><td width='79%'><asp:textbox id='beizhu' Width='400px' Height='100px' TextMode='MultiLine' runat='server' ></asp:textbox></td></tr>
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

