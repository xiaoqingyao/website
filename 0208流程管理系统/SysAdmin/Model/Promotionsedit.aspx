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
 <div class="container">
 <h4>位置： <a href="#">内容管理</a><a> ></a> <a href="#">文章发布</a><a> ></a> <span class="breadcrumb_current" >增加文章</span></h4> 
<ul id="tags"><li class="selectTag"><a href="javascript:;">基本信息</a> </li></ul><div id="panel"><fieldset><dl><dt>标题</dt><dd><input  class="validate[required]"  type="text" value="<%=hsFieldValue["title"]%>" style="width:200px;"  maxlength="30" name="title" id="title" /><span style="color:#ff0000; font-size:14px; font-weight:bold;">*</span></dd></dl><dl><dt>图片(尺寸360x270)</dt><dd><input   type="text" value="<%=hsFieldValue["PromotionsImg"]%>" style="width:150px;"  maxlength="0" name="PromotionsImg" id="PromotionsImg" /> <input type='button' onclick="InputImages('theForm', 'PromotionsImg', 1, 'JPG|GIF|JPEG|BMP', 4096, '',120,90)" value = '上传图片' />尺寸360x270</dd></dl><dl><dt>简述</dt><dd><textarea rows="8"   cols="50"  id="Description"  name="Description"><%=hsFieldValue["Description"]%></textarea></dd></dl><%AllPower.Config.UploadConfig uploadobj = AllPower.Config.Upload.GetConfig(GetUploadImgPath); %><dl><dt>内容</dt><dd><textarea  id="Content" name="Content"><%=hsFieldValue["Content"]%></textarea><script type="text/javascript">var Content$$ckeditor$$obj = CKEDITOR.replace('Content', { linkUploadAllowedExtensions: '<%=uploadobj.UploadFilesType %>', nodeId: 1,language:'<%=Resources.Model.DateLang%>', watermark: false, height: '280px', toolbar: 'ContentFull', modelId: 1, flashUploadAllowedExtensions: '<%=uploadobj.UploadMediaType %>', width: '680px', imageUploadAllowedExtensions: '<%=uploadobj.UploadImageType %>', skin: 'blue', thumbnail: false, fileRecord: true, fieldName: 'Content', wordPic: false, flashUpload: true, imageUpload: true, linkUpload: true, foreground: false, moduleName: '' }); </script></dd></dl><dl><dt>开始日期</dt><dd><input id="Starttime"  value="<%if(hsFieldValue["Starttime"].ToString().Equals("DateTime.Now.ToString('yyyy-MM-dd')")){Response.Write(DateTime.Now.ToString("yyyy-MM-dd"));}else{Response.Write(string.Format("{0:yyyy-MM-dd}",hsFieldValue["Starttime"]));}%>"   name="Starttime" style="width:150px;"  class="Wdate" type="text" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/><span style="color:#ff0000; font-size:14px; font-weight:bold;">*</span></dd></dl><dl><dt>结束日期</dt><dd><input id="EndTime"  value="<%if(hsFieldValue["EndTime"].ToString().Equals("none")){Response.Write("");}else{Response.Write(string.Format("{0:yyyy-MM-dd}",hsFieldValue["EndTime"]));}%>"   name="EndTime" style="width:150px;"  class="Wdate" type="text" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/><span style="color:#ff0000; font-size:14px; font-weight:bold;">*</span>结束日期</dd></dl><dl><dt>过期是否显示</dt><dd><input  type="radio" <%if(hsFieldValue["IsDisplay"] != null && hsFieldValue["IsDisplay"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="IsDisplay" value="1" />是<input  type="radio" <%if(hsFieldValue["IsDisplay"] != null && hsFieldValue["IsDisplay"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="IsDisplay" value="0" />否<span style="color:#ff0000; font-size:14px; font-weight:bold;">*</span>过期是否显示</dd></dl><dl><dt>是否撤消</dt><dd><input  type="radio" <%if(hsFieldValue["IsUndo"] != null && hsFieldValue["IsUndo"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="IsUndo" value="1" />是<input  type="radio" <%if(hsFieldValue["IsUndo"] != null && hsFieldValue["IsUndo"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="IsUndo" value="0" />否<span style="color:#ff0000; font-size:14px; font-weight:bold;">*</span></dd></dl><dl><dt>首页推荐</dt><dd><input  type="radio" <%if(hsFieldValue["IsPub"] != null && hsFieldValue["IsPub"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="IsPub" value="1" />是<input  type="radio" <%if(hsFieldValue["IsPub"] != null && hsFieldValue["IsPub"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="IsPub" value="0" />否是否推荐到首页</dd></dl><dl><dt>首页排序</dt><dd><input  class="validate[optional],custom[onlyNumber],numberMinMax[1,999999]"  type="text" value="<%=hsFieldValue["IndexOrder"]%>" style="width:150px;"  maxlength="10000" name="IndexOrder" id="IndexOrder" />首页排序</dd></dl><div style="clear:left"></div></fieldset></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="返回" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="BusinessID" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_U_Promotions" ID="hdnTableName" runat="server" /><asp:HiddenField Value="title||1,PromotionsImg||11,Description||2,Content||3,Starttime|DateTime.Now.ToString('yyyy-MM-dd')|10,EndTime|none|10,IsDisplay|1|4,IsUndo|0|4,IsPub||4,IndexOrder|999|8," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="000000010823335" runat="server" /> 
<asp:hiddenfield ID="hdnNodeID"  runat="server"/>
<asp:hiddenfield ID="hdnSiteID"  runat="server"/>
<asp:HiddenField ID="hdnActionType" runat="server" />
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>