<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PeiXunXiaoGuoView.aspx.cs"
    Inherits="OA.aspx.Moa.DocFile.PeiXunXiaoGuoView" %>

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
            查看培训效果信息</div>
        <div id="leftnav">
            <a href="../Main.aspx">
                <img alt="home" src="../../Style/Mobile/images/home.png" /></a>
        </div>
    </div>
    <div id="content">
        <ul class="pageitem">
            <li class="textbox"><span class="header">培训名称：
                <asp:Label ID="lblPeiXunName" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">反馈主题：
                <asp:Label ID="lblFanKuiZhuTi" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">反馈内容：
                <asp:Label ID="lblXiaoGuoFanKui" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">总体结论：
                <asp:Label ID="lblZongTiJieLun" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">录入人：
                <asp:Label ID="lblUserName" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">录入时间：
                <asp:Label ID="lblTimeStr" runat="server"></asp:Label>
            </span></li>
        </ul>
    </div>
    </form>
</body>
</html>
