<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LabelVarEdit.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Collection.LabelVarEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>标签变量编辑</title>
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
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>
    <style type="text/css">.container dl dt{width:60px;}</style>
 </head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <dl>
            <dt>名称：</dt>
            <dd>{$<asp:TextBox ID="txtName" Width="100" CssClass="validate[required]" runat="server"></asp:TextBox>$}</dd>
            
        </dl>
        <dl>
            <dt>备注：</dt>
            <dd><asp:TextBox ID="txtRemark"  TextMode="MultiLine" style=" width:280px; height:40px;"  runat="server"></asp:TextBox></dd>
        </dl>
        <dl>
            <dt>排序：</dt>
            <dd><asp:TextBox ID="txtOrders"  Text="0" CssClass="validate[optional,regex[\d,只能为数字]]" runat="server" Width="150"></asp:TextBox></dd>
        </dl>
    <center style=" clear:both;">
        <asp:Button ID="btnSave" runat="server" OnClick="Save" Text="添加" />
        <input type="button" value="关闭" onclick="parent.Closed()" />
    </center>
    </div>
    </form>
    <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>
