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
<div id="panel"><dl><dt>公告标题</dt><dd><input type="text" style="width:300px;" class="validate[required]" name="Title" value="<%=hsFieldValue["Title"] %>" id="Title" />
<span style="color:#ff0000;"> * </span>
<input type="button" value="检测是否具有重复" id="CheckTitleISRepeat" onclick="CheckTitleRepeat('K_U_Message','Title','CheckTitleISRepeatMSG')" />
<span style="color:#ff0000;" id="CheckTitleISRepeatMSG"></span></dd></dl><%KingTop.Config.UploadConfig uploadobj = KingTop.Config.Upload.GetConfig(GetUploadImgPath); %><dl><dt>公告内容</dt><dd><textarea  id="MsgContent" name="MsgContent"><%=hsFieldValue["MsgContent"]%></textarea><script type="text/javascript">    var MsgContent$$ckeditor$$obj = CKEDITOR.replace('MsgContent', { language: '<%=Resources.Model.DateLang%>', height: '300px',width:'700px' }); </script></dd></dl><dl><dt>公告发布时间</dt><dd><input id="PublishDate"  value="<%if(hsFieldValue["PublishDate"].ToString().Equals("DateTime.Now.ToString('yyyy-MM-dd')")){Response.Write(DateTime.Now.ToString("yyyy-MM-dd"));}else{Response.Write(string.Format("{0:yyyy-MM-dd}",hsFieldValue["PublishDate"]));}%>"   name="PublishDate" style="width:100px;"  class="Wdate" type="text" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/></dd></dl><dl><dt>发布范围</dt><dd><input type="hidden" name="PublishRange" value="<%=hsFieldValue["PublishRange"] %>" id="PublishRange" />
<textarea name="HQB_PublishRange" id="HQB_PublishRange" readonly="readOnly" style="height:45px; width:300px;" wrap="yes" onclick="openframe({ title: '选择发布范围', url: 'PublishRange.aspx', width: '440', height: '250' })"></textarea>
<script type="text/javascript">PublishRangeGetUserName();</script>
<a href="javascript:openframe({ title: '选择发布范围', url: 'PublishRange.aspx', width: '440', height: '250' })">添加</a></dd></dl></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="返回" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_U_Message" ID="hdnTableName" runat="server" /><asp:HiddenField Value="Title||0,MsgContent||3,PublishDate|DateTime.Now.ToString('yyyy-MM-dd')|10,PublishRange||0," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000018747779" runat="server" /><input type="hidden" id="hdnModelAlias" value="后台信息模型" name="hdnModelAlias"/> 
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>