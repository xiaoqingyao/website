<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileRename.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Template.FileRename" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>文件/目录重命名</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <script type="text/javascript" src="../js/listcheck.js"></script>

    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script type="text/javascript" src="../js/common.js"></script>

    <style type="text/css">
        .cRed, .cRed:visited, .cRed a, a.cRed:hover
        {
            color: #0000FF;
        }
    </style>
</head>
<body>
    <form id="fromeditor" runat="server">
    <div class="container">
        <h4>
            位置： 模板模型 &gt; <span style="color: Blue">文件夹/文件改名</span>
        </h4>
        <div id="searchContainer" style="height: 25px;">
            <span style="float: left; line-height: 25px;">
                <asp:Label runat="server" ID="lblPathTips"></asp:Label><asp:HiddenField runat="server"
                    ID="hidUrlReferrer" />
                <asp:HiddenField runat="server" ID="hidLogTitle" />
            </span>
        </div>
        <div class="function" style="height: 10px;">
        </div>
        <ul class="ulheader">
            <li style="width: 100%">文件夹/文件改名：<asp:Label runat="server" ID="lblDirectoryPath"></asp:Label></li>
        </ul>
        <ul class="ulheader ulbody" style="height: 30px;">
            <li style="width: 100%;">修改名称为：<asp:TextBox runat="server" ID="txtObjectName"></asp:TextBox>
                <asp:Button runat="server" ID="btnSubmit" Text="<%$Resources:Common,Update %>" OnClick="btnSubmit_Click"
                    CssClass="subButton" />&nbsp;&nbsp;&nbsp;
                <input type="button" name="ReBack" value=" 返回 " class="subButton" onclick='javascript:history.back();' />
            </li>
        </ul>
        <span class="function fr"></span>
        <br clear="left" />
    </div>
    </form>
</body>
</html>
