<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModelFieldGroupList.aspx.cs"
    Inherits="KingTop.Web.Admin.ModelFieldGroupList" %>

<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>部门管理</title>
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
        <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
    <div class="container">
        <h4>
            位置： <a href="#">内容管理</a><a> &gt;</a> <a href="ModelFieldList.aspx?modelid=<%=StrModelId%>&NodeID=<%=NodeID %>">
                模型字段管理</a><a> &gt;</a> <span class="breadcrumb_current"> 分组管理</span>
        </h4>
        <div id="searchContainer">
            <p>
                <span><%= Resources.Model.ModelFieldList%>：</span>
                <asp:DropDownList ID="ddlModelList" runat="server">
                </asp:DropDownList>
                <span><%= Resources.Model.ModelGroupName%></span>
                <asp:TextBox ID="txtGroupName" runat="server" Style="width: 240px;"></asp:TextBox>
                <asp:Button ID="btnQuery" runat="server" Text="<%$Resources:Common,Search %>" OnClick="btnKeySerach_Click" />
            </p>
        </div>
        <div class="function">
            <asp:Button ID="btnNew" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnNew_Click" />
            <asp:Button ID="btnOrder" runat="server" Text="<%$Resources:Common,ModelOrder %>"
                OnClick="btnOrders_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="<%$Resources:Common,Del %>" OnClientClick="return GetSelectTitle()" OnClick="btnDel_Click" />
        </div>
        <ul class="ulheader">
            <li style="width: 40px">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
            <li style="width: 10%">
                <%= Resources.Common.Orders%></li>
            <li style="width: 25%;">
                <%= Resources.Model.ModelGroupName%></li>
            <li style="width: 25%;">
                <%= Resources.Model.ModelFieldList%></li>
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
                    <li style="width: 25%">
                        <a href="ModelFieldGroupEdit.aspx?action=edit&NodeID=&id=<%# Eval("ID")%>&mid=<%# Eval("ModelID")%>" id="Title<%# Eval("ID")%>">
                        <%# Eval("Name")%></a></li>
                    <li style="width: 25%">
                        <%#Eval("ModelName")%></li>
                    <li style="width: 30%">
                        <asp:LinkButton ID="lnkbDelete" CssClass="abtn" OnCommand="lbtnDel_Click" CommandArgument='<%#Eval("id") %>'
                            Text="<%$ Resources:Common,Del%> "  OnClientClick='<%# ("if(confirm(\""+Resources.Common.DelConfirm+"\")){GetSingleTitle(\""+Eval("ID") +"\");}else{return false;}") %>'
                            runat="server"></asp:LinkButton>
                        <a id="lnkEdit" class="abtn" runat="server" href='<%#"ModelFieldGroupEdit.aspx?action=edit&NodeID="+NodeID+"&id="+Eval("id") %>'>
                            <%= Resources.Common.Update%></a>
                        <asp:LinkButton ID="lnkbState" CssClass="abtn" OnCommand="lbtnEnable_Click" CommandArgument='<%#Eval("id")+"|"+Eval("IsEnable") %>'
                            runat="server" Text='<%#KingTop.Common.Utils.ParseState(!Convert.ToBoolean(Eval("IsEnable")),Resources.Common.ON) %>'></asp:LinkButton>
                    </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
        <span class="function fr">
    <asp:Button ID="btnNew2" runat="server" Text="<%$Resources:Common,Add %>" onclick="btnNew_Click" />
 <asp:Button ID="btnOrder2" runat="server"  Text="<%$Resources:Common,ModelOrder %>" onclick="btnOrders_Click" />
   <asp:Button ID="btnDelete2" runat="server" Text="<%$Resources:Common,Del %>" OnClientClick="return GetSelectTitle()" onclick="btnDel_Click" />
  </span>
        <ul>
            <webdiyer:AspNetPager ID="AspNetPager1" CssClass="page" runat="server" PageSize="15"
                AlwaysShow="True" OnPageChanged="AspNetPager1_PageChanged" ShowCustomInfoSection="Left"
                ShowPageIndexBox="always" PageIndexBoxType="DropDownList" CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，每页显示%PageSize%条记录"
                UrlPaging="True">
            </webdiyer:AspNetPager>
        </ul>
        <br clear="left" />
    </div>
    </form>
</body>
</html>
