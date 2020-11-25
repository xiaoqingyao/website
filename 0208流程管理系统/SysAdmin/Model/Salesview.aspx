<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlManageView.aspx.cs" Inherits="AllPower.Web.Admin.ControlManageView" %>

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
<div id="panel"><dl><dt>标题：</dt><dd id="K_U_Sales_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>联系地址：</dt><dd id="K_U_Sales_ContactAddr"><%=hsFieldValue["ContactAddr"]%></dd></dl><dl><dt>小图：</dt><dd id="K_U_Sales_SmallImg"><%=hsFieldValue["SmallImg"]%></dd></dl><dl><dt>省份：</dt><dd id="K_U_Sales_city"><%=hsFieldValue["city"]%></dd></dl><dl><dt>面积：</dt><dd id="K_U_Sales_Area"><%=hsFieldValue["Area"]%></dd></dl><dl><dt>联系人：</dt><dd id="K_U_Sales_Contact"><%=hsFieldValue["Contact"]%></dd></dl><dl><dt>电话：</dt><dd id="K_U_Sales_tel"><%=hsFieldValue["tel"]%></dd></dl></div>
<asp:HiddenField Value="K_U_Sales" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000036992187" runat="server" />
</div>
<center><input type="button" value="返回" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
