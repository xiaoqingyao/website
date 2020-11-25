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
<h4>λ�ã� <a href="#">���ݹ���</a><a> ></a> <a href="#">���²鿴</a></span></h4> 
<div id="panel"><dl><dt>�������ƣ�</dt><dd id="K_U_DepartMent_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>���Ҹ����ˣ�</dt><dd id="K_U_DepartMent_Chief"><%=hsFieldValue["Chief"]%></dd></dl><dl><dt>���ҵ绰��</dt><dd id="K_U_DepartMent_Tel"><%=hsFieldValue["Tel"]%></dd></dl><dl><dt>���ҵ����ʼ���</dt><dd id="K_U_DepartMent_Email"><%=hsFieldValue["Email"]%></dd></dl><dl><dt>��������λ�ã�</dt><dd id="K_U_DepartMent_Place"><%=hsFieldValue["Place"]%></dd></dl><dl><dt>��λ������</dt><dd id="K_U_DepartMent_Beds"><%=hsFieldValue["Beds"]%></dd></dl><dl><dt>�ٴ����ң�</dt><dd id="K_U_DepartMent_Islckj"><%=ctrManageView.ParseFieldValueToText("100011289415623",hsFieldValue["Islckj"])%></dd></dl><dl><dt>ҽ�����ң�</dt><dd id="K_U_DepartMent_Isyjks"><%=ctrManageView.ParseFieldValueToText("100011291067187",hsFieldValue["Isyjks"])%></dd></dl><dl><dt>ְ�ܿ��ң�</dt><dd id="K_U_DepartMent_Isznkj"><%=ctrManageView.ParseFieldValueToText("100011291793759",hsFieldValue["Isznkj"])%></dd></dl><dl><dt>��ɫר�ƣ�</dt><dd id="K_U_DepartMent_Istszk"><%=ctrManageView.ParseFieldValueToText("100011292496875",hsFieldValue["Istszk"])%></dd></dl><dl><dt>ʡ���ص㣺</dt><dd id="K_U_DepartMent_IsKey"><%=ctrManageView.ParseFieldValueToText("100011293168756",hsFieldValue["IsKey"])%></dd></dl><dl><dt>�������ң�</dt><dd id="K_U_DepartMent_Issearch"><%=ctrManageView.ParseFieldValueToText("100011293859375",hsFieldValue["Issearch"])%></dd></dl><dl><dt>��ѯ���ң�</dt><dd id="K_U_DepartMent_Iszixun"><%=ctrManageView.ParseFieldValueToText("100011294529687",hsFieldValue["Iszixun"])%></dd></dl><dl><dt>������ң�</dt><dd id="K_U_DepartMent_Ismenzhen"><%=ctrManageView.ParseFieldValueToText("100011295234375",hsFieldValue["Ismenzhen"])%></dd></dl><dl><dt>���Ҽ�飺</dt><dd id="K_U_DepartMent_Digest"><%=hsFieldValue["Digest"]%></dd></dl><dl><dt>����ѧ����λ��</dt><dd id="K_U_DepartMent_Position"><%=hsFieldValue["Position"]%></dd></dl><dl><dt>���Ҽ������ƣ�</dt><dd id="K_U_DepartMent_Goodness"><%=hsFieldValue["Goodness"]%></dd></dl><dl><dt>�����о�����</dt><dd id="K_U_DepartMent_Research"><%=hsFieldValue["Research"]%></dd></dl><dl><dt>������Ƭ��</dt><dd id="K_U_DepartMent_Image"><%=hsFieldValue["Image"]%></dd></dl></div>
<asp:HiddenField Value="K_U_DepartMent" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000023655095" runat="server" />
</div>
<center><input type="button" value="����" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
