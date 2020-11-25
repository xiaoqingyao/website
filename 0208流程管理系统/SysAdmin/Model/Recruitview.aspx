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
<ul id="tags"><li class="selectTag"><a href="javascript:;">������Ϣ</a></li><li><a href="javascript:;">��ϵ��ʽ</a></li></ul><div id="panel"><fieldset><dl><dt>������</dt><dd id="K_F_Recruit_Name"><%=hsFieldValue["Name"]%></dd></dl><dl><dt>�Ա�</dt><dd id="K_F_Recruit_Sex"><%=ctrManageView.ParseFieldValueToText("100001211852858",hsFieldValue["Sex"])%></dd></dl><dl><dt>���䣺</dt><dd id="K_F_Recruit_Age"><%=hsFieldValue["Age"]%></dd></dl><dl><dt>�������ڣ�</dt><dd id="K_F_Recruit_BirthDay"><%=hsFieldValue["BirthDay"]%></dd></dl><dl><dt>����״����</dt><dd id="K_F_Recruit_IsMarried"><%=ctrManageView.ParseFieldValueToText("100001213950241",hsFieldValue["IsMarried"])%></dd></dl><dl><dt>��ߣ�</dt><dd id="K_F_Recruit_Height"><%=hsFieldValue["Height"]%></dd></dl><dl><dt>Ŀǰ���ڵأ�</dt><dd id="K_F_Recruit_CurrentAddress"><%=hsFieldValue["CurrentAddress"]%></dd></dl><dl><dt>�������ڵأ�</dt><dd id="K_F_Recruit_Census"><%=hsFieldValue["Census"]%></dd></dl><dl><dt>�������ޣ�</dt><dd id="K_F_Recruit_WorkExperience"><%=hsFieldValue["WorkExperience"]%></dd></dl><dl><dt>Ӣ�Ｖ��</dt><dd id="K_F_Recruit_EnglishLevel"><%=ctrManageView.ParseFieldValueToText("100001217475881",hsFieldValue["EnglishLevel"])%></dd></dl><dl><dt>Ӣ��ˮƽ��</dt><dd id="K_F_Recruit_EnglishState"><%=ctrManageView.ParseFieldValueToText("100001218145009",hsFieldValue["EnglishState"])%></dd></dl><dl><dt>�ڶ����</dt><dd id="K_F_Recruit_SecondForgin"><%=hsFieldValue["SecondForgin"]%></dd></dl><dl><dt>ˮƽ��</dt><dd id="K_F_Recruit_SecondForginLevel"><%=ctrManageView.ParseFieldValueToText("100001220242393",hsFieldValue["SecondForginLevel"])%></dd></dl><dl><dt>�������</dt><dd id="K_F_Recruit_Computer"><%=ctrManageView.ParseFieldValueToText("100001218814137",hsFieldValue["Computer"])%></dd></dl><dl><dt>���ѧ����</dt><dd id="K_F_Recruit_HeightestEducate"><%=ctrManageView.ParseFieldValueToText("100001220911521",hsFieldValue["HeightestEducate"])%></dd></dl><dl><dt>רҵ��</dt><dd id="K_F_Recruit_Professional"><%=hsFieldValue["Professional"]%></dd></dl><dl><dt>Ŀǰ��λ��</dt><dd id="K_F_Recruit_CurrentJob"><%=hsFieldValue["CurrentJob"]%></dd></dl><dl><dt>Ŀǰ��н��</dt><dd id="K_F_Recruit_CurrentSlary"><%=hsFieldValue["CurrentSlary"]%></dd></dl><dl><dt>Ŀǰ��ҵ��</dt><dd id="K_F_Recruit_CurrentProfession"><%=hsFieldValue["CurrentProfession"]%></dd></dl><dl><dt>������н����</dt><dd id="K_F_Recruit_HopeSalary"><%=hsFieldValue["HopeSalary"]%></dd></dl><dl><dt>ӦƸ��λ��</dt><dd id="K_F_Recruit_ApplyJob"><%=hsFieldValue["ApplyJob"]%></dd></dl><dl><dt>ͨ�ŵ�ַ��</dt><dd id="K_F_Recruit_Adress"><%=hsFieldValue["Adress"]%></dd></dl><dl><dt>�������飺</dt><dd id="K_F_Recruit_JobExperience"><%=hsFieldValue["JobExperience"]%></dd></dl><dl><dt>����������ϸ���ܣ�</dt><dd id="K_F_Recruit_JobExperienceDetail"><%=hsFieldValue["JobExperienceDetail"]%></dd></dl><dl><dt>����ר����</dt><dd id="K_F_Recruit_SelfSpecialty"><%=hsFieldValue["SelfSpecialty"]%></dd></dl><dl><dt>����������</dt><dd id="K_F_Recruit_Education"><%=hsFieldValue["Education"]%></dd></dl><div style="clear:left"></div></fieldset><fieldset style="display:none;"><dl><dt>��ϵ�绰��</dt><dd id="K_F_Recruit_LinkPhone"><%=hsFieldValue["LinkPhone"]%></dd></dl><dl><dt>�ֻ����룺</dt><dd id="K_F_Recruit_CellPhone"><%=hsFieldValue["CellPhone"]%></dd></dl><dl><dt>��˾�绰��</dt><dd id="K_F_Recruit_CompanyPhone"><%=hsFieldValue["CompanyPhone"]%></dd></dl><dl><dt>�������룺</dt><dd id="K_F_Recruit_CallPhone"><%=hsFieldValue["CallPhone"]%></dd></dl><dl><dt>Email��</dt><dd id="K_F_Recruit_Email"><%=hsFieldValue["Email"]%></dd></dl><dl><dt>������ҳ��</dt><dd id="K_F_Recruit_HomePage"><%=hsFieldValue["HomePage"]%></dd></dl><div style="clear:left"></div></fieldset></div>
<asp:HiddenField Value="K_F_Recruit" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000039721618" runat="server" />
</div>
<center><input type="button" value="����" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
