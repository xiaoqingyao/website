<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmailView.aspx.cs" Inherits="OA.aspx.Moa.LanEmail.EmailView" %>

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
            查看邮件</div>
        <div id="leftnav">
            <a href="../Main.aspx">
                <img alt="home" src="../../Style/Mobile/images/home.png" /></a>
        </div>
        <div id="rightnav">
            <a href="LanEmailAdd.aspx">写邮件</a>
        </div>
    </div>
    <div id="content">
        <span class="graytitle">
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </span>
        <ul class="pageitem">
            <li class="textbox"><span class="header">发送人：
                <asp:Label ID="Label2" runat="server"></asp:Label>
                &nbsp; <a class="BlueCss" href="LanEmailAdd.aspx?Type=HuiFu&ID=<%=Request.QueryString["ID"].ToString()%>">
                    回复</a> &nbsp; <a class="BlueCss" href="LanEmailAdd.aspx?Type=ZhuanFa&ID=<%=Request.QueryString["ID"].ToString()%>">
                        转发</a> </span><span class="header">接收人：
                            <asp:Label ID="Label3" runat="server"></asp:Label>
                        </span><span class="header">发送时间：
                            <asp:Label ID="Label4" runat="server"></asp:Label>
                        </span></li>
        </ul>
        <ul class="pageitem">
            <li class="textbox"><span class="header">邮件附件：
                <asp:Label ID="Label5" runat="server"></asp:Label>
            </span></li>
        </ul>
        <ul class="pageitem">
            <li class="textbox">
                <p>
                    邮件内容：
                    <asp:Label ID="Label6" runat="server"></asp:Label>
                </p>
            </li>
        </ul>
    </div>
    <div id="footer">
        <a href="#">Powered by 金码铺</a></div>
    </form>
</body>
</html>
