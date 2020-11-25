<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserMain.aspx.cs" Inherits="UserMain" %>
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
<form runat="server">
<uc1:Head ID="Head1" runat="server" />

<table width="950" height="273" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top:10px;">
      <tr>
        <td valign="top" style="width:180px;height:24px; background:url(images/gy.jpg) repeat-x; text-align:center;border:solid 1px #ddd; font-size:14px;">
            <br /><br />
            <a href="usermain.aspx"><font color="#2d7e17">个人基本信息</font></a><br /><br />
            <a href="userguanzhu.aspx"><font color="#2d7e17">我的收藏</font></a><br /><br />
            <a href="userpicoper.aspx"><font color="#2d7e17">上传相册</font></a><br /><br />
            <a href="userpicmanage.aspx"><font color="#2d7e17">我的相册管理</font></a><br /><br />
            <a href="userblogoper.aspx"><font color="#2d7e17">发布博客</font></a><br /><br />
            <a href="userBlogmanage.aspx"><font color="#2d7e17">我的博客管理</font></a><br /><br />
            <a href="userhaoyou.aspx"><font color="#2d7e17">我的好友</font></a><br /><br />
            <a href="userxinmanage.aspx"><font color="#2d7e17">站内信</font></a><br /><br />
            <a href="userlogout.aspx"><font color="#2d7e17">退出登录</font></a><br />
        </td>
        <td align="center" valign="top">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td colspan="2" style="width:100%;height:24px; background:url(images/gy.jpg) repeat-x; text-align:center;border:solid 1px #ddd;">
                &nbsp;&nbsp;&nbsp;&nbsp;个人基本信息
                </td>
            </tr>
            <tr height="40">
                <td align="right"></td>
                <td align="left"><b>个人基本信息</b></td>
            </tr>
            <tr height="40">
                <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户名：</td>
                <td align="left"><asp:TextBox ID="txtUserName" runat="server" Width="145px" Enabled="false"></asp:TextBox></td>
            </tr>
            <tr height="40">
                <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码：</td>
                <td align="left"><asp:TextBox ID="txtUserPwd" runat="server" Width="145px"></asp:TextBox></td>
            </tr>
            <tr height="40">
                <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;昵称：</td>
                <td align="left"><asp:TextBox ID="txtTitle" runat="server" Width="145px"></asp:TextBox></td>
            </tr>
            <tr height="40">
                <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email：</td>
                <td align="left"><asp:TextBox ID="tel" runat="server" Width="145px"></asp:TextBox></td>
            </tr>
            <tr height="40">
    <td align="right">注册时间：</td>
    <td align="left">
        <asp:Literal ID="ltlRegTime" runat="server"></asp:Literal>
    </td>
</tr>
            <tr height="40">
                <td align="right"></td>
                <td align="left">
                    <asp:Button ID="btnEditInfo" runat="server" Text=" 确认修改 " OnClick="btnEditInfo_Click" />
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