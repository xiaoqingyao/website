<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TiKuKaoShiView.aspx.cs" Inherits="OA.aspx.Moa.DocFile.TiKuKaoShiView" %>

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
<body>
    <form id="form1" runat="server">
    <div id="topbar">
        <div id="title">
            查看信息</div>
        <div id="leftnav">
            <a href="../Main.aspx">
                <img alt="home" src="../../Style/Mobile/images/home.png" /></a>
        </div>
    </div>
    <div id="content">
        <ul class="pageitem">
            <li class="textbox"><span class="header">用户名：
                <asp:Label ID="lblUserName" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">考试时间：
                <asp:Label ID="lblTimeStr" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">所用试卷：
                <asp:Label ID="lblShiJuanName" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">试卷答题详细情况：
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </span></li>
        </ul>
    </div>
    </form>
</body>
</html>
