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
<div id="panel"><dl><dt>工程名称：</dt><dd id="K_U_Case_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>工程区域：</dt><dd id="K_U_Case_Company"><%=hsFieldValue["Company"]%></dd></dl><dl><dt>工程类型：</dt><dd id="K_U_Case_SoftType"><%=ctrManageView.ParseFieldValueToText("100011355069371",hsFieldValue["SoftType"])%></dd></dl><dl><dt>选用产品：</dt><dd id="K_U_Case_Descripts"><%=hsFieldValue["Descripts"]%></dd></dl><dl><dt>工程简介：</dt><dd id="K_U_Case_Intro"><%=hsFieldValue["Intro"]%></dd></dl><dl><dt>工程相册：</dt><dd id="K_U_Case_BigImg"><%=hsFieldValue["BigImg"]%></dd></dl><dl><dt>小图：</dt><dd id="K_U_Case_SmallImg"><%=hsFieldValue["SmallImg"]%></dd></dl><dl><dt>工程面积：</dt><dd id="K_U_Case_acreage"><%=hsFieldValue["acreage"]%></dd></dl></div>
<asp:HiddenField Value="K_U_Case" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000035596251" runat="server" />
</div>
<center><input type="button" value="返回" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
