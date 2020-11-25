<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vote.aspx.cs" Inherits="OA.aspx.Moa.GongGao.Vote" %>

<html>
<head>
    <title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%> </title>
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="index,follow" name="robots" />
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <link href="../../Style/Mobile/pics/homescreen.gif" rel="apple-touch-icon" />
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no"
        name="viewport" />
    <link href="../../Style/Mobile/css/Style.css" rel="stylesheet" media="screen" type="text/css" />
    <link href="../../Style/Mobile/css/developer-style.css" rel="stylesheet" type="text/css" />

    <script src="../../Style/Mobile/javascript/functions.js" type="text/javascript"></script>

    <link href="../../Style/Mobile/pics/startup.png" rel="apple-touch-startup-image" />
</head>
<body class="musiclist">
    <div id="topbar">
        <div id="title">
            投票</div>
        <div id="leftnav">
            <a href="../Main.aspx">
                <img alt="home" src="../../Style/Mobile/images/home.png" /></a>
        </div>
        <div id="rightnav">
            <a href="VoteAdd.aspx">添加</a>
        </div>
    </div>
    <div id="content">
        <ul>
            <%
                int i = 1;
                foreach (var item in EmailList)
                {
            %>
            <li><a class="noeffect" href="VoteView.aspx?ID=<%=item.ID %>"><span class="number">
                <%=i++ %></span><span class="name">
                    <%=item.UserName%></span> <span class="name">
                        <%=item.TitleStr%></span><span class="arrow"> </span><span class="time">
                            <%=item.TimeStr.Value.ToString("yyyy-M-dd  HH:mm")%></span></a></li>
            <% } %>
            <li>
        </ul>
    </div>
</body>
</html>
