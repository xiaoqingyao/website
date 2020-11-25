<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecommendAreaEdit.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Model.RecommendAreaEdit" %>


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
    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
</script>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
<h4>位置： <a href="#">模型管理</a><a> ></a> <a href="#">推荐区域编辑</a></h4> 
<dl>
    <dt>推荐区域名称：</dt>
    <dd>
    <asp:TextBox ID="txtName" Width="200" runat="server" CssClass="validate[required]"></asp:TextBox></dd>
</dl>
<dl>
    
    <dt>保存推荐区域的字段：</dt>
    <dd>RA_<asp:TextBox ID="txtFieldName" CssClass="validate[required,length[1,20]]" Width="200"  runat="server"></asp:TextBox></dd>
</dl>
<dl>
    <dt>字段长度：</dt>
    <dd><asp:TextBox ID="txtFieldLength" Text="512" CssClass="validate[required,custom[onlyNumber]]" runat="server"></asp:TextBox></dd>
</dl>
<dl>
    <dt>所属站点：</dt>
    <dd>
    <asp:DropDownList ID="ddlSiteID" runat="server">
    </asp:DropDownList>
    </dd>
</dl>

<div class="Submit">
    <asp:Button ID="btnEdit" OnClick="RecommendArea_Edit" runat="server" Text="添加" />
    <input type="button" onclick="location.href='RecommendAreaList.aspx?SpecialID=<%=SpecialID %>'" value="返回" />
</div>
</div>
    </form>
<script type="text/javascript"><%=jsMessage%></script>
</body>
</html>
