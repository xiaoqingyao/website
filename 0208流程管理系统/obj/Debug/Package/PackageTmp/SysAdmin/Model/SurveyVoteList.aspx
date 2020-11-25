<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyVoteList.aspx.cs"
    Inherits="AllPower.Web.Admin.SurveyVoteList" %>

<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>问卷调查结果列表</title>
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
            位置： <a href="#">扩展应用</a><a> &gt;</a> <a href="SurveyList.aspx?NodeCode=<%=NodeCode %>">
                问卷调查管理</a><a> &gt;</a> <span style="color: Blue">问卷调查结果列表</span>
        </h4>
        <div class="function">
            <asp:Button ID="btnHidAction" runat="server" OnClick="btnDel_Click" Style="display: none" />
            <asp:Button ID="btnBack" runat="server" Text="返回问卷调查管理" OnClick="btnBack_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="<%$Resources:Common,Del %>" OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;" />
        </div>
        <ul class="ulheader">
            <li style="width: 40px">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
            <asp:Repeater ID="rptTitle" runat="server">
                <ItemTemplate>
                    <li style="width: 10%">
                        <%#Eval("name").ToString() == "username" ? "用户名" : Eval("name").ToString()%></li>
                </ItemTemplate>
            </asp:Repeater>
            <li style="width: 5%;">
                <%= Resources.Common.Operation%></li>
        </ul>
        <asp:Repeater ID="rptModelFileGroup" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="display: none"><span id="Title<%# Eval("RecordID")%>">
                        <%# (RptItem = Container)%></span></li>
                    <li style="width: 40px">
                        <input type="checkbox" name="chkID" value='<%#Eval("RecordID") %>' /></li>
                    <asp:Repeater ID="rptValue" runat="server" DataSource='<%#GetColumn() %>'>
                        <ItemTemplate>
                            <li style="width: 10%"><span>
                                <%# DataBinder.Eval(RptItem.DataItem,Eval("Type").ToString()=="0"?Eval("Name").ToString():"Q" + Eval("ID").ToString()).ToString()%></span></li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <li style="width: 20%">
                        <asp:LinkButton ID="lnkbDelete" CssClass="abtn" Text="<%$ Resources:Common,Del%> "
                            OnClientClick="selectThisRow();selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;"
                            runat="server"></asp:LinkButton>&nbsp;<a href='SurveyAllItem.aspx?sid=<%#Eval("SurveyID") %>'
                                class="abtn">查看所有的选项</a> </li>
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
