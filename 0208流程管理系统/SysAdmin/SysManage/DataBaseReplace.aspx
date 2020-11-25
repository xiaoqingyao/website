<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataBaseReplace.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.SysManage.DataBaseReplace" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>数据库字符串替换</title>
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/public.js"></script>

    <script src="../JS/publicform.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script language="javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
        function TypeChange(selValue) {
            if (selValue == "2" || selValue == "3") {
                $("#uloldvalue").css("display", "none");
                $("#ulnewvalue").css("display", "none");
                $("#uladd").css("display", "block");
            }
            else {
                $("#uloldvalue").css("display", "block");
                $("#ulnewvalue").css("display", "block");
                $("#uladd").css("display", "none");
            }
        }
        function SetFiles(obj) {
            var files = $("#txtFiles").val();
            if (obj.checked) {
                $("#txtFiles").val(files + obj.value + ",");
            }
            else {

                $("#txtFiles").val(files.replace(obj.value + ",", ""));

            }
        }
        
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %>
        </h4>
        <div id="panel">
            <br clear="left" />
            <dl>
                <dt>需替换的数据表:</dt>
                <dd>
                    <asp:DropDownList ID="ddlDataTable" runat="server" OnSelectedIndexChanged="ddlDataTable_SelectedIndexChanged"
                        AutoPostBack="true">
                    </asp:DropDownList>
                </dd>
            </dl>
            <dl>
                <dt>请选择需替换的字段名: </dt>
                <dd>
                    <asp:TextBox ID="txtFiles" runat="server" Width="316px" CssClass="validate[required]"></asp:TextBox>
                    <div style="word-break: break-all; word-wrap: break-word; width: 500px">
                        <asp:Repeater ID="reptFiles" runat="server">
                            <ItemTemplate>
                                <div style="float: left; width: 120px;word-break: break-all; word-wrap: break-word;">
                                    <input id="chkField" name="chkField" type="checkbox" value='<%#Container.DataItem%>'
                                        onclick="SetFiles(this)" style="border: 0px" /><%#Container.DataItem%>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>                   
                </dd>
            </dl>
            <dl>
                <dt>替换方式:</dt>
                <dd>
                    <asp:DropDownList ID="ddlReplaceType" runat="server" onchange="TypeChange(this.value)">
                        <asp:ListItem Value="1" Selected="True">字符串替换</asp:ListItem>
                        <asp:ListItem Value="2">在字段前面追加</asp:ListItem>
                        <asp:ListItem Value="3">在字段后面追加</asp:ListItem>
                    </asp:DropDownList>
                </dd>
            </dl>
            <dl id="uloldvalue">
                <dt>要替换的内容:</dt>
                <dd>
                    <asp:TextBox ID="txtOldValue" runat="server" TextMode="MultiLine" Width="400px" Height="50px"></asp:TextBox></dd>
            </dl>
            <dl id="ulnewvalue">
                <dt>替换为:</dt>
                <dd>
                    <asp:TextBox ID="txtNewValue" runat="server" TextMode="MultiLine" Width="400px" Height="50px"></asp:TextBox></dd>
            </dl>
            <dl id="uladd" style="display: none;">
                <dt>追加的字符串:</dt>
                <dd>
                    <asp:TextBox ID="txtAdd" runat="server" TextMode="MultiLine" Width="400px" Height="50px"></asp:TextBox></dd>
            </dl>
            <dl>
                <dt>替换条件:</dt>
                <dd>
                    <asp:TextBox ID="txtWhere" runat="server" TextMode="MultiLine" Width="400px" Height="50px"></asp:TextBox>
                    <br />
                    请输入sql（AND 条件语句），注:多个条件以and连接 如 catid=10 AND username='name' AND hits>100
                </dd>
            </dl>
            <br clear="left" />
        </div>
        <div class="Submit" style="padding-left: 300px;">
            <asp:Button ID="btnSave" runat="server" Text="开始替换" CssClass="subButton" OnClick="btnSave_Click" /></div>
    </div>
    </form>
</body>
</html>
