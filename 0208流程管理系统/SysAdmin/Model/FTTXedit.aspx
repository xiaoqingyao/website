<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlManageEdit.aspx.cs" ValidateRequest="false"  Inherits="AllPower.Web.Admin.ControlManageEdit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>ģ�ͱ༭ҳ</title>
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
 <h4>λ�ã�  <%GetPageNav(NodeCode);%> > <span id="CurrentOpNavName"></span></h4> 
<div id="panel"><dl><dt>Part Number</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Title"]%>" style="width:180px;"  maxlength="512" name="Title" id="Title" /></dd></dl><dl><dt>Image</dt><dd><input   type="text" value="<%=hsFieldValue["ImageUrl"]%>" style="width:150px;"  maxlength="" name="ImageUrl" id="ImageUrl" /> <input type='button' onclick="InputImages('theForm', 'ImageUrl', 1, 'jpeg|jpg|gif', 4096, '',125,125)" value = '�ϴ�ͼƬ' /></dd></dl><dl><dt>Data Rate</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Data_Rate"]%>" style="width:180px;"  maxlength="128" name="Data_Rate" id="Data_Rate" /></dd></dl><dl><dt>Reach</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Reach"]%>" style="width:180px;"  maxlength="128" name="Reach" id="Reach" /></dd></dl><dl><dt>LD</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["LD"]%>" style="width:180px;"  maxlength="128" name="LD" id="LD" /></dd></dl><dl><dt>PD</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["PD"]%>" style="width:180px;"  maxlength="128" name="PD" id="PD" /></dd></dl><dl><dt>Operating Case Temperature</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Operating_Case_Temperature"]%>" style="width:180px;"  maxlength="128" name="Operating_Case_Temperature" id="Operating_Case_Temperature" /></dd></dl><%AllPower.Config.UploadConfig uploadobj = AllPower.Config.Upload.GetConfig(GetUploadImgPath); %><dl><dt>Brief</dt><dd><textarea  id="Brief" name="Brief"><%=hsFieldValue["Brief"]%></textarea><script type="text/javascript">var Brief$$ckeditor$$obj = CKEDITOR.replace('Brief', { linkUploadAllowedExtensions: '<%=uploadobj.UploadFilesType %>', nodeId: 1,language:'<%=Resources.Model.DateLang%>', watermark: false, height: '260px', toolbar: 'ContentFull', modelId: 1, flashUploadAllowedExtensions: '<%=uploadobj.UploadMediaType %>', width: '690px', imageUploadAllowedExtensions: '<%=uploadobj.UploadImageType %>', skin: 'blue', thumbnail: false, fileRecord: true, fieldName: 'Content', wordPic: false, flashUpload: true, imageUpload: true, linkUpload: true, foreground: false, moduleName: '' }); </script></dd></dl></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="����" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_U_FTTX" ID="hdnTableName" runat="server" /><asp:HiddenField Value="Title||1,ImageUrl||11,Data_Rate||1,Reach||1,LD||1,PD||1,Operating_Case_Temperature||1,Brief||3," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000049443323" runat="server" /><input type="hidden" id="hdnModelAlias" value="FTTX Products" name="hdnModelAlias"/> 
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>