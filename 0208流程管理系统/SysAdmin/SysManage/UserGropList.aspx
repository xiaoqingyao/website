<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserGropList.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.SysManage.UserGropManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>用户组管理</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <script type="text/javascript" src="../js/listcheck.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script type="text/javascript" src="../js/Common.js"></script>
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
            <span>用户组名称：</span>
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            <asp:Button ID="btnQuery" runat="server" Text="<%$Resources:Common,Search %>" OnClick="btnQuery_Click" /></p>
        </div>
        <div class="function">
            <asp:Button ID="btnHidAction" runat="server" OnClick="butdel_Click" style="display:none" />
            <asp:Button ID="btnNew" runat="server"  Text="<%$Resources:Common,Add %>" OnClick="Butnew_Click" />
            <asp:Button ID="btnDelete" runat="server"  Text="<%$Resources:Common,Del %>"  OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;"
                />
            
        </div>
        <ul class="ulheader">
            <li style="width: 5%;text-align:center">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
            <li style="width: 30%">
                    <div align="left">
                        用户组名称</div>
                </li>
                <li style="width: 20%">
                    <div align="left">
                        父用户组</div>
                </li>
                 <li style="width: 30%">
                    <div align="left">
                        所属角色</div>
                </li>
                 <li style="width: 10%">
                    操作
                </li>
            </ul>
            <asp:Repeater ID="rptUserGropeList" runat="server">
                <ItemTemplate>
                    <ul class="ulheader ulbody">
                    <li style="width: 5%;text-align:center"> <input type="checkbox" value='<%#Eval("UserGroupCode")%>' name="chkId" id="chkId" />
                      </li>
                        <li style="width: 30%">
                            <a href='UserGropEdit.aspx?Action=Edit&NodeCode=<%=NodeCode %>&NodeID=<%=NodeID%>&ID=<%#Eval("UserGroupCode")%>' id="Title<%# Eval("UserGroupCode")%>"><%#GetGroupName(Eval("UserGroupName").ToString(), Eval("NumCode").ToString())%></a>
                        </li>
                        <li style="width: 20%">
                            <%#GetFatherGroupName(Eval("ParentNumCode").ToString())%>
                        </li>
                        <li style="width: 30%">
                            <%#GetRoleName(Eval("UserGroupCode").ToString())%>
                        </li>
                        <li style="width: 10%">
                            <%--<a runat="server" class="abtn" id="lnkNew" href='<%# "UserGropEdit.aspx?NodeCode="+NodeCode+"&NodeID="+NodeID+"&RoleCode="+RoleCode+"&UserGropCode="+Eval("UserGroupCode") %>'>
                                添加子用户组</a> --%>
                            <a runat="server" class="abtn" id="lnkRight" href='<%# "UserGropPermit.aspx?NodeCode="+NodeCode+"&NodeID="+NodeID+"&RoleCode="+RoleCode+"&UserGropCode="+Eval("UserGroupCode") %>'>
                                权限</a> 
                             
                            <asp:LinkButton ID="lnkbDelete" class="abtn" runat="server"
                            CommandName="deldp" ToolTip='<%#Eval("UserGroupName")%>' CommandArgument='<%#Eval("UserGroupCode") %>'
                            OnClientClick='selectThisRow();selfconfirm({msg:"确定要执行删除操作吗？",fn:function(data){setAction(data)}});return false;'>删除</asp:LinkButton>                            
                        </li>
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
