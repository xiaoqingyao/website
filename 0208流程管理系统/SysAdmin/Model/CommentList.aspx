<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentList.aspx.cs" Inherits="AllPower.Web.Admin.CommentList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>评论列表</title>
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
    <form id="Form1" name="theForm" method="post" runat="server">
            <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
    <div class="container">
        <h4>
            位置： <a href="#">内容管理</a> &gt;评论列表</h4>
        <div id="searchContainer">
            <p>
                <%= Resources.Common.Name%><asp:TextBox ID="txtGroupName" runat="server"></asp:TextBox>
                <asp:Button ID="btnQuery" runat="server" Text="<%$Resources:Common,Search %>" OnClick="btnKeySerach_Click" />
            </p>
        </div>
        <div class="function">
        <asp:Button ID="btnHidAction" runat="server" OnClick="btnLogicDel_Click" style="display:none" />
            <a href="Commentlist.aspx?typeId=1" class="abtn">所有评论</a><a href="Commentlist.aspx?typeId=2" class="abtn">
                未审核评论</a><a href="Commentlist.aspx?typeId=3" class="abtn">已审核评论</a><asp:Button ID="btnLogicDelete" runat="server" Text="<%$Resources:Common,Del %>"  OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;" /></div>
        <ul class="ulheader">
            <li style="width: 5%;text-align:center">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
            <li style="width: 4%;text-align:center">
                <%= Resources.Common.Orders%></li>
            <li style="width: 6%;">
                <%= Resources.Common.UserNo%></li>
            <li style="width: 25%;">
                <%= Resources.Common.Content%></li>
            <li style="width: 5%;text-align:center">
                <%= Resources.Model.SquareCount%></li>
            <li style="width: 5%;text-align:center">
                <%= Resources.Model.NeutralCount%></li>
            <li style="width: 5%;text-align:center">
                <%= Resources.Model.CounterCount%></li>
            <li style="width: 10%;">IP</li>
            <li style="width: 10%;">
                <%= Resources.Common.AddTime%></li>
            <li style="width: 10%;">
                <%= Resources.Common.Operation%></li>
        </ul>
        <asp:Repeater ID="rptModelFileGroup" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 5%;text-align:center">
                        <input type="checkbox" name="chkID" value='<%#Eval("id") %>' /></li>
                    <li style="width: 4%;text-align:center">
                        <%#Eval("orders") %></li>
                    <li style="width: 6%;">
                        <%#Eval("username") %></li>
                    <li style="width: 25%;"><span id="Title<%# Eval("ID")%>">
                        <%#Eval("content")%></span></li>
                    <li style="width: 5%;text-align:center">
                        <%#Eval("SquareCount")%></li>
                    <li style="width: 5%;text-align:center">
                        <%#Eval("NeutralCount")%></li>
                    <li style="width: 5%;text-align:center">
                        <%#Eval("CounterCount")%></li>
                    <li style="width: 10%;">
                        <%#Eval("ip")%></li>
                    <li style="width: 10%;">
                        <%#Eval("AddDate")%></li>
                    <li style="width: 10%;"><a href="<%#Eval("NewsUrl")%>" class="abtn" target="_blank">
                        <%= Resources.Model.NewsUrl%></a><a class="abtn" <%#Eval("FlowState").ToString()!="99"?"href='ReviewFlowNews.aspx?'":"style='color:Black;'" %>>
                            <%= Resources.Common.Review%></a> </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>        
        <ul>
            <webdiyer:AspNetPager ID="AspNetPager1" CssClass="page" runat="server" PageSize="15"
                AlwaysShow="True" OnPageChanged="AspNetPager1_PageChanged" ShowCustomInfoSection="Left"
                ShowPageIndexBox="always" PageIndexBoxType="DropDownList"  CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>" 
                UrlPaging="True">
            </webdiyer:AspNetPager>
        </ul>
        <br clear="left" />
    </div>
    </form>
</body>
</html>
