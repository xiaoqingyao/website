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
<div id="panel"><dl><dt>�ͻ����ͣ�</dt><dd id="K_U_Feedback_CustomerType"><%=ctrManageView.ParseFieldValueToText("100011422953274",hsFieldValue["CustomerType"])%></dd></dl><dl><dt>��˾���ƣ�</dt><dd id="K_U_Feedback_CompanyName"><%=hsFieldValue["CompanyName"]%></dd></dl><dl><dt>�ͻ�����ʡ��</dt><dd id="K_U_Feedback_InArea"><%=hsFieldValue["InArea"]%></dd></dl><dl><dt>�ͻ������У�</dt><dd id="K_U_Feedback_InCity"><%=hsFieldValue["InCity"]%></dd></dl><dl><dt>�ͻ���������</dt><dd id="K_U_Feedback_InCountry"><%=hsFieldValue["InCountry"]%></dd></dl><dl><dt>��ϵ�ˣ�</dt><dd id="K_U_Feedback_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>�ֻ���</dt><dd id="K_U_Feedback_MobilePhone"><%=hsFieldValue["MobilePhone"]%></dd></dl><dl><dt>�绰��</dt><dd id="K_U_Feedback_Tel"><%=hsFieldValue["Tel"]%></dd></dl><dl><dt>���䣺</dt><dd id="K_U_Feedback_Email"><%=hsFieldValue["Email"]%></dd></dl><dl><dt>MSN��</dt><dd id="K_U_Feedback_msn"><%=hsFieldValue["msn"]%></dd></dl><dl><dt>QQ��</dt><dd id="K_U_Feedback_qq"><%=hsFieldValue["qq"]%></dd></dl><dl><dt>��������ʡ�ݣ�</dt><dd id="K_U_Feedback_QuestionArea"><%=hsFieldValue["QuestionArea"]%></dd></dl><dl><dt>�ͺţ�</dt><dd id="K_U_Feedback_ModelNumber"><%=hsFieldValue["ModelNumber"]%></dd></dl><dl><dt>������ţ�</dt><dd id="K_U_Feedback_LogisticsCode"><%=hsFieldValue["LogisticsCode"]%></dd></dl><dl><dt>������ࣺ</dt><dd id="K_U_Feedback_QuestionClassification	"><%=ctrManageView.ParseFieldValueToText("100011429215628",hsFieldValue["QuestionClassification	"])%></dd></dl><dl><dt>�������������</dt><dd id="K_U_Feedback_ProblemDescription"><%=hsFieldValue["ProblemDescription"]%></dd></dl><dl><dt>���������</dt><dd id="K_U_Feedback_Treatment Advice"><%=hsFieldValue["Treatment Advice"]%></dd></dl><dl><dt>ʹ�������⣺</dt><dd id="K_U_Feedback_InUse"><%=ctrManageView.ParseFieldValueToText("100011429928924",hsFieldValue["InUse"])%></dd></dl><dl><dt>��ʼʹ�����ڣ�</dt><dd id="K_U_Feedback_StartDateTime"><%=hsFieldValue["StartDateTime"]%></dd></dl><dl><dt>����������ڣ�</dt><dd id="K_U_Feedback_CreationDate"><%=hsFieldValue["CreationDate"]%></dd></dl><dl><dt>��������������������</dt><dd id="K_U_Feedback_CaseDescription"><%=hsFieldValue["CaseDescription"]%></dd></dl><dl><dt>����������������</dt><dd id="K_U_Feedback_CaseTreatmentAdvice"><%=hsFieldValue["CaseTreatmentAdvice"]%></dd></dl></div>
<asp:HiddenField Value="K_U_Feedback" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000043289629" runat="server" />
</div>
<center><input type="button" value="����" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
