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
<div id="panel"><dl><dt>客户类型：</dt><dd id="K_U_Feedback_CustomerType"><%=ctrManageView.ParseFieldValueToText("100011422953274",hsFieldValue["CustomerType"])%></dd></dl><dl><dt>公司名称：</dt><dd id="K_U_Feedback_CompanyName"><%=hsFieldValue["CompanyName"]%></dd></dl><dl><dt>客户所在省：</dt><dd id="K_U_Feedback_InArea"><%=hsFieldValue["InArea"]%></dd></dl><dl><dt>客户所在市：</dt><dd id="K_U_Feedback_InCity"><%=hsFieldValue["InCity"]%></dd></dl><dl><dt>客户所在区：</dt><dd id="K_U_Feedback_InCountry"><%=hsFieldValue["InCountry"]%></dd></dl><dl><dt>联系人：</dt><dd id="K_U_Feedback_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>手机：</dt><dd id="K_U_Feedback_MobilePhone"><%=hsFieldValue["MobilePhone"]%></dd></dl><dl><dt>电话：</dt><dd id="K_U_Feedback_Tel"><%=hsFieldValue["Tel"]%></dd></dl><dl><dt>邮箱：</dt><dd id="K_U_Feedback_Email"><%=hsFieldValue["Email"]%></dd></dl><dl><dt>MSN：</dt><dd id="K_U_Feedback_msn"><%=hsFieldValue["msn"]%></dd></dl><dl><dt>QQ：</dt><dd id="K_U_Feedback_qq"><%=hsFieldValue["qq"]%></dd></dl><dl><dt>发生问题省份：</dt><dd id="K_U_Feedback_QuestionArea"><%=hsFieldValue["QuestionArea"]%></dd></dl><dl><dt>型号：</dt><dd id="K_U_Feedback_ModelNumber"><%=hsFieldValue["ModelNumber"]%></dd></dl><dl><dt>物流编号：</dt><dd id="K_U_Feedback_LogisticsCode"><%=hsFieldValue["LogisticsCode"]%></dd></dl><dl><dt>问题分类：</dt><dd id="K_U_Feedback_QuestionClassification	"><%=ctrManageView.ParseFieldValueToText("100011429215628",hsFieldValue["QuestionClassification	"])%></dd></dl><dl><dt>问题具体描述：</dt><dd id="K_U_Feedback_ProblemDescription"><%=hsFieldValue["ProblemDescription"]%></dd></dl><dl><dt>处理意见：</dt><dd id="K_U_Feedback_Treatment Advice"><%=hsFieldValue["Treatment Advice"]%></dd></dl><dl><dt>使用中问题：</dt><dd id="K_U_Feedback_InUse"><%=ctrManageView.ParseFieldValueToText("100011429928924",hsFieldValue["InUse"])%></dd></dl><dl><dt>起始使用日期：</dt><dd id="K_U_Feedback_StartDateTime"><%=hsFieldValue["StartDateTime"]%></dd></dl><dl><dt>问题产生日期：</dt><dd id="K_U_Feedback_CreationDate"><%=hsFieldValue["CreationDate"]%></dd></dl><dl><dt>情况描述问题具体描述：</dt><dd id="K_U_Feedback_CaseDescription"><%=hsFieldValue["CaseDescription"]%></dd></dl><dl><dt>情况描述处理意见：</dt><dd id="K_U_Feedback_CaseTreatmentAdvice"><%=hsFieldValue["CaseTreatmentAdvice"]%></dd></dl></div>
<asp:HiddenField Value="K_U_Feedback" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000043289629" runat="server" />
</div>
<center><input type="button" value="返回" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
