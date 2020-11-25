<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XueXiXinDeOK.aspx.cs" Inherits="OA.aspx.Moa.DocFile.XueXiXinDeOK" %>

<html>
<head>
    <title>
        <%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
<link href="../../css/main.css" type="text/css" rel="stylesheet" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="index,follow" name="robots" />
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no"
        name="viewport" />
    <link href="../../Style/Mobile/css/Style.css" rel="stylesheet" media="screen" type="text/css" />
    <link href="../../Style/Mobile/css/developer-style.css" rel="stylesheet" type="text/css" />
    <script src="../../Style/Mobile/javascript/functions.js" type="text/javascript"></script>
</head>
<body >
    <div id="topbar">
        <div id="title">
            学习心得</div>
        <div id="leftnav">
            <a href="../Main.aspx">
                <img alt="home" src="../../Style/Mobile/images/home.png" /></a>
        </div>
    </div>
    <div id="content">
       
            <%
                foreach (var item in EmailList)
                {
            %>
            <ul class="pageitem">
                <li class="textbox"><span class="header">
                    <%=item.XinDeTitle%>
                </span>
                    <%=item.UserName%></li>
                <li class="menu"><a href="XueXiXinDeViewSP.aspx?ID=<%=item.ID %>">
                    <img alt="Description" src="../../Style/Mobile/thumbs/safari.png" />
                    <span class="name">签注意见</span> <span class="comment">
                        <%=item.TimeStr.Value.ToString("yyyy-M-dd")%></span> <span class="arrow"></span>
                </a></li>
            </ul>
            <% } %>
        
    </div>
    <div id="footer">
        <a href="#">Powered by 金码铺</a></div>
</body>
</html>