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
<div id="panel"><dl><dt>IP��ַ��</dt><dd id="K_F_zxsqin_IP"><%=hsFieldValue["IP"]%></dd></dl><dl><dt>������������</dt><dd id="K_F_zxsqin_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>��������ȣ�</dt><dd id="K_F_zxsqin_sqed"><%=hsFieldValue["sqed"]%></dd></dl><dl><dt>�Ա�</dt><dd id="K_F_zxsqin_xb"><%=ctrManageView.ParseFieldValueToText("100011314035937",hsFieldValue["xb"])%></dd></dl><dl><dt>���֤���룺</dt><dd id="K_F_zxsqin_sfz"><%=hsFieldValue["sfz"]%></dd></dl><dl><dt>��ϵ�绰��</dt><dd id="K_F_zxsqin_dhhm"><%=hsFieldValue["dhhm"]%></dd></dl><dl><dt>���ʵ�ַ��</dt><dd id="K_F_zxsqin_email"><%=hsFieldValue["email"]%></dd></dl><dl><dt>������λ��</dt><dd id="K_F_zxsqin_gzdw"><%=hsFieldValue["gzdw"]%></dd></dl><dl><dt>��λ�绰��</dt><dd id="K_F_zxsqin_dwdh"><%=hsFieldValue["dwdh"]%></dd></dl><dl><dt>ÿ�»�����н��</dt><dd id="K_F_zxsqin_myyx"><%=hsFieldValue["myyx"]%></dd></dl><dl><dt>�������룺</dt><dd id="K_F_zxsqin_qtsr"><%=hsFieldValue["qtsr"]%></dd></dl><dl><dt>����������</dt><dd id="K_F_zxsqin_qs"><%=ctrManageView.ParseFieldValueToText("100011319632812",hsFieldValue["qs"])%></dd></dl></div>
<asp:HiddenField Value="K_F_zxsqin" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000048779687" runat="server" />
</div>
<center><input type="button" value="����" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
