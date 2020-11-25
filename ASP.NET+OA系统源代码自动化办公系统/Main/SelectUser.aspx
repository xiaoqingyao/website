<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SelectUser.aspx.cs" Inherits="SelectCondition" %>

<html>
<head>
    <title>ѡ������</title>
    <meta http-equiv="Content-Language" content="zh-cn" />
    <link href="../Style/Style.css" type="text/css" rel="STYLESHEET" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <base target="_self" />
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no"
        name="viewport" />

    <script src="../JS/jquery-1.4.1.js" type="text/javascript"></script>

    <link href="../JS/jquery-ui-mobile-1.7.2.custom.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-ui-1.7.2.custom.min.js" type="text/javascript"></script>

    <script src="../JS/jquery.bgiframe.min.js" type="text/javascript"></script>

    <link href="../Style/Mobile/css/Style.css" rel="stylesheet" media="screen" type="text/css" />

    <script src="../Style/Mobile/javascript/functions.js" type="text/javascript"></script>

    <link href="../Style/Mobile/pics/startup.png" rel="apple-touch-startup-image" />
    <style type="text/css">
        body
        {
            overflow: hidden;
            width: 100%;
            margin: 0;
            padding: 0;
        }
    </style>

    <script language="javascript" type="text/javascript">
        var allCheckStr;
        // var getFromParent = window.dialogArguments;
        function CheckSelect() {
            var aaaa = "";
            for (var i = 0; i < window.document.Form1.elements.length; i++) {
                var e = Form1.elements[i];
                if (e.checked) {
                    if (aaaa == "") {
                        aaaa = e.value;
                    }
                    else {
                        aaaa = aaaa + "," + e.value;
                    }
                }
            }
            return aaaa;
        }

        function AddSelect() {
            var aaaa = "";
            for (var i = 0; i < window.document.Form1.elements.length; i++) {
                var e = Form1.elements[i];
                if (e.checked) {
                    if (aaaa == "") {
                        aaaa = e.value;
                    }
                    else {
                        aaaa = aaaa + "," + e.value;
                    }
                }
            }
            if (document.getElementById('TextBox4').value.length > 0) {
                document.getElementById('TextBox4').value = document.getElementById('TextBox4').value + "," + aaaa;
            }
            else {
                document.getElementById('TextBox4').value = aaaa;
            }

            for (var i = 0; i < window.document.Form1.elements.length; i++) {
                var e = Form1.elements[i];
                e.checked = false;
            }
        }

        function AllSelect() {
            var aaaa = "";
            for (var i = 0; i < window.document.Form1.elements.length; i++) {
                var e = Form1.elements[i];
                if (e.id == "Checkbox1") {
                    if (aaaa == "") {
                        aaaa = e.value;
                    }
                    else {
                        aaaa = aaaa + "," + e.value;
                    }
                }
            }
            if (document.getElementById('TextBox4').value.length > 0) {
                document.getElementById('TextBox4').value = document.getElementById('TextBox4').value + "," + aaaa;
            }
            else {
                document.getElementById('TextBox4').value = aaaa;
            }
        }

        function sendFromChild() {
            parent.SetData(document.getElementById('TextBox4').value);
            parent.closeWFDialog();
            //window.returnValue=CheckSelect();  
            //                window.returnValue=document.getElementById('TextBox4').value;
            //                window.close();  
        }

        function CCC() {
            parent.closeWFDialog();
            //  window.close();
        }

        function SelectBM() {
            var wName; var RadNum = Math.random();
            $('#divBM').dialog({
                inline: true,
                autoOpen: false,
                width: 350,
                height: 320,
                modal: true,
                close: function() {
                    $(this).dialog('destroy');
                    $("#iframeBM").attr("src", "");
                }
            });

            $("#iframeBM").attr("src", "../Main/SelectCondition.aspx?TableName=ERPBuMen&LieName=BuMenName&Radstr=" + RadNum);
            $('#divBM').dialog('open');
        }

        function SetBM(wName) {
            if (wName == null) { }
            else {
                document.getElementById('TextBox2').value = wName;
            }
        }

        //�رնԻ���
        function closeBMDialog() {
            $("#divBM").dialog("close");
        }

        function SelectJS() {
            var wName; var RadNum = Math.random();
            $('#divJS').dialog({
                inline: true,
                autoOpen: false,
                width: 350,
                height: 320,
                modal: true,
                close: function() {
                    $(this).dialog('destroy');
                    $("#iframeJS").attr("src", "");
                }
            });

            $("#iframeJS").attr("src", "../Main/SelectCondition.aspx?TableName=ERPJiaoSe&LieName=JiaoSeName&Radstr=" + RadNum);
            $('#divJS').dialog('open');
        }

        function SetJS(wName) {
            if (wName == null) { }
            else {
                document.getElementById('TextBox3').value = wName;
            }
        }

        //�رնԻ���
        function closeJSDialog() {
            $("#divJS").dialog("close");
        }
         
    </script>

