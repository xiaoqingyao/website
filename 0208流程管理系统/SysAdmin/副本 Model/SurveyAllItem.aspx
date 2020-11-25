<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyAllItem.aspx.cs"
    Inherits="KingTop.WEB.SysAdmin.Model.SurveyAllItem" %>

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
    <form id="Form1" name="theForm" method="post" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a><a> &gt;</a> <a href="SurveyList.aspx?NodeCode=<%=NodeCode %>">
                问卷调查管理</a><a> &gt;</a> <span style="color: Blue">当前投票记录的问题选项列表</span>
        </h4>
        <div class="function">
            <asp:Button ID="btnBack" runat="server" Text="返回投票详情" OnClick="btnBack_Click" />
        </div>
        <ul class="ulheader">
            <li style="width: 30%">编号</li>
            <li style="width: 35%;">选项名</li>
        </ul>
        <asp:Repeater ID="rptItem" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 30%">
                        <%#Container.ItemIndex+1 %>、</li>
                    <li style="width: 35%">
                        <%#Eval("Name")%></li>
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
