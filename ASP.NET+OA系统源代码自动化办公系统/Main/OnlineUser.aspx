<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OnlineUser.aspx.cs" Inherits="OnlineUser" %>

<html>
<head>
    <title>移动手机浙江金海环境移动办公平台 </title>
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="index,follow" name="robots" />
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <link href="../Style/Mobile/pics/homescreen.gif" rel="apple-touch-icon" />
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no"
        name="viewport" />

    <script src="../JS/jquery-1.4.1.js" type="text/javascript"></script>

    <link href="../Style/Mobile/css/Style.css" rel="stylesheet" media="screen" type="text/css" />

    <script src="../Style/Mobile/javascript/functions.js" type="text/javascript"></script>

    <link href="../Style/Mobile/pics/startup.png" rel="apple-touch-startup-image" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="topbar">
        <div id="leftnav">
            <a href="../Main/Main.aspx">
                <img alt="home" src="../Style/Mobile/images/home.png" /></a>
        </div>
        <div id="title">
            系统用户</div>
    </div>
    <div id="tributton">
        <div class="links">
            <a href="../Main/Main.aspx">主页</a><a href="#">在线用户</a><a id="pressed">关于</a></div>
    </div>
    <div id="content">
        <asp:TreeView ID="ListTreeView" runat="server" ExpandDepth="0" ForeColor="Black"
            ShowLines="True">
            <ParentNodeStyle HorizontalPadding="2px" />
            <RootNodeStyle HorizontalPadding="2px" />
            <LeafNodeStyle HorizontalPadding="2px" />
            <Nodes>
            </Nodes>
        </asp:TreeView>
    </form>
</body>
</html>
