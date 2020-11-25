<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecyclingAssociatedEdit.aspx.cs" Inherits="KingTop.Web.Admin.RecyclingAssociatedEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>添加回收站信息关联表</title>    
 <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
<script type="text/javascript" src="../js/publicform.js"></script>
    
    <link href="../CSS/validationEngine.jquery.css" rel="stylesheet" type="text/css" />   
     <script src="../JS/Common.js" type="text/javascript"></script>
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
        <script type="text/javascript" src="../js/Advertising.js"></script>
        <script src="../Calendar/WdatePicker.js" type="text/javascript"></script>
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
    <form id="theForm" runat="server" >
 <input type="hidden" id="hidLogTitle" runat="server" />
<div class="container">
<h4>位置： <a href="#">内容管理</a> > <a href="#">回收站管理</a> <span class="breadcrumb_current" >添加回收站信息关联表</span></h4> 

<dl>
<dt>表名</dt>
<dd>
<asp:DropDownList ID="ddlRecyclingManageID" runat="server"></asp:DropDownList>
</dd>
</dl>
<dl>
<dt>关联表名</dt>
<dd>  
<asp:DropDownList ID="ddlAssociatedID" runat="server"></asp:DropDownList>
</dd>
</dl>

<dl>
<dt>关联字段</dt>
<dd>
            <asp:TextBox ID="txtAssociatedKey"  CssClass="validate[required]" runat="server"></asp:TextBox>
</dd>
</dl>
<dl>
<dt>关联字段是否条件</dt>
<dd>
   <asp:CheckBox ID="cbKeyIsWhere" runat="server" Checked="true"></asp:CheckBox>
</dd>
</dl>
<dl>
<dt>关联条件</dt>
<dd>
   <asp:TextBox ID="txtAssociatedWhere" runat="server"></asp:TextBox>
</dd>
</dl>

<div style="clear:left"></div>

<div class="Submit">
<asp:Button ID="btnSave" runat="server" Text="<%$Resources:Common,Add %>" onclick="btnSave_Click" />
                        
                            &nbsp;<input type="button" name="Submit422" value="<%= Resources.Common.Back %>"  onClick='location.href="RecyclingAssociatedList.aspx<%=StrPageParams %>";' >
</div>
</div>     
    </form>
</body>
</html>