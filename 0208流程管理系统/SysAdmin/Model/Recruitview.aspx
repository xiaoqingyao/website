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
<ul id="tags"><li class="selectTag"><a href="javascript:;">基本信息</a></li><li><a href="javascript:;">联系方式</a></li></ul><div id="panel"><fieldset><dl><dt>姓名：</dt><dd id="K_F_Recruit_Name"><%=hsFieldValue["Name"]%></dd></dl><dl><dt>性别：</dt><dd id="K_F_Recruit_Sex"><%=ctrManageView.ParseFieldValueToText("100001211852858",hsFieldValue["Sex"])%></dd></dl><dl><dt>年龄：</dt><dd id="K_F_Recruit_Age"><%=hsFieldValue["Age"]%></dd></dl><dl><dt>出生日期：</dt><dd id="K_F_Recruit_BirthDay"><%=hsFieldValue["BirthDay"]%></dd></dl><dl><dt>婚姻状况：</dt><dd id="K_F_Recruit_IsMarried"><%=ctrManageView.ParseFieldValueToText("100001213950241",hsFieldValue["IsMarried"])%></dd></dl><dl><dt>身高：</dt><dd id="K_F_Recruit_Height"><%=hsFieldValue["Height"]%></dd></dl><dl><dt>目前所在地：</dt><dd id="K_F_Recruit_CurrentAddress"><%=hsFieldValue["CurrentAddress"]%></dd></dl><dl><dt>户囗所在地：</dt><dd id="K_F_Recruit_Census"><%=hsFieldValue["Census"]%></dd></dl><dl><dt>工作年限：</dt><dd id="K_F_Recruit_WorkExperience"><%=hsFieldValue["WorkExperience"]%></dd></dl><dl><dt>英语级别：</dt><dd id="K_F_Recruit_EnglishLevel"><%=ctrManageView.ParseFieldValueToText("100001217475881",hsFieldValue["EnglishLevel"])%></dd></dl><dl><dt>英语水平：</dt><dd id="K_F_Recruit_EnglishState"><%=ctrManageView.ParseFieldValueToText("100001218145009",hsFieldValue["EnglishState"])%></dd></dl><dl><dt>第二外语：</dt><dd id="K_F_Recruit_SecondForgin"><%=hsFieldValue["SecondForgin"]%></dd></dl><dl><dt>水平：</dt><dd id="K_F_Recruit_SecondForginLevel"><%=ctrManageView.ParseFieldValueToText("100001220242393",hsFieldValue["SecondForginLevel"])%></dd></dl><dl><dt>计算机：</dt><dd id="K_F_Recruit_Computer"><%=ctrManageView.ParseFieldValueToText("100001218814137",hsFieldValue["Computer"])%></dd></dl><dl><dt>最高学历：</dt><dd id="K_F_Recruit_HeightestEducate"><%=ctrManageView.ParseFieldValueToText("100001220911521",hsFieldValue["HeightestEducate"])%></dd></dl><dl><dt>专业：</dt><dd id="K_F_Recruit_Professional"><%=hsFieldValue["Professional"]%></dd></dl><dl><dt>目前岗位：</dt><dd id="K_F_Recruit_CurrentJob"><%=hsFieldValue["CurrentJob"]%></dd></dl><dl><dt>目前月薪：</dt><dd id="K_F_Recruit_CurrentSlary"><%=hsFieldValue["CurrentSlary"]%></dd></dl><dl><dt>目前行业：</dt><dd id="K_F_Recruit_CurrentProfession"><%=hsFieldValue["CurrentProfession"]%></dd></dl><dl><dt>期望月薪：：</dt><dd id="K_F_Recruit_HopeSalary"><%=hsFieldValue["HopeSalary"]%></dd></dl><dl><dt>应聘岗位：</dt><dd id="K_F_Recruit_ApplyJob"><%=hsFieldValue["ApplyJob"]%></dd></dl><dl><dt>通信地址：</dt><dd id="K_F_Recruit_Adress"><%=hsFieldValue["Adress"]%></dd></dl><dl><dt>工作经验：</dt><dd id="K_F_Recruit_JobExperience"><%=hsFieldValue["JobExperience"]%></dd></dl><dl><dt>工作经历详细介绍：</dt><dd id="K_F_Recruit_JobExperienceDetail"><%=hsFieldValue["JobExperienceDetail"]%></dd></dl><dl><dt>技能专长：</dt><dd id="K_F_Recruit_SelfSpecialty"><%=hsFieldValue["SelfSpecialty"]%></dd></dl><dl><dt>教育背景：</dt><dd id="K_F_Recruit_Education"><%=hsFieldValue["Education"]%></dd></dl><div style="clear:left"></div></fieldset><fieldset style="display:none;"><dl><dt>联系电话：</dt><dd id="K_F_Recruit_LinkPhone"><%=hsFieldValue["LinkPhone"]%></dd></dl><dl><dt>手机号码：</dt><dd id="K_F_Recruit_CellPhone"><%=hsFieldValue["CellPhone"]%></dd></dl><dl><dt>公司电话：</dt><dd id="K_F_Recruit_CompanyPhone"><%=hsFieldValue["CompanyPhone"]%></dd></dl><dl><dt>呼机号码：</dt><dd id="K_F_Recruit_CallPhone"><%=hsFieldValue["CallPhone"]%></dd></dl><dl><dt>Email：</dt><dd id="K_F_Recruit_Email"><%=hsFieldValue["Email"]%></dd></dl><dl><dt>个人主页：</dt><dd id="K_F_Recruit_HomePage"><%=hsFieldValue["HomePage"]%></dd></dl><div style="clear:left"></div></fieldset></div>
<asp:HiddenField Value="K_F_Recruit" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000039721618" runat="server" />
</div>
<center><input type="button" value="返回" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
