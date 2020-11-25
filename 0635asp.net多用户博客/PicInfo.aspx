<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PicInfo.aspx.cs" Inherits="PicInfo" %>
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
                <div class="aa_1">相册详情</div>
              </td>
            </tr>
            <tr>
            <td style="line-height:30px;" align="center">
                <table width="95%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                        <img src="<%=picaddress %>" border="0" class="img1" width="650" />
                        </td>
                    </tr>
                    <tr>
                    <td valign="top" style="line-height:40px; text-align:left; font-size:16px;">
                    <b><asp:Literal ID="Picname" runat="server"></asp:Literal></b><br />
                    
                    
                    
                    <span style="color:#888; font-size:12px;">
                        类型：<asp:Literal ID="typename" runat="server"></asp:Literal>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        浏览量：<%=hits%> 次
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        发布人：<%=username%>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        时间：<asp:Literal ID="addtime" runat="server"></asp:Literal>
                    </span>
                    
                    
                    
                    </td>
                    </tr>
                    <tr>
                </table>
                
            </td>
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