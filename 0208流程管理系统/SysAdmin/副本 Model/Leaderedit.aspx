<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlManageEdit.aspx.cs" ValidateRequest="false"  Inherits="KingTop.Web.Admin.ControlManageEdit" %>
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
<div id="panel"><dl><dt>姓名</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Title"]%>" style="width:300px;"  maxlength="512" name="Title" id="Title" /></dd></dl><dl><dt>岗位</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["GangWei"]%>" style="width:300px;"  maxlength="100" name="GangWei" id="GangWei" /></dd></dl><dl><dt>技术职称</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["ZhiChen"]%>" style="width:300px;"  maxlength="100" name="ZhiChen" id="ZhiChen" /></dd></dl><dl><dt>电话</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Tel"]%>" style="width:300px;"  maxlength="100" name="Tel" id="Tel" /></dd></dl><dl><dt>电子邮件</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Email"]%>" style="width:300px;"  maxlength="100" name="Email" id="Email" /></dd></dl><dl><dt>分管范围</dt><dd><textarea style="height:100px;width:500px;"   class="validate[optional]"  id="FGFW"  name="FGFW"><%=hsFieldValue["FGFW"]%></textarea></dd></dl><dl><dt>照片</dt><dd><input id=""  type="hidden" value="<%=hsFieldValue[""]%>" id="Photo"  name="" /><input   type="text" value="<%=hsFieldValue["Photo"]%>" style="width:300px;"  maxlength="" name="Photo" id="Photo" /> <input type='button' onclick="InputImages('theForm', 'Photo', 1, '', 4096, '',125,125)" value = '上传图片' /></dd></dl><%KingTop.Config.UploadConfig uploadobj = KingTop.Config.Upload.GetConfig(GetUploadImgPath); %><dl><dt>简历</dt><dd><textarea  id="Resume" name="Resume"><%=hsFieldValue["Resume"]%></textarea><script type="text/javascript">var Resume$$ckeditor$$obj = CKEDITOR.replace('Resume', { linkUploadAllowedExtensions: '<%=uploadobj.UploadFilesType %>', nodeId: 1,language:'<%=Resources.Model.DateLang%>', watermark: false, height: '300px', toolbar: 'ContentFull', modelId: 1, flashUploadAllowedExtensions: '<%=uploadobj.UploadMediaType %>', width: '600px', imageUploadAllowedExtensions: '<%=uploadobj.UploadImageType %>', skin: 'blue', thumbnail: false, fileRecord: true, fieldName: 'Content', wordPic: false, flashUpload: true, imageUpload: true, linkUpload: true, foreground: false, moduleName: '' }); </script></dd></dl><dl><dt>任职时间</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["RZTime"]%>" style="width:300px;"  maxlength="30" name="RZTime" id="RZTime" />历任领导添加任职时间</dd></dl><dl><dt>简介</dt><dd><textarea style="height:100px;width:600px;"   class="validate[optional]"  id="Digest"  name="Digest"><%=hsFieldValue["Digest"]%></textarea>历任领导添加简介</dd></dl></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="返回" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_U_Leader" ID="hdnTableName" runat="server" /><asp:HiddenField Value="Title||1,GangWei||1,ZhiChen||1,Tel||1,Email||1,FGFW||2,Photo||11,|0|8,Resume||3,RZTime||1,Digest||2," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000019446872" runat="server" /><input type="hidden" id="hdnModelAlias" value="领导班子模型" name="hdnModelAlias"/> 
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>