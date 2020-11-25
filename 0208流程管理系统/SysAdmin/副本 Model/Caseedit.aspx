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
<div id="panel"><dl><dt>工程名称</dt><dd><input  class="validate[required]"  type="text" value="<%=hsFieldValue["Title"]%>" style="width:180px;"  maxlength="512" name="Title" id="Title" /><span style="color:#ff0000; font-size:14px; font-weight:bold;">*</span></dd></dl><dl><dt>工程区域</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Company"]%>" style="width:400px;"  maxlength="128" name="Company" id="Company" /></dd></dl><dl><dt>工程类型</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["SoftType"]%>" style="width:100px;"  maxlength="30" name="SoftType" id="SoftType" /></dd></dl><dl><dt>选用产品</dt><dd><textarea style="height:80px;width:500px;"   class="validate[optional]"  id="Descripts"  name="Descripts"><%=hsFieldValue["Descripts"]%></textarea>500个字符以内,注：1个汉字等于2个字符</dd></dl><dl><dt>工程简介</dt><dd><textarea style="height:100px;width:500px;"   class="validate[optional]"  id="Intro"  name="Intro"><%=hsFieldValue["Intro"]%></textarea>500字符以内，注：1个汉字等于2个字符</dd></dl><ul id="BigImgAlbumsContainer" style="list-style:none; width:650px;"></ul><div style="clear:both; margin-left:120px;"><input type="hidden" value="<%=hsFieldValue["BigImg"]%>" name="BigImg" id="BigImg" /><span >描述：<input type="text" id="BigImgAlbumsNewTitle"  style="width: 180px;"></span><input type="text" id="BigImgThumbAlbumsNewURL"   readonly="readonly"  style="width: 180px;">  <input type="button" value="上传小图" id="BigImgThumbAlbumsNewBtn"><input type="text" id="BigImgAlbumsNewURL"   readonly="readonly"  style="width: 180px;">  <input type="button" value="上传大图" id="BigImgAlbumsNewBtn">		<script type="text/javascript">	var BigImgUploadParam = {FormName:"theForm", ElementName:"BigImgAlbumsNewURL", ThumbElementName:"BigImgThumbAlbumsNewURL",ControlType:1, ExtType:"", MaxSize:4096, GetSizeControl:"", ThumbWidth:392, ThumbHeight:316};	var albumsBigImg = new Albums("BigImg",BigImgUploadParam,true);albumsBigImg.init();</script></div><dl><dt>小图</dt><dd><input   type="text" value="<%=hsFieldValue["SmallImg"]%>" style="width:300px;"  maxlength="" name="SmallImg" id="SmallImg" /> <input type='button' onclick="InputImages('theForm', 'SmallImg', 1, '', 4096, '',135,104)" value = '上传图片' /></dd></dl><dl><dt>工程面积</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["acreage"]%>" style="width:100px;"  maxlength="30" name="acreage" id="acreage" /></dd></dl></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="返回" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_U_Case" ID="hdnTableName" runat="server" /><asp:HiddenField Value="Title||1,Company||1,SoftType||1,Descripts||2,Intro||2,BigImg||11,SmallImg||11,acreage||1," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000035596251" runat="server" /><input type="hidden" id="hdnModelAlias" value="案例展示模型" name="hdnModelAlias"/> 
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>