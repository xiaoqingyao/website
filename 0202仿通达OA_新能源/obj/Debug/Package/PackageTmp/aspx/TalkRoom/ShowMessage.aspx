<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowMessage.aspx.cs" Inherits="OA.aspx.TalkRoom.ShowMessage" %>
<html>
	<head>
		<title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
<link href="../../css/main.css" type="text/css" rel="stylesheet" />
  <LINK href="../../Style/Style.css" type="text/css" rel="STYLESHEET">
  <meta http-equiv="refresh" content="5;url=ShowMessage.aspx?TalkRoomName=<%=Request.QueryString["TalkRoomName"].ToString()%>" >
</head>
<body>
    <form id="form1" runat="server">
    <div>    
        <asp:Label ID="Label1" runat="server"></asp:Label>
    <a name="aaaaa"></a>
     </div>
    </form>
</body>
</html>