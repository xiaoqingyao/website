<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModelList.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.ModelList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>模块管理</title>
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
                <span>模块名称：</span>
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                <asp:Button ID="btnQuery" runat="server" Text="<%$Resources:Common,Search %>"
                    OnClick="btnQuery_Click" /></p>
        </div>
        <div class="function">
            <asp:Button ID="btnHidAction" runat="server" OnClick="btnDelete_Click" style="display:none" />
            <asp:Button ID="btnNew" runat="server"  Text="<%$Resources:Common,Add %>"
                OnClick="btnNew_Click" />
            <asp:Button ID="btnDelete"  runat="server" Text="<%$Resources:Common,Del %>" OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;"
              />
        </div>
        <ul class="ulheader">
            <li style="width: 5%; text-align:center">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
            <li style="width: 7%">模块编码</li>
            <li style="width: 18%">模块名称</li>
            <li style="width: 15%">英文名称</li>
            <li style="width: 25%">链接地址</li>
            <li style="width: 5%">系统模块</li>
            <li style="width: 6%">状态</li>
            <li style="width: 10%">操作</li>
        </ul>
        <asp:Repeater ID="rptModelList" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 5%;text-align:center">
                        <input type="checkbox" name="chkId" id="chkId" value='<%#Eval("ModuleID")%>' /></li>
                    <li style="width: 7%">
                        <%#Eval("ModuleCode")%>
                    </li>
                    <li style="width: 18%"><a href='<%#"ModelEdit.aspx?action=Edit&NodeCode="+NodeCode+"&NodeID="+NodeID+"&ModuleID="+Eval("ModuleID").ToString()%>' id="Title<%# Eval("ModuleID")%>"><%#Eval("ModuleName")%></a> </li>
                    <li style="width: 15%">
                        <%#Eval("ModuleEncDesc")%>
                    </li>
                    <li style="width: 25%">
                        <%#Eval("linkUrl")%>
                    </li>
                    <li style="width: 5%">
                        <%#AllPower.Common.Utils.ParseIsOrNot((Eval("IsSystem").ToString()),"0")%></li>
                    <li style="width: 6%">
                        <%#AllPower.Common.Utils.ParseState((Eval("IsValid").ToString()),"0")%>
                    </li>
                    <li style="width: 10%">
                    <asp:LinkButton ID="lnkbState" class="abtn" runat="server" OnCommand="ModelList_State"
                           CommandName="Statedp" ToolTip='<%#Eval("ModuleName")%>' CommandArgument='<%#Eval("ModuleID")+"|"+Eval("IsValid") %>'><%# AllPower.Common.Utils.ParseStateTitle(!AllPower.Common.Utils.ParseBool(Eval("IsValid").ToString()), "0")%></asp:LinkButton>
                    <asp:LinkButton ID="lnkbDelete" class="abtn" runat="server" OnCommand="ModelList_Del"
                           CommandName="deldp" ToolTip='<%#Eval("ModuleName")%>' CommandArgument='<%#Eval("ModuleID") %>'
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
        <br clear="left" />
    </div>
    </form>
</body>
</html>
