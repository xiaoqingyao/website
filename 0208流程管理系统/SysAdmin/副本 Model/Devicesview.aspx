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
<div id="panel"><dl><dt>Part No.：</dt><dd id="K_U_Devices_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>Data encapsulation：</dt><dd id="K_U_Devices_Data_encapsulation"><%=hsFieldValue["Data_encapsulation"]%></dd></dl><dl><dt>Data Rate：</dt><dd id="K_U_Devices_Data_Rate"><%=hsFieldValue["Data_Rate"]%></dd></dl><dl><dt>Wavelength：</dt><dd id="K_U_Devices_Wavelength"><%=hsFieldValue["Wavelength"]%></dd></dl><dl><dt>Source：</dt><dd id="K_U_Devices_Source"><%=hsFieldValue["Source"]%></dd></dl><dl><dt>Distance：</dt><dd id="K_U_Devices_Distance"><%=hsFieldValue["Distance"]%></dd></dl><dl><dt>Temperature：</dt><dd id="K_U_Devices_Temperature"><%=hsFieldValue["Temperature"]%></dd></dl><dl><dt>Connector：</dt><dd id="K_U_Devices_Connector"><%=hsFieldValue["Connector"]%></dd></dl><dl><dt>Others：</dt><dd id="K_U_Devices_Others"><%=hsFieldValue["Others"]%></dd></dl></div>
<asp:HiddenField Value="K_U_Devices" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000048769886" runat="server" />
</div>
<center><input type="button" value="返回" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
