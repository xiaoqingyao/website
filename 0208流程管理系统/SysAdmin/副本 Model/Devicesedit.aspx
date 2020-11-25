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
<div id="panel"><dl><dt>Part No.</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Title"]%>" style="width:180px;"  maxlength="512" name="Title" id="Title" /></dd></dl><dl><dt>Data encapsulation</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Data_encapsulation"]%>" style="width:180px;"  maxlength="128" name="Data_encapsulation" id="Data_encapsulation" /></dd></dl><dl><dt>Data Rate</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Data_Rate"]%>" style="width:180px;"  maxlength="256" name="Data_Rate" id="Data_Rate" />(b/s)</dd></dl><dl><dt>Wavelength</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Wavelength"]%>" style="width:180px;"  maxlength="128" name="Wavelength" id="Wavelength" />(nm)</dd></dl><dl><dt>Source</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Source"]%>" style="width:180px;"  maxlength="128" name="Source" id="Source" /></dd></dl><dl><dt>Distance</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Distance"]%>" style="width:180px;"  maxlength="64" name="Distance" id="Distance" />(km)</dd></dl><dl><dt>Temperature</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Temperature"]%>" style="width:180px;"  maxlength="128" name="Temperature" id="Temperature" />(c)</dd></dl><dl><dt>Connector</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Connector"]%>" style="width:180px;"  maxlength="128" name="Connector" id="Connector" /></dd></dl><dl><dt>Others</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Others"]%>" style="width:180px;"  maxlength="128" name="Others" id="Others" /></dd></dl></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="返回" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_U_Devices" ID="hdnTableName" runat="server" /><asp:HiddenField Value="Title||1,Data_encapsulation||1,Data_Rate||1,Wavelength||1,Source||1,Distance||1,Temperature||1,Connector||1,Others||1," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000048769886" runat="server" /><input type="hidden" id="hdnModelAlias" value="Devices Product" name="hdnModelAlias"/> 
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>