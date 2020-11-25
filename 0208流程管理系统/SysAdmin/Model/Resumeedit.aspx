<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlManageEdit.aspx.cs" ValidateRequest="false"  Inherits="AllPower.Web.Admin.ControlManageEdit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>模型编辑页</title>
    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
     <script type="text/javascript" src="../js/jquery-validationEngine-cn.js"></script>
    <script src="../Calendar/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Editor/ckeditor/ckeditor.js"></script>
    <script src="../ColorPicker/dhtmlxcommon.js" type="text/javascript"></script>
    <script src="../ColorPicker/colorpicker.js" type="text/javascript"></script> 
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/publicform.js" type="text/javascript"></script>

    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
   <script src="../JS/Common.js" type="text/javascript"></script>
    <script src="../JS/ControlManageEdit.js" type="text/javascript"></script>
    <script src="../JS/ModelFieldAlbums.js" type="text/javascript"></script>
    
    <script type="text/javascript">$(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });</script>
    
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
    <link href="../ColorPicker/colorpicker.css" rel="stylesheet" type="text/css" />
    <link href="../Editor/ckeditor/content.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
      
 </head>
 <body>
 <form id="theForm" runat="server">
<input type="hidden" id="hdnUploadImgUrl" value="<%=GetUploadImgUrl() %>" />
<input type="hidden" id="hdnUploadImgPath" value="<%=GetUploadImgSetParam()[1] %>" />
<input type="hidden" id="hdnRSID" value="<%=Request.QueryString["ID"]%>" />
 <asp:hiddenfield ID="hdnNodeID"  runat="server"/>
<asp:hiddenfield ID="hdnSiteID"  runat="server"/>
<asp:HiddenField ID="hdnActionType" runat="server" />
<asp:hiddenfield ID="hdnBackUrlParam"  runat="server"/>
<input type="hidden" id="hdnCreateHtmlRighte" value="<%=isHasCreateHtmlRight %>" />
<div class="container">
 <h4>位置：  <%GetPageNav(NodeCode);%> > <span id="CurrentOpNavName"></span></h4> 
<div id="panel"><dl><dt>应聘职位</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Title"]%>" style="width:300px;"  maxlength="200" name="Title" id="Title" /></dd></dl><dl><dt>姓名</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["UserName"]%>" style="width:300px;"  maxlength="30" name="UserName" id="UserName" /></dd></dl><dl><dt>性别</dt><dd><input  type="radio" <%if(hsFieldValue["Gender"] != null && hsFieldValue["Gender"].ToString().Contains("男")) {Response.Write("checked='checked'");}%>  name="Gender" value="男" />男<input  type="radio" <%if(hsFieldValue["Gender"] != null && hsFieldValue["Gender"].ToString().Contains("女")) {Response.Write("checked='checked'");}%>  name="Gender" value="女" />女</dd></dl><dl><dt>出生日期</dt><dd><input id="BirthDate"  value="<%if(hsFieldValue["BirthDate"].ToString().Equals("none")){Response.Write("");}else{Response.Write(string.Format("{0:yyyy-MM-dd}",hsFieldValue["BirthDate"]));}%>"   name="BirthDate" style="width:300px;"  class="Wdate" type="text" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/></dd></dl><dl><dt>婚姻状况</dt><dd><select  id="Marital" name="Marital"><option  <%if(hsFieldValue["Marital"] != null && hsFieldValue["Marital"].ToString().Contains("0")) {Response.Write("selected='selected'");}%> value="0">未婚</option><option  <%if(hsFieldValue["Marital"] != null && hsFieldValue["Marital"].ToString().Contains("1")) {Response.Write("selected='selected'");}%> value="1">已婚</option></select></dd></dl><dl><dt>毕业院校</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Graduated"]%>" style="width:300px;"  maxlength="30" name="Graduated" id="Graduated" /></dd></dl><dl><dt>学历</dt><dd><select  id="Education" name="Education"><option  <%if(hsFieldValue["Education"] != null && hsFieldValue["Education"].ToString().Contains("不限")) {Response.Write("selected='selected'");}%> value="不限">不限</option><option  <%if(hsFieldValue["Education"] != null && hsFieldValue["Education"].ToString().Contains("初中以上")) {Response.Write("selected='selected'");}%> value="初中以上">初中以上</option><option  <%if(hsFieldValue["Education"] != null && hsFieldValue["Education"].ToString().Contains("高中以上")) {Response.Write("selected='selected'");}%> value="高中以上">高中以上</option><option  <%if(hsFieldValue["Education"] != null && hsFieldValue["Education"].ToString().Contains("中专以上")) {Response.Write("selected='selected'");}%> value="中专以上">中专以上</option><option  <%if(hsFieldValue["Education"] != null && hsFieldValue["Education"].ToString().Contains("大专以上")) {Response.Write("selected='selected'");}%> value="大专以上">大专以上</option><option  <%if(hsFieldValue["Education"] != null && hsFieldValue["Education"].ToString().Contains("本科以上")) {Response.Write("selected='selected'");}%> value="本科以上">本科以上</option><option  <%if(hsFieldValue["Education"] != null && hsFieldValue["Education"].ToString().Contains("硕士以上")) {Response.Write("selected='selected'");}%> value="硕士以上">硕士以上</option><option  <%if(hsFieldValue["Education"] != null && hsFieldValue["Education"].ToString().Contains("博士及以上")) {Response.Write("selected='selected'");}%> value="博士及以上">博士及以上</option></select></dd></dl><dl><dt>专业</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Specialty"]%>" style="width:300px;"  maxlength="30" name="Specialty" id="Specialty" /></dd></dl><dl><dt>毕业时间</dt><dd><input id="GraduationTime"  value="<%if(hsFieldValue["GraduationTime"].ToString().Equals("none")){Response.Write("");}else{Response.Write(string.Format("{0:yyyy-MM-dd}",hsFieldValue["GraduationTime"]));}%>"   name="GraduationTime" style="width:300px;"  class="Wdate" type="text" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/></dd></dl><dl><dt>电话</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Tel"]%>" style="width:300px;"  maxlength="30" name="Tel" id="Tel" /></dd></dl><dl><dt>EMail</dt><dd><input  class="validate[optional,regex[\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+,你的email输入错误]]"  type="text" value="<%=hsFieldValue["EMail"]%>" style="width:300px;"  maxlength="128" name="EMail" id="EMail" /></dd></dl><dl><dt>联系地址</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Address"]%>" style="width:500px;"  maxlength="30" name="Address" id="Address" /></dd></dl><dl><dt>专业技能</dt><dd><textarea style="height:300px;width:500px;"   class="validate[optional]"  id="Skill"  name="Skill"><%=hsFieldValue["Skill"]%></textarea></dd></dl><dl><dt>个人简历</dt><dd><textarea style="height:300px;width:500px;"   class="validate[optional]"  id="Intro"  name="Intro"><%=hsFieldValue["Intro"]%></textarea>500字符以内，注：1个汉字等于2个字符</dd></dl></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="返回" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_U_Resume" ID="hdnTableName" runat="server" /><asp:HiddenField Value="Title||1,UserName||1,Gender|男|4,BirthDate|none|10,Marital||6,Graduated||1,Education||6,Specialty||1,GraduationTime|none|10,Tel||1,EMail||1,Address||1,Skill||2,Intro||2," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000044623437" runat="server" /><input type="hidden" id="hdnModelAlias" value="简历模块" name="hdnModelAlias"/> 
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>