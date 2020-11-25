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
<div id="panel"><dl><dt>科室名称</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Title"]%>" style="width:300px;"  maxlength="512" name="Title" id="Title" /></dd></dl><dl><dt>科室负责人</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Chief"]%>" style="width:300px;"  maxlength="100" name="Chief" id="Chief" /></dd></dl><dl><dt>科室电话</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Tel"]%>" style="width:300px;"  maxlength="512" name="Tel" id="Tel" /></dd></dl><dl><dt>科室电子邮件</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Email"]%>" style="width:300px;"  maxlength="512" name="Email" id="Email" /></dd></dl><dl><dt>科室物理位置</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Place"]%>" style="width:300px;"  maxlength="512" name="Place" id="Place" /></dd></dl><dl><dt>床位数量</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Beds"]%>" style="width:300px;"  maxlength="512" name="Beds" id="Beds" /></dd></dl><dl><dt>临床科室</dt><dd><input  type="radio" <%if(hsFieldValue["Islckj"] != null && hsFieldValue["Islckj"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="Islckj" value="1" />是<input  type="radio" <%if(hsFieldValue["Islckj"] != null && hsFieldValue["Islckj"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="Islckj" value="0" />否</dd></dl><dl><dt>医技科室</dt><dd><input  type="radio" <%if(hsFieldValue["Isyjks"] != null && hsFieldValue["Isyjks"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="Isyjks" value="1" />是<input  type="radio" <%if(hsFieldValue["Isyjks"] != null && hsFieldValue["Isyjks"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="Isyjks" value="0" />否</dd></dl><dl><dt>职能科室</dt><dd><input  type="radio" <%if(hsFieldValue["Isznkj"] != null && hsFieldValue["Isznkj"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="Isznkj" value="1" />是<input  type="radio" <%if(hsFieldValue["Isznkj"] != null && hsFieldValue["Isznkj"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="Isznkj" value="0" />否</dd></dl><dl><dt>特色专科</dt><dd><input  type="radio" <%if(hsFieldValue["Istszk"] != null && hsFieldValue["Istszk"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="Istszk" value="1" />是<input  type="radio" <%if(hsFieldValue["Istszk"] != null && hsFieldValue["Istszk"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="Istszk" value="0" />否</dd></dl><dl><dt>省市重点</dt><dd><input  type="radio" <%if(hsFieldValue["IsKey"] != null && hsFieldValue["IsKey"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="IsKey" value="1" />是<input  type="radio" <%if(hsFieldValue["IsKey"] != null && hsFieldValue["IsKey"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="IsKey" value="0" />否</dd></dl><dl><dt>搜索科室</dt><dd><input  type="radio" <%if(hsFieldValue["Issearch"] != null && hsFieldValue["Issearch"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="Issearch" value="1" />是<input  type="radio" <%if(hsFieldValue["Issearch"] != null && hsFieldValue["Issearch"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="Issearch" value="0" />否</dd></dl><dl><dt>咨询科室</dt><dd><input  type="radio" <%if(hsFieldValue["Iszixun"] != null && hsFieldValue["Iszixun"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="Iszixun" value="1" />是<input  type="radio" <%if(hsFieldValue["Iszixun"] != null && hsFieldValue["Iszixun"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="Iszixun" value="0" />否</dd></dl><dl><dt>门诊科室</dt><dd><input  type="radio" <%if(hsFieldValue["Ismenzhen"] != null && hsFieldValue["Ismenzhen"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="Ismenzhen" value="1" />是<input  type="radio" <%if(hsFieldValue["Ismenzhen"] != null && hsFieldValue["Ismenzhen"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="Ismenzhen" value="0" />否</dd></dl><dl><dt>科室简介</dt><dd><textarea style="height:100px;width:600px;"   class="validate[optional]"  id="Digest"  name="Digest"><%=hsFieldValue["Digest"]%></textarea></dd></dl><dl><dt>科室学术地位</dt><dd><textarea style="height:100px;width:600px;"   class="validate[optional]"  id="Position"  name="Position"><%=hsFieldValue["Position"]%></textarea></dd></dl><dl><dt>科室技术优势</dt><dd><textarea style="height:100px;width:600px;"   class="validate[optional]"  id="Goodness"  name="Goodness"><%=hsFieldValue["Goodness"]%></textarea></dd></dl><dl><dt>科室研究方向</dt><dd><textarea style="height:100px;width:600px;"   class="validate[optional]"  id="Research"  name="Research"><%=hsFieldValue["Research"]%></textarea></dd></dl><dl><dt>科室照片</dt><dd><input id=""  type="hidden" value="<%=hsFieldValue[""]%>" id="Image"  name="" /><input   type="text" value="<%=hsFieldValue["Image"]%>" style="width:300px;"  maxlength="" name="Image" id="Image" /> <input type='button' onclick="InputImages('theForm', 'Image', 1, '', 4096, '',125,125)" value = '上传图片' /></dd></dl></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="返回" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_U_DepartMent" ID="hdnTableName" runat="server" /><asp:HiddenField Value="Title||1,Chief||1,Tel||1,Email||1,Place||1,Beds||1,Islckj|0|4,Isyjks|0|4,Isznkj|0|4,Istszk|0|4,IsKey|0|4,Issearch|0|4,Iszixun|0|4,Ismenzhen|0|4,Digest||2,Position||2,Goodness||2,Research||2,Image||11,|0|8," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000023655095" runat="server" /><input type="hidden" id="hdnModelAlias" value="科室模型" name="hdnModelAlias"/> 
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>