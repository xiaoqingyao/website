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
<div id="panel"><dl><dt>工程案例名称</dt><dd><input  class="validate[required]"  type="text" value="<%=hsFieldValue["Title"]%>" style="width:180px;"  maxlength="512" name="Title" id="Title" /><span style="color:#ff0000; font-size:14px; font-weight:bold;">*</span></dd></dl><dl><dt>图片</dt><dd><input   type="text" value="<%=hsFieldValue["image"]%>" style="width:300px;"  maxlength="" name="image" id="image" /> <input type='button' onclick="InputImages('theForm', 'image', 1, '', 4096, '',277,176)" value = '上传图片' />宽 277px ，高 176 px</dd></dl><dl><dt>行业分类</dt><dd><select  id="Company" name="Company"><option  <%if(hsFieldValue["Company"] != null && hsFieldValue["Company"].ToString().Contains("平安亚运")) {Response.Write("selected='selected'");}%> value="平安亚运">平安亚运</option><option  <%if(hsFieldValue["Company"] != null && hsFieldValue["Company"].ToString().Contains("平安奥运（体育场馆）")) {Response.Write("selected='selected'");}%> value="平安奥运（体育场馆）">平安奥运（体育场馆）</option><option  <%if(hsFieldValue["Company"] != null && hsFieldValue["Company"].ToString().Contains("智慧城市")) {Response.Write("selected='selected'");}%> value="智慧城市">智慧城市</option><option  <%if(hsFieldValue["Company"] != null && hsFieldValue["Company"].ToString().Contains("公检法、军队")) {Response.Write("selected='selected'");}%> value="公检法、军队">公检法、军队</option><option  <%if(hsFieldValue["Company"] != null && hsFieldValue["Company"].ToString().Contains("教育系统")) {Response.Write("selected='selected'");}%> value="教育系统">教育系统</option><option  <%if(hsFieldValue["Company"] != null && hsFieldValue["Company"].ToString().Contains("智能建筑（小区、酒店、风景区）")) {Response.Write("selected='selected'");}%> value="智能建筑（小区、酒店、风景区）">智能建筑（小区、酒店、风景区）</option><option  <%if(hsFieldValue["Company"] != null && hsFieldValue["Company"].ToString().Contains("医疗系统")) {Response.Write("selected='selected'");}%> value="医疗系统">医疗系统</option><option  <%if(hsFieldValue["Company"] != null && hsFieldValue["Company"].ToString().Contains("金融系统")) {Response.Write("selected='selected'");}%> value="金融系统">金融系统</option><option  <%if(hsFieldValue["Company"] != null && hsFieldValue["Company"].ToString().Contains("大型企业")) {Response.Write("selected='selected'");}%> value="大型企业">大型企业</option><option  <%if(hsFieldValue["Company"] != null && hsFieldValue["Company"].ToString().Contains("能源/交通行业")) {Response.Write("selected='selected'");}%> value="能源/交通行业">能源/交通行业</option></select><span style="color:#ff0000; font-size:14px; font-weight:bold;">*</span></dd></dl><%AllPower.Config.UploadConfig uploadobj = AllPower.Config.Upload.GetConfig(GetUploadImgPath); %><dl><dt>内容</dt><dd><textarea  id="Content" name="Content"><%=hsFieldValue["Content"]%></textarea><script type="text/javascript">var Content$$ckeditor$$obj = CKEDITOR.replace('Content', { linkUploadAllowedExtensions: '<%=uploadobj.UploadFilesType %>|pdf', nodeId: 1,language:'<%=Resources.Model.DateLang%>', watermark: false, height: '500px', toolbar: 'ContentFull', modelId: 1, flashUploadAllowedExtensions: '<%=uploadobj.UploadMediaType %>', width: '680px', imageUploadAllowedExtensions: '<%=uploadobj.UploadImageType %>', skin: 'blue', thumbnail: false, fileRecord: true, fieldName: 'Content', wordPic: false, flashUpload: true, imageUpload: true, linkUpload: true, foreground: false, moduleName: '' }); </script><span style="color:#ff0000; font-size:14px; font-weight:bold;">*</span></dd></dl></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="返回" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_U_project" ID="hdnTableName" runat="server" /><asp:HiddenField Value="Title||1,image||11,Company||6,Content||3," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000041176251" runat="server" /><input type="hidden" id="hdnModelAlias" value="工程案例" name="hdnModelAlias"/> 
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>