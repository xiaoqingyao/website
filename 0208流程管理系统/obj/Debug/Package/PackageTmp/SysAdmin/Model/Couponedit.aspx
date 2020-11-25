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
<ul id="tags"><li class="selectTag"><a href="javascript:;">专用属性</a> </li></ul><div id="panel"><fieldset><dl><dt>标题</dt><dd><input  class="validate[required]"  type="text" value="<%=hsFieldValue["title"]%>" style="width:180px;"  maxlength="256" name="title" id="title" /><span style="color:#ff0000; font-size:14px; font-weight:bold;">*</span></dd></dl><dl><dt>图片(尺寸360x270)</dt><dd><input   type="text" value="<%=hsFieldValue["Image"]%>" style="width:180px;"  maxlength="0" name="Image" id="Image" /> <input type='button' onclick="InputImages('theForm', 'Image', 1, 'JPG|GIF|BMP', 4096, '',120,90)" value = '上传图片' /><span style="color:#ff0000; font-size:14px; font-weight:bold;">*</span></dd></dl><dl><dt>描述</dt><dd><textarea rows="8"  class="validate[required]"  cols="50"  id="Desc"  name="Desc"><%=hsFieldValue["Desc"]%></textarea><span style="color:#ff0000; font-size:14px; font-weight:bold;">*</span></dd></dl><dl><dt>下载次数</dt><dd><input  class="validate[required],custom[onlyNumber],numberMinMax[0,9999999]"  type="text" value="<%=hsFieldValue["DownCount"]%>" style="width:150px;"  maxlength="10000" name="DownCount" id="DownCount" /><span style="color:#ff0000; font-size:14px; font-weight:bold;">*</span></dd></dl><dl><dt>流水号</dt><dd><input  class="validate[optional],custom[onlyNumber],numberMinMax[1,99999999]"  type="text" value="<%=hsFieldValue["Number"]%>" style="width:150px;"  maxlength="10000" name="Number" id="Number" /></dd></dl><dl><dt>过期是否显示</dt><dd><input  type="radio" <%if(hsFieldValue["IsDisplay"] != null && hsFieldValue["IsDisplay"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="IsDisplay" value="1" />是<input  type="radio" <%if(hsFieldValue["IsDisplay"] != null && hsFieldValue["IsDisplay"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="IsDisplay" value="0" />否<span style="color:#ff0000; font-size:14px; font-weight:bold;">*</span></dd></dl><dl><dt>是否撤消</dt><dd><input  type="radio" <%if(hsFieldValue["IsUndo"] != null && hsFieldValue["IsUndo"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="IsUndo" value="1" />是<input  type="radio" <%if(hsFieldValue["IsUndo"] != null && hsFieldValue["IsUndo"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="IsUndo" value="0" />否<span style="color:#ff0000; font-size:14px; font-weight:bold;">*</span></dd></dl><dl><dt>首页推荐</dt><dd><input  type="radio" <%if(hsFieldValue["IsPub"] != null && hsFieldValue["IsPub"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="IsPub" value="1" />是<input  type="radio" <%if(hsFieldValue["IsPub"] != null && hsFieldValue["IsPub"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="IsPub" value="0" />否</dd></dl><dl><dt>开始日期</dt><dd><input id="Starttime"  value="<%if(hsFieldValue["Starttime"].ToString().Equals("DateTime.Now.ToString('yyyy-MM-dd')")){Response.Write(DateTime.Now.ToString("yyyy-MM-dd"));}else{Response.Write(string.Format("{0:yyyy-MM-dd}",hsFieldValue["Starttime"]));}%>"   name="Starttime" style="width:150px;"  class="Wdate" type="text" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/><span style="color:#ff0000; font-size:14px; font-weight:bold;">*</span></dd></dl><dl><dt>结束日期</dt><dd><input id="EndTime"  value="<%if(hsFieldValue["EndTime"].ToString().Equals("none")){Response.Write("");}else{Response.Write(string.Format("{0:yyyy-MM-dd}",hsFieldValue["EndTime"]));}%>"   name="EndTime" style="width:150px;"  class="Wdate" type="text" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/><span style="color:#ff0000; font-size:14px; font-weight:bold;">*</span></dd></dl><dl><dt>首页排序</dt><dd><input  class="validate[optional],custom[onlyNumber],numberMinMax[1,999999]"  type="text" value="<%=hsFieldValue["OrderIndex"]%>" style="width:150px;"  maxlength="10000" name="OrderIndex" id="OrderIndex" />首页排序</dd></dl><div style="clear:left"></div></fieldset></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="返回" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="BusinessID" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_U_Coupon" ID="hdnTableName" runat="server" /><asp:HiddenField Value="title||1,Image||11,Desc||2,DownCount||8,Number||8,IsDisplay|1|4,IsUndo|0|4,IsPub|0|4,Starttime|DateTime.Now.ToString('yyyy-MM-dd')|10,EndTime|none|10,OrderIndex|999|8," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000010970354" runat="server" /> 
<asp:hiddenfield ID="hdnNodeID"  runat="server"/>
<asp:hiddenfield ID="hdnSiteID"  runat="server"/>
<asp:HiddenField ID="hdnActionType" runat="server" />
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>