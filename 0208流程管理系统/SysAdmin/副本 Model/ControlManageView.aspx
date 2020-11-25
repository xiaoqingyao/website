<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlManageView.aspx.cs" Inherits="KingTop.Web.Admin.ControlManageView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title><%=hsFieldValue["Title"]%></title>
        <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
    <script src="../JS/ControlManageView.js" type="text/javascript"></script>
</head>
<body>
<form id="theForm" runat="server">
<!--{$ParseModel.Fields$}-->
<!--$ParseModel.ServerControl$-->
<asp:HiddenField ID="hdnTableName"  runat="server"/>
<asp:HiddenField ID="hdnModelID" runat="server" />
</form>
</body>
</html>
