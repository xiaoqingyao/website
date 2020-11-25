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
<div id="panel"><dl><dt>品牌名称</dt><dd><input  class="validate[required]"  type="text" value="<%=hsFieldValue["Title"]%>" style="width:180px;"  maxlength="256" name="Title" id="Title" /><span style="color:#ff0000; font-size:14px; font-weight:bold;">*</span></dd></dl><dl><dt>品牌网址</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Url"]%>" style="width:180px;"  maxlength="256" name="Url" id="Url" /></dd></dl><dl><dt>品牌LOGO</dt><dd><input id=""  type="hidden" value="<%=hsFieldValue[""]%>"  name="" /><input   type="text" value="<%=hsFieldValue["Logo"]%>" style="width:150px;"  maxlength="" name="Logo" id="Logo" /> <input type='button' onclick="InputImages('theForm', 'Logo', 1, '', 4096, '',125,125)" value = '上传图片' /></dd></dl><dl><dt>品牌描述</dt><dd><textarea style="height:80px;width:500px;"   class="validate[optional]"  id="Description"  name="Description"><%=hsFieldValue["Description"]%></textarea></dd></dl><dl><dt>是否显示</dt><dd><input  type="radio" <%if(hsFieldValue["IsDisplay"] != null && hsFieldValue["IsDisplay"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="IsDisplay" value="1" />是<input  type="radio" <%if(hsFieldValue["IsDisplay"] != null && hsFieldValue["IsDisplay"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="IsDisplay" value="0" />否</dd></dl></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="返回" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_G_Brand" ID="hdnTableName" runat="server" /><asp:HiddenField Value="Title||1,Url||1,Logo||11,|0|8,Description||2,IsDisplay|1|4," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000045987577" runat="server" /><input type="hidden" id="hdnModelAlias" value="商品品牌" name="hdnModelAlias"/> 
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>