<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Uppwd.aspx.cs" Inherits="Admin_Uppwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>家庭理财管理系统</title>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css" />
<link rel="stylesheet" type="text/css" href="skin/css/main.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
<table width="100%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px;margin-top:8px;">
  <tr>
    <td   class='title'><span>修改登录密码</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="center">
        输入原密码：<asp:TextBox ID="txtpwd1" runat="server" TextMode="Password"></asp:TextBox>新密码：<asp:TextBox
            ID="txtpwd2" runat="server" TextMode="Password" Width="138px"></asp:TextBox>
        &nbsp;
        重复新密码：
        <asp:TextBox
            ID="rePwd" runat="server" TextMode="Password" Width="138px"></asp:TextBox>
        &nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="btnAdd_Click" Text="修改" />&nbsp;
        <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label></td>
  </tr>
</table>
    </div>
    </form>
</body>
</html>
