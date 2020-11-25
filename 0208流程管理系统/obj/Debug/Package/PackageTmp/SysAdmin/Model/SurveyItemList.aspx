<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyItemList.aspx.cs"
    Inherits="AllPower.Web.Admin.SurveyItemList" %>

<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>问卷调查选项列表</title>
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
    <form name="theForm" method="post" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <a href="#">内容管理</a><a> &gt;</a> <a href="SurveyList.aspx?NodeCode=<%=NodeCode %>">
                问卷调查管理</a><a> &gt;</a> <font color="blue">问卷调查选项</font>
        </h4>
        <div id="searchContainer">
            <p>
                <span>
                    <%= Resources.Common.Name%></span>
                <asp:TextBox ID="txtGroupName" runat="server" Style="width: 240px;"></asp:TextBox>
                <asp:Button ID="btnQuery" runat="server" Text="<%$Resources:Common,Search %>" OnClick="btnKeySerach_Click" />
            </p>
        </div>
        <div class="function">
            <asp:Button ID="btnHidAction" runat="server" OnClick="btnDel_Click" Style="display: none" />
            <asp:Button ID="btnBack" runat="server" Text="返回问卷调查管理" OnClick="btnBack_Click" />
            <asp:Button ID="btnNew" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnNew_Click" />
            <asp:Button ID="btnOrder" runat="server" Text="<%$Resources:Common,ModelOrder %>"
                OnClick="btnOrders_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="<%$Resources:Common,Del %>" OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;" />
        </div>
        <ul class="ulheader">
            <li style="width: 40px">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
            <li style="width: 10%">
                <%= Resources.Common.Orders%></li>
            <li style="width: 25%;">
                <%= Resources.Common.Name%></li>
            <li style="width: 25%;">
                <%= Resources.Common.Type%></li>
            <li style="width: 30%;">
                <%= Resources.Common.Operation%></li>
        </ul>
        <asp:Repeater ID="rptModelFileGroup" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 40px">
                        <input type="checkbox" name="chkID" value='<%#Eval("id") %>' /></li>
                    <li style="width: 10%">
                        <asp:TextBox ID="txtOrders" runat="server" Text='<%#Eval("orders") %>' Width="30"></asp:TextBox><asp:HiddenField
                            ID="hidIds" runat="server" Value='<%#Eval("id") %>' />
                    </li>
                    <li style="width: 25%"><span id="Title<%# Eval("ID")%>">
                        <%# Eval("Name")%></span></li>
                    <li style="width: 25%">
                        <%#GetType(Eval("Type").ToString())%></li>
                    <li style="width: 30%">
                        <asp:LinkButton ID="lnkbDelete" CssClass="abtn" Text="<%$ Resources:Common,Del%> "
                            OnClientClick="selectThisRow();selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;"
                            runat="server"></asp:LinkButton>
                        <a id="lnkEdit" class="abtn" runat="server" href='<%#"SurveyItemEdit.aspx?action=edit&NodeCode="+NodeCode+"&nid="+StrNid+"&id="+Eval("id") %>'>
                            <%= Resources.Common.Update%></a> </li>
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
