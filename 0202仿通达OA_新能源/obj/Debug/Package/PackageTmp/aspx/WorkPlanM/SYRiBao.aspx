﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SYRiBao.aspx.cs" Inherits="FTD.Web.UI.aspx.WorkPlanM.SYRiBao" %>

<html>
	<head>
		<title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
<link href="../../css/main.css" type="text/css" rel="stylesheet" />
  <LINK href="../../Style/Style.css" type="text/css" rel="STYLESHEET">
</head>
<body>
    <form id="form1" runat="server">
    <div>    
        
    </div>
        <table style="width: 100%; height:100%;" border="0" cellpadding="0" cellspacing="0">
            <tr>
            <td  width="15%">
            
            <IFRAME name="Mid1" frameBorder="0" marginHeight="0" marginWidth="0" width="100%" height="100%" BORDERCOLOR="#ffffFF"  src="../Main/SelectUser.aspx" border="0"></IFRAME>
                </td>
                <td>
                <IFRAME name="Mid2" frameBorder="0" marginHeight="0" marginWidth="0" width="100%" height="100%" BORDERCOLOR="#ffffFF"  src="SYRiBaoRight.aspx" border="0"></IFRAME>
                </td>
        </tr>
        </table>
    </form>
</body>
</html>
