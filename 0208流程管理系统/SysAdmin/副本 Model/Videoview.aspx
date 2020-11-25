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
<div id="panel"><dl><dt>标题：</dt><dd id="K_U_Video_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>作者：</dt><dd id="K_U_Video_Author"><%=hsFieldValue["Author"]%></dd></dl><dl><dt>属性：</dt><dd id="K_U_Video_shuxing"><%=ctrManageView.ParseFieldValueToText("100011299873125",hsFieldValue["shuxing"])%></dd></dl><dl><dt>浏览次数：</dt><dd id="K_U_Video_Hits"><%=hsFieldValue["Hits"]%></dd></dl><dl><dt>关键词：</dt><dd id="K_U_Video_KeyWords"><%=hsFieldValue["KeyWords"]%></dd></dl><dl><dt>图片：</dt><dd id="K_U_Video_Image"><%=hsFieldValue["Image"]%></dd></dl><dl><dt>视频文件：</dt><dd id="K_U_Video_Files"><%=hsFieldValue["Files"]%></dd></dl><dl><dt>视频链接地址：</dt><dd id="K_U_Video_LinkAddress"><%=hsFieldValue["LinkAddress"]%></dd></dl><dl><dt>发布日期：</dt><dd id="K_U_Video_UpdateDate"><%=hsFieldValue["UpdateDate"]%></dd></dl><dl><dt>简介：</dt><dd id="K_U_Video_Intro"><%=hsFieldValue["Intro"]%></dd></dl></div>
<asp:HiddenField Value="K_U_Video" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000022229687" runat="server" />
</div>
<center><input type="button" value="返回" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
