<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlManageEdit.aspx.cs" ValidateRequest="false"  Inherits="KingTop.Web.Admin.ControlManageEdit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>ģ�ͱ༭ҳ</title>
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
 <h4>λ�ã�  <%GetPageNav(NodeCode);%> > <span id="CurrentOpNavName"></span></h4> 
<div id="panel"><dl><dt>����</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Title"]%>" style="width:180px;"  maxlength="512" name="Title" id="Title" /></dd></dl><dl><dt>����</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Name"]%>" style="width:150px;"  maxlength="256" name="Name" id="Name" /></dd></dl><dl><dt>EMail</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["EMail"]%>" style="width:150px;"  maxlength="256" name="EMail" id="EMail" /></dd></dl><dl><dt>��ϵ�绰</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["LinkPhone"]%>" style="width:150px;"  maxlength="15" name="LinkPhone" id="LinkPhone" /></dd></dl><dl><dt>����</dt><dd><textarea style="height:80px;width:500px;"   class="validate[optional]"  id="Content"  name="Content"><%=hsFieldValue["Content"]%></textarea></dd></dl><dl><dt>��ϵ��ַ</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["LinkAddress"]%>" style="width:180px;"  maxlength="512" name="LinkAddress" id="LinkAddress" /></dd></dl><dl><dt>IP��ַ</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["IP"]%>" style="width:180px;"  maxlength="30" name="IP" id="IP" /></dd></dl><dl><dt>�������</dt><dd><textarea style="height:120px;width:600px;"   class="validate[optional]"  id="DealResult"  name="DealResult"><%=hsFieldValue["DealResult"]%></textarea></dd></dl></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="����" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_F_FeedBack" ID="hdnTableName" runat="server" /><asp:HiddenField Value="Title||1,Name||1,EMail||1,LinkPhone||1,Content||2,LinkAddress||1,IP||1,DealResult||2," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000043118759" runat="server" /><input type="hidden" id="hdnModelAlias" value="��ѯ/����" name="hdnModelAlias"/> 
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>