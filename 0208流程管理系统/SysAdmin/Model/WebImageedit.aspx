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
<div id="panel"><dl><dt>标题</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Title"]%>" style="width:180px;"  maxlength="100" name="Title" id="Title" /></dd></dl><dl><dt>图片</dt><dd><input id=""  type="hidden" value="<%=hsFieldValue[""]%>" id="Image"  name="" /><input   type="text" value="<%=hsFieldValue["Image"]%>" style="width:180px;"  maxlength="" name="Image" id="Image" /> <input type='button' onclick="InputImages('theForm', 'Image', 1, '', 10240, '',784,162)" value = '上传图片' /></dd></dl><dl><dt>文章标题</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["wzTitle"]%>" style="width:300px;"  maxlength="512" name="wzTitle" id="wzTitle" /></dd></dl><dl><dt>转向链接地址</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["LinkURL"]%>" style="width:180px;"  maxlength="100" name="LinkURL" id="LinkURL" /></dd></dl><dl><dt>图片描述</dt><dd><textarea style="height:100px;width:300px;"   class="validate[optional]"  id="Remark"  name="Remark"><%=hsFieldValue["Remark"]%></textarea></dd></dl></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="返回" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_U_WebImage" ID="hdnTableName" runat="server" /><asp:HiddenField Value="Title||1,Image||11,|0|8,wzTitle||1,LinkURL|#|1,Remark||2," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000010951886" runat="server" /><input type="hidden" id="hdnModelAlias" value="网站图片模型" name="hdnModelAlias"/> 
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>