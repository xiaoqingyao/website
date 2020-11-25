<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvertisementList.aspx.cs"
    Inherits="AllPower.Web.Admin.AdvertisementList" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>广告管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <script type="text/javascript" src="../js/listcheck.js"></script>

    <script type="text/javascript" src="../js/regExp.js"></script>

    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script type="text/javascript" src="../js/Common.js"></script>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <form id="Form1" name="theForm" method="post" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： 扩展应用 &gt;<a href="AdvertisingList.aspx?NodeCode=<%=NodeCode %>">广告版位管理</a> &gt;
            <span style="color: Blue">广告列表</span>
        </h4>
        <div id="searchContainer">
            <p>
                <%= Resources.Common.Name%><asp:TextBox ID="txtGroupName" runat="server"></asp:TextBox>&nbsp;&nbsp;
                <asp:Button ID="btnKeySerach" runat="server" Text="<%$Resources:Common,Search %>"
                    OnClick="btnKeySerach_Click" />
            </p>
        </div>
        <div class="function">
            <asp:Button ID="btnHidAction" runat="server" OnClick="btnLogicDel_Click" Style="display: none" />
            <asp:Button ID="btnBack" runat="server" Text="返回广告位管理" OnClick="btnBack_Click" />
            <asp:Button ID="btnNew" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnSave_Click" />
            <asp:Button ID="btnLogicDelete" runat="server" OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;"
                Text="<%$Resources:Common,Del %>" />
        </div>
        <ul class="ulheader">
            <li style="width: 40px">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
            <li style="width: 5%">
                <%= Resources.Common.Orders%></li>
            <li style="width: 15%;">
                <%= Resources.Common.Name%></li>
            <li style="width: 10%;">
                <%= Resources.Model.Type%></li>
            <li style="width: 10%;">
                <%= Resources.Model.Weight%></li>
            <li style="width: 10%;">
                <%= Resources.Model.ClickCount%></li>
            <li style="width: 10%;">
                <%= Resources.Model.ViewCount%></li>
            <li style="width: 10%;">
                <%= Resources.Model.LastTime%></li>
            <li style="width: 5%;">状态</li>
            <li style="width: 15%;">
                <%= Resources.Common.Operation%></li>
        </ul>
        <asp:Repeater ID="rptModelFileGroup" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 40px">
                        <input type="checkbox" name="chkID" value='<%#Eval("id") %>' /></li>
                    <li style="width: 5%">
                        <%#Eval("orders") %></li>
                    <li style="width: 15%;"><span id="Title<%# Eval("ID")%>">
                        <%# Eval("Name")%></span></li>
                    <li style="width: 10%;">
                        <%#GetAdvertisingType(Eval("Type").ToString())%></li>
                    <li style="width: 10%;">
                        <%#Eval("Weight")%></li>
                    <li style="width: 10%;">
                        <%#Eval("ClickCount").ToString()%></li>
                    <li style="width: 10%;">
                        <%#Eval("ViewCount").ToString()%></li>
                    <li style="width: 10%;">
                        <%#Eval("ExpiredTime").ToString()%></li>
                    <li style="width: 5%">
                        <%#AllPower.Common.Utils.ParseState((Eval("IsEnable")), "0")%></li>
                    <li style="width: 15%;">
                        <asp:LinkButton ID="lbtnDel" CssClass="abtn" Text="<%$ Resources:Common,Del%> " OnClientClick="selectThisRow();selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;"
                            runat="server"></asp:LinkButton>
                        <asp:LinkButton ID="lbtnEnable" CssClass="abtn" OnCommand="lbtnEnable_Click" CommandArgument='<%#Eval("id")+"|"+Eval("IsEnable") %>'
                            runat="server" Text='<%#AllPower.Common.Utils.ParseStateTitle(!Convert.ToBoolean(Eval("IsEnable")),Resources.Common.ON) %>'></asp:LinkButton>
                        <a href="AdvertisementEdit.aspx?action=edit&nodecode=<%=NodeCode %>&id=<%#Eval("id") %>"
                            class="abtn">
                            <%= Resources.Common.Update%></a></li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
        <ul>
            <webdiyer:AspNetPager ID="AspNetPager1" CssClass="page" runat="server" PageSize="15"
                AlwaysShow="True" OnPageChanged="AspNetPager1_PageChanged" ShowCustomInfoSection="Left"
                ShowPageIndexBox="always" PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>"
                UrlPaging="True">
            </webdiyer:AspNetPager>
        </ul>
        <br clear="left" />
    </div>
    </form>
</body>
</html>
