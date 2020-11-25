<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskFPAdd.aspx.cs" Inherits="OA.aspx.Moa.Subaltern.TaskFPAdd" %>

<html>
<head>
    <title>金码铺移动办公平台 </title>
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="index,follow" name="robots" />
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no"
        name="viewport" />
    <script src="../JS/jquery-1.4.1.js" type="text/javascript"></script>
    <link href="../JS/jquery-ui-mobile-1.7.2.custom.css" rel="stylesheet" type="text/css" />
    <script src="../JS/jquery-ui-1.7.2.custom.min.js" type="text/javascript"></script>
    <script src="../JS/jquery.bgiframe.min.js" type="text/javascript"></script>
    <link href="../Style/Mobile/css/Style.css" rel="stylesheet" media="screen" type="text/css" />
    <link href="../Style/Mobile/css/developer-style.css" rel="stylesheet" type="text/css" />
    <script src="../Style/Mobile/javascript/functions.js" type="text/javascript"></script>
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
                document.getElementById('txtToUserList').value = wName;
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
        <div id="title">
            添加任务</div>
        <div id="leftnav">
            <a href="../Main.aspx">
                <img alt="home" src="../Style/Mobile/images/home.png" /></a>
        </div>
    </div>
    <div id="content">
        <fieldset>
            <span class="graytitle">任务标题：</span>
            <ul class="pageitem">
                <li class="bigfield">
                    <asp:TextBox ID="txtTaskTitle" runat="server" Width="100%"></asp:TextBox>
                </li>
            </ul>
            <span class="graytitle">开始时间：</span>
            <ul class="pageitem">
                <li class="bigfield">
                    <input id="TextBox2" runat="server" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm' });"
                        style="width: 100%;" />
                </li>
            </ul>
            <span class="graytitle">结束时间：</span>
            <ul class="pageitem">
                <li class="bigfield">
                    <input id="TextBox3" runat="server" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm' });"
                        style="width: 100%;" />
                </li>
            </ul>
            <span class="graytitle">是否需要提醒：</span>
            <ul class="pageitem">
                <li class="bigfield">
                    <select runat="server" id="TX" style="width: 100%;">
                        <option value="是">是</option>
                        <option value="否">否</option>
                    </select></li>
            </ul>
            <span class="graytitle">反馈提醒时间：</span>
            <ul class="pageitem">
                <li class="bigfield">
                    <input id="TextBox4" runat="server" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm' });"
                        style="width: 100%;" /></li>
            </ul>
            <span class="graytitle">执行人： </span>
            <ul class="pageitem">
                <li class="bigfield">
                    <asp:TextBox ID="txtToUserList" runat="server" Width="100%"></asp:TextBox><br />
                </li>
                <img class="HerCss" onclick="DoSelect()" src="../../images/Button/search.gif" />
            </ul>
            <ul class="pageitem">
                <li class="checkbox"><span class="name">短消息</span>
                    <asp:CheckBox ID="CHKSMS" runat="server" Checked="True" /></li>
                <li class="checkbox"><span class="check"><span class="name">短信 </span>
                    <asp:CheckBox ID="CHKMOB" runat="server" />
                </span></li>
            </ul>
            <span class="graytitle">任务内容：</span>
            <ul class="pageitem">
                <li class="textbox">
                    <asp:TextBox ID="txtTaskContent" runat="server" Width="100%" Rows="10" TextMode="MultiLine"></asp:TextBox>
                </li>
                <li class="button" style="text-align: center;">
                    <asp:Button ID="iButton1" runat="server" Text="发送" OnClick="iButton1_Click"
                        Width="80px" />
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
