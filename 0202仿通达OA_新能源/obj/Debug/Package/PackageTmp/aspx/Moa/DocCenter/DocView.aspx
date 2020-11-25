<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocView.aspx.cs" Inherits="OA.aspx.Moa.DocCenter.DocView" %>

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
            查看文件信息</div>
        <div id="leftnav">
            <a href="../Main.aspx">
                <img alt="home" src="../../Style/Mobile/images/home.png" /></a>
        </div>
    </div>
    <div id="content">
        <ul class="pageitem">
            <li class="textbox"><span class="header">文件：
                <asp:Label ID="Label7" runat="server"></asp:Label>
                <asp:Label ID="Label8" runat="server" Visible="False"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">文件编号：
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">文件大小：
                <asp:Label ID="Label2" runat="server"></asp:Label>KB </span></li>
            <li class="textbox"><span class="header">上传时间：
                <asp:Label ID="Label3" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">上传人：
                <asp:Label ID="Label4" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">文件类型：
                <asp:Label ID="Label5" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">备注信息：
                <asp:Label ID="Label6" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">可查看人员：
                <asp:Label ID="Label9" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">可添加人员：
                <asp:Label ID="Label10" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">可修改人员：
                <asp:Label ID="Label11" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">可删除人员：
                <asp:Label ID="Label12" runat="server"></asp:Label></span></li>
        </ul>
    </div>
    <div id="footer">
        <a href="#">Powered by 金码铺</a></div>
    </form>
</body>
</html>
