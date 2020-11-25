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
<div id="panel"><dl><dt>������</dt><dd id="K_U_Tojoin_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>��˾���ƣ�</dt><dd id="K_U_Tojoin_Company"><%=hsFieldValue["Company"]%></dd></dl><dl><dt>��˾��ַ��</dt><dd id="K_U_Tojoin_ContactAddr"><%=hsFieldValue["ContactAddr"]%></dd></dl><dl><dt>�Ա�</dt><dd id="K_U_Tojoin_Gender"><%=ctrManageView.ParseFieldValueToText("100011374426562",hsFieldValue["Gender"])%></dd></dl><dl><dt>�绰��</dt><dd id="K_U_Tojoin_Tel"><%=hsFieldValue["Tel"]%></dd></dl><dl><dt>EMail��</dt><dd id="K_U_Tojoin_EMail"><%=hsFieldValue["EMail"]%></dd></dl><dl><dt>��ַ��</dt><dd id="K_U_Tojoin_city"><%=hsFieldValue["city"]%></dd></dl><dl><dt>���֤��</dt><dd id="K_U_Tojoin_cards"><%=hsFieldValue["cards"]%></dd></dl><dl><dt>��ҵ���飺</dt><dd id="K_U_Tojoin_Industry"><%=ctrManageView.ParseFieldValueToText("100011376799122",hsFieldValue["Industry"])%></dd></dl><dl><dt>������ҵ���飺</dt><dd id="K_U_Tojoin_yearsindustry"><%=hsFieldValue["yearsindustry"]%></dd></dl><dl><dt>�ִ�����ҵ��</dt><dd id="K_U_Tojoin_trade"><%=hsFieldValue["trade"]%></dd></dl><dl><dt>�ʽ�״����</dt><dd id="K_U_Tojoin_Funds"><%=hsFieldValue["Funds"]%></dd></dl><dl><dt>�ƻ���ַ��</dt><dd id="K_U_Tojoin_Programcity"><%=hsFieldValue["Programcity"]%></dd></dl><dl><dt>�ƻ������</dt><dd id="K_U_Tojoin_Programarea"><%=hsFieldValue["Programarea"]%></dd></dl><dl><dt>������̣�</dt><dd id="K_U_Tojoin_Idealshop"><%=ctrManageView.ParseFieldValueToText("100011380929629",hsFieldValue["Idealshop"])%></dd></dl><dl><dt>����ʹ��Ȩ��</dt><dd id="K_U_Tojoin_Storeaccess"><%=ctrManageView.ParseFieldValueToText("100011381616762",hsFieldValue["Storeaccess"])%></dd></dl><dl><dt>���������</dt><dd id="K_U_Tojoin_shoparea"><%=hsFieldValue["shoparea"]%></dd></dl><dl><dt>��ҵ���ڣ�</dt><dd id="K_U_Tojoin_Openingdate"><%=hsFieldValue["Openingdate"]%></dd></dl><dl><dt>��չ�滮��</dt><dd id="K_U_Tojoin_planning"><%=hsFieldValue["planning"]%></dd></dl></div>
<asp:HiddenField Value="K_U_Tojoin" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000038357812" runat="server" />
</div>
<center><input type="button" value="����" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
