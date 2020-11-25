<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PicList.aspx.cs" Inherits="PicList" %>
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
          
          <table width="677" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
            <tr>
              <td style="border-bottom:#a5c94f solid 1px;">
                <div class="aa_1">相册展示列表 <font color="#db0000"><asp:Literal ID="ltlArea" runat="server"></asp:Literal></font></div>
              </td>
            </tr>
            
            <tr><td>
                <asp:Repeater ID="rptList" runat="server">
                <ItemTemplate>
                <div style="text-align:center; float:left; width:135px;padding-top:10px;">
                    <div style="text-align:center; float:left; width:100%;"><a href="Picinfo.aspx?id=<%#Eval("PicId") %>" target="_blank"><img src="<%#Eval("PicAddress").ToString().Substring(1) %>" width="115" height="100" border="0" class="img1" /></a></div>
                    <div style="text-align:center; float:left; width:100%;padding-top:3px;"><a href="Picinfo.aspx?id=<%#Eval("PicId") %>" target="_blank"><%#!string.IsNullOrEmpty(key) ? (Eval("PicName").ToString().Replace(key, "<font color=\"#db0000\">" + key + "</font>")) : Eval("PicName").ToString()%></a></div>
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