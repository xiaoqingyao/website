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
<div id="panel"><dl><dt>ӦƸְλ��</dt><dd id="K_U_Resume_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>������</dt><dd id="K_U_Resume_UserName"><%=hsFieldValue["UserName"]%></dd></dl><dl><dt>�Ա�</dt><dd id="K_U_Resume_Gender"><%=ctrManageView.ParseFieldValueToText("100011423331252",hsFieldValue["Gender"])%></dd></dl><dl><dt>�������ڣ�</dt><dd id="K_U_Resume_BirthDate"><%=hsFieldValue["BirthDate"]%></dd></dl><dl><dt>����״����</dt><dd id="K_U_Resume_Marital"><%=ctrManageView.ParseFieldValueToText("100011424445312",hsFieldValue["Marital"])%></dd></dl><dl><dt>��ҵԺУ��</dt><dd id="K_U_Resume_Graduated"><%=hsFieldValue["Graduated"]%></dd></dl><dl><dt>ѧ����</dt><dd id="K_U_Resume_Education"><%=ctrManageView.ParseFieldValueToText("100011423632812",hsFieldValue["Education"])%></dd></dl><dl><dt>רҵ��</dt><dd id="K_U_Resume_Specialty"><%=hsFieldValue["Specialty"]%></dd></dl><dl><dt>��ҵʱ�䣺</dt><dd id="K_U_Resume_GraduationTime"><%=hsFieldValue["GraduationTime"]%></dd></dl><dl><dt>�绰��</dt><dd id="K_U_Resume_Tel"><%=hsFieldValue["Tel"]%></dd></dl><dl><dt>EMail��</dt><dd id="K_U_Resume_EMail"><%=hsFieldValue["EMail"]%></dd></dl><dl><dt>��ϵ��ַ��</dt><dd id="K_U_Resume_Address"><%=hsFieldValue["Address"]%></dd></dl><dl><dt>רҵ���ܣ�</dt><dd id="K_U_Resume_Skill"><%=hsFieldValue["Skill"]%></dd></dl><dl><dt>���˼�����</dt><dd id="K_U_Resume_Intro"><%=hsFieldValue["Intro"]%></dd></dl></div>
<asp:HiddenField Value="K_U_Resume" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000044623437" runat="server" />
</div>
<center><input type="button" value="����" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
