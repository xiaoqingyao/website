<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskFP.aspx.cs" Inherits="OA.aspx.Moa.Subaltern.TaskFP" %>

<html>
<head>
    <title>金码铺移动办公平台 </title>
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="index,follow" name="robots" />
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no"
        name="viewport" />
    <link href="../../Style/Mobile/css/Style.css" rel="stylesheet" media="screen" type="text/css" />
    <link href="../../Style/Mobile/css/developer-style.css" rel="stylesheet" type="text/css" />
    <script src="../../Style/Mobile/javascript/functions.js" type="text/javascript"></script>
</head>
<body class="applist">
    <div id="topbar">
        <div id="title">
            任务分配</div>
        <div id="leftnav">
            <a href="../Main.aspx">
                <img alt="home" src="../../Style/Mobile/images/home.png" /></a>
        </div>
        <div id="rightnav">
            <a href='TaskFPAdd.aspx'>分配任务</a>
        </div>
    </div>
    <div id="content">
        <ul>
            <%
                foreach (var item in EmailList)
                {
            %>
            <li><a class="effect" href="TaskFPView.aspx?ID=<%=item.ID %>"><span class="image"
                style="background-image: url('../../Style/Mobile/thumbs/compass.png')"></span><span
                    class="comment">
                    <%=item.FromUser%></span> <span class="name">
                        <%=item.TaskTitle%></span> <span class="stars4"></span><span class="arrow">
                </span><span class="price">
                    <%=item.TimeStr.Value.ToString("yyyy-M-dd  HH:mm")%></span></a> </li>
            <% } %>
        </ul>
    </div>
   <div id="footer">
        <a href="#">Powered by 金码铺</a></div>
</body>
</html>
