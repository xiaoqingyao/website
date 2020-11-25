<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewFlowList.aspx.cs"
    Inherits="AllPower.Web.Admin.ReviewFlowList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>审核流程管理</title>
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
<body>
    <form id="theForm" name="theForm" method="post" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <a href="#">系统管理</a> &gt;<span style="color: Blue">审核流程管理</span>
        </h4>
        <div id="searchContainer">
            <p>
            </p>
        </div>
        <div class="function">
            <asp:Button ID="btnHidAction" runat="server" OnClick="btnLogicDel_Click" Style="display: none" />
            <asp:Button ID="btnNew" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnSave_Click" />
            <asp:Button ID="btnOrder" runat="server" Text="<%$Resources:Common,ModelOrder %>"
                OnClick="btnOrders_Click" />
            <asp:Button ID="btnLogicDelete" runat="server" OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;"
                Text="<%$Resources:Common,Del %>" />
        </div>
        <ul class="ulheader">
            <li style="width: 40px">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
            <li style="width: 10%">
                <%= Resources.Common.Orders%></li>
            <li style="width: 15%;">
                <%= Resources.Model.ModelName%></li>
            <li style="width: 25%;">
                <%= Resources.Model.ModelDescribe%></li>
            <li style="width: 15%">
                <%= Resources.Model.ModelEnable%></li>
            <li style="width: 25%;">
                <%= Resources.Common.Operation%></li>
        </ul>
        <asp:Repeater ID="rptModelFileGroup" runat="server" OnItemDataBound="rptModelFileGroup_ItemDataBound">
            <ItemTemplate>
                <asp:HiddenField ID="hdnID" runat="server" Value='<%#Eval("id") %>' />
                <ul class="ulheader ulbody">
                    <li style="width: 40px">
                        <input type="checkbox" name="chkID" value='<%#Eval("id") %>' /></li>
                    <li style="width: 10%">
                        <asp:TextBox ID="txtOrders" runat="server" Text='<%#Eval("orders") %>' Width="30"></asp:TextBox>
                        <asp:HiddenField ID="hidIds" runat="server" Value='<%#Eval("id") %>' />
                    </li>
                    <li style="width: 15%"><span id="Title<%# Eval("ID")%>">
                        <%# Eval("Name")%></span></li>
                    <li style="width: 25%">
                        <%#Eval("Desc")%></li>
                    <li style="width: 15%">
                        <%#AllPower.Common.Utils.ParseState(Eval("isenable"), Resources.Common.ON)%></li>
                    <li style="width: 25%">
                        <asp:Panel ID="palBtn" runat="server">
                            <asp:LinkButton ID="lnkbDelete" CssClass="abtn" Text="<%$ Resources:Common,Del%> "
                                OnClientClick="selectThisRow();selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;"
                                runat="server"></asp:LinkButton>
                            <asp:LinkButton ID="lbtnState" CssClass="abtn" OnCommand="lbtnEnable_Click" CommandArgument='<%#Eval("id")+"|"+Eval("IsEnable") %>'
                                runat="server" Text='<%#AllPower.Common.Utils.ParseStateTitle(!Convert.ToBoolean(Eval("IsEnable")),Resources.Common.ON) %>'></asp:LinkButton>
                            <a id="lnkEdit" runat="server" class="abtn" href='<%#"ReviewFlowEdit.aspx?action=edit&NodeCode="+NodeCode+"&id="+Eval("id") %>'>
                                <%= Resources.Common.Update%></a> <a class="abtn" href="FlowStepList.aspx?NodeCode=<%=NodeCode %>&flowId=<%#Eval("id") %>">
                                    <%= Resources.Model.StepManage%></a>
                        </asp:Panel>
                    </li>
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

    <script type="text/javascript">        function hrefDisable(containter) {
            $(containter).find("a").each(function() {
                $(this).attr("href", "");
            });
        }</script>

</body>
</html>
