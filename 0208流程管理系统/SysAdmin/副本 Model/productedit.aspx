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
<div id="panel"><dl><dt>��Ʒ����</dt><dd><select  id="{#ID#}" name="productclass"><% ctrManageEdit.FieldBind("00", "|-", "...", "TypeParent", "TypeName", "TypeId", "TypeId", "K_Types", "orders", "105015002", ""); %> <script  type="text/javascript">                                                                                                                                                                                                                                                                                                     document.write("<%= ctrManageEdit.strlist %>");
                                                                                                                                                                                                                                                                                                     document.getElementById("{#ID#}").value = "<%=hsFieldValue["productclass"] %>";                                                                                                                                                                                                      </script>
</select></dd></dl><dl><dt>��Ʒ����</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Title"]%>" style="width:180px;"  maxlength="512" name="Title" id="Title" /></dd></dl><dl><dt>��Ʒͼ��</dt><dd><style  type="text/css">.HQB_MultiFile_ButtonList input{margin-bottom:5px;}</style><table  class="HQB_MultiFile_ButtonList"><tr><td valign="top"><ul style="list-style:none; padding::0; margin:0; "><li style="margin:0; padding:0;margin-bottom:5px;"><input type="hidden" id="BigImg" value="<%=hsFieldValue["BigImg"]%>" name="BigImg" /><select style=" width:300px; height:200px;" name="HQB_MultiFile_BigImg" multiple="multiple" id="HQB_MultiFile_BigImg" ondblclick="return MultiFileItemModify('HQB_MultiFile_BigImg','BigImg')" onchange="MultiFileSynchronousHideValue('HQB_MultiFile_BigImg','BigImg')"></select></li><li style="margin:0; padding:0; display:block;"><input type='button' onclick="InputImages('theForm', 'HQB_MultiFile_BigImg', 2, '', 4096, 'BigImg',456,335)" value = '�ϴ�ͼƬ' /></li></ul></td><td valign="top"><input type="button" onclick="MultiFileItemAdd('HQB_MultiFile_BigImg','BigImg')" value="����ⲿ��ַ" /><br /><input type="button" value="�޸�ѡ��" onclick="MultiFileItemModify('HQB_MultiFile_BigImg','BigImg')" /><br /><input type="button" value="ɾ��ѡ��" onclick="MultiFileItemDel('HQB_MultiFile_BigImg','BigImg')"/><br /><input type="button" value="�����ƶ�" onclick="UpOrder('HQB_MultiFile_BigImg')" /><br /><input type="button" value="�����ƶ�" onclick="DownOrder('HQB_MultiFile_BigImg')" /></td></tr></table><script type="text/javascript">MultiFileInit('HQB_MultiFile_BigImg','BigImg')</script></dd></dl><dl><dt>��ϸ����</dt><dd><textarea style="height:100px;width:680px;"   class="validate[optional]"  id="Content"  name="Content"><%=hsFieldValue["Content"]%></textarea></dd></dl><dl><dt>Сͼ</dt><dd><input   type="text" value="<%=hsFieldValue["SmallImg"]%>" style="width:300px;"  maxlength="" name="SmallImg" id="SmallImg" /> <input type='button' onclick="InputImages('theForm', 'SmallImg', 1, '', 4096, '',125,125)" value = '�ϴ�ͼƬ' /></dd></dl><ul id="CaseAlbumsContainer" style="list-style:none; width:650px;"></ul><div style="clear:both; margin-left:120px;"><input type="hidden" value="<%=hsFieldValue["Case"]%>" name="Case" id="Case" /><span >������<input type="text" id="CaseAlbumsNewTitle"  style="width: 180px;"></span><input type="text" id="CaseThumbAlbumsNewURL"   readonly="readonly"  style="width: 180px;">  <input type="button" value="�ϴ�Сͼ" id="CaseThumbAlbumsNewBtn"><input type="text" id="CaseAlbumsNewURL"   readonly="readonly"  style="width: 180px;">  <input type="button" value="�ϴ���ͼ" id="CaseAlbumsNewBtn">		<script type="text/javascript">	var CaseUploadParam = {FormName:"theForm", ElementName:"CaseAlbumsNewURL", ThumbElementName:"CaseThumbAlbumsNewURL",ControlType:1, ExtType:"", MaxSize:4096, GetSizeControl:"", ThumbWidth:456, ThumbHeight:335};	var albumsCase = new Albums("Case",CaseUploadParam,true);albumsCase.init();</script></div><dl><dt>����</dt><dd><textarea style="height:100px;width:600px;"   class="validate[optional]"  id="Slogan"  name="Slogan"><%=hsFieldValue["Slogan"]%></textarea></dd></dl><dl><dt>�ռ�Ч��</dt><dd><textarea style="height:100px;width:600px;"   class="validate[optional]"  id="effects"  name="effects"><%=hsFieldValue["effects"]%></textarea></dd></dl><dl><dt>�г���λ</dt><dd><textarea style="height:100px;width:600px;"   class="validate[optional]"  id="positioning"  name="positioning"><%=hsFieldValue["positioning"]%></textarea></dd></dl><dl><dt>����ͼƬ</dt><dd><input id=""  type="hidden" value="<%=hsFieldValue[""]%>" id="Outline"  name="" /><input   type="text" value="<%=hsFieldValue["Outline"]%>" style="width:300px;"  maxlength="" name="Outline" id="Outline" /> <input type='button' onclick="InputImages('theForm', 'Outline', 1, '', 4096, '',387,333)" value = '�ϴ�ͼƬ' /></dd></dl><dl><dt>�Ƽ�</dt><dd><input  type="radio" <%if(hsFieldValue["IsCommend"] != null && hsFieldValue["IsCommend"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="IsCommend" value="1" />��<input  type="radio" <%if(hsFieldValue["IsCommend"] != null && hsFieldValue["IsCommend"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="IsCommend" value="0" />��</dd></dl></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="����" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_U_product" ID="hdnTableName" runat="server" /><asp:HiddenField Value="Title||1,BigImg||11,Content||2,SmallImg||11,Case||11,productclass||6,Slogan||2,effects||2,positioning||2,Outline||11,|0|8,IsCommend|0|4," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000036219372" runat="server" /><input type="hidden" id="hdnModelAlias" value="��Ʒ����" name="hdnModelAlias"/> 
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>