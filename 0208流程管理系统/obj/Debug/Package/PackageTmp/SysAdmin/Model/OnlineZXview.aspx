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
<h4>λ�ã� <a href="#">���ݹ���</a><a> ></a> <a href="#">���²鿴</a></span></h4> 
<div id="panel"><dl><dt>���ʱ��⣺</dt><dd id="K_U_OnlineZX_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>�������ң�</dt><dd id="K_U_OnlineZX_DepartMent"><%=hsFieldValue["DepartMent"]%></dd></dl><dl><dt>�������ݣ�</dt><dd id="K_U_OnlineZX_Content"><%=hsFieldValue["Content"]%></dd></dl><dl><dt>������ڣ�</dt><dd id="K_U_OnlineZX_AddDate"><%=hsFieldValue["AddDate"]%></dd></dl><dl><dt>���������</dt><dd id="K_U_OnlineZX_Hits"><%=hsFieldValue["Hits"]%></dd></dl><dl><dt>�ظ����ݣ�</dt><dd id="K_U_OnlineZX_ReContent"><%=hsFieldValue["ReContent"]%></dd></dl></div>
<asp:HiddenField Value="K_U_OnlineZX" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000025029687" runat="server" />
</div>
<center><input type="button" value="����" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