</head>
<body>
    <form id="Form1" method="post" runat="server">
    <div id="content">
        <ul class="pageitem">
            <li class="button" style="text-align: center;">���ţ�<asp:TextBox ID="TextBox2" runat="server"
                Height="20px" Width="50px"></asp:TextBox><img class="HerCss" onclick="SelectBM();"
                    style="width: 20px; height: 20px;" src="../images/Button/search.gif" />
                ��ɫ��<asp:TextBox ID="TextBox3" runat="server" Height="20px" Width="50px"></asp:TextBox><img
                    class="HerCss" onclick="SelectJS();" style="width: 20px; height: 20px;" src="../images/Button/search.gif" /><asp:ImageButton
                        ID="ImageButton4" runat="server" ImageAlign="AbsMiddle" ImageUrl="../images/Button/BtnSerch.jpg"
                        Style="width: 40px; height: 20px;" OnClick="ImageButton4_Click" />
            </li>
            <li class="textbox" style="height: 250px;">
                <table border="0" cellpadding="0" cellspacing="0" align="center">
                    <tr>
                        <td rowspan="4" style="width: 130px">
                            <asp:ListBox ID="ListBox1" runat="server" Height="250px" SelectionMode="Multiple"
                                Width="130px"></asp:ListBox>
                        </td>
                        <td style="width: 27px">
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../images/AddTo.gif"
                                OnClick="ImageButton1_Click" ToolTip="ѡ�м���" />
                        </td>
                        <td rowspan="4" width="130px">
                            <asp:ListBox ID="ListBox2" runat="server" Height="250px" SelectionMode="Multiple"
                                Width="130px"></asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 27px">
                            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="../images/AddAll.gif"
                                OnClick="ImageButton2_Click" ToolTip="ȫ������" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 27px">
                            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="../images/Remove.gif"
                                OnClick="ImageButton3_Click" ToolTip="ѡ��ȥ��" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 27px">
                            <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="../images/RemoveAll.gif"
                                OnClick="ImageButton5_Click" ToolTip="ȫ��ȥ��" />
                        </td>
                    </tr>
                </table>
            </li>
            <li class="button" style="text-align: center;">
                <asp:TextBox ID="TextBox4" runat="server" Enabled="False" Width="0px" Height="0px"></asp:TextBox>
                <input id="Button1" class="BottonCss" onclick="sendFromChild();" style="width: 70px"
                    type="button" value="ȷ��" />
                <input class="BottonCss" onclick="CCC();" style="width: 72px" type="button" value="ȡ��" />
            </li>
        </ul>
    </div>
    <div id="divBM" title="����ѡ��" style="display: none;">
        <iframe id="iframeBM" height="100%" width="100%" frameborder="0" marginheight="0"
            marginwidth="0" scrolling="auto"></iframe>
    </div>
    <div id="divJS" title="��ɫ" style="display: none;">
        <iframe id="iframeJS" height="100%" width="100%" frameborder="0" marginheight="0"
            marginwidth="0" scrolling="auto"></iframe>
    </div>
    </form>
</body>
</html>
