<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GongGaoAdd.aspx.cs" Inherits="OA.aspx.Moa.GongGao.GongGaoAdd" %>

<html>
<head>
    <title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%> </title>
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="index,follow" name="robots" />
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <link href="../Style/Mobile/pics/homescreen.gif" rel="apple-touch-icon" />
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no"
        name="viewport" />
    <link href="../Style/Mobile/css/Style.css" rel="stylesheet" media="screen" type="text/css" />
    <link href="../Style/Mobile/css/developer-style.css" rel="stylesheet" type="text/css" />

    <script src="../Style/Mobile/javascript/functions.js" type="text/javascript"></script>

    <link href="../Style/Mobile/pics/startup.png" rel="apple-touch-startup-image" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="topbar">
        <div id="leftnav">
            <a href="../Main.aspx">
                <img alt="home" src="../Style/Mobile/images/home.png" /></a>
        </div>
        <div id="title">
            添加公告通知</div>
    </div>
    <div id="tributton">
        <div class="links">
            <a href="../Main.aspx">主页</a><a href="#">在线用户</a><a id="pressed">关于</a></div>
    </div>
    <div id="content">
        <fieldset>
            <span class="graytitle">信息主题：</span>
            <ul class="pageitem">
                <li class="bigfield">
                    <asp:TextBox ID="TextBox1" runat="server" Width="100%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator>
                </li>
            </ul>
            <span class="graytitle">附件：</span>
            <ul class="pageitem">
                <li class="checkbox" style="height: 100px;">
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                    </asp:CheckBoxList>
                </li>
                <li class="button">&nbsp;
<asp:ImageButton ID="iButton3" runat="server" CausesValidation="False" Width="80" Height="20" ImageAlign="AbsMiddle" ImageUrl="../../images/Button/DelFile.jpg" OnClick="iButton3_Click" />
                </li>
            </ul>
            <span class="graytitle">上传附件：</span>
            <ul class="pageitem">
                <li class="textbox">
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="350px" />
                </li>
                <li class="button">
                    
<asp:ImageButton ID="iButton2" runat="server" CausesValidation="False" ImageAlign="AbsMiddle" Width="60" Height="20" ImageUrl="../../images/Button/UpLoad.jpg" OnClick="iButton2_Click" />
                </li>
            </ul>
            <span class="graytitle">详细内容：</span>
            <ul class="pageitem">
                <li class="textbox">
                    <asp:TextBox ID="TxtContent" runat="server"  rows="10" cols="6" style="width: 100%;"></asp:TextBox>
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
