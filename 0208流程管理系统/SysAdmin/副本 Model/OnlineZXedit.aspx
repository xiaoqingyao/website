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
<div id="panel"><dl><dt>提问标题</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Title"]%>" style="width:300px;"  maxlength="512" name="Title" id="Title" /></dd></dl><dl><dt>所属科室</dt><dd><select  id="{#ID#}" name="DepartMent"><%foreach (object key in ctrManageEdit.FieldBind("K_U_DepartMent", "Title", "Title", "NodeCode='105004007' and SiteID=1 and IsDel=0 and Iszixun='1' order by Orders desc").Keys){%><option  <%if(hsFieldValue["DepartMent"] != null && hsFieldValue["DepartMent"].ToString().Contains(key.ToString())) {Response.Write("selected='selected'");}%> value="<%= key.ToString()%>"><%=ctrManageEdit.FieldBind("K_U_DepartMent", "Title", "Title", "NodeCode='105004007' and SiteID=1 and IsDel=0 and Iszixun='1' order by Orders desc")[key].ToString()%></option> <% } %> </select></dd></dl><dl><dt>提问内容</dt><dd><textarea style="height:100px;width:500px;"   class="validate[optional]"  id="Content"  name="Content"><%=hsFieldValue["Content"]%></textarea></dd></dl><dl><dt>添加日期</dt><dd><input id="AddDate"  value="<%if(hsFieldValue["AddDate"].ToString().Equals("none")){Response.Write("");}else{Response.Write(string.Format("{0:yyyy-MM-dd}",hsFieldValue["AddDate"]));}%>"   name="AddDate" style="width:150px;"  class="Wdate" type="text" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/></dd></dl><dl><dt>浏览次数</dt><dd><input  class="validate[optional],custom[onlyNumber],numberMinMax[0,999999]"  type="text" value="<%=hsFieldValue["Hits"]%>" style="width:150px;"  maxlength="10000" name="Hits" id="Hits" /></dd></dl><%KingTop.Config.UploadConfig uploadobj = KingTop.Config.Upload.GetConfig(GetUploadImgPath); %><dl><dt>回复内容</dt><dd><textarea  id="ReContent" name="ReContent"><%=hsFieldValue["ReContent"]%></textarea><script type="text/javascript">var ReContent$$ckeditor$$obj = CKEDITOR.replace('ReContent', { linkUploadAllowedExtensions: '<%=uploadobj.UploadFilesType %>', nodeId: 1,language:'<%=Resources.Model.DateLang%>', watermark: false, height: '300px', toolbar: 'ContentFull', modelId: 1, flashUploadAllowedExtensions: '<%=uploadobj.UploadMediaType %>', width: '600px', imageUploadAllowedExtensions: '<%=uploadobj.UploadImageType %>', skin: 'blue', thumbnail: false, fileRecord: true, fieldName: 'Content', wordPic: false, flashUpload: true, imageUpload: true, linkUpload: true, foreground: false, moduleName: '' }); </script></dd></dl><dl><dt>审核状态</dt><dd><select  id="{#ID#}" name="FlowState"><%foreach (object key in ctrManageEdit.FieldBind("K_ReviewFlowState", "Name", "StateValue", " StateValue in(3,99)").Keys){%><option  <%if(hsFieldValue["FlowState"] != null && hsFieldValue["FlowState"].ToString().Contains(key.ToString())) {Response.Write("selected='selected'");}%> value="<%= key.ToString()%>"><%=ctrManageEdit.FieldBind("K_ReviewFlowState", "Name", "StateValue", " StateValue in(3,99)")[key].ToString()%></option> <% } %> </select></dd></dl></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="返回" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_U_OnlineZX" ID="hdnTableName" runat="server" /><asp:HiddenField Value="Title||1,DepartMent||6,Content||2,AddDate|none|10,Hits|0|8,ReContent||3,FlowState|3|6," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000025029687" runat="server" /><input type="hidden" id="hdnModelAlias" value="在线咨询模型" name="hdnModelAlias"/> 
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>