<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TongXunLuView.aspx.cs" Inherits="OA.aspx.Moa.Work.TongXunLuView" %>

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
            查看联系人</div>
        <div id="leftnav">
            <a href="../Main.aspx">
                <img alt="home" src="../../Style/Mobile/images/home.png" /></a>
        </div>
        <div id="rightnav">
            <a href="TongXunLu.aspx?TypeStr=<%=Request.QueryString["TypeStr"].ToString().Trim() %>">通讯录</a>
        </div>
    </div>
    <div id="content">
        <ul class="pageitem">
            <li class="textbox"><span class="header">所属类别：
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </span></li>
              <li class="textbox"><span class="header">是否共享：
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </span></li>
        </ul>
        <ul class="pageitem">
            <li class="textbox"><span class="header"><strong>个人信息</strong> </span></li>
            <li class="textbox"><span class="header">姓名：
                <asp:Label ID="Label3" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">性别：
                <asp:Label ID="Label4" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">生日：
                <asp:Label ID="Label5" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">昵称：
                <asp:Label ID="Label6" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">职务：
                <asp:Label ID="Label7" runat="server"></asp:Label></span></li>
            <li class="textbox"><span class="header">配偶：
                <asp:Label ID="Label8" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">子女：
                <asp:Label ID="Label9" runat="server"></asp:Label>
            </span></li>
        </ul>
        <ul class="pageitem">
            <li class="textbox"><span class="header"><strong>联系方式（单位）</strong> </span></li>
            <li class="textbox"><span class="header">单位名称：
                <asp:Label ID="Label10" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">单位地址：
                <asp:Label ID="Label11" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">单位邮编：
                <asp:Label ID="Label12" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">单位电话：
                <asp:Label ID="Label13" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">单位传真：
                <asp:Label ID="Label14" runat="server"></asp:Label>
            </span></li>
        </ul>
        <ul class="pageitem">
            <li class="textbox"><span class="header"><strong>联系方式（家庭）</strong> </span></li>
            <li class="textbox"><span class="header">家庭住址：
                <asp:Label ID="Label15" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">家庭邮编：
                <asp:Label ID="Label16" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">家庭电话：
                <asp:Label ID="Label17" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">手机：
                <asp:Label ID="Label18" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">小灵通：
                <asp:Label ID="Label19" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">电子邮件：
                <asp:Label ID="Label20" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">QQ号码：
                <asp:Label ID="Label21" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">MSN：
                <asp:Label ID="Label22" runat="server"></asp:Label>
            </span></li>
            <li class="textbox"><span class="header">备注：
                <asp:Label ID="Label23" runat="server"></asp:Label>
            </span></li>
        </ul>
    </div>
    <div id="footer">
        <a href="#">Powered by 金码铺</a></div>
    </form>
</body>
</html>
