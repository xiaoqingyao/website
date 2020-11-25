<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaveDoc.aspx.cs" Inherits="OA.aspx.DsoFramer.SaveDoc" %>
<html>
	<head>
		<title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
<link href="../../css/main.css" type="text/css" rel="stylesheet" />
  <LINK href="../../Style/Style.css" type="text/css" rel="STYLESHEET">
</head>
<body>
    <form id="Form1" method="post" runat="server" encType="multipart/form-data">
        <%--<input type=text name="FilePath" value=<%=Request.QueryString["FilePath"].ToString()%>>--%>
    </form>
</body>
</html>