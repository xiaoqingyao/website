<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommonFieldGroupList.aspx.cs" EnableEventValidation="false" Inherits="KingTop.WEB.SysAdmin.Model.CommonFieldGroupList" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/Common.js"></script>
</head>
<body>
    <form id="theForm" runat="server">
        <input type="hidden" name="hidLogTitle" id="hidLogTitle" />
    <div class="container">
        <h4>
            当前位置： <%GetPageNav(NodeCode);%></h4>
            <div class="function">
        <ul style=" list-style:none; height:25px;">
            <li>    
                <input type="button"  value="添加分组" onclick="javascript:location.href='CommonFieldGroupEdit.aspx?action=add&NodeCode=<%=NodeCode %>';">
            </li>
        </ul>
        </div>
             <ul class="ulheader">
            <li style="width:220px;">分组名称</li>
            <li style="width: 120px;">添加用户</li>
            <li style="width: 80px;">排序</li>
            <li style="width: 300px;">操作</li>
        </ul>
        <asp:Repeater ID="rptCommonFieldGroup" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">    
        <li style="width:220px;"><span id="Title<%# Eval("ID")%>"> <%#Eval("Name") %></span></li>
    <li style="width: 120px;"><%#Eval("AddMan") %></li>
            <li style="width: 80px;"><input type="text" style="width: 70px;" value="<%#Eval("Orders") %>" onblur="setOrders('k_ModelcommonFieldGroup', '<%#Eval("ID") %>', this.value)" /></li>
            <li style="width:300px;">
            <input type="button" value="修改" id="btnEdit"  onclick="location.href='CommonFieldGroupEdit.aspx?action=edit&id=<%# Eval("ID")%>'"/>
            <asp:Button ID="btnDelete" runat="server" OnCommand="CommonFieldGroup_Del" CommandName="deldp" CommandArgument='<%#Eval("ID") %>' OnClientClick="return reConfirm(this,'确定要删除这个分组吗?');" RecordID='<%#Eval("ID") %>'  Text="删除"></asp:Button>
            </li> 
            </ul>
            </ItemTemplate>
        </asp:Repeater>
</div> 
    </form>
    <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>
