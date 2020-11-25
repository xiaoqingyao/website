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
<div id="panel"><dl><dt>Part Number：</dt><dd id="K_U_Transceiver_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>Brand：</dt><dd id="K_U_Transceiver_Brand"><%=ctrManageView.ParseFieldValueToText("100011337567192",hsFieldValue["Brand"])%></dd></dl><dl><dt>Data Rate：</dt><dd id="K_U_Transceiver_Data_Rate"><%=hsFieldValue["Data_Rate"]%></dd></dl><dl><dt>Reach：</dt><dd id="K_U_Transceiver_Reach"><%=hsFieldValue["Reach"]%></dd></dl><dl><dt>Wavelength：</dt><dd id="K_U_Transceiver_Wavelength"><%=hsFieldValue["Wavelength"]%></dd></dl><dl><dt>LD：</dt><dd id="K_U_Transceiver_LD"><%=hsFieldValue["LD"]%></dd></dl><dl><dt>PD：</dt><dd id="K_U_Transceiver_PD"><%=hsFieldValue["PD"]%></dd></dl><dl><dt>Pout：</dt><dd id="K_U_Transceiver_Pout"><%=hsFieldValue["Pout"]%></dd></dl><dl><dt>Sensitivity：</dt><dd id="K_U_Transceiver_Sensitivity"><%=hsFieldValue["Sensitivity"]%></dd></dl><dl><dt>Link Budget：</dt><dd id="K_U_Transceiver_Link_Budget"><%=hsFieldValue["Link_Budget"]%></dd></dl><dl><dt>Operating Case Temperature：</dt><dd id="K_U_Transceiver_Operating_Case_Temperature"><%=hsFieldValue["Operating_Case_Temperature"]%></dd></dl><dl><dt>Description：</dt><dd id="K_U_Transceiver_Description"><%=hsFieldValue["Description"]%></dd></dl></div>
<asp:HiddenField Value="K_U_Transceiver" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000050138235" runat="server" />
</div>
<center><input type="button" value="返回" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
