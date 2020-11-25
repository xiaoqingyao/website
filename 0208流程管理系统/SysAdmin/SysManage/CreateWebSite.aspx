<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateWebSite.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.SysManage.CreateWebSite" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>新建站点</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <script type="text/javascript" src="../js/listcheck.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script type="text/javascript" src="../js/Common.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %>
        </h4>
        <ul class="ulheader">
            <li style="width: 5%">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
            <li style="width: 19%">模板ID</li><li style="width: 15%">模板名称</li>
        </ul>
        
        <asp:Repeater ID="rptTemplateList" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 5%">
                        <input type="radio" value='<%#Eval("TemplateID")%>' name="chkID" <%=check %> id="chkID" /></li>
                        <%check=""; %>
                    <li style="width: 19%">
                        <%#Eval("TemplateID")%></li>
                    <li style="width: 15%">
                        <%#Eval("TemplateName")%></li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
        <ul class="page">
            <asp:Button ID="Create" runat="server"  Text="下一步" OnClick="Create_Click" />
        </ul>
        <br clear="left" />
    </div>
    </form>
</body>
</html>
