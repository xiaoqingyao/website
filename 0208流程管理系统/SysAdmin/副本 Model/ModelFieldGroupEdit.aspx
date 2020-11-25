<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModelFieldGroupEdit.aspx.cs" Inherits="KingTop.Web.Admin.ModelFieldGroupEdit" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>添加关键字</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
<script type="text/javascript" src="../js/publicform.js"></script>
    
    <link href="../CSS/validationEngine.jquery.css" rel="stylesheet" type="text/css" />   
     <script src="../JS/Common.js" type="text/javascript"></script>
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>
        <script type="text/javascript">
            $(document).ready(function() { $("#theForm").validationEngine({ validationEventTriggers:"blur",  //触发的事件  validationEventTriggers:"keyup blur",
			inlineValidation: true,//是否即时验证，false为提交表单时验证,默认true
			success :  false,//为true时即使有不符合的也提交表单,false表示只有全部通过验证了才能提交表单,默认false
			promptPosition: "topRight"//提示所在的位置，topLeft, topRight, bottomLeft,  centerRight, bottomRight
			}) });
    </script>
</head>

<body>
    <form id="theForm" runat="server">
  <input type="hidden" id="hidLogTitle" runat="server" />

<div class="container">
<h4>位置： <a href="#">内容管理</a> > <a href="#">模型管理</a> > <a href="#">分组管理</a> > <span class="breadcrumb_current" >添加分组</span><asp:Button ID="Button1" runat="server" Text="中文" onclick="Button1_Click" 
                          style="height: 26px" />
&nbsp;&nbsp;
                      <asp:Button ID="Button2" runat="server" Text="英文" onclick="Button2_Click" /></h4> 

<dl>
<dt><%=Resources.Model.ModelFieldGroupName%></dt>
<dd>
<asp:TextBox ID="txtName" runat="server" CssClass="validate[required,length[1,64]]"></asp:TextBox>*
</dd>
</dl>
<dl>
<dt><%=Resources.Model.ModelField%></dt>
<dd>  
   <asp:DropDownList ID="ddlModelList" runat="server"></asp:DropDownList>
</dd>
</dl>
<dl>
<dt><%=Resources.Model.IsEnable %></dt>
<dd>
<asp:CheckBox ID="IsEnable" runat="server" />
</dd>
</dl>

<div style="clear:left"></div>

<div class="Submit">
<asp:Button ID="btnSave" runat="server"  Text="<%$Resources:Common,Add %>" onclick="btnSave_Click" />&nbsp;<input type="button" name="Submit422" value="<%= Resources.Common.Back %>"  onClick='location.href="ModelFieldGroupList.aspx<%=StrPageParams %>";' >
</div>
</div>
    </form>
</body>
</html>





