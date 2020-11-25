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
<div id="panel"><dl><dt>Part Number</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Title"]%>" style="width:180px;"  maxlength="512" name="Title" id="Title" /></dd></dl><dl><dt>Brand</dt><dd><select  id="Brand" name="Brand"><option  <%if(hsFieldValue["Brand"] != null && hsFieldValue["Brand"].ToString().Contains("0")) {Response.Write("selected='selected'");}%> value="0">Ingellen</option><option  <%if(hsFieldValue["Brand"] != null && hsFieldValue["Brand"].ToString().Contains("1")) {Response.Write("selected='selected'");}%> value="1">HP</option><option  <%if(hsFieldValue["Brand"] != null && hsFieldValue["Brand"].ToString().Contains("2")) {Response.Write("selected='selected'");}%> value="2">Sun</option><option  <%if(hsFieldValue["Brand"] != null && hsFieldValue["Brand"].ToString().Contains("3")) {Response.Write("selected='selected'");}%> value="3">Cisco</option><option  <%if(hsFieldValue["Brand"] != null && hsFieldValue["Brand"].ToString().Contains("4")) {Response.Write("selected='selected'");}%> value="4">SMC</option><option  <%if(hsFieldValue["Brand"] != null && hsFieldValue["Brand"].ToString().Contains("5")) {Response.Write("selected='selected'");}%> value="5">Nortel</option><option  <%if(hsFieldValue["Brand"] != null && hsFieldValue["Brand"].ToString().Contains("6")) {Response.Write("selected='selected'");}%> value="6">Dell</option><option  <%if(hsFieldValue["Brand"] != null && hsFieldValue["Brand"].ToString().Contains("7")) {Response.Write("selected='selected'");}%> value="7">Foundry</option><option  <%if(hsFieldValue["Brand"] != null && hsFieldValue["Brand"].ToString().Contains("8")) {Response.Write("selected='selected'");}%> value="8">Extreme</option><option  <%if(hsFieldValue["Brand"] != null && hsFieldValue["Brand"].ToString().Contains("9")) {Response.Write("selected='selected'");}%> value="9">Enterasys</option><option  <%if(hsFieldValue["Brand"] != null && hsFieldValue["Brand"].ToString().Contains("10")) {Response.Write("selected='selected'");}%> value="10">Avaya</option><option  <%if(hsFieldValue["Brand"] != null && hsFieldValue["Brand"].ToString().Contains("11")) {Response.Write("selected='selected'");}%> value="11">Brocade</option><option  <%if(hsFieldValue["Brand"] != null && hsFieldValue["Brand"].ToString().Contains("12")) {Response.Write("selected='selected'");}%> value="12">3Com</option><option  <%if(hsFieldValue["Brand"] != null && hsFieldValue["Brand"].ToString().Contains("13")) {Response.Write("selected='selected'");}%> value="13">D-link</option><option  <%if(hsFieldValue["Brand"] != null && hsFieldValue["Brand"].ToString().Contains("14")) {Response.Write("selected='selected'");}%> value="14">Alcatel</option><option  <%if(hsFieldValue["Brand"] != null && hsFieldValue["Brand"].ToString().Contains("15")) {Response.Write("selected='selected'");}%> value="15">Juniper</option><option  <%if(hsFieldValue["Brand"] != null && hsFieldValue["Brand"].ToString().Contains("16")) {Response.Write("selected='selected'");}%> value="16">Allied </option><option  <%if(hsFieldValue["Brand"] != null && hsFieldValue["Brand"].ToString().Contains("17")) {Response.Write("selected='selected'");}%> value="17">Telesyn</option><option  <%if(hsFieldValue["Brand"] != null && hsFieldValue["Brand"].ToString().Contains("18")) {Response.Write("selected='selected'");}%> value="18">Netgear</option></select></dd></dl><dl><dt>Data Rate</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Data_Rate"]%>" style="width:180px;"  maxlength="128" name="Data_Rate" id="Data_Rate" /></dd></dl><dl><dt>Reach</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Reach"]%>" style="width:180px;"  maxlength="128" name="Reach" id="Reach" /></dd></dl><dl><dt>Wavelength</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Wavelength"]%>" style="width:180px;"  maxlength="128" name="Wavelength" id="Wavelength" />(nm)</dd></dl><dl><dt>LD</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["LD"]%>" style="width:180px;"  maxlength="128" name="LD" id="LD" /></dd></dl><dl><dt>PD</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["PD"]%>" style="width:180px;"  maxlength="128" name="PD" id="PD" /></dd></dl><dl><dt>Pout</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Pout"]%>" style="width:180px;"  maxlength="128" name="Pout" id="Pout" />(min)</dd></dl><dl><dt>Sensitivity</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Sensitivity"]%>" style="width:180px;"  maxlength="128" name="Sensitivity" id="Sensitivity" />(max)</dd></dl><dl><dt>Link Budget</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Link_Budget"]%>" style="width:180px;"  maxlength="128" name="Link_Budget" id="Link_Budget" /></dd></dl><dl><dt>Operating Case Temperature</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Operating_Case_Temperature"]%>" style="width:180px;"  maxlength="128" name="Operating_Case_Temperature" id="Operating_Case_Temperature" /></dd></dl><%AllPower.Config.UploadConfig uploadobj = AllPower.Config.Upload.GetConfig(GetUploadImgPath); %><dl><dt>Description</dt><dd><textarea  id="Description" name="Description"><%=hsFieldValue["Description"]%></textarea><script type="text/javascript">var Description$$ckeditor$$obj = CKEDITOR.replace('Description', { linkUploadAllowedExtensions: '<%=uploadobj.UploadFilesType %>', nodeId: 1,language:'<%=Resources.Model.DateLang%>', watermark: false, height: '200px', toolbar: 'ContentFull', modelId: 1, flashUploadAllowedExtensions: '<%=uploadobj.UploadMediaType %>', width: '600px', imageUploadAllowedExtensions: '<%=uploadobj.UploadImageType %>', skin: 'blue', thumbnail: false, fileRecord: true, fieldName: 'Content', wordPic: false, flashUpload: true, imageUpload: true, linkUpload: true, foreground: false, moduleName: '' }); </script></dd></dl></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="返回" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_U_Transceiver" ID="hdnTableName" runat="server" /><asp:HiddenField Value="Title||1,Brand|0|6,Data_Rate||1,Reach||1,Wavelength||1,LD||1,PD||1,Pout||1,Sensitivity||1,Link_Budget||1,Operating_Case_Temperature||1,Description||3," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000050138235" runat="server" /><input type="hidden" id="hdnModelAlias" value="Transceiver Products" name="hdnModelAlias"/> 
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>