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
<div id="panel"><dl><dt>所属科室名称</dt><dd><select  id="{#ID#}" name="DepartMent"><%foreach (object key in ctrManageEdit.FieldBind("K_U_DepartMent", "Title", "Title", "NodeCode='105004007' and SiteID=1 and IsDel=0 order by Orders desc").Keys){%><option  <%if(hsFieldValue["DepartMent"] != null && hsFieldValue["DepartMent"].ToString().Contains(key.ToString())) {Response.Write("selected='selected'");}%> value="<%= key.ToString()%>"><%=ctrManageEdit.FieldBind("K_U_DepartMent", "Title", "Title", "NodeCode='105004007' and SiteID=1 and IsDel=0 order by Orders desc")[key].ToString()%></option> <% } %> </select></dd></dl><dl><dt>标题</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Title"]%>" style="width:300px;"  maxlength="512" name="Title" id="Title" /></dd></dl><dl><dt>作者</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Author"]%>" style="width:150px;"  maxlength="30" name="Author" id="Author" /></dd></dl><dl><dt>浏览次数</dt><dd><input  class="validate[optional],custom[onlyNumber],numberMinMax[0,999999]"  type="text" value="<%=hsFieldValue["Hits"]%>" style="width:150px;"  maxlength="10000" name="Hits" id="Hits" /></dd></dl><dl><dt>关键词1</dt><dd>
<input  class="validate[optional]"  type="text" value="<%=hsFieldValue["KeyWords"]%>" style="width:300px;"  maxlength="512" name="KeyWords" id="KeyWords" />


</dd></dl><dl><dt>图片</dt><dd><input id=""  type="hidden" value="<%=hsFieldValue[""]%>" id="FirstPagePic"  name="" /><input   type="text" value="<%=hsFieldValue["FirstPagePic"]%>" style="width:300px;"  maxlength="" name="FirstPagePic" id="FirstPagePic" /> <input type='button' onclick="InputImages('theForm', 'FirstPagePic', 1, 'jpg|gif|bmp|png|jpeg', 4096, '',125,125)" value = '上传图片' /></dd></dl><%KingTop.Config.UploadConfig uploadobj = KingTop.Config.Upload.GetConfig(GetUploadImgPath); %><dl><dt>内容</dt><dd><textarea  id="Content" name="Content"><%=hsFieldValue["Content"]%></textarea><script type="text/javascript">var Content$$ckeditor$$obj = CKEDITOR.replace('Content', { linkUploadAllowedExtensions: '<%=uploadobj.UploadFilesType %>', nodeId: 1,language:'<%=Resources.Model.DateLang%>', watermark: false, height: '300px', toolbar: 'ContentFull', modelId: 1, flashUploadAllowedExtensions: '<%=uploadobj.UploadMediaType %>', width: '600px', imageUploadAllowedExtensions: '<%=uploadobj.UploadImageType %>', skin: 'blue', thumbnail: false, fileRecord: true, fieldName: 'Content', wordPic: false, flashUpload: true, imageUpload: true, linkUpload: true, foreground: false, moduleName: '' }); </script></dd></dl><dl><dt>发布日期</dt><dd><input id="UpdateDate"  value="<%if(hsFieldValue["UpdateDate"].ToString().Equals("DateTime.Now.ToString('yyyy-MM-dd')")){Response.Write(DateTime.Now.ToString("yyyy-MM-dd"));}else{Response.Write(string.Format("{0:yyyy-MM-dd}",hsFieldValue["UpdateDate"]));}%>"   name="UpdateDate" style="width:150px;"  class="Wdate" type="text" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/></dd></dl></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="返回" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_U_KJNews" ID="hdnTableName" runat="server" /><asp:HiddenField Value="DepartMent||6,Title||1,Author||1,Hits|0|8,KeyWords||1,FirstPagePic||11,Content||3,UpdateDate|DateTime.Now.ToString('yyyy-MM-dd')|10," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000024356258" runat="server" /><input type="hidden" id="hdnModelAlias" value="科室要闻模型" name="hdnModelAlias"/> 
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>