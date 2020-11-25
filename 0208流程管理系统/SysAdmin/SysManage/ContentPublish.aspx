<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContentPublish.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.ContentPublish" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>内容发布</title>
    <link type="text/css" href="../skin/green/css/style.css" rel="stylesheet" id="myskin" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <script type="text/javascript" src="../js/listcheck.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>    
    <script type="text/javascript" src="../js/common.js"></script>    
    <script type="text/javascript" src="../js/jquery.cookie.js"></script>
    <script type="text/javascript" src="../js/skin.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
    <div class="container">
        <h4>
            位置： <a href="#">系统管理</a> &gt; <span class="breadcrumb_current"> 内容发布</span>
        </h4>
        <ul>内容发布测试：本测试将把 SysAdmin/Template/Html 文件夹下的所有生成的文件发布到指定的发布服务器</ul>
        <ul>
            选择发布服务器<asp:DropDownList ID="ddlServerMachine" runat="server"></asp:DropDownList>
        </ul>
        <ul><asp:Button ID="btnPublish" runat="server" Text="发布" 
                onclick="btnPublish_Click" /></ul>
        <br clear="left" />
    </div>
    </form>
</body>
</html>
