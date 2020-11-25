<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserReg.aspx.cs" Inherits="UserReg" %>
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
    <td align="center" valign="top">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="30%" align="left"><br />
            <img src="images/ad.jpg" />
        </td>
        <td align="center" valign="top" style="min-height:300px;background:#f3f3f3;">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
            <tr>
                <td style="border-bottom:#ccc solid 1px;" colspan="2">
                    <div class="aa_1">用户注册</div></td>
            </tr>
            <tr height="40">
                <td align="right" style="font-size:16px;">登录帐号：</td>
                <td align="left"><asp:TextBox ID="txtRegUserName" runat="server" Width="145px" style="font-size:16px;"></asp:TextBox></td>
            </tr>
            <tr height="40">
                <td align="right" style="font-size:16px;">登录密码：</td>
                <td align="left"><asp:TextBox ID="txtRegUserPwd" runat="server" TextMode="Password" Width="145px" style="font-size:16px;"></asp:TextBox></td>
            </tr>
            <tr height="40">
                <td align="right" style="font-size:16px;">确认密码：</td>
                <td align="left"><asp:TextBox ID="txtRegUserPwd2" runat="server" TextMode="Password" Width="145px" style="font-size:16px;"></asp:TextBox></td>
            </tr>
            <tr height="40">
                <td align="right" style="font-size:16px;">昵称：</td>
                <td align="left"><asp:TextBox ID="txtRegTitle" runat="server" Width="145px" style="font-size:16px;"></asp:TextBox></td>
            </tr>
            <tr height="40">
                <td align="right" style="font-size:16px;">Email：</td>
                <td align="left"><asp:TextBox ID="txtRegTel" runat="server" Width="145px" style="font-size:16px;"></asp:TextBox></td>
            </tr>
            <tr height="40">
                <td align="right" style="font-size:16px;">密保问题：</td>
                <td align="left"><asp:TextBox ID="wenti" runat="server" Width="145px" style="font-size:16px;"></asp:TextBox> 找回密码时用</td>
            </tr>
            <tr height="40">
                <td align="right" style="font-size:16px;">密保答案：</td>
                <td align="left"><asp:TextBox ID="daan" runat="server" Width="145px" style="font-size:16px;"></asp:TextBox> 找回密码时用</td>
            </tr>
            <tr height="40">
                <td align="center" colspan="2">
                    <asp:Button ID="btnReg" runat="server" Text=" 提交注册 " style="font-size:16px;" OnClick="btnReg_Click" />
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