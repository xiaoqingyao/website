<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecyclingManageEdit.aspx.cs" Inherits="KingTop.Web.Admin.RecyclingManageEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>添加回收站管理表</title>    
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
<h4>位置： <%GetPageNav(NodeCode); %> > <span class="breadcrumb_current" >添加回收站管理表</span></h4> 

<dl>
<dt>表名</dt>
<dd>
<asp:TextBox ID="txtName" Width="200" runat="server" CssClass="validate[required,length[1,64]]"></asp:TextBox>*
</dd>
</dl>
<dl>
<dt><%=Resources.Common.Describe%></dt>
<dd>  
<asp:TextBox ID="txtDesc" runat="server" Height="99px" Width="365px" ></asp:TextBox>*
</dd>
</dl>

<dl>
<dt>表主键</dt>
<dd>
            <asp:TextBox ID="txtpKey" Text="ID" CssClass="validate[required]" runat="server"></asp:TextBox>
</dd>
</dl>

<dl>
<dt>删除字段</dt>
<dd>
   <asp:TextBox ID="txtdelKey" runat="server"  Text="isDel" CssClass="validate[required]" ></asp:TextBox>
</dd>
</dl>

<dl>
<dt>标题字段</dt>
<dd>
<asp:TextBox ID="txtTitleKey" runat="server"  Text="Title" CssClass="validate[required]" ></asp:TextBox>
</dd>
</dl>

<dl>
<dt>删除时间字段</dt>
<dd>
 <asp:TextBox ID="txtdelTimeKey"  Text="delTime" CssClass="validate[required]"  runat="server"></asp:TextBox>
</dd>
</dl>


<dl>
<dt>是否需要回收站管理</dt>
<dd>
<asp:CheckBox ID="cbIsManage" runat="server" Checked="true" /> <%=Resources.Common.Yes%>
</dd>
</dl>

<dl style="display:none">
<dt>是否受主表还原控制</dt>
<dd>
<asp:CheckBox ID="cbIsReductive" runat="server" /> <%=Resources.Common.Yes%>
</dd>
</dl>

<dl style="display:none">
<dt>列表地址</dt>
<dd>
<asp:TextBox ID="txtListUrl" runat="server"></asp:TextBox>
</dd>
</dl>


<dl>
<dt>是否使用存储过程删除</dt>
<dd>
<asp:CheckBox ID="cbIsProcDel" runat="server" /> <%=Resources.Common.Yes%>
</dd>
</dl>

<dl>
<dt>存储过程删除命令</dt>
<dd>
<asp:TextBox ID="txtProcDelText" runat="server" Width="400"></asp:TextBox>   提示:{ID}表示当前要操作记录的表主键
</dd>
</dl>

<dl style="display:none">
<dt>是否使用存储过程还原</dt>
<dd>
<asp:CheckBox ID="cbIsProcReductive" runat="server" /> <%=Resources.Common.Yes%>
</dd>
</dl>

<dl style="display:none">
<dt>存储过程还原命令</dt>
<dd>
<asp:TextBox ID="txtProcReductiveText" runat="server"></asp:TextBox> <%=Resources.Model.VoteIPCountMessage%>
</dd>
</dl>
<dl>
<dt>所属节点是否使用描述文字</dt>
<dd>
<asp:CheckBox ID="cbIsOnDesc" runat="server" /> <%=Resources.Common.Yes%>
</dd>
</dl>

<div style="clear:left"></div>

<div class="Submit">
<asp:Button ID="btnSave" runat="server" Text="<%$Resources:Common,Add %>" onclick="btnSave_Click" />
                        
                            &nbsp;<input type="button" name="Submit422" value="<%= Resources.Common.Back %>"  onClick='location.href="RecyclingManageList.aspx<%=StrPageParams %>";' >
</div>
</div>     
    </form>
</body>
</html>