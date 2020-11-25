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
<div id="panel"><dl><dt>姓名</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Title"]%>" style="width:180px;"  maxlength="512" name="Title" id="Title" /></dd></dl><dl><dt>公司名称</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Company"]%>" style="width:400px;"  maxlength="128" name="Company" id="Company" /></dd></dl><dl><dt>公司地址</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["ContactAddr"]%>" style="width:300px;"  maxlength="128" name="ContactAddr" id="ContactAddr" /></dd></dl><dl><dt>性别</dt><dd><input  type="radio" <%if(hsFieldValue["Gender"] != null && hsFieldValue["Gender"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="Gender" value="1" />男<input  type="radio" <%if(hsFieldValue["Gender"] != null && hsFieldValue["Gender"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="Gender" value="0" />女</dd></dl><dl><dt>电话</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Tel"]%>" style="width:300px;"  maxlength="30" name="Tel" id="Tel" /></dd></dl><dl><dt>EMail</dt><dd><input  class="validate[optional,regex[\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+,你的email输入错误]]"  type="text" value="<%=hsFieldValue["EMail"]%>" style="width:100px;"  maxlength="128" name="EMail" id="EMail" /></dd></dl><dl><dt>地址</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["city"]%>" style="width:100px;"  maxlength="50" name="city" id="city" /></dd></dl><dl><dt>身份证</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["cards"]%>" style="width:100px;"  maxlength="18" name="cards" id="cards" /></dd></dl><dl><dt>行业经验</dt><dd><input  type="radio" <%if(hsFieldValue["Industry"] != null && hsFieldValue["Industry"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="Industry" value="1" />是<input  type="radio" <%if(hsFieldValue["Industry"] != null && hsFieldValue["Industry"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="Industry" value="0" />否</dd></dl><dl><dt>几年行业经验</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["yearsindustry"]%>" style="width:100px;"  maxlength="30" name="yearsindustry" id="yearsindustry" /></dd></dl><dl><dt>现从事行业</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["trade"]%>" style="width:100px;"  maxlength="30" name="trade" id="trade" /></dd></dl><dl><dt>资金状况</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Funds"]%>" style="width:100px;"  maxlength="30" name="Funds" id="Funds" /></dd></dl><dl><dt>计划地址</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Programcity"]%>" style="width:100px;"  maxlength="30" name="Programcity" id="Programcity" /></dd></dl><dl><dt>计划面积</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Programarea"]%>" style="width:100px;"  maxlength="30" name="Programarea" id="Programarea" /></dd></dl><dl><dt>理想店铺</dt><dd><input  type="radio" <%if(hsFieldValue["Idealshop"] != null && hsFieldValue["Idealshop"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="Idealshop" value="1" />是<input  type="radio" <%if(hsFieldValue["Idealshop"] != null && hsFieldValue["Idealshop"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="Idealshop" value="0" />否</dd></dl><dl><dt>店面使用权</dt><dd><input  type="radio" <%if(hsFieldValue["Storeaccess"] != null && hsFieldValue["Storeaccess"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="Storeaccess" value="1" />自用<input  type="radio" <%if(hsFieldValue["Storeaccess"] != null && hsFieldValue["Storeaccess"].ToString().Contains("2")) {Response.Write("checked='checked'");}%>  name="Storeaccess" value="2" />租用</dd></dl><dl><dt>店铺面积</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["shoparea"]%>" style="width:100px;"  maxlength="30" name="shoparea" id="shoparea" /></dd></dl><dl><dt>开业日期</dt><dd><input id="Openingdate"  value="<%if(hsFieldValue["Openingdate"].ToString().Equals("DateTime.Now.ToString('yyyy-MM-dd')")){Response.Write(DateTime.Now.ToString("yyyy-MM-dd"));}else{Response.Write(string.Format("{0:yyyy-MM-dd}",hsFieldValue["Openingdate"]));}%>"   name="Openingdate" style="width:100px;"  class="Wdate" type="text" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/></dd></dl><dl><dt>发展规划</dt><dd><textarea style="height:400px;width:500px;"   class="validate[optional]"  id="planning"  name="planning"><%=hsFieldValue["planning"]%></textarea></dd></dl></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="返回" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_U_Tojoin" ID="hdnTableName" runat="server" /><asp:HiddenField Value="Title||1,Company||1,ContactAddr||1,Gender|0|4,Tel||1,EMail||1,city||1,cards||1,Industry|0|4,yearsindustry|1|1,trade||1,Funds||1,Programcity||1,Programarea||1,Idealshop|0|4,Storeaccess|1|4,shoparea||1,Openingdate|DateTime.Now.ToString('yyyy-MM-dd')|10,planning||2," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000038357812" runat="server" /><input type="hidden" id="hdnModelAlias" value="网上加盟" name="hdnModelAlias"/> 
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>