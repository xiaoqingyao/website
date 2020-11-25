<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NowWorkFlow.aspx.cs" Inherits="WorkFlow_NowWorkFlow" %>

<html>
<head>
    <title>移动手机浙江金海环境移动办公平台 </title>
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="index,follow" name="robots" />
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <link href="../Style/Mobile/pics/homescreen.gif" rel="apple-touch-icon" />
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no"
        name="viewport" />
    <link href="../Style/Mobile/css/Style.css" rel="stylesheet" media="screen" type="text/css" />

    <script src="../Style/Mobile/javascript/functions.js" type="text/javascript"></script>

    <link href="../Style/Mobile/pics/startup.png" rel="apple-touch-startup-image" />
</head>
<body>
    <div>
        <%
            foreach (var item in EmailList)
            {
        %>
        <ul class="pageitem">
            <li class="textbox"><span class="header">
                <%=item.FormName %>&nbsp; |
                <%=item.UserName%></span><%=item.WorkName %></li>
            <li class="menu"><a href="../WorkFlow/WorkToDo.aspx?ID=<%=item.ID %>">
                <img alt="Description" src="../Style/Mobile/thumbs/safari.png" />
                <span class="name">处理</span> <span class="comment">
                    <%=item.TimeStr.Value.ToString("yyyy-M-dd")%></span> <span class="arrow"></span>
            </a></li>
        </ul>
        <% } %>
    </div>
</body>
</html>
