<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NetEmailAdd.aspx.cs" Inherits="OA.aspx.Moa.NetMail.NetEmailAdd" %>

<html>
<head>
    <title>金码铺移动办公平台 </title>
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="index,follow" name="robots" />
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no"
        name="viewport" />
    <link href="../Style/Mobile/css/Style.css" rel="stylesheet" media="screen" type="text/css" />
    <link href="../Style/Mobile/css/developer-style.css" rel="stylesheet" type="text/css" />

    <script src="../Style/Mobile/javascript/functions.js" type="text/javascript"></script>

    
</head>
<body>
    <form id="form1" runat="server">
    <div id="topbar">
        <div id="leftnav">
            <a href="NetEmailView.aspx">
                <img alt="home" src="../Style/Mobile/images/home.png" /></a> <a href='NetMailShou.aspx'>收件箱</a>
        </div>
        <div id="title">
            撰写新邮件</div>
    </div>
    <div id="content">
        <fieldset>
            <span class="graytitle">邮件主题：</span>
            <ul class="pageitem">
                <li class="bigfield">
                    <asp:TextBox ID="TextBox1" placeholder="邮件主题" runat="server" Width="100%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator>
                </li>
            </ul>
            <span class="graytitle">接收人： </span>
            <ul class="pageitem">
                <li class="bigfield">
                    <asp:TextBox ID="TextBox2" placeholder="接收人" runat="server" Width="100%"></asp:TextBox>
                </li>
            </ul>
            <span class="graytitle">附件：</span>
            <ul class="pageitem">
                <li class="checkbox" style="height: 100px;">
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" TextAlign="Left" Style="vertical-align: middle;"
                        RepeatDirection="Horizontal" RepeatColumns="1">
                    </asp:CheckBoxList>
                </li>
                <li class="button">
                    
<asp:ImageButton ID="iButton3" runat="server" CausesValidation="False" Width="80" Height="20" ImageAlign="AbsMiddle" ImageUrl="../../images/Button/DelFile.jpg" OnClick="iButton3_Click" />
                </li>
            </ul>
            <span class="graytitle">上传附件：</span>
            <ul class="pageitem">
                <li class="textbox">
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="100%" />
                </li>
                <li class="button">
                    
<asp:ImageButton ID="iButton2" runat="server" ImageAlign="AbsMiddle" ImageUrl="../../images/Button/UpLoad.jpg" OnClick="iButton2_Click" Width="60" Height="20" CausesValidation="False" />
                </li>
            </ul>
            <span class="graytitle">邮件内容：</span>
            <ul class="pageitem">
                <li class="textbox">
                    <textarea runat="server" id="TxtContent" rows="10" cols="6" style="width: 100%;"></textarea>
                </li>
                <li class="button">
                    <asp:Button ID="iButton1" runat="server" Text="发送" OnClick="iButton1_Click" />
                </li>
                <li class="button">
                    <asp:Button ID="iButton4" runat="server" Text="存草稿箱" OnClick="iButton4_Click" />
                </li>
            </ul>
        </fieldset>
    </div>
    </form>
</body>
</html>
