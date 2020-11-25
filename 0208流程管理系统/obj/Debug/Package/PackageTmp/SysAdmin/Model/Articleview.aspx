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
<ul id="tags"><li class="selectTag"><a href="javascript:;">基本信息</a></li></ul><div id="panel"><fieldset><dl><dt>标题：</dt><dd id="K_U_Article_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>发布时间：</dt><dd id="K_U_Article_UpdateDate"><%=hsFieldValue["UpdateDate"]%></dd></dl><dl><dt>图片：</dt><dd id="K_U_Article_FirstPagePic"><%=hsFieldValue["FirstPagePic"]%></dd></dl><dl><dt>简介：</dt><dd id="K_U_Article_Intro"><%=hsFieldValue["Intro"]%></dd></dl><dl><dt>文章内容：</dt><dd id="K_U_Article_Content"><%=hsFieldValue["Content"]%></dd></dl><dl><dt>来源：</dt><dd id="K_U_Article_Source"><%=hsFieldValue["Source"]%></dd></dl><dl><dt>所属节点：</dt><dd id="K_U_Article_NodeCode"><%=hsFieldValue["NodeCode"]%></dd></dl><dl><dt>作者：</dt><dd id="K_U_Article_Author"><%=hsFieldValue["Author"]%></dd></dl><dl><dt>关键字：</dt><dd id="K_U_Article_Keyword"><%=hsFieldValue["Keyword"]%></dd></dl><dl><dt>标题颜色：</dt><dd id="K_U_Article_ColorCode"><%=hsFieldValue["ColorCode"]%></dd></dl><dl><dt>转向链接：</dt><dd id="K_U_Article_OptionalTextBoxField"><%=hsFieldValue["OptionalTextBoxField"]%></dd></dl><div style="clear:left"></div></fieldset></div>
<asp:HiddenField Value="K_U_Article" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="000000000132380" runat="server" />
</div>
<center><input type="button" value="返回" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
