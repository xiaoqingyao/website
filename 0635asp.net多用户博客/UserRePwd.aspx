<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserRePwd.aspx.cs" Inherits="UserRePwd" %>
<%@ Register src="Controls/Head.ascx" tagname="Head" tagprefix="uc1" %>
<%@ Register src="Controls/Foot.ascx" tagname="Foot" tagprefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>个人博客系统［毕业设计］</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form runat="server" id="aa">
<uc1:Head ID="Head1" runat="server" />

<table width="950" height="273" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td style="border-bottom:#ccc solid 1px;" colspan="2">
                    <div class="aa_0">用户密码找回</div></td>
      </tr>
      <tr>
        <td align="center" style="background:#fff;">
            <img src="images/kf.gif" />
        </td>
        <td align="center" width="60%" valign="top" style="min-height:300px;background:#fff;">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
            <tr height="35">
                <td align="left">先输入用户名：
                    <asp:TextBox ID="username" runat="server" Width="145px"></asp:TextBox>
                    <asp:Button ID="Button0" runat="server" Text=" 下一步 " OnClick="btnyz_Click" />
                    
                </td>
            </tr>
            <tr height="35" runat="server" id="tr1" visible="false">
                <td align="left">
                    密保问题：<asp:Literal ID="wenti" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr height="35" runat="server" id="tr2" visible="false">
                <td align="left">
                    密保答案：<asp:TextBox ID="daan" runat="server" Width="145px"></asp:TextBox>
                    <asp:HiddenField ID="hiddaan" runat="server" />
                </td>
            </tr>
            <tr height="35" runat="server" id="tr3" visible="false">
                <td align="center">
                    <asp:Button ID="Button1" runat="server" Text=" 密码找回 " OnClick="btnzh_Click" /><br />
                    <asp:Label ID="mess" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
        </td>

      </tr>
      <tr height="150">
            <td colspan="2"></td>
      </tr>
    </table></td>
  </tr>
</table>

<uc2:Foot ID="Foot1" runat="server" />
</form>
</body>
</html>