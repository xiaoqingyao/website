<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateManage.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.SysManage.TemplateManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>模板管理</title>
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
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %>
        </h4>
        <div id="searchContainer">
            <p><span> 模板名称：</span>
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            <asp:Button ID="btnQuery" runat="server" Text="<%$Resources:Common,Search %>"
                OnClick="btnQuery_Click" /></p>
                </div>
        <div class="function">
            <asp:Button ID="btnHidAction" runat="server" OnClick="btnDelete_Click" style="display:none" />
            <asp:Button ID="btnNew" runat="server"  Text="<%$Resources:Common,Add %>"
                OnClick="btnNew_Click" />
            <asp:Button ID="btnDelete" runat="server"  Text="<%$Resources:Common,Del %>" OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;" />
        </div>
       <ul class="ulheader">
            <li style="width: 6%;text-align:center">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
              <li style="width: 19%">
                    <div align="left">
                        模板ID</div>
                </li>
               <li style="width: 15%">
                    <div align="left">
                        模板名称</div>
                </li>
               <li style="width: 35%">
                    操作
               </li>
            </ul>
            <asp:Repeater ID="rptTemplateList" runat="server">
                <ItemTemplate>
                    <ul class="ulheader ulbody">
                    <li style="width: 6%;text-align:center">
                        <input type="checkbox" value='<%#Eval("TemplateID")%>' name="chkId" id="chkId" />
                        </li>
                       <li style="width: 19%">
                            <%#Eval("TemplateID")%>
                        </li>
                        <li style="width:15%">
                            <a href='TemplateEdit.aspx?Action=Edit&TemplateID=<%#Eval("TemplateID")%>' id="Title<%# Eval("TemplateID")%>">
                                <%#Eval("TemplateName")%></a>
                        </li>
                        <li style="width:35%">
                            <a  class="abtn" href='TemplateNodeManage.aspx?TemplateID=<%#Eval("TemplateID")%>&NodeID=<%#NodeID%>&NodeCode=<%=NodeCode %>'>模板节点管理</a> 
                            <a class="abtn" href='TemplatePermit.aspx?TemplateID=<%#Eval("TemplateID")%>&NodeID=<%#NodeID%>&NodeCode=<%=NodeCode %>'>模板权限管理</a> 
                            <asp:LinkButton ID="lnkbDelete" class="abtn" runat="server" CommandName="deldp" ToolTip='<%#Eval("TemplateName")%>' CommandArgument='<%#Eval("TemplateID") %>'
                            OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;">删除</asp:LinkButton>  
                        </li>
                    </ul>
                </ItemTemplate>
            </asp:Repeater>                    
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
