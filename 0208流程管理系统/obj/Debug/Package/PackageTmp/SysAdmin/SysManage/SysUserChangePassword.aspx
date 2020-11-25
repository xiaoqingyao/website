<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysUserChangePassword.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.SysManage.SysUserChangePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>修改密码</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <link rel="stylesheet" href="../css/template.css" type="text/css" />
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>
    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
</head>
<body>
    <form id="theForm" name="theForm" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %>
        </h4>
        <div id="panel">
            <fieldset>
         <dl>
        	<dt>登录名：</dt>
            <dd><asp:TextBox ID="txtAccountName" runat="server" CssClass="validate[required,length[3,12]]"></asp:TextBox></dd>
         </dl>
         <dl<%if(!string.IsNullOrEmpty(UserID)){Response.Write(" style='display:none'");} %>>
        	<dt>原密码：</dt>
        	<dd>
        	<asp:TextBox ID="txtAccountPwd" runat="server" TextMode="Password" CssClass="validate[required,length[6,15]] text-input"></asp:TextBox>
        	<asp:HiddenField ID="hiddenPwd" runat="server" />
        	</dd>
         </dl>
         <dl>
        	<dt>新密码：</dt>
        	<dd><asp:TextBox ID="txtAccountNewPwd1" CssClass="validate[required,length[6,15]] text-input" runat="server" TextMode="Password"></asp:TextBox></dd>
         </dl>
         <dl>
            <dt>确认密码：</dt>
            <dd><asp:TextBox ID="txtAccountNewPwd2" cssClass="validate[required,confirm[txtAccountNewPwd1]] text-input" runat="server" TextMode="Password"></asp:TextBox></dd>
         </dl>   <div style="clear:left"></div>      
      </fieldset>
        </div>
        <div class="Submit">
            <asp:Button ID="BtnSave" runat="server" CssClass="subButton" Text="<%$Resources:Common,Update %>"
                OnClick="BtnSave_Click" />
            <asp:Button ID="BtnBack" runat="server" CssClass="subButton" Text="<%$Resources:Common,Back %>"
                OnClick="BtnBack_Click"/>
        </div>
    </div>
    </form>
</body>
</html>
