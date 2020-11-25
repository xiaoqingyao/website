<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MobileSmsAdd.aspx.cs" Inherits="OA.aspx.Moa.Mobile.MobileSmsAdd" %>

<html>
<head>
    <title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%> </title>
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="index,follow" name="robots" />
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no"
        name="viewport" />

    <script src="../../JS/jquery-1.4.1.js" type="text/javascript"></script>

    <link href="../../JS/jquery-ui-mobile-1.7.2.custom.css" rel="stylesheet" type="text/css" />

    <script src="../../JS/jquery-ui-1.7.2.custom.min.js" type="text/javascript"></script>

    <script src="../../JS/jquery.bgiframe.min.js" type="text/javascript"></script>

    <link href="../../Style/Mobile/css/Style.css" rel="stylesheet" media="screen" type="text/css" />
    <link href="../../Style/Mobile/css/developer-style.css" rel="stylesheet" type="text/css" />

    <script src="../../Style/Mobile/javascript/functions.js" type="text/javascript"></script>

    

    <script type="text/javascript">
        function DoSelect() {
            var wName; var RadNum = Math.random();
            $('#divWF').dialog({
                inline: true,
                autoOpen: false,
                width: 300,
                height: 380,
                modal: true,
                close: function () {
                    $(this).dialog('destroy');
                    $("#iframeWF").attr("src", "");
                }
            });

            $("#iframeWF").attr("src", "../SelectUser.aspx?TableName=ERPUser&LieName=UserName&Radstr=" + RadNum);
            $('#divWF').dialog('open');
        }

        function SetData(wName) {
            if (wName == null) { }
            else {
                document.getElementById('TextBox1').value = wName;
            }
        }

        //关闭对话框
        function closeWFDialog() {
            $("#divWF").dialog("close");
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div id="topbar">
        <div id="leftnav">
            <a href="../Main.aspx">
                <img alt="home" src="../../Style/Mobile/images/home.png" /></a> <a href='MobileSms.aspx'>
                    手机短信</a>
        </div>
        <div id="title">
            添加短信</div>
    </div>
    <div id="tributton">
        <div class="links">
            <a href="../Main.aspx">主页</a><a href="#">在线用户</a><a id="pressed">关于</a></div>
    </div>
    <div id="content">
        <fieldset>
            <legend>内部短信群发 </legend><span class="graytitle">接收人：</span>
            <ul class="pageitem">
                <li class="bigfield">
                    <asp:TextBox ID="TextBox1" runat="server" Width="100%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="*该项不可以为空" Display="Dynamic" ValidationGroup="Neibu"></asp:RequiredFieldValidator>&nbsp;
                    <span style="color: darkgray">* 请选择用户名，用于内部人员短信</span> </li>
                     <img class="HerCss" onclick="DoSelect()"
                        src="../../images/Button/search.gif" />
            </ul>
            <span class="graytitle">信息内容：</span>
            <ul class="pageitem">
                <li class="textbox">
                    <asp:TextBox ID="TextBox2" runat="server" Width="100%" Height="50px" TextMode="MultiLine"></asp:TextBox>
                </li>
                <li class="button">
                    <asp:Button ID="iButton1" runat="server" Text="发送" OnClick="iButton1_Click" />
                </li>
            </ul>
        </fieldset>
        <fieldset>
            <legend>外部短信群发 </legend><span class="graytitle">接收用户：</span>
            <ul class="pageitem">
                <li class="textbox">
                    <asp:TextBox ID="TextBox3" runat="server" Height="90px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3"
                        Display="Dynamic" ErrorMessage="*该项不可以为空" ValidationGroup="WaiBu"></asp:RequiredFieldValidator>&nbsp;
                    <span style="color: darkgray">* 请输入手机号码列表，用 "," 分隔。</span></li>
            </ul>
            <span class="graytitle">信息内容：</span>
            <ul class="pageitem">
                <li class="textbox">
                    <asp:TextBox ID="TextBox4" runat="server" Height="50px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                </li>
                <li class="button">
                    <asp:Button ID="iButton2" runat="server" Text="发送" OnClick="iButton2_Click" />
                </li>
            </ul>
        </fieldset>
    </div>
     <div id="divWF" title="人员选择" style="display: none;">
        <iframe id="iframeWF" height="100%" width="100%" frameborder="0" marginheight="0"
            marginwidth="0" scrolling="auto"></iframe>
    </div>
    </form>
</body>
</html>
