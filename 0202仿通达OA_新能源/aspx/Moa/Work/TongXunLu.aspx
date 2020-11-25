<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TongXunLu.aspx.cs" Inherits="OA.aspx.Moa.Work.TongXunLu" %>

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
<body>
    <body class="applist">
        <div id="topbar">
            <div id="title">
                通讯录管理</div>
            <div id="leftnav">
                <a href="../Main.aspx">
                    <img alt="home" src="../../Style/Mobile/images/home.png" /></a>
            </div>
        </div>
        <div id="content">
            <ul>
                <%
                    foreach (var item in EmailList)
                    {
                %>
                <li><a class="effect" href="TongXunLuView.aspx?ID=<%=item.ID %>&TypeStr=<%=type %>"><span class="image"
                    style="background-image: url('../../Style/Mobile/thumbs/rmail.png')"></span><span class="comment">
                        <%=item.NameStr%></span> <span class="name">
                            <%=item.JiaTingDianHua%></span> <span class="stars4"></span><span class="arrow">
                    </span><span class="price">
                        <%=item.DanWeiMingCheng%></span></a> </li>
                <% } %>
            </ul>
        </div>
        <div id="footer">
            <a href="#">Powered by 金码铺</a></div>
    </body>
</html>
