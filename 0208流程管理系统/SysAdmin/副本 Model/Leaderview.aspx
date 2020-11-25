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
<div id="panel"><dl><dt>姓名：</dt><dd id="K_U_Leader_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>岗位：</dt><dd id="K_U_Leader_GangWei"><%=hsFieldValue["GangWei"]%></dd></dl><dl><dt>技术职称：</dt><dd id="K_U_Leader_ZhiChen"><%=hsFieldValue["ZhiChen"]%></dd></dl><dl><dt>电话：</dt><dd id="K_U_Leader_Tel"><%=hsFieldValue["Tel"]%></dd></dl><dl><dt>电子邮件：</dt><dd id="K_U_Leader_Email"><%=hsFieldValue["Email"]%></dd></dl><dl><dt>分管范围：</dt><dd id="K_U_Leader_FGFW"><%=hsFieldValue["FGFW"]%></dd></dl><dl><dt>照片：</dt><dd id="K_U_Leader_Photo"><%=hsFieldValue["Photo"]%></dd></dl><dl><dt>简历：</dt><dd id="K_U_Leader_Resume"><%=hsFieldValue["Resume"]%></dd></dl><dl><dt>任职时间：</dt><dd id="K_U_Leader_RZTime"><%=hsFieldValue["RZTime"]%></dd></dl><dl><dt>简介：</dt><dd id="K_U_Leader_Digest"><%=hsFieldValue["Digest"]%></dd></dl></div>
<asp:HiddenField Value="K_U_Leader" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000019446872" runat="server" />
</div>
<center><input type="button" value="返回" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
