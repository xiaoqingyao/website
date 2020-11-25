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
<div id="panel"><dl><dt>标题</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Title"]%>" style="width:180px;"  maxlength="512" name="Title" id="Title" /></dd></dl><dl><dt>联系地址</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["ContactAddr"]%>" style="width:300px;"  maxlength="128" name="ContactAddr" id="ContactAddr" /></dd></dl><dl><dt>小图</dt><dd><input   type="text" value="<%=hsFieldValue["SmallImg"]%>" style="width:300px;"  maxlength="" name="SmallImg" id="SmallImg" /> <input type='button' onclick="InputImages('theForm', 'SmallImg', 1, '', 4096, '',430,356)" value = '上传图片' /></dd></dl><dl><dt>省份</dt><dd><select  id="{#ID#}" name="city"><%foreach (object key in ctrManageEdit.FieldBind("K_Area", "Name", "ID", "").Keys){%><option  <%if(hsFieldValue["city"] != null && hsFieldValue["city"].ToString().Contains(key.ToString())) {Response.Write("selected='selected'");}%> value="<%= key.ToString()%>"><%=ctrManageEdit.FieldBind("K_Area", "Name", "ID", "")[key].ToString()%></option> <% } %> </select></dd></dl><dl><dt>面积</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Area"]%>" style="width:100px;"  maxlength="30" name="Area" id="Area" /></dd></dl><dl><dt>联系人</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Contact"]%>" style="width:100px;"  maxlength="30" name="Contact" id="Contact" /></dd></dl><dl><dt>电话</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["tel"]%>" style="width:100px;"  maxlength="30" name="tel" id="tel" /></dd></dl></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="返回" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_U_Sales" ID="hdnTableName" runat="server" /><asp:HiddenField Value="Title||1,ContactAddr||1,SmallImg||11,city|0|6,Area||1,Contact||1,tel||1," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000036992187" runat="server" /><input type="hidden" id="hdnModelAlias" value="销售网络模型" name="hdnModelAlias"/> 
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>