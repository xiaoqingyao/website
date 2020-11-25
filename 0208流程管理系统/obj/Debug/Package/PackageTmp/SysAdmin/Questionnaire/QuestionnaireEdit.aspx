<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuestionnaireEdit.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Questionnaire.QuestionnaireEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
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
    <script type="text/javascript">
        $(displayEmailConfig);
        function displayEmailConfig() {
            if ($("#chkIsSendEmail").attr("checked")) { $("#SendEmailConfig").css("display", "block") }
            else { $("#SendEmailConfig").css("display", "none")} 
        }
    </script>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <dl>
            <dt>标题：</dt>
            <dd><asp:TextBox ID="txtTitle" runat="server" Width="200"></asp:TextBox></dd>
        </dl>
                <dl>
            <dt>状态：</dt>
            <dd><asp:CheckBox ID="chkIsEnable" Checked="true" Text="启用" runat="server" /></dd>
        </dl>
        <dl>
            <dt>发送感谢邮件：</dt>
            <dd><asp:CheckBox ID="chkIsSendEmail" onclick="displayEmailConfig()" Checked="false" Text="发送" runat="server" /></dd>
        </dl>
        <div style=" display:none;" id="SendEmailConfig">
            <dl>
                <dt>SMTP地址：</dt>
                <dd><asp:TextBox ID="txtEmailSmtp" runat="server" Width="200"></asp:TextBox></dd>
            </dl>
            <dl>
                <dt>邮箱用：</dt>
                <dd><asp:TextBox ID="txtSendEmail" runat="server" Width="200"></asp:TextBox></dd>
            </dl>
            
            <dl>
                <dt>邮箱用户名：</dt>
                <dd><asp:TextBox ID="txtEmailUID" runat="server" Width="200"></asp:TextBox></dd>
            </dl>
            <dl>
                <dt>邮箱密码：</dt>
                <dd><asp:TextBox ID="txtEmailPWD" runat="server" Width="200"></asp:TextBox></dd>
            </dl>
            <dl>
                <dt>端口：</dt>
                <dd><asp:TextBox ID="txtPort" runat="server" Width="200"></asp:TextBox></dd>
            </dl>
            
        </div>
        <dl>
            <dt>奖励积分：</dt>
            <dd><asp:TextBox ID="txtIntegral" runat="server"></asp:TextBox></dd>
        </dl>
        <dl>
            <dt>邮件模板：</dt>
            <dd>
                <asp:TextBox ID="txtEmailTemplate" style=" width:500px; height:80px;" runat="server" TextMode="MultiLine"></asp:TextBox>用户名标签：{#UserName#}
            </dd>
        </dl>
        <dl>
            <dt>公告：</dt>
            <dd>
                <asp:TextBox ID="txtBulletin" runat="server" style=" width:500px; height:180px;" TextMode="MultiLine"></asp:TextBox>
            </dd>
        </dl>
        <div class="Submit">
            <asp:Button ID="btnEdit" runat="server" Text="添加" onclick="btnEdit_Click" />
            <input type="button" value="返回" onclick="location.href='QuestionnaireList.aspx'" />
        </div>
    </div>
    </form>
    <script type="text/javascript">
    <%=jsMessage %>
    </script>
</body>
</html>
