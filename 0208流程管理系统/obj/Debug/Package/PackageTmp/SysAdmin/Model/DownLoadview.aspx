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
<ul id="tags"><li class="selectTag"><a href="javascript:;">关联商品</a></li></ul><div id="panel"><fieldset><dl><dt>标题：</dt><dd id="K_U_DownLoad_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>附件：</dt><dd id="K_U_DownLoad_Files"><%=hsFieldValue["Files"]%></dd></dl><dl><dt>语言：</dt><dd id="K_U_DownLoad_Subtitle"><%=hsFieldValue["Subtitle"]%></dd></dl><dl><dt>审核状态：</dt><dd id="K_U_DownLoad_FlowState"><%=ctrManageView.ParseFieldValueToText("100011283225389",hsFieldValue["FlowState"])%></dd></dl><dl><dt>发布日期：</dt><dd id="K_U_DownLoad_UpdateDate"><%=hsFieldValue["UpdateDate"]%></dd></dl><div style="clear:left"></div></fieldset></div>
<asp:HiddenField Value="K_U_DownLoad" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000022925389" runat="server" />
</div>
<center><input type="button" value="返回" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
