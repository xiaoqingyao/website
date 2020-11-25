<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GoToNextNode.aspx.cs" Inherits="WorkFlow_GoToNextNode" %>

<html>
<head>
    <title>移动手机浙江金海环境移动办公平台 </title>
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

    <script src="../JS/jquery-1.4.1.js" type="text/javascript"></script>

    <link href="../JS/jquery-ui-mobile-1.7.2.custom.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-ui-1.7.2.custom.min.js" type="text/javascript"></script>

    <script src="../JS/jquery.bgiframe.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        function DoSelect() {
            var wName; var RadNum = Math.random();
            $('#divWF').dialog({
                inline: true,
                autoOpen: false,
                width: 400,
                height: 380,
                modal: true,
                close: function() {
                    $(this).dialog('destroy');
                    $("#iframeWF").attr("src", "");
                }
            });

            $("#iframeWF").attr("src", "../Main/SelectUser.aspx?TableName=ERPUser&LieName=UserName&Condition='" + document.getElementById('TextBox2').value + "'&Radstr=" + RadNum);
            $('#divWF').dialog('open');
        }

        function SetData(wName) {
            if (wName == null) { }
            else {
                document.getElementById('TextBox5').value = wName;
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
            <a href="../Main/Main.aspx">
                <img alt="home" src="../Style/Mobile/images/home.png" /></a>
        </div>
        <div id="title">
            继续办理工作</div>
        <div id="rightnav">
            <a href="javascript:window.history.go(-1)">返回</a></div>
    </div>
    <div id="tributton">
        <div class="links">
            <a href="../Main/Main.aspx">主页</a><a href="#">在线用户</a><a id="pressed">关于</a></div>
    </div>
    <div id="content">
        <fieldset>
            <span class="graytitle">工作名称：</span>
            <ul class="pageitem">
                <li class="bigfield">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </li>
            </ul>
            <span class="graytitle">下一结点选择：</span>
            <ul class="pageitem">
                <li class="select">
                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" Width="100%"
                        OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                    </asp:DropDownList>
                </li>
            </ul>
            <span class="graytitle">是否根据条件跳转：</span>
            <ul class="pageitem">
                <li class="checkbox">
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" Text="根据条件字段自动决定下一节点" />
                </li>
            </ul>
            <span class="graytitle">节点审批模式：</span>
            <ul class="pageitem">
                <li class="bigfield">
                    <asp:Label ID="Label2" runat="server"></asp:Label><asp:TextBox ID="TextBox2" runat="server"
                        Width="28px" Style="display: none"></asp:TextBox>
                </li>
            </ul>
            <span class="graytitle">经办人列表：</span>
            <ul class="pageitem">
                <li class="textbox">
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                </li>
            </ul>
            <span class="graytitle">审批人选择：</span>
            <ul class="pageitem">
                <li class="textbox">
                    <asp:TextBox ID="TextBox5" runat="server" Width="100%"></asp:TextBox>
                    <img class="HerCss" onclick="DoSelect()" src="../images/Button/search.gif" />
                </li>
                <li class="checkbox"><span class="name">短消息</span><img src="../images/TreeImages/@sms.gif" />
                    <asp:CheckBox ID="CHKSMS" runat="server" Checked="True" />
                </li>
                <li class="checkbox"><span class="name">短信</span><img src="../images/TreeImages/mobile_sms.gif" />
                    <asp:CheckBox ID="CHKMOB" runat="server" />
                </li>
                <li class="button">
                    <asp:Button ID="ImageButton1" runat="server" Text="提交" OnClick="ImageButton1_Click" />
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
