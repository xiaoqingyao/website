<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetSpecialInfoComment.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.SysManage.SetSpecialInfoComment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script type="text/javascript">        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });</script>

    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/public.js"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>

    <script src="../JS/publicform.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <dl>
            <dt>评论标题：</dt>
            <dd>
                <asp:TextBox ID="txtCommentTitle" Width="180" runat="server"></asp:TextBox></dd>
        </dl>
        <dl>
            <dt>预设反对观点：</dt>
            <dd>
                <asp:TextBox ID="txtOpposeView" TextMode="MultiLine" Width="400" Height="70" runat="server"></asp:TextBox></dd>
        </dl>
        <dl>
            <dt>预设支持观点：</dt>
            <dd>
                <asp:TextBox ID="txtSupportView"  TextMode="MultiLine" Width="400" Height="70" runat="server"></asp:TextBox></dd>
        </dl>
        <dl>
            <dt>反对人数：</dt>
            <dd>
                <asp:TextBox ID="txtOpposeCount" CssClass="validate[optional],custom[onlyNumber]" Width="100" runat="server"></asp:TextBox></dd>
        </dl>
        <dl>
            <dt>支持人数：</dt>
            <dd>
                <asp:TextBox ID="txtSupportCount" CssClass="validate[optional],custom[onlyNumber]" Width="100" runat="server"></asp:TextBox></dd>
        </dl>
    </div>
    <div class="Submit">
        <asp:Button ID="Button1" runat="server" OnClick="Edit" Text="确定" />
        <input type="button" value="关闭" onclick="parent.Closed();"/>
    </div>
    </form>
    <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>
