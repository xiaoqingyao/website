﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateNodeManage.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.SysManage.TemplateNodeManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>模板节点管理</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <script type="text/javascript" src="../JS/DTree.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script type="text/javascript" src="../js/Common.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %>
        </h4>
        <div class="function">
            <asp:Button ID="btnNew" runat="server" Text="新增一级节点" OnClick="btnNew_Click" />
        </div>
        <table border="0" cellpadding="0" cellspacing="0" id="senfe">
            <tr>
                <td>
                    <div class="dtree" id="menutree" runat="server">
                    </div>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
