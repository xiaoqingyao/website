<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Expertedit.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Model.Expertedit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ר�ҹ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<link href="../css/public.css" rel="stylesheet" type="text/css" />
<link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
<link href="../css/dialog.css" rel="stylesheet" type="text/css" />
<script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>
 <script type="text/javascript" src="../js/listcheck.js"></script>
<script type="text/javascript" src="../js/jquery.dialog.js"></script>
<script type="text/javascript" src="../js/win.js"></script>
<script type="text/javascript" src="../js/publicform.js"></script>
</head>
<body>
<form id="theForm" runat="server">
<div class="container">
<h4>λ�ã� <a href="#">ϵͳ����</a><a> &gt;</a> <a href="#">ר�ҽ���</a><a> &gt;</a> <span class="breadcrumb_current" > <a href="#">ר�ҹ���</a></span> </h4>

<div id="panel">
<dl><dt>ר������</dt><dd><input type="text" style="width:300px;" runat="server" maxlength="512" id="txtName" /></dd></dl>

<dl><dt>��������</dt><dd><asp:DropDownList ID="ddlDepartMent" runat="server" AppendDataBoundItems="true"></asp:DropDownList></dd></dl>

<dl style="display:none;"><dt>����</dt><dd><asp:CheckBox ID="cbshuxing" runat="server"/>��ҳ�Ƽ�</dd></dl>

<dl><dt>ѧ��</dt><dd><input type="text" style="width:300px;" runat="server" maxlength="512" id="txtXueLi" /></dd></dl>

<dl><dt>ְ��</dt><dd><input type="text" style="width:300px;" runat="server" maxlength="512" id="txtZhiChen" /></dd></dl>

<dl><dt>�Ա�</dt><dd><input type="radio" name="gender" id="rbMan" runat="server" value="��" checked />��&nbsp;&nbsp;<input name="gender" type="radio" id="rbFeMan" runat="server" value="Ů" />Ů</dd></dl>

<dl>
<dt>��Ƭ</dt>
<dd><asp:Image ID="venueimg" runat="server" Width="100px" Height="150px" Visible="false" />
<asp:FileUpload ID="FileImage" runat="server" Width="300px" Height="20px"/>
<input type="text" id="imgwidth" runat="server" value="91" visible="false" /><input type="text" id="imgheight" runat="server" value="117" visible="false" />
<asp:Button ID="btnsubmit" runat="server" Text="�ύ" Width="60px" OnClick="btnsubmit_Click" />֧��jpg��gif��bmp��jpeg��ʽͼƬ</dd>
</dl>

<div id="div_menzhentype" runat="server">
<dl><dt>����ѡ��</dt>
<dd>
<asp:CheckBox ID="cbMenZhenZJ" runat="server" AutoPostBack="true" oncheckedchanged="cbMenZhenZJ_CheckedChanged" />ר������&nbsp;&nbsp;
<asp:CheckBox ID="cbMenZhenMY" runat="server" AutoPostBack="true" oncheckedchanged="cbMenZhenMY_CheckedChanged" />��ҽ����</dd>
</dl>
</div>

<div id="div_zjinfo" runat="server">
<dl><dt>ר������ʱ��</dt><dd><asp:CheckBoxList ID="cbMenZhenDateZJList" runat="server" 
        RepeatDirection="Horizontal" RepeatColumns="7" ></asp:CheckBoxList>
</dd></dl>

<dl><dt>ר�������ַ</dt><dd><input type="text" style="width:300px;" runat="server" maxlength="512" id="txtAddress" /></dd></dl>

<dl><dt>ר�ҹҺŷ�</dt><dd><input type="text" style="width:300px;" runat="server" maxlength="512" id="txtGuaiHaoFei" /></dd></dl>

<dl><dt>ר�������޺�</dt><dd><input type="text" style="width:300px;" runat="server" maxlength="512" id="txtXianHao" /></dd></dl>

