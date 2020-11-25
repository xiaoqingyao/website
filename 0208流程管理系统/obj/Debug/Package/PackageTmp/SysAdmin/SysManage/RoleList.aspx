<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoleList.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.RoleManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>角色管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <script type="text/javascript" src="../js/listcheck.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %>
        </h4>
        <div id="searchContainer">
            <p>
                <span>角色名称：</span>
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                <asp:Button ID="btnQuery" runat="server" Text="<%$Resources:Common,Search %>"
                    OnClick="btnQuery_Click" /></p>
        </div>
        <div class="function">
            <asp:Button ID="btnHidAction" runat="server" OnClick="btndel_Click" style="display:none" />
            <asp:Button ID="btnNew" runat="server"  Text="<%$Resources:Common,Add %>"
                OnClick="btnnew_Click" />
            <asp:Button ID="btnDelete" runat="server"  Text="<%$Resources:Common,Del %>"
                 OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;" />
        </div>
        <ul class="ulheader">
            <li style="width: 6%;text-align:center">
               <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
            <li style="width: 29%">角色名称</li>
            <li style="width: 39%">角色描述</li>
            <li style="width: 15%">操作 </li>
        </ul>
        <asp:Repeater ID="rptUserGropeList" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 6%;text-align:center">
                        <input type="checkbox" value='<%#Eval("RoleCode")%>' name="chkId" id="chkId" />
                    </li>
                    <li style="width: 29%"><a href='RoleEdit.aspx?Action=Edit&NodeCode=<%=Request.QueryString["NodeCode"] %>&ID=<%#Eval("RoleCode")%>' id="Title<%# Eval("RoleCode")%>"><%#Eval("RoleName")%></a> </li>
                    <li style="width: 39%">
                        <%#Eval("RoleDescription")%>
                    </li>
                    <li style="width: 15%">
                    <a id="lnkRight"  class="abtn" runat="server" href='<%#"RolePermit.aspx?NodeCode="+Request.QueryString["NodeCode"]+"&RoleCode="+ Eval("RoleCode")+"&NodeId="+NodeID %>'>权限</a> 
                      <asp:LinkButton ID="lnkbDelete" class="abtn" runat="server"
                            CommandName="deldp" ToolTip='<%#Eval("RoleName")%>' CommandArgument='<%#Eval("RoleCode") %>'
                            OnClientClick='selectThisRow();selfconfirm({msg:"确定要执行删除操作吗？",fn:function(data){setAction(data)}});return false;'>删除</asp:LinkButton> 
                </ul>
            </ItemTemplate>
        </asp:Repeater>
        
       <ul class="page">
            <webdiyer:AspNetPager ID="Split" runat="server" CssClass="page" PageSize="20" AlwaysShow="True" UrlPaging="true"
                ShowCustomInfoSection="left" CustomInfoSectionWidth="28%" ShowPageIndexBox="always"
                PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>" 
                HorizontalAlign="Center" NumericButtonCount="6">
            </webdiyer:AspNetPager>
        </ul>
    </div>
    </form>
</body>
</html>
