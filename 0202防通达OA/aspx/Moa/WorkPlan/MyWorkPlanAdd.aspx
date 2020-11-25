<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyWorkPlanAdd.aspx.cs" Inherits="OA.aspx.Moa.WorkPlan.MyWorkPlanAdd" %>

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
                document.getElementById('TextBox2').value = wName;
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
                <img alt="home" src="../Style/Mobile/images/home.png" /></a>
        </div>
        <div id="title">
            添加工作计划</div>
    </div>
    <div id="content">
        <fieldset>
            <span class="graytitle">计划主题：</span>
            <ul class="pageitem">
                <li class="bigfield">
                    <asp:TextBox ID="TextBox1" runat="server" Width="100%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="*该项不可以为空"></asp:RequiredFieldValidator>
                </li>
            </ul>
            <span class="graytitle">允许查看人： </span>
            <ul class="pageitem">
                <li class="bigfield">
                    <asp:TextBox ID="TextBox2" runat="server" Width="100%"></asp:TextBox>
                </li>
                <img class="HerCss" onclick="DoSelect()" src="../../images/Button/search.gif" />
            </ul>
            <span class="graytitle">附件：</span>
            <ul class="pageitem">
                <li class="checkbox" style="height: 100px;">
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
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
            <span class="graytitle">计划内容：</span>
            <ul class="pageitem">
                <li class="textbox">
                    <textarea runat="server" id="TxtContent" rows="10" cols="6" style="width: 100%;"></textarea>
                </li>
                <li class="button" style="text-align: center;">
                    <asp:Button ID="iButton1" runat="server" Text="保存" OnClick="iButton1_Click"
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
