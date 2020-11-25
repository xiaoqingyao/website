<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XueXiXinDeViewSP.aspx.cs"
    Inherits="OA.aspx.Moa.DocFile.XueXiXinDeViewSP" %>

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
            查看信息</div>
        <div id="leftnav">
            <a href="../Main.aspx">
                <img alt="home" src="../../Style/Mobile/images/home.png" /></a>
        </div>
    </div>
    <div id="content">
        <ul class="pageitem">
            <li class="textbox"><span class="header">心得标题：
                <asp:Label ID="lblXinDeTitle" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">心得内容：
                <asp:Label ID="lblXinDeContent" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">附件文件：
                <asp:Label ID="lblFuJianStr" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">领导意见：
                <asp:TextBox ID="TextBox1" runat="server" Height="60px" TextMode="MultiLine" Width="250px"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="签注意见" />
            </span></li>
            <li class="textbox"><span class="header">撰写用户：
                <asp:Label ID="lblUserName" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">撰写时间：
                <asp:Label ID="lblTimeStr" runat="server"></asp:Label>
            </span></li>
        </ul>
    </div>
    </form>
</body>
</html>
