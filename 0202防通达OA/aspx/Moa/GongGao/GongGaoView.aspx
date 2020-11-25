<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GongGaoView.aspx.cs" Inherits="OA.aspx.Moa.GongGao.GongGaoView" %>

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
    <script language="javascript">
        function DownloadFile(FileURL)   //下载附件
        {
            document.getElementById("hdnFileURL").value = FileURL;
            document.getElementById("btnDownloadFile").click();
        }
  </script>
</head>
<body>
    <form id="form1" runat="server">
    <input id="hdnFileURL" runat="server" type="hidden" />
    <div style="width: 0px; height: 0px; display: none;">
        <asp:Button ID="btnDownloadFile" Width="0px" Height="0px" runat="server" Text="Button"
            OnClick="btnDownloadFile_Click" />
    </div>
    <div id="topbar">
        <div id="title">
            查看公告通知</div>
        <div id="leftnav">
            <a href="../Main.aspx">
                <img alt="home" src="../../Style/Mobile/images/home.png" /></a>
        </div>
        <div id="rightnav">
            <a href="GongGaoAdd.aspx">添加</a>
        </div>
    </div>
    <div id="content">
        <ul class="pageitem">
            <li class="textbox"><span class="header">
                <asp:Label ID="Label1" runat="server"></asp:Label></span>
                <asp:Label ID="Label4" runat="server"></asp:Label>
                <br />
                <span style='text-align: right; float: right'>发布人:
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                    <asp:Label ID="Label5" runat="server"></asp:Label></span> </li>
        </ul>
        <ul class="pageitem">
            <li class="textbox"><span class="header">
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </span></li>
        </ul>
    </div>
    <div id="footer">
        <a href="#">Powered by 金码铺</a></div>
    </form>
</body>
</html>
