<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowSiteNode.aspx.cs" Inherits="KingTop.WEB.SysAdmin.Model.ShowSiteNode" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>添加记录至节点</title>
    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
    <script src="../JS/checkboxdtree.js" type="text/javascript"></script>
    <script src="../JS/ShowSiteNode.js" type="text/javascript"></script>
    <link href="../CSS/checkboxdtree.css" rel="stylesheet" type="text/css" />
</head>
<body style=" padding:3px; font-size:12px; padding-top:0px;">
    <form id="theForm" runat="server">
        <asp:hiddenfield id="hdnAction" runat="server"></asp:hiddenfield>
        <div runat="server" id="TreeMenu" style=" margin:0px; padding:0px;"></div>
    </form>

</body>
</html>