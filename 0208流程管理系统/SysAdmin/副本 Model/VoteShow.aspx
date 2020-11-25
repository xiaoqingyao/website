<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VoteShow.aspx.cs" Inherits="KingTop.Web.Admin.VoteShow" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>投票管理</title>
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

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <form id="Form1" name="theForm" method="post" runat="server">
    <div class="container">
        <h4>
            位置： <a href="#">扩展应用</a> &gt;<a href="VoteList.aspx?NodeCode=<%=NodeCode %>">投票管理</a>&gt;<font
                color="blue">查看投票</font></h4>
        <div class="function">
            <asp:Button ID="btnBack" runat="server" Text="返回投票管理" OnClick="btnBack_Click" />
        </div>
        <ul class="ulheader">
            <li style="width: 8%">
                <%= Resources.Common.Orders%></li>
            <li style="width: 15%">选项</li>
            <li style="width: 20%;">票数</li>
            <li style="width: 20%;">百分比 </li>
            <li style="width: 25%;">图示</li>
        </ul>
        <asp:Repeater ID="rptModelFileGroup" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 8%">
                        <%#Eval("orders") %></li>
                    <li style="width: 15%">
                        <%#Eval("Name") %></li>
                    <li style="width: 20%">
                        <%#Eval("VoteCount").ToString()%></li>
                    <li style="width: 20%">
                        <%#GetPercent(Convert.ToDouble(Eval("VoteCount")))%>% </li>
                    <li style="width: 25%">
                        <img src="../Images/show.gif" alt="结果图示" width='<%#GetPercent(Convert.ToDouble(Eval("VoteCount")))%>%'
                            style='<%#GetDisplay(Convert.ToInt32(Eval("VoteCount")))%>' />
                    </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
        <span class="function fr"></span>
        <webdiyer:AspNetPager ID="AspNetPager1" CssClass="page" runat="server" PageSize="15"
            AlwaysShow="True" OnPageChanged="AspNetPager1_PageChanged" ShowCustomInfoSection="Left"
            ShowPageIndexBox="always" PageIndexBoxType="DropDownList" CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，每页显示%PageSize%条记录"
            UrlPaging="True">
        </webdiyer:AspNetPager>
        <br clear="left" />
    </div>
    </form>
</body>
</html>
