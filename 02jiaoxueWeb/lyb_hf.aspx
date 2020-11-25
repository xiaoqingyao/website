<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lyb_hf.aspx.cs" Inherits="lyb_hf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
	<style>TD { FONT-SIZE: 12px; FONT-FAMILY: 宋体 }
	TH { FONT-SIZE: 12px; FONT-FAMILY: 宋体 }
		</style>
	</HEAD>
	<body >
		<form id="Form1" method="post" runat="server">
			<h1 align="center">
                回复留言</h1>
			<table width="50%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"> 
				<tr>
					<td width="20%" style="HEIGHT: 26px">
                        回复内容：</td>
					<td width="80%" style="HEIGHT: 26px">
						<asp:TextBox id="TextBox1" runat="server" Width="408px" TextMode="MultiLine" Height="83px"></asp:TextBox></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;
						<asp:Button id="Button1" runat="server" Width="48px" Text="回复" onclick="Button1_Click"></asp:Button>&nbsp;
                        <input id="Reset1" style="width: 50px" type="reset" value="重填" /></td>
				</tr>
			</table>
		</form>
	</body>
</HTML>