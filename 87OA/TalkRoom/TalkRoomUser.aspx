<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TalkRoomUser.aspx.cs" Inherits="TalkRoom_TalkRoomUser" %>
<html>
	<head>
		<title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
  <LINK href="../Style/Style.css" type="text/css" rel="STYLESHEET">
  <meta http-equiv="refresh" content="60" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <img src="../images/U03.gif" /><a href="Javascript:void(0);" onclick="parent.frames['Speak'].document.getElementById('TextBox1').value='所有人'" >所有人</a><br>
        <asp:Label ID="Label1" runat="server"></asp:Label> 
     </div>
    </form>
</body>
</html>