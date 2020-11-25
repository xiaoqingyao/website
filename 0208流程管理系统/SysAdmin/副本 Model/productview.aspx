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
<div id="panel"><dl><dt>所属节点：</dt><dd id="K_U_product_NodeCode"><%=hsFieldValue["NodeCode"]%></dd></dl><dl><dt>产品名称：</dt><dd id="K_U_product_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>产品图库：</dt><dd id="K_U_product_BigImg"><%=hsFieldValue["BigImg"]%></dd></dl><dl><dt>详细介绍：</dt><dd id="K_U_product_Content"><%=hsFieldValue["Content"]%></dd></dl><dl><dt>小图：</dt><dd id="K_U_product_SmallImg"><%=hsFieldValue["SmallImg"]%></dd></dl><dl><dt>相关案例：</dt><dd id="K_U_product_Case"><%=hsFieldValue["Case"]%></dd></dl><dl><dt>产品分类：</dt><dd id="K_U_product_productclass"><%=hsFieldValue["productclass"]%></dd></dl><dl><dt>标语：</dt><dd id="K_U_product_Slogan"><%=hsFieldValue["Slogan"]%></dd></dl><dl><dt>空间效果：</dt><dd id="K_U_product_effects"><%=hsFieldValue["effects"]%></dd></dl><dl><dt>市场定位：</dt><dd id="K_U_product_positioning"><%=hsFieldValue["positioning"]%></dd></dl><dl><dt>概述图片：</dt><dd id="K_U_product_Outline"><%=hsFieldValue["Outline"]%></dd></dl><dl><dt>推荐：</dt><dd id="K_U_product_IsCommend"><%=ctrManageView.ParseFieldValueToText("100011364187511",hsFieldValue["IsCommend"])%></dd></dl></div>
<asp:HiddenField Value="K_U_product" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000036219372" runat="server" />
</div>
<center><input type="button" value="返回" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
