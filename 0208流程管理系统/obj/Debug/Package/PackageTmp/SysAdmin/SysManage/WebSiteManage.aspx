<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebSiteManage.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.WebSiteManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>站点管理</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <script type="text/javascript" src="../js/listcheck.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script type="text/javascript" src="../js/Common.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
    <asp:Button ID="btnHidAction" runat="server" OnClick="BtnDelete_Click" style="display:none" />
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %>
        </h4>
        <div id="searchContainer">
            <p><span> 站点名称：</span>
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            <asp:Button ID="btnQuery" runat="server" Text="<%$Resources:Common,Search %>"
                OnClick="btnQuery_Click" /></p>
                </div>
       <ul class="ulheader">
            <li style="width: 6%;text-align:center">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
              <li style="width: 19%">
                    <div align="left">
                        站点ID</div>
                </li>
               <li style="width: 15%">
                    <div align="left">
                        站点名称</div>
                </li>
               <li style="width: 35%">
                    操作
               </li>
            </ul>
            <asp:Repeater ID="rptWebSiteList" runat="server">
                <ItemTemplate>
                    <ul class="ulheader ulbody">
                    <li style="width: 6%;text-align:center">
                        <input type="checkbox" value='<%#Eval("SiteID")%>|<%#Eval("Directory")%>' name="chkId" id="chkId" />
                        </li>
                       <li style="width: 19%">
                            <%#Eval("SiteID")%>
                        </li>
                        <li style="width:15%" id="Title<%#Eval("SiteID")%>|<%#Eval("Directory")%>">
                            <%#Eval("SiteName")%>
                        </li>
                        <li style="width:35%">
                            <asp:LinkButton ID="lnkbDelete" class="abtn" runat="server" CommandName="deldp" ToolTip='<%#Eval("SiteName")%>' CommandArgument='<%#Eval("SiteID") %>'
                            OnClientClick="selectThisRow();selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;">删除</asp:LinkButton>  
                        </li>
                    </ul>
                </ItemTemplate>
            </asp:Repeater>
                    <span class="function fr">
        </span>
        <ul class="page">
            <webdiyer:AspNetPager ID="Split" runat="server" CssClass="page" PageSize="20" AlwaysShow="True" UrlPaging="true"
                ShowCustomInfoSection="left" CustomInfoSectionWidth="28%" ShowPageIndexBox="always"
                PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>" 
                HorizontalAlign="Center" NumericButtonCount="6">
            </webdiyer:AspNetPager>
        </ul>
    </div> 
    </form>
</body>
</html>