<dl><dt>ר������״̬</dt><dd><input type="radio" name="state" id="rbYes" runat="server" value="����"/>����&nbsp;&nbsp;<input name="state" type="radio" id="rbNo" runat="server" value="��ͣ" />��ͣ</dd></dl>

<dl><dt>ר�����ϹҺ�</dt><dd><input type="text" style="width:300px;" runat="server" maxlength="512" id="txtOnlineGuaiHao" /></dd></dl>
</div>

<div id="div_myinfo" runat="server">
<dl><dt>��ҽ����ʱ��</dt><dd><asp:CheckBoxList ID="cbMenZhenDateMYList" runat="server" 
        RepeatDirection="Horizontal" RepeatColumns="7" ></asp:CheckBoxList>
</dd></dl>

<dl><dt>��ҽ�����ַ</dt><dd><input type="text" style="width:300px;"  maxlength="512" runat="server" id="txtMYAddress" /></dd></dl>

<dl><dt>��ҽ�Һŷ�</dt><dd><input type="text" style="width:300px;"  maxlength="100" runat="server" id="txtMYGuaHaoFei" /></dd></dl>

<dl><dt>��ҽ�����޺�</dt><dd><input  type="text" style="width:300px;"  maxlength="512" runat="server" id="txtMYXianHao" /></dd></dl>

<dl><dt>��ҽ����״̬</dt><dd><input type="radio" name="mystate" id="rdmystateYes" runat="server" value="����"/>����&nbsp;&nbsp;<input name="mystate" type="radio" id="rdmystateNo" runat="server" value="��ͣ" />��ͣ</dd></dl>

<dl><dt>��ҽ���ϹҺ�</dt><dd><input type="text" style="width:300px;"  maxlength="512" runat="server" id="txtMYOnlieGuaiHao" /></dd></dl>
</div>

<div id="div_rctype" runat="server">
<dl><dt>�˲�����</dt>
<dd>
<%--��ʿ����ʦ|1,˶ʿ����ʦ|2,151�˲�|3,131�˲�|4,��ҽ��ѧ����|5,��ҽ��ѧ������|6,�㽭ʡҽѧ����ί/����ί|7,������ҽѧ����ί|8--%>
<asp:CheckBox ID="cbRCType1" runat="server" />��ʿ����ʦ&nbsp;
<asp:CheckBox ID="cbRCType2" runat="server" />˶ʿ����ʦ&nbsp;
<asp:CheckBox ID="cbRCType3" runat="server" />151�˲�&nbsp;
<asp:CheckBox ID="cbRCType4" runat="server" />131�˲�&nbsp;
<asp:CheckBox ID="cbRCType5" runat="server" />��ҽ��ѧ����&nbsp;
<asp:CheckBox ID="cbRCType6" runat="server" />��ҽ��ѧ������&nbsp;
<asp:CheckBox ID="cbRCType7" runat="server" />�㽭ʡҽѧ����ί/����ί&nbsp;
<asp:CheckBox ID="cbRCType8" runat="server" />������ҽѧ����ί
</dd>
</dl>
</div>

<dl><dt>����</dt><dd><textarea style="height:150px;width:600px;" id="txtResume" runat="server"></textarea></dd></dl>

<dl><dt>����ѧ��</dt><dd><textarea style="height:150px;width:600px;" id="txtMainStudy" runat="server"></textarea></dd></dl>

<dl><dt>�о�����</dt><dd><textarea style="height:150px;width:600px;" id="txtResearch" runat="server"></textarea></dd></dl>

<dl><dt>ҽ�Ƴɹ�</dt><dd><textarea style="height:150px;width:600px;" id="txtYLResult" runat="server"></textarea></dd></dl></div>

<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btn" runat="server" Text="" onclick="btn_Click"  />
 <input type="button" value="����" onclick="javascript:location.href='Expertlist.aspx'"  />
 </div>
</div>

</form>
</body>
</html>
