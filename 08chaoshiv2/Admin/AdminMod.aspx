<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminMod.aspx.cs" Inherits="Admin_AdminMod" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
</head>
<body bgColor="#b7d6fd">
    <form id="form1" runat="server">
    <div>
        <h1 align="center">修改密码</h1>
			<table width="50%" border="1" align="center">
                <tr>
                    <td>
                        旧密码：</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox></td>
                </tr>
                <tr>
					<td>&nbsp;新密码：</td>
					<td>
						<asp:TextBox id="TextBox2" runat="server" TextMode="Password"></asp:TextBox>*</td>
				</tr>
				<tr>
					<td>&nbsp;确认密码：</td>
					<td>
						<asp:TextBox id="TextBox3" runat="server" TextMode="Password"></asp:TextBox>*</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;
						<asp:Button id="Button1" runat="server" Width="48px" Text="修改" onclick="Button1_Click"></asp:Button>&nbsp;
						<asp:Button id="Button3" runat="server" Width="48px" Text="返回" onclick="Button3_Click"></asp:Button></td>
				</tr>
			</table>
    </div>
    </form>
</body>
</html>
