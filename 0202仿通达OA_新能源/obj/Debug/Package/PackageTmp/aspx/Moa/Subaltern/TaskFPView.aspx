<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskFPView.aspx.cs" Inherits="OA.aspx.Moa.Subaltern.TaskFPView" %>

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
        <span class="graytitle">
            <asp:Label ID="lblTaskTitle" runat="server"></asp:Label></span>
        <ul class="pageitem">
            <li class="textbox"><span class="header">任务内容</span>
                <asp:Label ID="lblTaskContent" runat="server"></asp:Label>
                <p>
                    分配人：<asp:Label ID="lblFromUser" runat="server"></asp:Label><br />
                    执行人：<asp:Label ID="lblToUserList" runat="server"></asp:Label><br />
                    开始时间：<asp:Label ID="Label1" runat="server"></asp:Label><br />
                    结束时间：<asp:Label ID="Label2" runat="server"></asp:Label><br />
                    是否需要反馈：<asp:Label ID="Label3" runat="server"></asp:Label><br />
                    反馈时间：<asp:Label ID="Label4" runat="server"></asp:Label><br />
                </p>
            </li>
        </ul>
        <ul class="pageitem">
            <li class="textbox"><span class="header">汇报与批示</span>
                <asp:Label ID="lblXinXiGouTong" runat="server"></asp:Label>
            </li>
        </ul>
        <ul class="pageitem">
            <li class="textbox"><span class="header">任务进度</span>
                <asp:Label ID="lblJinDu" runat="server"></asp:Label>
            </li>
        </ul>
        <ul class="pageitem">
            <li class="textbox"><span class="header">完成情况</span>
                <asp:Label ID="lblWanCheng" runat="server"></asp:Label>
            </li>
        </ul>
        <ul class="pageitem">
            <li class="textbox"><span class="header">当前状态</span>
                <asp:Label ID="lblNowState" runat="server"></asp:Label>
            </li>
        </ul>
        <ul class="pageitem">
            <li class="textbox"><span class="header">我的汇报</span> 任务进度(%)：<asp:TextBox ID="txtJinDu"
                runat="server" Width="350px"></asp:TextBox><br />
                完成情况：<asp:TextBox ID="txtWanCheng" runat="server" Height="60px" TextMode="MultiLine"
                    Width="350px"></asp:TextBox><br />
                我的汇报：
                <asp:TextBox ID="TextBox1" runat="server" Height="60px" TextMode="MultiLine" Width="350px"></asp:TextBox>
            </li>
            <li class="button">
                <asp:Button ID="submit" runat="server" OnClick="Button1_Click" Text="保存" /></li>
        </ul>
    </div>
    </form>
</body>
</html>
