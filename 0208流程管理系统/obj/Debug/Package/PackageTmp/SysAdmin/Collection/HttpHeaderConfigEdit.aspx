<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HttpHeaderConfigEdit.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Collection.HttpHeaderConfigEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>HttpHeader配置编辑</title>
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
    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
     <script type="text/javascript" src="../js/Collection.js"></script>
   <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
    <div id="panel">

            <h4>当前位置：信息采集->Http请求头配置编辑</h4>
        <dl>
            <dt>名称：</dt>
            <dd><asp:TextBox ID="txtName" CssClass="validate[required]" Width="180" runat="server"></asp:TextBox></dd>
        </dl>
        <dl>
            <dt>备注：</dt>
            <dd><asp:TextBox ID="txtRemark" Width="270" Height="60" runat="server"></asp:TextBox></dd>
        </dl>
        <dl>
            <dt>排序：</dt>
            <dd><asp:TextBox ID="txtOrders"  Text="0" CssClass="validate[optional,regex[\d,只能为数字]]" runat="server" Width="180"></asp:TextBox></dd>
        </dl>
       </div> 
           <div class="Submit">
        <asp:Button ID="btnSave" CssClass="subButton" runat="server" OnClick="Save" Text="添 加" />
	    <input class="subButton" type="button"onclick="location.href='HttpHeaderConfigList.aspx'" value="返回" />
    </div>
   </div>
    </form>
        <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>
