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
<div id="panel"><dl><dt>客户类型</dt><dd><input  type="radio" <%if(hsFieldValue["CustomerType"] != null && hsFieldValue["CustomerType"].ToString().Contains("0")) {Response.Write("checked='checked'");}%>  name="CustomerType" value="0" />经销商<input  type="radio" <%if(hsFieldValue["CustomerType"] != null && hsFieldValue["CustomerType"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="CustomerType" value="1" />工程商<input  type="radio" <%if(hsFieldValue["CustomerType"] != null && hsFieldValue["CustomerType"].ToString().Contains("2")) {Response.Write("checked='checked'");}%>  name="CustomerType" value="2" />最终客户<input  type="radio" <%if(hsFieldValue["CustomerType"] != null && hsFieldValue["CustomerType"].ToString().Contains("3")) {Response.Write("checked='checked'");}%>  name="CustomerType" value="3" />其他客户</dd></dl><dl><dt>公司名称</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["CompanyName"]%>" style="width:300px;"  maxlength="100" name="CompanyName" id="CompanyName" /></dd></dl><dl><dt>客户所在省</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["InArea"]%>" style="width:300px;"  maxlength="30" name="InArea" id="InArea" /></dd></dl><dl><dt>客户所在市</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["InCity"]%>" style="width:300px;"  maxlength="30" name="InCity" id="InCity" /></dd></dl><dl><dt>客户所在区</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["InCountry"]%>" style="width:300px;"  maxlength="30" name="InCountry" id="InCountry" /></dd></dl><dl><dt>联系人</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["Title"]%>" style="width:300px;"  maxlength="512" name="Title" id="Title" /></dd></dl><dl><dt>手机</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["MobilePhone"]%>" style="width:300px;"  maxlength="30" name="MobilePhone" id="MobilePhone" />手机</dd></dl><dl><dt>电话</dt><dd><input  class="validate[optional,regex[\d+,你的电话号码格式有误]]"  type="text" value="<%=hsFieldValue["Tel"]%>" style="width:300px;"  maxlength="30" name="Tel" id="Tel" /></dd></dl><dl><dt>邮箱</dt><dd><input  class="validate[optional,regex[\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+,邮箱地址错误]]"  type="text" value="<%=hsFieldValue["Email"]%>" style="width:300px;"  maxlength="50" name="Email" id="Email" /></dd></dl><dl><dt>MSN</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["msn"]%>" style="width:300px;"  maxlength="50" name="msn" id="msn" /></dd></dl><dl><dt>QQ</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["qq"]%>" style="width:300px;"  maxlength="15" name="qq" id="qq" /></dd></dl><dl><dt>发生问题省份</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["QuestionArea"]%>" style="width:300px;"  maxlength="30" name="QuestionArea" id="QuestionArea" /></dd></dl><dl><dt>型号</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["ModelNumber"]%>" style="width:300px;"  maxlength="50" name="ModelNumber" id="ModelNumber" /></dd></dl><dl><dt>物流编号</dt><dd><input  class="validate[optional]"  type="text" value="<%=hsFieldValue["LogisticsCode"]%>" style="width:300px;"  maxlength="30" name="LogisticsCode" id="LogisticsCode" /></dd></dl><dl><dt>问题分类</dt><dd><input  type="radio" <%if(hsFieldValue["QuestionClassification	"] != null && hsFieldValue["QuestionClassification	"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="QuestionClassification	" value="1" />性能问题<input  type="radio" <%if(hsFieldValue["QuestionClassification	"] != null && hsFieldValue["QuestionClassification	"].ToString().Contains("2")) {Response.Write("checked='checked'");}%>  name="QuestionClassification	" value="2" />外观问题<input  type="radio" <%if(hsFieldValue["QuestionClassification	"] != null && hsFieldValue["QuestionClassification	"].ToString().Contains("3")) {Response.Write("checked='checked'");}%>  name="QuestionClassification	" value="3" />配件问题<input  type="radio" <%if(hsFieldValue["QuestionClassification	"] != null && hsFieldValue["QuestionClassification	"].ToString().Contains("4")) {Response.Write("checked='checked'");}%>  name="QuestionClassification	" value="4" />少发、漏发、多发货问题 </dd></dl><dl><dt>问题具体描述</dt><dd><textarea style="height:80px;width:500px;"   class="validate[optional]"  id="ProblemDescription"  name="ProblemDescription"><%=hsFieldValue["ProblemDescription"]%></textarea></dd></dl><dl><dt>处理意见</dt><dd><textarea style="height:80px;width:500px;"   class="validate[optional]"  id="Treatment Advice"  name="Treatment Advice"><%=hsFieldValue["Treatment Advice"]%></textarea></dd></dl><dl><dt>使用中问题</dt><dd><input  type="radio" <%if(hsFieldValue["InUse"] != null && hsFieldValue["InUse"].ToString().Contains("1")) {Response.Write("checked='checked'");}%>  name="InUse" value="1" />性能问题<input  type="radio" <%if(hsFieldValue["InUse"] != null && hsFieldValue["InUse"].ToString().Contains("2")) {Response.Write("checked='checked'");}%>  name="InUse" value="2" />售后服务问题</dd></dl><dl><dt>起始使用日期</dt><dd><input id="StartDateTime"  value="<%if(hsFieldValue["StartDateTime"].ToString().Equals("DateTime.Now.ToString('yyyy-MM-dd HH:mm:ss')")){Response.Write(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));}else{Response.Write(string.Format("{0:yyyy-MM-dd HH:mm:ss}",hsFieldValue["StartDateTime"]));}%>"   name="StartDateTime" style="width:150px;"  class="Wdate" type="text" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></dd></dl><dl><dt>问题产生日期</dt><dd><input id="CreationDate"  value="<%if(hsFieldValue["CreationDate"].ToString().Equals("none")){Response.Write("");}else{Response.Write(string.Format("{0:yyyy-MM-dd HH:mm:ss}",hsFieldValue["CreationDate"]));}%>"   name="CreationDate" style="width:150px;"  class="Wdate" type="text" onFocus="WdatePicker({lang:'<%=Resources.Model.DateLang%>',skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></dd></dl><dl><dt>情况描述问题具体描述</dt><dd><textarea style="height:80px;width:500px;"   class="validate[optional]"  id="CaseDescription"  name="CaseDescription"><%=hsFieldValue["CaseDescription"]%></textarea></dd></dl><dl><dt>情况描述处理意见</dt><dd><textarea style="height:80px;width:500px;"   class="validate[optional]"  id="CaseTreatmentAdvice"  name="CaseTreatmentAdvice"><%=hsFieldValue["CaseTreatmentAdvice"]%></textarea></dd></dl></div>
<div class="Submit" id="HQB_Operation_Button">
 <asp:Button ID="btnModelManageEdit" OnClick="Edit"  runat="server" />
 <input type="button" value="返回" onclick="back()" />
 </div>
</div>
 <asp:HiddenField ID="hdnFieldFromUrlParamValue" runat="server" Value="" /><asp:hiddenfield ID="hdnNodeCode" runat="server"/><asp:HiddenField Value="K_U_Feedback" ID="hdnTableName" runat="server" /><asp:HiddenField Value="CustomerType|0|4,CompanyName||1,InArea||1,InCity||1,InCountry||1,Title||1,MobilePhone||1,Tel||1,Email||1,msn||1,qq||1,QuestionArea||1,ModelNumber||1,LogisticsCode||1,QuestionClassification	||4,ProblemDescription||2,Treatment Advice||2,InUse|1|4,StartDateTime|DateTime.Now.ToString('yyyy-MM-dd HH:mm:ss')|10,CreationDate|none|10,CaseDescription||2,CaseTreatmentAdvice||2," ID="hdnFieldValue" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000043289629" runat="server" /><input type="hidden" id="hdnModelAlias" value="意见反馈模块" name="hdnModelAlias"/> 
<script type="text/javascript"><%=jsMessage %></script>
 </form>
 </body>
 </html>