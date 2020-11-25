<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>管理登陆</title>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 11pt;
	font-weight: bold;
}
-->
</style>
</head>
<body style="background-image:url(images/admin_login_bg.gif); margin:0 auto; width:500px;">
    <form id="form1" runat="server">
      <table width="100%" height="237"  align="center" style="text-align: center; margin-top:100px;">
  <tr><td align="center">
      <asp:Label ID="Label1" runat="server" Text="家庭财务管理系统" 
          style="font-size: 35px; font-family: 华文行楷"></asp:Label> <br />
          <br />
          <br />
<div style="background-image:url(images/admin_login.png); width:500px; height:200px;">
  
    <table width="500" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="250">&nbsp;</td>
        <td colspan="2">&nbsp;</td>
      </tr> 
      <tr>
        <td height="40"><div align="right" class="STYLE1">用户名：</div></td>
        <td height="40" colspan="2"><input type="text" name="textfield" id="lname" runat="server" style="height:20px; width:200px; font-size:15pt; font-weight:bold;" /></td>
      </tr>
      <tr>
        <td height="40"><div align="right" class="STYLE1">密&nbsp; 码：</div></td>
        <td height="40" colspan="2"><input type="password" name="textfield2" id="pwd" runat="server" style="height:20px; width:200px; font-size:15pt; font-weight:bold;" /></td>
      </tr>
     <tr>
        <td height="40"><div align="right" class="STYLE1">身&nbsp; 份：</div></td>
        <td height="40" colspan="2">
            <asp:DropDownList ID="DropDownList1" runat="server" Width="200">
             <asp:ListItem>家庭成员</asp:ListItem>
                <asp:ListItem>管理员</asp:ListItem>
               
            </asp:DropDownList>
        </td>
      </tr>
      <tr>
        <td height="40">&nbsp;</td>
        <td height="40" colspan="2">
            <asp:Button ID="Button1" runat="server" Text="" 
                style="width:130px; height:30px; background-image:url(images/admin_login_button.png); border:0; background-color: transparent; " 
                onclick="Button1_Click" />
        </td>
      </tr>
    </table>
 
</div>
</td></tr>
</table>
    </form>
</body>
</html>