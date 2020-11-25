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
<ul id="tags"><li class="selectTag"><a href="javascript:;">基本信息</a> </li></ul><div id="panel"><fieldset><dl><dt>标题</dt><dd><input type="text" style="width:300px;" class="validate[required]" name="Title" value="<%=hsFieldValue["Title"] %>" id="Title" />
<span style="color:#ff0000;"> * </span>
<input type="button" value="检测是否具有重复" id="CheckTitleISRepeat" onclick="CheckTitleRepeat('K_U_Article','Title','CheckTitleISRepeatMSG')" />
<span style="color:#ff0000;" id="CheckTitleISRepeatMSG"></span></dd></dl><dl><dt>发布时间</dt><dd><input id="UpdateDate"  value="<%if(hsFieldValue["UpdateDate"].ToString().Equals("DateTime.Now.ToString('yyyy-MM-dd')")){Response.Write(DateTime.Now.ToString("yyyy-MM-dd"));}else{Response.Write(string.Format("{0:yyyy-MM-dd}",hsFieldValue["UpdateDate"]));}%>"   name="UpdateDate" style="width:150px;"  class="Wdate" type="text" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/></dd></dl><dl><dt>图片</dt><dd><input   type="text" value="<%=hsFieldValue["FirstPagePic"]%>" style="width:300px;"  maxlength="0" name="FirstPagePic" id="FirstPagePic" /> <input type='button' onclick="InputImages('theForm', 'FirstPagePic', 1, 'jpg|gif|png', 4096, '',180,100)" value = '上传图片' /></dd></dl><dl><dt>简介</dt><dd><textarea style="height:150px;width:680px;"   class="validate[optional]"  id="Intro"  name="Intro"><%=hsFieldValue["Intro"]%></textarea></dd></dl><%KingTop.Config.UploadConfig uploadobj = KingTop.Config.Upload.GetConfig(GetUploadImgPath); %><dl><dt>文章内容</dt><dd><textarea  id="Content" name="Content"><%=hsFieldValue["Content"]%></textarea><script type="text/javascript">var Content$$ckeditor$$obj = CKEDITOR.replace('Content', { linkUploadAllowedExtensions: '<%=uploadobj.UploadFilesType %>', nodeId: 1,language:'<%=Resources.Model.DateLang%>', watermark: false, height: '400px', toolbar: 'ContentFull', modelId: 1, flashUploadAllowedExtensions: '<%=uploadobj.UploadMediaType %>', width: '689px', imageUploadAllowedExtensions: '<%=uploadobj.UploadImageType %>', skin: 'blue', thumbnail: false, fileRecord: true, fieldName: 'Content', wordPic: false, flashUpload: true, imageUpload: true, linkUpload: true, foreground: false, moduleName: '' }); </script></dd></dl><dl><dt>推荐首页</dt><dd><input  type="radio" <%if(hsFieldValue["IsComment"] != null && hsFieldValue["IsComment"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="IsComment" value="1" />是<input  type="radio" <%if(hsFieldValue["IsComment"] != null && hsFieldValue["IsComment"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="IsComment" value="0" />否</dd></dl><dl><dt>热点新闻</dt><dd><input  type="radio" <%if(hsFieldValue["IsEnable"] != null && hsFieldValue["IsEnable"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="IsEnable" value="1" />是<input  type="radio" <%if(hsFieldValue["IsEnable"] != null && hsFieldValue["IsEnable"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="IsEnable" value="0" />否</dd></dl><div style="clear:left"></div></fieldset></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="返回" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_U_Article" ID="hdnTableName" runat="server" /><asp:HiddenField Value="Title||0,UpdateDate|DateTime.Now.ToString('yyyy-MM-dd')|10,FirstPagePic||11,Intro||2,Content||3,IsComment|0|4,IsEnable|0|4," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="000000000132380" runat="server" /><input type="hidden" id="hdnModelAlias" value="文章模型" name="hdnModelAlias"/> 
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>