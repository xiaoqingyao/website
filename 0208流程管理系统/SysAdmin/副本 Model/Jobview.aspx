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
<div id="panel"><dl><dt>职位名称：</dt><dd id="K_U_Job_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>截止日期：</dt><dd id="K_U_Job_EndDate"><%=hsFieldValue["EndDate"]%></dd></dl><dl><dt>招聘人数：</dt><dd id="K_U_Job_PersonNum"><%=hsFieldValue["PersonNum"]%></dd></dl><dl><dt>工作地点：</dt><dd id="K_U_Job_WorkAddress"><%=hsFieldValue["WorkAddress"]%></dd></dl><dl><dt>专业要求：</dt><dd id="K_U_Job_claim"><%=hsFieldValue["claim"]%></dd></dl><dl><dt>招聘单位：</dt><dd id="K_U_Job_Author"><%=hsFieldValue["Author"]%></dd></dl><dl><dt>职位类别：</dt><dd id="K_U_Job_jobclass"><%=ctrManageView.ParseFieldValueToText("100011346973121",hsFieldValue["jobclass"])%></dd></dl><dl><dt>学历要求：</dt><dd id="K_U_Job_requirements"><%=ctrManageView.ParseFieldValueToText("100011346937563",hsFieldValue["requirements"])%></dd></dl><dl><dt>招聘分类：</dt><dd id="K_U_Job_jobUnit"><%=ctrManageView.ParseFieldValueToText("100011347631252",hsFieldValue["jobUnit"])%></dd></dl><dl><dt>经验要求：</dt><dd id="K_U_Job_empirical"><%=ctrManageView.ParseFieldValueToText("100011346946871",hsFieldValue["empirical"])%></dd></dl><dl><dt>职位描述：</dt><dd id="K_U_Job_Intro"><%=hsFieldValue["Intro"]%></dd></dl><dl><dt>招聘要求：</dt><dd id="K_U_Job_Content"><%=hsFieldValue["Content"]%></dd></dl><dl><dt>联系方式：</dt><dd id="K_U_Job_Contact"><%=hsFieldValue["Contact"]%></dd></dl></div>
<asp:HiddenField Value="K_U_Job" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000027148437" runat="server" />
</div>
<center><input type="button" value="返回" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
