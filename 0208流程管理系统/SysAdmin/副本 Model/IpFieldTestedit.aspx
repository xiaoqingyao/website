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
<div id="panel"><dl><dt>IP地址</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["IP"]%>" style="width:180px;"  maxlength="30" name="IP" id="IP" /></dd></dl><dl><dt>标题</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Title"]%>" style="width:180px;"  maxlength="512" name="Title" id="Title" /></dd></dl><dl><dt>test</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["test"]%>" style="width:100px;"  maxlength="30" name="test" id="test" /></dd></dl><dl><dt>ttt</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["ttt"]%>" style="width:100px;"  maxlength="30" name="ttt" id="ttt" /></dd></dl><dl><dt>aaaa</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["aaaa"]%>" style="width:100px;"  maxlength="30" name="aaaa" id="aaaa" /></dd></dl><dl><dt>aaaas</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["aa"]%>" style="width:100px;"  maxlength="30" name="aa" id="aa" /></dd></dl><dl><dt>asas</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["as"]%>" style="width:100px;"  maxlength="30" name="as" id="as" /></dd></dl></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="返回" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_F_IpFieldTest" ID="hdnTableName" runat="server" /><asp:HiddenField Value="IP||1,Title||1,test||1,ttt||1,aaaa||1,as||1," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000039052490" runat="server" /> 
<asp:hiddenfield ID="hdnNodeID"  runat="server"/>
<asp:hiddenfield ID="hdnSiteID"  runat="server"/>
<asp:HiddenField ID="hdnActionType" runat="server" />
<asp:hiddenfield ID="hdnBackUrlParam"  runat="server"/>
<input type="hidden" id="hdnCreateHtmlRighte" value="<%=isHasCreateHtmlRight %>" />
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>