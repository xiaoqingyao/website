<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoToNextNode.aspx.cs" Inherits="OA.aspx.Moa.NWorkFlow.GoToNextNode" %>

<html>
<head>
    <title>
        <%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
<link href="../css/main.css" type="text/css" rel="stylesheet" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="index,follow" name="robots" />
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no"
        name="viewport" />
    <link href="../Style/Mobile/css/style.css" rel="stylesheet" media="screen" type="text/css" />
    <script src="../Style/Mobile/javascript/functions.js" type="text/javascript"></script>
    
    <script type="text/javascript" language="javascript" src="../JS/calendar.js"></script>
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
                document.getElementById('TextBox5').value = wName;
            }
        }

        //关闭对话框
        function closeWFDialog() {
            $("#divWF").dialog("close");
        }
    </script>
    <script language="javascript">
        function PrintTable() {
            document.getElementById("PrintHide").style.visibility = "hidden"
            print();
            document.getElementById("PrintHide").style.visibility = "visible"
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="topbar">
        <div id="leftnav">
            <a href="../Main.aspx">
                <img alt="home" src="../Style/Mobile/images/home.png" /></a>
        </div>
        <div id="title">
            继续办理工作</div>
        <div id="rightnav">
            <a href="javascript:window.history.go(-1)">返回</a></div>
    </div>
    <div id="content">
        <fieldset>
            <span class="graytitle">工作名称：</span>
            <ul class="pageitem">
                <li class="bigfield">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Style="display: none;">表单内容</asp:Label>
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
            <span class="graytitle">评审模式：</span>
            <ul class="pageitem">
                <li class="bigfield">
                    <asp:TextBox ID="TextBox1" runat="server" BorderStyle="None" BorderWidth="0px" ReadOnly="True"
                        Width="350px"></asp:TextBox>
                </li>
            </ul>
            <span class="graytitle">审批人选择模式：</span>
            <ul class="pageitem">
                <li class="bigfield">
                    <asp:TextBox ID="TextBox2" runat="server" BorderStyle="None" BorderWidth="0px" ReadOnly="True"
                        Width="350px"></asp:TextBox>
                </li>
            </ul>
            <span class="graytitle">审批人选择：</span>
            <ul class="pageitem">
                <li class="bigfield">
                    <asp:TextBox ID="TextBox5" runat="server" Width="80%"></asp:TextBox>
                    <img class="HerCss" onclick="DoSelect()" src="../../../images/Button/search.gif" />
                </li>
                <li class="checkbox"><span class="name">短消息</span><img src="../../../images/TreeImages/@sms.gif" />
                    <asp:CheckBox ID="CHKSMS" runat="server" Checked="True" />
                </li>
                <li class="checkbox"><span class="name">短信</span><img src="../../../images/TreeImages/mobile_sms.gif" />
                    <asp:CheckBox ID="CHKMOB" runat="server" />
                </li>
                <li class="button">
                    <asp:Button ID="iButton1" runat="server" Text="提交" OnClick="iButton1_Click" />
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
