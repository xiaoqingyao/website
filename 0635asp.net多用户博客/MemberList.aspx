<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemberList.aspx.cs" Inherits="MemberList" %>
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
<uc1:Head ID="Head1" runat="server" />

<table width="950" height="273" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="250" valign="top">
    
    <uc3:Left ID="Left1" runat="server" />

    </td>
    <td align="center" valign="top"><table width="677" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center">
          
          <table width="677" border="0" cellpadding="0" cellspacing="0" style="margin-top:10px;">
            <tr>
            <td style="border-bottom:#a5c94f solid 1px;">
                <div class="aa_1">搜索个人信息</div></td>
                </tr>
            <tr><td align="left" style="line-height:25px;padding-top:10px;">
                
<asp:Repeater ID="rptListmember" runat="server">
<ItemTemplate>
    <div style="text-align:left;width:100%; float:left; height:100px; border-bottom:dashed 1px #ddd;">
        <div style="float:left;width:630px;padding-left:40px; background:url(images/_38.gif) 20px 5px no-repeat;">
            <div style="float:left;padding:10px 0 10px 15px;width:385px;">
                <a href="memberinfo.aspx?id=<%#Eval("memberId") %>" target="_blank"><font style="color:green; font-weight:bold;"><%#Eval("membername") %></font></a>
                <br /><%#Eval("username") %>
            </div>
            <div style="float:right;padding:35px 10px 0 0;">注册时间：<%#Convert.ToDateTime(Eval("AddTime")).ToString("yyyy-MM-dd")%></div>
        </div>
    </div>
</ItemTemplate>
</asp:Repeater>
    
            </td></tr>
          </table>

          

          <table width="100" border="0" cellspacing="0" cellpadding="0"><tr><td height="20"></td></tr></table>
          </td>
      </tr>
    </table></td>
  </tr>
</table>

<uc2:Foot ID="Foot1" runat="server" />
</body>
</html>