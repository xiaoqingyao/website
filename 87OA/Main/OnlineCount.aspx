<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OnlineCount.aspx.cs" Inherits="OnlineCount" %>
<html>
	<head>
		<title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
		<meta http-equiv="refresh" content="<%=TiXingJianGe %>">
  <LINK href="../Style/Style.css" type="text/css" rel="STYLESHEET">
</head>
<body scroll="no" background="../images/BottomBg.gif">
    <form id="form1" runat="server">
    <div >
        <table border="0" cellpadding="0" cellspacing="0">            
            <tr>                
                <td valign="baseline" style="padding-top:4px;">
                共&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" CssClass="na" Font-Underline="True" Target="rform" NavigateUrl="OnlineUser.aspx">0</asp:HyperLink>&nbsp;人在线&nbsp;&nbsp;<img align="absMiddle" height="16" border=0 src="../images/TreeImages/email.gif" width="16" />&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" CssClass="na" Font-Underline="True" Target="rform" NavigateUrl="../LanEmail/LanEmailShou.aspx">0</asp:HyperLink></td>
            </tr>
        </table>
        <%=TanChuStr %>  
    </div>
    </form>
</body>
</html>
