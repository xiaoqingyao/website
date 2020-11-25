<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>网络在线考试系统</title>
<link href="images/login.css" rel="stylesheet" type="text/css" />


<style type="text/css">
<!--
.inputtext {border-left:1px solid balck;
border-right:1px solid balck;
border-top:1px solid balck;
border-bottom:1px solid balck;
}
.STYLE1 {color: #FFFFFF}
.STYLE2 {font-size: 26pt}
-->
</style>
</head>

<body style="background-image:url(images/admin_login_bg.gif); margin:0 auto; width:500px;">

    <form id="form1" runat="server">
    <div>
       
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div style="font-family:宋体; color:#FFFFFF; filter:Glow(Color=#000000,Strength=2); WIDTH: 100%; FONT-WEIGHT: bold; FONT-SIZE: 19pt; margin-top:5pt">
  <div align="center" class="STYLE5 STYLE1 STYLE2">网络在线考试系统</div>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="593" height="357" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="images/login-bg.png"><table width="100%" height="45%" border="0" cellpadding="1" cellspacing="1" bordercolor="#000066">
      <tr>
        <td width="31%">&nbsp;</td>
        <td width="69%">&nbsp;</td>
      </tr>
      <tr>
        <td height="163">&nbsp;</td>
        <td valign="top">
            <table align="left" border="0" cellpadding="0" cellspacing="0" height="100%" style="width: 71%">
                <tr>
                    <td height="30" width="24%">
                        <span class="STYLE1">用&nbsp;&nbsp;户:</span></td>
                    <td height="30" width="76%">
                        <span style="height: 28px">&nbsp;<asp:TextBox ID="TextBox1" runat="server" Width="88px"></asp:TextBox></span></td>
                </tr>
                <tr>
                    <td height="25">
                        <span class="STYLE1">密&nbsp;&nbsp;码:</span></td>
                    <td height="25">
                        <span style="height: 28px">&nbsp;<asp:TextBox ID="TextBox2" runat="server" TextMode="Password"
                            Width="88px"></asp:TextBox></span></td>
                </tr>
                <tr>
                    <td height="25">
                        <span class="STYLE1">角&nbsp;&nbsp;色:</span></td>
                    <td height="25">
                        <span style="height: 28px">&nbsp;<asp:DropDownList ID="cx" runat="server">
                        </asp:DropDownList></span></td>
                </tr>
                <tr>
                    <td colspan="2" height="25">
                        <p align="center">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="登陆" />
                            &nbsp; &nbsp;
                            <input id="Reset1" type="reset" value="重置" /></p>
                    </td>
                </tr>
            </table>
        </td>
      </tr>
    </table></td>
  </tr>
</table>

    
    </div>
    </form>
</body>
</html>
