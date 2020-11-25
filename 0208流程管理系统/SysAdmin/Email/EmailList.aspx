<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmailList.aspx.cs" Inherits=" AllPower.Web.Admin.Emails.EmailList" %>

<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/listcheck.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <script type="text/javascript" src="../js/public.js"></script>

    <script type="text/javascript" src="../js/common.js"></script>

    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            当前位置：<a href="CategoryList.aspx?cid=l"> > </a><a href="CategoryList.aspx?cid=">管理</a>
        </h4>
        <div id="searchContainer">
            <ul class="hassele">
                <li></li>
                <li>
                    <asp:TextBox ID="txtSearch" Text="搜索邮件" runat="server" Width="100px" MaxLength="50" /></li>
                <li>
                    <asp:Button ID="btnQuery" runat="server" Text="搜 索" OnClick="btnQuery_Click" /></li>
            </ul>
        </div>
        <div class="function">           
            <asp:Button ID="btnDelete" runat="server" Text="<%$Resources:Common,Del %>" OnClick="btnDelete_Click"
                OnClientClick="return GetSelectTitle()" />                        
                <asp:Button ID="btnMarket" runat="server" Text="<%$Resources:Orgin,Market %>" 
                OnClientClick="return GetSelectTitle()" />
                <asp:Button ID="btnMove" runat="server" Text="<%$Resources:Orgin,Move %>" 
                OnClientClick="return GetSelectTitle()" />
                <asp:Button ID="btnLook" runat="server" Text="<%$Resources:Orgin,Lookx %>" 
                OnClientClick="return GetSelectTitle()" />              
        </div>
        <ul class="ulheader">
            <li style="width: 40px">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" />
                <%=Resources.Orgin.Select%></li>
            <li style="width: 15%;">
                <%=Resources.Orgin.Sender%>
            </li>
            <li style="width: 42%">
                <%=Resources.Orgin.Title%></li>
            <li style="width: 10%;">
                <%=Resources.Orgin.SendTime%></li>
            <li style="width: auto">
                <%=Resources.Orgin.Operate%></li>
        </ul>
        <asp:Repeater ID="rptEmailList" runat="server" OnItemCommand="rptEmailList_ItemCommand">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 40px">
                        <input type="checkbox" id="chkId" name="chkId" value='<%#Eval("ID")%>' style="width: 16px;
                            height: 16px;" />
                    </li>
                    <li style="width: 15%"><a onclick="activestate()" href="EmailView.aspx?Action=view&ID=<%#Eval("ID") %>">
                        <img src="../image/unRd3.gif" />
                        <asp:Image ID="ImgState" runat="server" ImageUrl='<%#Eval("Status").ToString()=="1"?"../image/unRd3.gif":"" %>' /><%#Eval("SendID")%></a>
                    </li>
                    <li style="width: 42%;"><a href="Email.aspx?action=edit&id=<%# Eval("ID")%>&cid=<%=CID%>"
                        id="Title<%# Eval("ID")%>">
                        <%#Eval("Title")%> </li>
                    <li style="width: 10%;">
                        <%#Eval("SendTime")%>
                    </li>
                    <li style="width: auto"><a id="lnkNew" class="abtn" runat="server" href='<%#"EmailView.aspx?Action=view&ID="+Eval("ID")+"&nodeid="+NodeCode %>'>
                        <%=Resources.Orgin.Look%></a> </a>
                        <asp:LinkButton ID="lnkbDelete" class="abtn" runat="server" OnCommand="Category_Del"
                            CommandName="deldp" ToolTip='<%#Eval("ID")%>' CommandArgument='<%#Eval("ID") %>'
                            OnClientClick='<%#"if(confirm(\"确定要删除该商户吗?\")){GetSingleTitle(\""+Eval("ID") +"\");}"%>'><%=Resources.Orgin.Delete%></asp:LinkButton>
                    </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
        <span class="function fr">            
            <asp:Button ID="btnDelete1" runat="server" Text="<%$Resources:Common,Del %>" OnClick="btnDelete_Click"
                OnClientClick="return GetSelectTitle()" />
                <asp:Button ID="btnMarket1" runat="server" Text="<%$Resources:Orgin,Market %>" 
                OnClientClick="return GetSelectTitle()" />
                <asp:Button ID="btnMove1" runat="server" Text="<%$Resources:Orgin,Move %>" 
                OnClientClick="return GetSelectTitle()" />
                <asp:Button ID="btnLook1" runat="server" Text="<%$Resources:Orgin,Lookx %>" 
                OnClientClick="return GetSelectTitle()" />
        </span>
        <ul class="page">
            <webdiyer:AspNetPager ID="Split" runat="server" PageSize="20" AlwaysShow="True" OnPageChanged="Split_PageChanged"
                ShowCustomInfoSection="Left" CustomInfoSectionWidth="26%" ShowPageIndexBox="always"
                UrlPaging="true" PageIndexBoxType="DropDownList" CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，每页显示%PageSize%条记录">
            </webdiyer:AspNetPager>
        </ul>
        <br clear="left" />
    </div>
    </form>
</body>
</html>
