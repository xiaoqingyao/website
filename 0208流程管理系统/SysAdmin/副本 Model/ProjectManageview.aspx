<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlManageView.aspx.cs" Inherits="KingTop.Web.Admin.ControlManageView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title><%=hsFieldValue["Title"]%></title>
        <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
        <script type="text/javascript" src="../js/publicform.js"></script>
        <script type="text/javascript" src="../js/public.js"></script>
        <script type="text/javascript" src="../js/regExp.js"></script>
        <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
        <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="../js/jquery.dialog.js"></script>
        <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/ControlManageView.js" type="text/javascript"></script>

    <link href="../css/public.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="theForm" runat="server">
<div class="container">
<h4>位置： <a href="#">内容管理</a><a> ></a> <a href="#">文章查看</a></span></h4> 
<div id="panel"><dl><dt>项目名称：</dt><dd id="K_U_ProjectManage_Name"><%=hsFieldValue["Name"]%></dd></dl><dl><dt>地址：</dt><dd id="K_U_ProjectManage_Address"><%=hsFieldValue["Address"]%></dd></dl><dl><dt>小图片：</dt><dd id="K_U_ProjectManage_SmallImage"><%=hsFieldValue["SmallImage"]%></dd></dl><dl><dt>大图片：</dt><dd id="K_U_ProjectManage_BigImage"><%=hsFieldValue["BigImage"]%></dd></dl><dl><dt>项目介绍：</dt><dd id="K_U_ProjectManage_Content"><%=hsFieldValue["Content"]%></dd></dl></div>
<asp:HiddenField Value="K_U_ProjectManage" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000010248437" runat="server" />
</div>
<center><input type="button" value="返回" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
