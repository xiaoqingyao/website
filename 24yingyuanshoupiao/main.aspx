<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>在线影院售票系统</title>
</head>
<% if(Session["username"]==null)
        {
            Response.Redirect("login.aspx");
        } %>
<frameset rows="127,*,11" frameborder="no" border="0" framespacing="0">
    <frame src="top.aspx" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" />
    <frame src="center.aspx" name="mainFrame" id="mainFrame" />
    <frame src="down.aspx" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" />
</frameset>
<noframes>
    <body>
    </body>
</noframes>
</html>
