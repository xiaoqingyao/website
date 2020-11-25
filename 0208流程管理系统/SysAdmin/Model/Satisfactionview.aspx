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
<div id="panel"><dl><dt>�ͻ����ͣ�</dt><dd id="K_U_Satisfaction_CustomerType"><%=ctrManageView.ParseFieldValueToText("100011446064628",hsFieldValue["CustomerType"])%></dd></dl><dl><dt>�ͻ���˾���ƣ�</dt><dd id="K_U_Satisfaction_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>��˾���ƣ�</dt><dd id="K_U_Satisfaction_Company"><%=hsFieldValue["Company"]%></dd></dl><dl><dt>�ͻ�����ʡ��</dt><dd id="K_U_Satisfaction_InArea"><%=hsFieldValue["InArea"]%></dd></dl><dl><dt>�ͻ������У�</dt><dd id="K_U_Satisfaction_InCity"><%=hsFieldValue["InCity"]%></dd></dl><dl><dt>�ͻ���������</dt><dd id="K_U_Satisfaction_InCountry"><%=hsFieldValue["InCountry"]%></dd></dl><dl><dt>�ֻ���</dt><dd id="K_U_Satisfaction_Mobile"><%=hsFieldValue["Mobile"]%></dd></dl><dl><dt>�绰��</dt><dd id="K_U_Satisfaction_Tel"><%=hsFieldValue["Tel"]%></dd></dl><dl><dt>EMail��</dt><dd id="K_U_Satisfaction_EMail"><%=hsFieldValue["EMail"]%></dd></dl><dl><dt>MSN��</dt><dd id="K_U_Satisfaction_MSN"><%=hsFieldValue["MSN"]%></dd></dl><dl><dt>QQ��</dt><dd id="K_U_Satisfaction_QQ"><%=hsFieldValue["QQ"]%></dd></dl><dl><dt>�Ƿ�����ʹ�����籴����Ʒ����</dt><dd id="K_U_Satisfaction_WhetherUse"><%=ctrManageView.ParseFieldValueToText("100011434884375",hsFieldValue["WhetherUse"])%></dd></dl><dl><dt>�����İ���Ʒ�ƣ�</dt><dd id="K_U_Satisfaction_CooperationBrand"><%=hsFieldValue["CooperationBrand"]%></dd></dl><dl><dt>���ӡ��</dt><dd id="K_U_Satisfaction_AppearanceImpression"><%=ctrManageView.ParseFieldValueToText("100011436214626",hsFieldValue["AppearanceImpression"])%></dd></dl><dl><dt>�������������:��</dt><dd id="K_U_Satisfaction_OpinionSuggestion"><%=hsFieldValue["OpinionSuggestion"]%></dd></dl><dl><dt>�������籴����Ʒ�ļ������������ǣ���</dt><dd id="K_U_Satisfaction_TechnicalPerformance"><%=ctrManageView.ParseFieldValueToText("100011437685937",hsFieldValue["TechnicalPerformance"])%></dd></dl><dl><dt>������������飺</dt><dd id="K_U_Satisfaction_TechnologySuggestion"><%=hsFieldValue["TechnologySuggestion"]%></dd></dl><dl><dt>�������籴����Ʒ������������?��</dt><dd id="K_U_Satisfaction_QualityEvaluation"><%=ctrManageView.ParseFieldValueToText("100011439012552",hsFieldValue["QualityEvaluation"])%></dd></dl><dl><dt>������������飺</dt><dd id="K_U_Satisfaction_QualitySuggestion"><%=hsFieldValue["QualitySuggestion"]%></dd></dl><dl><dt>����ļ�ʱ�ԣ�</dt><dd id="K_U_Satisfaction_ServiceTimeliness"><%=ctrManageView.ParseFieldValueToText("100011440484375",hsFieldValue["ServiceTimeliness"])%></dd></dl><dl><dt>������Ա��̬�ȣ�</dt><dd id="K_U_Satisfaction_ServiceAttitude"><%=ctrManageView.ParseFieldValueToText("100011441143755",hsFieldValue["ServiceAttitude"])%></dd></dl><dl><dt>�����ļ�ʱ�ԣ�</dt><dd id="K_U_Satisfaction_TimelyDelivery"><%=ctrManageView.ParseFieldValueToText("100011441846875",hsFieldValue["TimelyDelivery"])%></dd></dl><dl><dt>�������������:��</dt><dd id="K_U_Satisfaction_ServiceSuggestion"><%=hsFieldValue["ServiceSuggestion"]%></dd></dl><dl><dt>����ȣ�</dt><dd id="K_U_Satisfaction_ServiceSuggestionSatisfied"><%=ctrManageView.ParseFieldValueToText("100011443267187",hsFieldValue["ServiceSuggestionSatisfied"])%></dd></dl><dl><dt>���Ƿ����л�����Ȥ���˽����籴����Ʒ�����ܼ�ʹ�ü��ɵȷ����֪ʶ����</dt><dd id="K_U_Satisfaction_UseSkills"><%=ctrManageView.ParseFieldValueToText("100011443956461",hsFieldValue["UseSkills"])%></dd></dl><dl><dt>������籴����֯��Կͻ�����Ѳ�Ʒ֪ʶ��ѵ�����μ��𣿣�</dt><dd id="K_U_Satisfaction_Train"><%=ctrManageView.ParseFieldValueToText("100011444628125",hsFieldValue["Train"])%></dd></dl><dl><dt>�����������������籴����Ʒ������������ȷ���Ľ���:��</dt><dd id="K_U_Satisfaction_Narration"><%=hsFieldValue["Narration"]%></dd></dl><dl><dt>�������������:��</dt><dd id="K_U_Satisfaction_SatisfiedSuggestion"><%=hsFieldValue["SatisfiedSuggestion"]%></dd></dl><dl><dt>IP��ַ��</dt><dd id="K_U_Satisfaction_IP"><%=hsFieldValue["IP"]%></dd></dl></div>
<asp:HiddenField Value="K_U_Satisfaction" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000042578123" runat="server" />
</div>
<center><input type="button" value="����" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
