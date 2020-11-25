<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberModelEdit.aspx.cs" Inherits="AllPower.Web.Admin.MemberModelEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>添加会员模型</title>
   <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-3.2-vsdoc2.js" type="text/javascript"></script>

    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script type="text/javascript" src="../Editor/ckeditor/ckeditor.js"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script src="../Calendar/WdatePicker.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>

</head>
<body>
    <form id="theForm" runat="server">
     <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
    <div class="container">
        <h4>
            位置： <a href="#">系统管理</a><a> &gt;</a> <a href="MemberModelList.aspx">模型管理</a><a> &gt;</a> <span class="breadcrumb_current">
                添加模型</span>
        </h4>
        <div id="panel">
            <fieldset>
                <dl>
                    <dt><%=Resources.Model.ModelName%> </dt><dd><asp:TextBox ID="txtName" runat="server" Width="200px" CssClass="validate[required,length[3,20]]"></asp:TextBox>*</dd></dl>
                <dl>
                    <dt><%=Resources.Model.ModelMemo%></dt><dd><asp:TextBox ID="txtDescription" runat="server" Width="200px"></asp:TextBox></dd></dl>
                <dl>
                    <dt><%=Resources.Model.IsEnable%></dt><dd><asp:CheckBox ID="chkIsValid" Text="" runat="server" /></dd></dl>
            </fieldset>
        </div>
        <div class="Submit">
            <asp:Button ID="btnAdd" runat="server" Text=" 提 交 " OnClick="btnAdd_Click" CssClass="subButton"></asp:Button>
           <input type="button" name="Submit422" value="<%= Resources.Common.Back %>"
                onclick='location.href="MemberModelList.aspx<%=StrPageParams %>";' class="subButton">
        </div>
    </div>
    </form>
</body>
</html>
