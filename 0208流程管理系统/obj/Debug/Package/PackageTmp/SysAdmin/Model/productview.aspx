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
<div id="panel"><dl><dt>产品分类：</dt><dd id="K_U_product_productclass"><%=hsFieldValue["productclass"]%></dd></dl><dl><dt>产品名称：</dt><dd id="K_U_product_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>新品：</dt><dd id="K_U_product_IsNew"><%=ctrManageView.ParseFieldValueToText("100011423611646",hsFieldValue["IsNew"])%></dd></dl><dl><dt>推荐：</dt><dd id="K_U_product_isCommend"><%=ctrManageView.ParseFieldValueToText("100011423628125",hsFieldValue["isCommend"])%></dd></dl><dl><dt>产品型号：</dt><dd id="K_U_product_Model"><%=hsFieldValue["Model"]%></dd></dl><dl><dt>产品参数：</dt><dd id="K_U_product_pdf"><%=hsFieldValue["pdf"]%></dd></dl><dl><dt>产品说明书：</dt><dd id="K_U_product_pdf2"><%=hsFieldValue["pdf2"]%></dd></dl><dl><dt>产品图片：</dt><dd id="K_U_product_BigImg"><%=hsFieldValue["BigImg"]%></dd></dl><dl><dt>尺寸图：</dt><dd id="K_U_product_drawing"><%=hsFieldValue["drawing"]%></dd></dl><dl><dt>产品图片组：</dt><dd id="K_U_product_ImageList"><%=hsFieldValue["ImageList"]%></dd></dl><dl><dt>认证图：</dt><dd id="K_U_product_QPicture"><%=hsFieldValue["QPicture"]%></dd></dl><dl><dt>适用场合：</dt><dd id="K_U_product_AOccasions"><%=hsFieldValue["AOccasions"]%></dd></dl><dl><dt>产品概述：</dt><dd id="K_U_product_Description"><%=hsFieldValue["Description"]%></dd></dl><dl><dt>产品特点：</dt><dd id="K_U_product_Features"><%=hsFieldValue["Features"]%></dd></dl><dl><dt>技术参数：</dt><dd id="K_U_product_content"><%=hsFieldValue["content"]%></dd></dl></div>
<asp:HiddenField Value="K_U_product" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000036219372" runat="server" />
</div>
<center><input type="button" value="返回" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
