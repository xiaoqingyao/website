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
<div id="panel"><dl><dt>标题</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Title"]%>" style="width:300px;"  maxlength="512" name="Title" id="Title" /></dd></dl><dl><dt>行业分类</dt><dd><select  id="company" name="company"><option  <%if(hsFieldValue["company"] != null && hsFieldValue["company"].ToString().Contains("平安亚运")) {Response.Write("selected='selected'");}%> value="平安亚运">平安亚运</option><option  <%if(hsFieldValue["company"] != null && hsFieldValue["company"].ToString().Contains("平安奥运（体育场馆）")) {Response.Write("selected='selected'");}%> value="平安奥运（体育场馆）">平安奥运（体育场馆）</option><option  <%if(hsFieldValue["company"] != null && hsFieldValue["company"].ToString().Contains("智慧城市")) {Response.Write("selected='selected'");}%> value="智慧城市">智慧城市</option><option  <%if(hsFieldValue["company"] != null && hsFieldValue["company"].ToString().Contains("公检法、军队")) {Response.Write("selected='selected'");}%> value="公检法、军队">公检法、军队</option><option  <%if(hsFieldValue["company"] != null && hsFieldValue["company"].ToString().Contains("教育系统")) {Response.Write("selected='selected'");}%> value="教育系统">教育系统</option><option  <%if(hsFieldValue["company"] != null && hsFieldValue["company"].ToString().Contains("智能建筑（小区、酒店、风景区）")) {Response.Write("selected='selected'");}%> value="智能建筑（小区、酒店、风景区）">智能建筑（小区、酒店、风景区）</option><option  <%if(hsFieldValue["company"] != null && hsFieldValue["company"].ToString().Contains("医疗系统")) {Response.Write("selected='selected'");}%> value="医疗系统">医疗系统</option><option  <%if(hsFieldValue["company"] != null && hsFieldValue["company"].ToString().Contains("金融系统")) {Response.Write("selected='selected'");}%> value="金融系统">金融系统</option><option  <%if(hsFieldValue["company"] != null && hsFieldValue["company"].ToString().Contains("大型企业")) {Response.Write("selected='selected'");}%> value="大型企业">大型企业</option><option  <%if(hsFieldValue["company"] != null && hsFieldValue["company"].ToString().Contains("能源/交通行业")) {Response.Write("selected='selected'");}%> value="能源/交通行业">能源/交通行业</option></select></dd></dl><dl><dt>图片</dt><dd><input id=""  type="hidden" value="<%=hsFieldValue[""]%>" id="bigimg"  name="" /><input   type="text" value="<%=hsFieldValue["bigimg"]%>" style="width:500px;"  maxlength="" name="bigimg" id="bigimg" /> <input type='button' onclick="InputImages('theForm', 'bigimg', 1, '', 4096, '',125,125)" value = '上传图片' />宽 ： 185 px ， 高 ： 119 px</dd></dl><dl><dt>详细</dt><dd><textarea style="height:300px;width:500px;"   class="validate[optional]"  id="descripts"  name="descripts"><%=hsFieldValue["descripts"]%></textarea></dd></dl></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="返回" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_U_Case" ID="hdnTableName" runat="server" /><asp:HiddenField Value="Title||1,company||6,bigimg||11,|0|8,descripts||2," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000043937961" runat="server" /><input type="hidden" id="hdnModelAlias" value="典型案例" name="hdnModelAlias"/> 
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>