<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkRiZhiAdd.aspx.cs" Inherits="OA.aspx.Moa.Work.WorkRiZhiAdd" %>

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
        <div id="leftnav">
            <a href="../Main.aspx">
                <img alt="home" src="../../Style/Mobile/images/home.png" /></a><a href="WorkRiZhi.aspx">工作日志</a>
        </div>
        <div id="title">
            添加工作日志</div>
    </div>
    <div id="tributton">
        <div class="links">
            <a href="../Main.aspx">主页</a><a href="#">在线用户</a><a id="pressed">关于</a></div>
    </div>
    <div id="content">
        <fieldset>
            <span class="graytitle">日志主题：</span>
            <ul class="pageitem">
                <li class="bigfield">
                    <asp:TextBox ID="TextBox1" runat="server" Width="100%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator>
                </li>
            </ul>
            <span class="graytitle">日志类型：</span>
            <ul class="pageitem">
                <li class="select">
                    <select name="d" runat="server" id="SelLX">
                        <option value="个人日志">个人日志</option>
                        <option value="工作日志">工作日志</option>
                    </select><span class="arrow"></span> </li>
            </ul>
            <span class="graytitle">详细内容：</span>
            <ul class="pageitem">
                <li class="textbox">
                    <asp:TextBox ID="TxtContent" runat="server" Height="100px" Width="100%"></asp:TextBox>
                </li>
                <li class="button">
                    <asp:Button ID="iButton1" runat="server" Text="保存" OnClick="iButton1_Click" />
                </li>
            </ul>
        </fieldset>
    </div>
    <div id="footer">
        <a href="#">Powered by 金码铺</a></div>
    </form>
</body>
</html>
