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
<div id="panel"><dl><dt>应聘职位：</dt><dd id="K_U_Resume_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>姓名：</dt><dd id="K_U_Resume_UserName"><%=hsFieldValue["UserName"]%></dd></dl><dl><dt>性别：</dt><dd id="K_U_Resume_Gender"><%=ctrManageView.ParseFieldValueToText("100011423331252",hsFieldValue["Gender"])%></dd></dl><dl><dt>出生日期：</dt><dd id="K_U_Resume_BirthDate"><%=hsFieldValue["BirthDate"]%></dd></dl><dl><dt>婚姻状况：</dt><dd id="K_U_Resume_Marital"><%=ctrManageView.ParseFieldValueToText("100011424445312",hsFieldValue["Marital"])%></dd></dl><dl><dt>毕业院校：</dt><dd id="K_U_Resume_Graduated"><%=hsFieldValue["Graduated"]%></dd></dl><dl><dt>学历：</dt><dd id="K_U_Resume_Education"><%=ctrManageView.ParseFieldValueToText("100011423632812",hsFieldValue["Education"])%></dd></dl><dl><dt>专业：</dt><dd id="K_U_Resume_Specialty"><%=hsFieldValue["Specialty"]%></dd></dl><dl><dt>毕业时间：</dt><dd id="K_U_Resume_GraduationTime"><%=hsFieldValue["GraduationTime"]%></dd></dl><dl><dt>电话：</dt><dd id="K_U_Resume_Tel"><%=hsFieldValue["Tel"]%></dd></dl><dl><dt>EMail：</dt><dd id="K_U_Resume_EMail"><%=hsFieldValue["EMail"]%></dd></dl><dl><dt>联系地址：</dt><dd id="K_U_Resume_Address"><%=hsFieldValue["Address"]%></dd></dl><dl><dt>专业技能：</dt><dd id="K_U_Resume_Skill"><%=hsFieldValue["Skill"]%></dd></dl><dl><dt>个人简历：</dt><dd id="K_U_Resume_Intro"><%=hsFieldValue["Intro"]%></dd></dl></div>
<asp:HiddenField Value="K_U_Resume" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000044623437" runat="server" />
</div>
<center><input type="button" value="返回" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
