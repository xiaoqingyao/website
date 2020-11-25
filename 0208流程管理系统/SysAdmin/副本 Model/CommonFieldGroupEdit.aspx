<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommonFieldGroupEdit.aspx.cs" Inherits="KingTop.WEB.SysAdmin.Model.CommonFieldGroupEdit" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>
   <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
     <script type="text/javascript" src="../js/jquery-validationEngine-cn.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/publicform.js" type="text/javascript"></script>
    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
        <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
        <script src="../JS/Common.js" type="text/javascript"></script>
    <script type="text/javascript">
        var id;
         <%=jsMessage %> 
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
        $(function() {
            var name = "字段编辑";
            var listUrl = "CommonFieldGroupList.aspx?NodeCode=<%=NodeCode %>";
            var addUrl = "CommonFieldGroupEdit.aspx?action=add&NodeCode=<%=NodeCode %>";
            var updateUrl = "CommonFieldGroupEdit.aspx?action=edit&NodeCode=<%=NodeCode %>&id=" + id;
            showEditMessage(name, listUrl, addUrl, updateUrl);
        });
</script>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
<h4>位置：  <%GetPageNav(NodeCode);%></h4> 
<dl>
    <dt>分组名称：</dt>
    <dd>
    <asp:TextBox ID="txtName" Width="200" runat="server" CssClass="validate[required]"></asp:TextBox></dd>
</dl>
<dl>
    <dt>排序：</dt>
    <dd><asp:TextBox ID="txtOrders" Text="512" CssClass="validate[required,custom[onlyNumber]]" runat="server"></asp:TextBox></dd>
</dl>


<div class="Submit">
    <asp:Button ID="btnEdit" OnClick="CommonFieldGroup_Edit" runat="server" Text="添加" />
    <input type="button" onclick="location.href='CommonFieldGroupList.aspx?NodeCode=<%=NodeCode %>'" value="返回" />
</div>
</div>
    </form>
</body>
</html>
