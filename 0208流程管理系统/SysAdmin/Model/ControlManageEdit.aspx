<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlManageEdit.aspx.cs" Inherits="AllPower.Web.Admin.ControlManageEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
    <link href="../ColorPicker/colorpicker.css" rel="stylesheet" type="text/css" />
    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
    <script src="../JS/Common.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/jquery-validationEngine-cn.js"></script>
    <script src="../Calendar/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Editor/ckeditor/ckeditor.js"></script>
    <script src="../ColorPicker/colorpicker.js" type="text/javascript"></script>
    <script src="../ColorPicker/dhtmlxcommon.js" type="text/javascript"></script>
    <script src="../JS/ControlManageEdit.js" type="text/javascript"></script>
    <script type="text/javascript">        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });</script>
     <link href="../Editor/ckeditor/content.css" rel="stylesheet" type="text/css" />
      <!--{$ParseModel.Include$}-->
</head>
<body>
    <form id="theForm" runat="server">
    <div>
        <asp:HiddenField ID="hdnTableName"  runat="server"/>
        <asp:HiddenField ID="hdnFieldValue" runat="server"  />
        <asp:HiddenField ID="hdnModelID" runat="server" />
        <asp:hiddenfield ID="hdnNodeID"  runat="server"/>
        <asp:hiddenfield ID="hdnSiteID"  runat="server"/>
        <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" />
        <asp:HiddenField ID="hdnActionType" runat="server" />
        <asp:HiddenField ID="hdnBackUrlParam"   runat="server" />
     <!--{$ParseModel.Fields$}-->
    </div>
    
    
    <asp:Button ID="btnModelManageEdit" OnClick="Edit" runat="server" />
    <!--$ParseModel.ServerControl$-->
    </form>
</body>
</html>
