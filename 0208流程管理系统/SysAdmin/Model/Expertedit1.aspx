<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Expertedit.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Model.Expertedit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>专家管理</title>
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
<h4>位置： <a href="#">系统管理</a><a> &gt;</a> <a href="#">专家介绍</a><a> &gt;</a> <span class="breadcrumb_current" > <a href="#">专家管理</a></span> </h4>

<div id="panel">
<dl><dt>专家名字</dt><dd><input type="text" style="width:300px;" runat="server" maxlength="512" id="txtName" /></dd></dl>

<dl><dt>所属科室</dt><dd><asp:DropDownList ID="ddlDepartMent" runat="server" AppendDataBoundItems="true"></asp:DropDownList></dd></dl>

<dl style="display:none;"><dt>属性</dt><dd><asp:CheckBox ID="cbshuxing" runat="server"/>首页推荐</dd></dl>

<dl><dt>学历</dt><dd><input type="text" style="width:300px;" runat="server" maxlength="512" id="txtXueLi" /></dd></dl>

<dl><dt>职称</dt><dd><input type="text" style="width:300px;" runat="server" maxlength="512" id="txtZhiChen" /></dd></dl>

<dl><dt>性别</dt><dd><input type="radio" name="gender" id="rbMan" runat="server" value="男" checked />男&nbsp;&nbsp;<input name="gender" type="radio" id="rbFeMan" runat="server" value="女" />女</dd></dl>

<dl>
<dt>照片</dt>
<dd><asp:Image ID="venueimg" runat="server" Width="100px" Height="150px" Visible="false" />
<asp:FileUpload ID="FileImage" runat="server" Width="300px" Height="20px"/>
<input type="text" id="imgwidth" runat="server" value="91" visible="false" /><input type="text" id="imgheight" runat="server" value="117" visible="false" />
<asp:Button ID="btnsubmit" runat="server" Text="提交" Width="60px" OnClick="btnsubmit_Click" />支持jpg、gif、bmp、jpeg格式图片</dd>
</dl>

<div id="div_menzhentype" runat="server">
<dl><dt>门诊选择</dt>
<dd>
<asp:CheckBox ID="cbMenZhenZJ" runat="server" AutoPostBack="true" oncheckedchanged="cbMenZhenZJ_CheckedChanged" />专家门诊&nbsp;&nbsp;
<asp:CheckBox ID="cbMenZhenMY" runat="server" AutoPostBack="true" oncheckedchanged="cbMenZhenMY_CheckedChanged" />名医名诊</dd>
</dl>
</div>

<div id="div_zjinfo" runat="server">
<dl><dt>专家门诊时间</dt><dd><asp:CheckBoxList ID="cbMenZhenDateZJList" runat="server" 
        RepeatDirection="Horizontal" RepeatColumns="7" ></asp:CheckBoxList>
</dd></dl>

<dl><dt>专家门诊地址</dt><dd><input type="text" style="width:300px;" runat="server" maxlength="512" id="txtAddress" /></dd></dl>

<dl><dt>专家挂号费</dt><dd><input type="text" style="width:300px;" runat="server" maxlength="512" id="txtGuaiHaoFei" /></dd></dl>

<dl><dt>专家门诊限号</dt><dd><input type="text" style="width:300px;" runat="server" maxlength="512" id="txtXianHao" /></dd></dl>

<dl><dt>专家门诊状态</dt><dd><input type="radio" name="state" id="rbYes" runat="server" value="在诊"/>在诊&nbsp;&nbsp;<input name="state" type="radio" id="rbNo" runat="server" value="暂停" />暂停</dd></dl>

<dl><dt>专家网上挂号</dt><dd><input type="text" style="width:300px;" runat="server" maxlength="512" id="txtOnlineGuaiHao" /></dd></dl>
</div>

<div id="div_myinfo" runat="server">
<dl><dt>名医门诊时间</dt><dd><asp:CheckBoxList ID="cbMenZhenDateMYList" runat="server" 
        RepeatDirection="Horizontal" RepeatColumns="7" ></asp:CheckBoxList>
</dd></dl>

<dl><dt>名医门诊地址</dt><dd><input type="text" style="width:300px;"  maxlength="512" runat="server" id="txtMYAddress" /></dd></dl>

<dl><dt>名医挂号费</dt><dd><input type="text" style="width:300px;"  maxlength="100" runat="server" id="txtMYGuaHaoFei" /></dd></dl>

<dl><dt>名医门诊限号</dt><dd><input  type="text" style="width:300px;"  maxlength="512" runat="server" id="txtMYXianHao" /></dd></dl>

<dl><dt>名医门诊状态</dt><dd><input type="radio" name="mystate" id="rdmystateYes" runat="server" value="在诊"/>在诊&nbsp;&nbsp;<input name="mystate" type="radio" id="rdmystateNo" runat="server" value="暂停" />暂停</dd></dl>

<dl><dt>名医网上挂号</dt><dd><input type="text" style="width:300px;"  maxlength="512" runat="server" id="txtMYOnlieGuaiHao" /></dd></dl>
</div>

<div id="div_rctype" runat="server">
<dl><dt>人才类型</dt>
<dd>
<%--博士生导师|1,硕士生导师|2,151人才|3,131人才|4,南医大学教授|5,南医大学副教授|6,浙江省医学会主委/副主委|7,杭州市医学会主委|8--%>
<asp:CheckBox ID="cbRCType1" runat="server" />博士生导师&nbsp;
<asp:CheckBox ID="cbRCType2" runat="server" />硕士生导师&nbsp;
<asp:CheckBox ID="cbRCType3" runat="server" />151人才&nbsp;
<asp:CheckBox ID="cbRCType4" runat="server" />131人才&nbsp;
<asp:CheckBox ID="cbRCType5" runat="server" />南医大学教授&nbsp;
<asp:CheckBox ID="cbRCType6" runat="server" />南医大学副教授&nbsp;
<asp:CheckBox ID="cbRCType7" runat="server" />浙江省医学会主委/副主委&nbsp;
<asp:CheckBox ID="cbRCType8" runat="server" />杭州市医学会主委
</dd>
</dl>
</div>

<dl><dt>简历</dt><dd><textarea style="height:150px;width:600px;" id="txtResume" runat="server"></textarea></dd></dl>

<dl><dt>主攻学科</dt><dd><textarea style="height:150px;width:600px;" id="txtMainStudy" runat="server"></textarea></dd></dl>

<dl><dt>研究方向</dt><dd><textarea style="height:150px;width:600px;" id="txtResearch" runat="server"></textarea></dd></dl>

<dl><dt>医疗成果</dt><dd><textarea style="height:150px;width:600px;" id="txtYLResult" runat="server"></textarea></dd></dl></div>

<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btn" runat="server" Text="" onclick="btn_Click"  />
 <input type="button" value="返回" onclick="javascript:location.href='Expertlist.aspx'"  />
 </div>
</div>

</form>
</body>
</html>
