<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewFlowStateList.aspx.cs"
    Inherits="KingTop.Web.Admin.ReviewFlowStateList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>审核流程状态管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
            位置： <a href="#">系统管理</a>&gt;<span style="color: Blue"> 审核流程状态管理</span></h4>
        <div id="searchContainer">
            <p>
            </p>
        </div>
        <div class="function">
            <div class="function">
                <asp:Button ID="btnNew" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnSave_Click" />
                <asp:Button ID="btnLogicDelete" runat="server" OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;"
                    Text="<%$Resources:Common,Del %>" />
                <asp:Button ID="btnHidAction" runat="server" OnClick="btnLogicDel_Click" Style="display: none" />
            </div>
        </div>
        <ul class="ulheader">
            <li style="width: 40px">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
            <li style="width: 10%">
                <%= Resources.Common.Name%></li>
            <li style="width: 25%;">
                <%= Resources.Model.ModelValue%></li>
            <li style="width: 25%;">
                <%= Resources.Model.ModelDescribe%></li>
            <li style="width: 15%">
                <%= Resources.Common.Type%></li>
            <li style="width: 15%;">
                <%= Resources.Common.Operation%></li>
        </ul>
        <asp:Repeater ID="rptModelFileGroup" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 40px">
                        <input type="checkbox" name="chkID" value='<%#Eval("id") %>' /></li>
                    <li style="width: 10%"><span id="Title<%# Eval("ID")%>">
                        <%#Eval("Name") %></span></li>
                    <li style="width: 25%">
                        <%#Eval("StateValue")%></li>
                    <li style="width: 25%">
                        <%#Eval("Desc")%></li>
                    <li style="width: 15%">
                        <%#KingTop.Common.Utils.ParseModelType(Eval("type"))%></li>
                    <li style="width: 15%">
                        <asp:LinkButton ID="lnkbDelete" CssClass="abtn" Text="<%$ Resources:Common,Del%> "
                            OnClientClick="selectThisRow();selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;"
                            Enabled='<%#Convert.ToBoolean(Eval("type").ToString()=="0"?"False":"True") %>'
                            runat="server"></asp:LinkButton>
                        <%#Eval("type").ToString() == "0" ? "<a class='abtn'>" : "<a class='abtn' id='lnkEdit' runnat='server' href='ReviewFlowStateEdit.aspx?NodeCode=" + NodeCode + "&action=edit&id=" + Eval("id").ToString() + "'/>"%><%= Resources.Common.Update%></a>
                    </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
        <webdiyer:AspNetPager ID="AspNetPager1" CssClass="page" runat="server" PageSize="15"
            AlwaysShow="True" OnPageChanged="AspNetPager1_PageChanged" ShowCustomInfoSection="Left"
            ShowPageIndexBox="always" PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>"
            UrlPaging="True">
        </webdiyer:AspNetPager>
        <br clear="left" />
    </div>
    </form>
</body>
</html>
