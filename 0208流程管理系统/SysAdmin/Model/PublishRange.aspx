<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublishRange.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Model.PublishRange" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script> 
    <script src="../JS/PublishRange.js" type="text/javascript"></script>
    <script src="../JS/checkboxdtree.js" type="text/javascript"></script>
    <link href="../CSS/checkboxdtree.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/PublishRange.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <center>
   <div class="popWrap">
      <div class="popWrapScreen">
      <h4 class="title"><a href="javascript:ShowSelectedUser('已选用户')">已选用户</a></h4>
            <asp:Repeater ID="rptPublishRange" runat="server">
            <ItemTemplate>
             <h4 class="title" id="navTitle<%#Eval("SiteID")%>"> <a href="#"><%#Eval("SiteName")%></a></h4>
             <div class="selcontaier"><ul>
           <%#pRange.SiteUserTree(Eval("SiteID"), Eval("SiteName"))%>
            </ul></div>
            </ItemTemplate>
            </asp:Repeater>
       </div>
       	<div class="selectedWindows">
            <ul>
                <li style=" font-weight:bolder;" id="ListHeader"></li>
                <li><a href="javascript:AddCurrentList()">全部添加</a></li>
                <li><a href="javascript:DelCurrentList()">全部删除</a></li>
            </ul>
            <ul id="CurrentUser"></ul>
        </div>
    </div>
    </center><asp:hiddenfield ID="hdnSiteID" runat="server"></asp:hiddenfield><asp:hiddenfield id="hdnSiteName" runat="server"></asp:hiddenfield>
    </form>
</body>

</html>
