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
<div id="panel"><dl><dt>月刊名称</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["J_name"]%>" style="width:180px;"  maxlength="50" name="J_name" id="J_name" /></dd></dl><dl><dt>封面图片</dt><dd><input id=""  type="hidden" value="<%=hsFieldValue[""]%>" id="J_titleImg"  name="" /><input   type="text" value="<%=hsFieldValue["J_titleImg"]%>" style="width:180px;"  maxlength="" name="J_titleImg" id="J_titleImg" /> <input type='button' onclick="InputImages('theForm', 'J_titleImg', 1, '', 10240, '',116,154)" value = '上传图片' /></dd></dl><dl><dt>月刊内容</dt><dd><style  type="text/css">.HQB_MultiFile_ButtonList input{margin-bottom:5px;}</style><table  class="HQB_MultiFile_ButtonList"><tr><td valign="top"><ul style="list-style:none; padding::0; margin:0; "><li style="margin:0; padding:0;margin-bottom:5px;"><input type="hidden" id="J_imgList" value="<%=hsFieldValue["J_imgList"]%>" name="J_imgList" /><select style=" width:300px; height:300px;" name="HQB_MultiFile_J_imgList" multiple="multiple" id="HQB_MultiFile_J_imgList" ondblclick="return MultiFileItemModify('HQB_MultiFile_J_imgList','J_imgList')" onchange="MultiFileSynchronousHideValue('HQB_MultiFile_J_imgList','J_imgList')"></select></li><li style="margin:0; padding:0; display:block;"><input type='button' onclick="InputImages('theForm', 'HQB_MultiFile_J_imgList', 2, '', 10240, 'J_imgList',1000,1395)" value = '上传图片' /></li></ul></td><td valign="top"><input type="button" onclick="MultiFileItemAdd('HQB_MultiFile_J_imgList','J_imgList')" value="添加外部地址" /><br /><input type="button" value="修改选中" onclick="MultiFileItemModify('HQB_MultiFile_J_imgList','J_imgList')" /><br /><input type="button" value="删除选中" onclick="MultiFileItemDel('HQB_MultiFile_J_imgList','J_imgList')"/><br /><input type="button" value="向上移动" onclick="UpOrder('HQB_MultiFile_J_imgList')" /><br /><input type="button" value="向下移动" onclick="DownOrder('HQB_MultiFile_J_imgList')" /></td></tr></table><script type="text/javascript">MultiFileInit('HQB_MultiFile_J_imgList','J_imgList')</script></dd></dl><dl><dt>备注</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["J_remark"]%>" style="width:300px;"  maxlength="21" name="J_remark" id="J_remark" /></dd></dl></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="返回" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_U_Magazine" ID="hdnTableName" runat="server" /><asp:HiddenField Value="J_name||1,J_titleImg||11,|0|8,J_imgList||11,J_remark||1," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000042475618" runat="server" /><input type="hidden" id="hdnModelAlias" value="天健月刊" name="hdnModelAlias"/> 
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>