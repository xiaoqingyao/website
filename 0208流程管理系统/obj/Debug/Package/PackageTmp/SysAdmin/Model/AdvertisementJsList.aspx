<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvertisementJsList.aspx.cs"
    Inherits="AllPower.Web.Admin.AdvertisementJsList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>广告js管理</title>
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
<body>
    <form id="Form1" name="theForm" method="post" runat="server">
    <div class="container">
        <h4>
            位置：扩展应用 &gt;<span class="breadcrumb_current"> 广告js管理</span></h4>
        <div id="searchContainer">
            <p>
            </p>
        </div>
        <div class="function">
        </div>
        <ul class="ulheader">
            <li style="width: 40px">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
            <li style="width: 10%">
                <%= Resources.Common.Orders%></li>
            <li style="width: 15%;">
                <%= Resources.Model.ModelName%></li>
            <li style="width: 25%;">
                <%= Resources.Model.Path%></li>
            <li style="width: 25%;">
                <%= Resources.Common.Operation%></li>
        </ul>
        <asp:Repeater ID="rptModelFileGroup" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 40px">
                        <input type="checkbox" name="chkID" value='<%#Eval("id") %>' /></li>
                    <li style="width: 10%">
                        <%#Eval("value") %>
                    </li>
                    <li style="width: 15%">
                        <%#Eval("Name") %></li>
                    <li style="width: 25%">
                        <%#Eval("src").ToString()%></li>
                    <li style="width: 25%"><a class="abtn" href="AdvertisementjsEdit.aspx?NodeCode=<%=NodeCode %>&src=<%#Eval("src") %>">
                        <%= Resources.Common.Update%></a></li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
        <span class="function fr"></span>
        <br clear="left" />
    </div>
    </form>
</body>
</html>
