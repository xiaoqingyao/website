<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemberInfo.aspx.cs" Inherits="memberInfo" %>
<%@ Register src="Controls/Head.ascx" tagname="Head" tagprefix="uc1" %>
<%@ Register src="Controls/Foot.ascx" tagname="Foot" tagprefix="uc2" %>
<%@ Register src="Controls/Left.ascx" tagname="Left" tagprefix="uc3" %>
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
    <td width="250" valign="top">
    
    <uc3:Left ID="Left1" runat="server" />

    </td>
    <td align="center" valign="top"><table width="677" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center">
          
          <table width="677" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
            <tr>
              <td style="border-bottom:#a5c94f solid 1px;">
                <div class="aa_1">个人信息详情</div></td>
            </tr>
            
            
            <tr height="40">
                <td align="right"></td>
                <td align="left"><b>个人基本信息</b></td>
            </tr>
            <tr height="40">
                <td align="right" style="font-size:14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户名：</td>
                <td align="left" style="font-size:14px;"><asp:Literal ID="txtUserName" runat="server"></asp:Literal></td>
            </tr>
            <tr height="40">
                <td align="right" style="font-size:14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;昵称：</td>
                <td align="left" style="font-size:14px;"><asp:Literal ID="txtTitle" runat="server"></asp:Literal></td>
            </tr>
            <tr height="40">
                <td align="right" style="font-size:14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email：</td>
                <td align="left" style="font-size:14px;"><asp:Literal ID="tel" runat="server"></asp:Literal></td>
            </tr>
            <tr height="40">
    <td align="right" style="font-size:14px;">注册时间：</td>
    <td align="left" style="font-size:14px;">
        <asp:Literal ID="ltlRegTime" runat="server"></asp:Literal>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
        
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><font color="blue">加好友</font></asp:LinkButton>
        
    </td>
</tr>
            <tr height="40">
                <td align="right" style="font-size:14px;">发布日志：</td>
                <td align="left" style="font-size:14px;"><asp:Literal ID="ltlblog" runat="server"></asp:Literal> 条</td>
            </tr>
            <tr height="40">
                <td align="right" style="font-size:14px;">上传相册：</td>
                <td align="left" style="font-size:14px;"><asp:Literal ID="ltlpic" runat="server"></asp:Literal> 条</td>
            </tr>
          </table>
          
          <table width="100" border="0" cellspacing="0" cellpadding="0"><tr><td height="20"></td></tr></table>
          </td>
      </tr>
    </table></td>
  </tr>
</table>

<uc2:Foot ID="Foot1" runat="server" />
</form>
</body>
</html>