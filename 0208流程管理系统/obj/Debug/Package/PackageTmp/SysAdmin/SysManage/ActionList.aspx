<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActionList.aspx.cs" Inherits="AllPower.Web.Admin.ActionList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>操作管理</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <script type="text/javascript" src="../js/listcheck.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>    
    <script type="text/javascript" src="../js/common.js"></script>
    
    <script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/skin.js"></script>
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
                <select name="searchType">
                <option value="ModuleName">模块名称</option>
                <option value="OperName"<%if(AllPower.Common.Utils.UrlDecode(Request.QueryString["searchType"])=="OperName"){Response.Write(" selected");} %>>操作名称</option>
                </select>
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                <asp:Button ID="btnQuery" runat="server" Text="<%$Resources:Common,Search %>"
                    OnClick="btnQuery_Click" /></p>
        </div>
        <div class="function">
            <asp:Button ID="btnHidAction" runat="server" OnClick="btndel_Click" style="display:none" />
            <asp:Button ID="btnNew" runat="server" Text="<%$Resources:Common,Add %>"
                OnClick="btnNew_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="<%$Resources:Common,Del %>" OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;"
              />
        </div>
        <ul class="ulheader">
            <li style="width: 40px; text-align:center" >
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
            <li style="width: 10%">操作编码</li>
            <li style="width: 30%">操作名称</li>
            <li style="width: 10%">英文名称</li>
            <li style="width: 20%">模块名称</li>
            <li style="width: 10%">状态</li>
            <li style="width: 13%">操作</li>
        </ul>
        <asp:Repeater ID="rptActionList" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 40px;text-align:center">
                     <input type="checkbox" name="chkId" value='<%#Eval("ID")%>' />
                    </li>
                    <li style="width: 10%">
                        <%#Eval("OperCode")%></li>
                    <li style="width: 30%"><a href='ActionEdit.aspx?action=Edit&NodeCode=<%=NodeCode %>&ID=<%#Eval("ID") %>'  id="Title<%# Eval("ID")%>"><%#Eval("OperName")%></a></li>
                    <li style="width: 10%">
                        <%#Eval("OperEngDesc")%>
                    </li>
                    <li style="width: 20%">
                        <%#Eval("ModuleName")%>
                    </li>
                    <li style="width: 10%">
                        <%#AllPower.Common.Utils.ParseState((Eval("IsValid").ToString()),"0")%>
                    </li>
                    <li style="width: 13%">
                        <asp:LinkButton ID="lnkbState" class="abtn" runat="server" OnCommand="ActionList_State"
                            CommandName="Statedp" ToolTip='<%#Eval("OperName")%>' CommandArgument='<%#Eval("ID")+"|"+Eval("IsValid") %>'><%# AllPower.Common.Utils.ParseStateTitle(!AllPower.Common.Utils.ParseBool(Eval("IsValid").ToString()), "0")%></asp:LinkButton> 
                        <asp:LinkButton ID="lnkbDelete" class="abtn" runat="server" OnCommand="ActionList_Del"
                            CommandName="deldp" ToolTip='<%#Eval("OperName")%>' CommandArgument='<%#Eval("ID") %>'
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
