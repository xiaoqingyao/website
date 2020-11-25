<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NetMailYiFa.aspx.cs" Inherits="NetMail_NetMailYiFa" %>

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
    <link href="../Style/Mobile/css/developer-style.css" rel="stylesheet" type="text/css" />

    <script src="../Style/Mobile/javascript/functions.js" type="text/javascript"></script>

    <link href="../Style/Mobile/pics/startup.png" rel="apple-touch-startup-image" />
</head>
<body class="applist">
    <div id="topbar">
        <div id="title">
            已发送</div>
        <div id="leftnav">
            <a href="../Main/Main.aspx">
                <img alt="home" src="../Style/Mobile/images/home.png" /></a>
        </div>
        <div id="rightnav">
            <a href='LanEmailAdd.aspx'>发邮件</a>
        </div>
    </div>
    <div id="content">
        <ul>
            <%
                foreach (var item in EmailList)
                {
            %>
            <li><a class="effect" href="EmailView.aspx?ID=<%=item.ID %>"><span class="image"
                <%if(item.EmailState=="未读") {%> style="background-image: url('../Style/Mobile/thumbs/mail.png')"
                <%}else{ %>style="background-image: url('../Style/Mobile/thumbs/rmail.png')"
                <%} %>></span><span class="comment">
                    <%=item.FromUser%></span> <span class="name">
                        <%=item.EmailTitle%></span> <span class="stars4"></span><span class="arrow">
                </span><span class="price">
                    <%=item.TimeStr.Value.ToString("yyyy-M-dd  HH:mm")%></span></a> </li>
            <% } %>
        </ul>
    </div>
    <div id="footer">
        <a href="#">Powered by 阿琴小店</a></div>
</body>
</html>
