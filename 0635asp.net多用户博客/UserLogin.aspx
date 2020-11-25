<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserLogin.aspx.cs" Inherits="UserLogin" %>
<%@ Register src="Controls/Head.ascx" tagname="Head" tagprefix="uc1" %>
<%@ Register src="Controls/Foot.ascx" tagname="Foot" tagprefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>个人博客系统[毕业设计]</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form runat="server" id="aa">
<uc1:Head ID="Head1" runat="server" />

<table width="950" height="273" border="0" align="center" cellpadding="0" cellspacing="0" style="background:#fff;">
  <tr>
    <td width="30%" align="left"><br />
            <img src="images/ad.jpg" />
        </td>
    <td align="center" valign="top">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top:10px;">
      <tr>
          <td style="border-bottom:#ccc solid 1px;"><div class="aa_1">用户登录</div></td>
      </tr>
      <tr>
        <td align="center" width="100%" valign="top" style="height:300px;background:#f3f3f3;">
            <table width="450" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
            <tr height="50">
                <td align="right" style="font-size:16px;">登录帐号：</td>
                <td align="left"><asp:TextBox ID="txtLoginUserName" runat="server" Width="145px" style="font-size:16px;"></asp:TextBox></td>
            </tr>
            <tr height="50">
                <td align="right" style="font-size:16px;">登录密码：</td>
                <td align="left"><asp:TextBox ID="txtLoginUserPwd" runat="server" TextMode="Password" Width="145px" style="font-size:16px;"></asp:TextBox></td>
            </tr>
            <tr height="50">
                <td align="center" colspan="2">
                    <asp:Button ID="btnLogin" runat="server" Text=" 确认登录 " style="font-size:16px;" OnClick="btnLogin_Click" />
                </td>
            </tr>
        </table>
        </td>
      </tr>
    </table></td>
  </tr>
</table>

<uc2:Foot ID="Foot1" runat="server" />
</form>
</body>
</html>