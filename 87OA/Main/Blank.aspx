<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Blank.aspx.cs" Inherits="Address_UserList0" %>
<html>
	<head>
		<title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
		<META HTTP-EQUIV=REFRESH CONTENT="1;URL='OnlineCount.aspx'">
  <LINK href="../Style/Style.css" type="text/css" rel="STYLESHEET">
</head>
<body scroll="no" background="../images/BottomBg.gif">
    <form id="form1" runat="server">
    <div >
        <table border="0" cellpadding="0" cellspacing="0">            
            <tr>                
                <td valign="baseline" style="padding-top:4px;">
                共&nbsp;<strong><span style="color: red; text-decoration: underline">0</span></strong>&nbsp;人在线&nbsp;&nbsp;<img align="absMiddle" height="16" border=0 src="../images/TreeImages/email.gif" width="16" />&nbsp;<strong><span
                        style="color: red; text-decoration: underline">0</span></strong></td>
            </tr>
        </table>       
    </div>
    </form>
</body>
</html>