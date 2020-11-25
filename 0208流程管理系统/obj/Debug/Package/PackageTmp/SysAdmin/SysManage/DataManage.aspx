<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataManage.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.DataManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <div id="searchContainer" style="padding-left: 10px">
            <img src="../img/dialogImage/iconAlert.gif" style="height: 19px; width: 22px; vertical-align: bottom" />注意：该页面操作需要安全码！如果忘记安全码，请重写设置web.config的DataManagePassword节点的值
        </div>
        <div id="panel">
        <dl>
        <dt>请输入安全码： </dt><dd><asp:TextBox ID="txtManagePwd" runat="server"  CssClass="validate[required,length[2,50]]"></asp:TextBox> </dd>
        <dd style="padding-left:10px"> <asp:Button ID="btnCheck" runat="server" Text="提交" CssClass="abtn" 
                onclick="btnCheck_Click"  /></dd>
        </dl>
            
           
        </div>
    </div>
    </form>
</body>
</html>
