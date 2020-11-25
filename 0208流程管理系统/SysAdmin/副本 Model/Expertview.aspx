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
<div id="panel"><dl><dt>ר�����֣�</dt><dd id="K_U_Expert_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>�������ң�</dt><dd id="K_U_Expert_DepartMent"><%=hsFieldValue["DepartMent"]%></dd></dl><dl><dt>���ԣ�</dt><dd id="K_U_Expert_shuxing"><%=ctrManageView.ParseFieldValueToText("100011299892187",hsFieldValue["shuxing"])%></dd></dl><dl><dt>ѧ����</dt><dd id="K_U_Expert_XueLi"><%=hsFieldValue["XueLi"]%></dd></dl><dl><dt>ְ�ƣ�</dt><dd id="K_U_Expert_ZhiChen"><%=hsFieldValue["ZhiChen"]%></dd></dl><dl><dt>�Ա�</dt><dd id="K_U_Expert_Gender"><%=ctrManageView.ParseFieldValueToText("100011294612553",hsFieldValue["Gender"])%></dd></dl><dl><dt>����ѡ��</dt><dd id="K_U_Expert_MenZhenType"><%=ctrManageView.ParseFieldValueToText("100011295378126",hsFieldValue["MenZhenType"])%></dd></dl><dl><dt>����ʱ�䣺</dt><dd id="K_U_Expert_MenZhenDate"><%=hsFieldValue["MenZhenDate"]%></dd></dl><dl><dt>�����ַ��</dt><dd id="K_U_Expert_Address"><%=hsFieldValue["Address"]%></dd></dl><dl><dt>�Һŷѣ�</dt><dd id="K_U_Expert_GuaiHaoFei"><%=hsFieldValue["GuaiHaoFei"]%></dd></dl><dl><dt>�����޺ţ�</dt><dd id="K_U_Expert_XianHao"><%=hsFieldValue["XianHao"]%></dd></dl><dl><dt>����״̬��</dt><dd id="K_U_Expert_State"><%=ctrManageView.ParseFieldValueToText("100011300782812",hsFieldValue["State"])%></dd></dl><dl><dt>���ϹҺţ�</dt><dd id="K_U_Expert_OnlineGuaiHao"><%=hsFieldValue["OnlineGuaiHao"]%></dd></dl><dl><dt>��ҽ����ʱ�䣺</dt><dd id="K_U_Expert_MYMenZhenDate"><%=hsFieldValue["MYMenZhenDate"]%></dd></dl><dl><dt>��ҽ�����ַ��</dt><dd id="K_U_Expert_MYAddress"><%=hsFieldValue["MYAddress"]%></dd></dl><dl><dt>��ҽ�Һŷѣ�</dt><dd id="K_U_Expert_MYGuaHaoFei"><%=hsFieldValue["MYGuaHaoFei"]%></dd></dl><dl><dt>��ҽ�����޺ţ�</dt><dd id="K_U_Expert_MYXianHao"><%=hsFieldValue["MYXianHao"]%></dd></dl><dl><dt>��ҽ����״̬��</dt><dd id="K_U_Expert_MYState"><%=ctrManageView.ParseFieldValueToText("100011302686792",hsFieldValue["MYState"])%></dd></dl><dl><dt>��ҽ���ϹҺţ�</dt><dd id="K_U_Expert_MYOnlieGuaiHao"><%=hsFieldValue["MYOnlieGuaiHao"]%></dd></dl><dl><dt>��Ƭ��</dt><dd id="K_U_Expert_Image"><%=hsFieldValue["Image"]%></dd></dl><dl><dt>�˲����ͣ�</dt><dd id="K_U_Expert_RCType"><%=ctrManageView.ParseFieldValueToText("100011304946872",hsFieldValue["RCType"])%></dd></dl><dl><dt>������</dt><dd id="K_U_Expert_Resume"><%=hsFieldValue["Resume"]%></dd></dl><dl><dt>����ѧ�ƣ�</dt><dd id="K_U_Expert_MainStudy"><%=hsFieldValue["MainStudy"]%></dd></dl><dl><dt>�о�����</dt><dd id="K_U_Expert_Research"><%=hsFieldValue["Research"]%></dd></dl><dl><dt>ҽ�Ƴɹ���</dt><dd id="K_U_Expert_YLResult"><%=hsFieldValue["YLResult"]%></dd></dl></div>
<asp:HiddenField Value="K_U_Expert" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000025793755" runat="server" />
</div>
<center><input type="button" value="����" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
