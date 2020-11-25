<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MobileSms.aspx.cs" Inherits="OA.aspx.Moa.Mobile.MobileSms" %>

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
<body class="applist">
    <div id="topbar">
        <div id="title">
            已发送短信</div>
        <div id="leftnav">
            <a href="../Main.aspx">
                <img alt="home" src="../../Style/Mobile/images/home.png" /></a>
        </div>
        <div id="rightnav">
            <a href='MobileSmsAdd.aspx'>添加</a>
        </div>
    </div>
    <div class="searchbox">
        <form action="">
        <fieldset>
            <input name="keyword" id="searchbox" placeholder="查找" type="text" />
        </fieldset>
        </form>
    </div>
    <div id="content">
        <ul>
            <%
                foreach (var item in MobileList)
                {
            %>
            <li><a class="effect" href="MobileSms.aspx?MsgID=<%=item.ID%>" title="点击发送信息"><span class="image"
                style="background-image: url('../../Style/Mobile/thumbs/rmail.png')"></span><span class="comment">
                    <%=item.ToUserList%></span> <span class="name">
                        <%=item.ContentStr%></span> <span class="stars4"></span><span class="arrow">
                </span><span class="price">
                    <%=item.TimeStr.Value.ToString("yyyy-M-dd  HH:mm")%></span></a> </li>
            <% } %>
        </ul>
    </div>
    <div id="footer">
        <a href="#">Powered by 金码铺</a></div>
</body>
</html>
