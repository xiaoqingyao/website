<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlManageView.aspx.cs" Inherits="AllPower.Web.Admin.ControlManageView" %>

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
<div id="panel"><dl><dt>BPON Solutions：</dt><dd id="K_U_PON_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>Tx Rate：</dt><dd id="K_U_PON_Tx_Rate"><%=hsFieldValue["Tx_Rate"]%></dd></dl><dl><dt>Rx Rate：</dt><dd id="K_U_PON_Rx_Rate"><%=hsFieldValue["Rx_Rate"]%></dd></dl><dl><dt>Tx Power：</dt><dd id="K_U_PON_Tx_Power"><%=hsFieldValue["Tx_Power"]%></dd></dl><dl><dt>Rx Sens：</dt><dd id="K_U_PON_Rx_Sens"><%=hsFieldValue["Rx_Sens"]%></dd></dl><dl><dt>Form Factor：</dt><dd id="K_U_PON_Form_Factor"><%=hsFieldValue["Form_Factor"]%></dd></dl><dl><dt>Link Budget：</dt><dd id="K_U_PON_Link_Budget"><%=hsFieldValue["Link_Budget"]%></dd></dl><dl><dt>Application：</dt><dd id="K_U_PON_Application"><%=hsFieldValue["Application"]%></dd></dl><dl><dt>WaveLength Tx：</dt><dd id="K_U_PON_W_Tx"><%=hsFieldValue["W_Tx"]%></dd></dl><dl><dt>WaveLength Rx：</dt><dd id="K_U_PON_W_Rx"><%=hsFieldValue["W_Rx"]%></dd></dl><dl><dt>WaveLength Video：</dt><dd id="K_U_PON_W_Video"><%=hsFieldValue["W_Video"]%></dd></dl></div>
<asp:HiddenField Value="K_U_PON" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000048073437" runat="server" />
</div>
<center><input type="button" value="返回" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
