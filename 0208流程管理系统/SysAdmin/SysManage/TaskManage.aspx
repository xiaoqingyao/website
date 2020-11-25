<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskManage.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.TaskManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>定时任务管理</title>
    <link type="text/css" href="../skin/green/css/style.css" rel="stylesheet" id="myskin" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <script type="text/javascript" src="../js/listcheck.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>    
    <script type="text/javascript" src="../js/common.js"></script>    
    <script type="text/javascript" src="../js/jquery.cookie.js"></script>
    <script type="text/javascript" src="../js/skin.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat ="server" />
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %>
        </h4>        
        <div class="function">
            <asp:Button ID="btnHidAction" runat="server" OnClick="btndel_Click" style="display:none" />
            <asp:Button ID="btnNew" runat="server" Text="<%$Resources:Common,Add %>" OnClick="btnNew_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="<%$Resources:Common,Del %>" OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;" />
        </div>
        <ul class="ulheader">
            <li style="width: 40px; text-align:center" ><input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
            <li style="width: 10%">所属站点</li>
            <li style="width: 25%">任务名称</li>
            <li style="width: 10%">执行周期</li>
            <li style="width: 10%">最后一次执行时间</li>
            <li style="width: 5%">是否启用</li>
            <li style="width: 30%">操作</li>
        </ul>
        <asp:Repeater ID="rptTaskList" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 40px;text-align:center"><input type="checkbox" name="chkId" value='<%#Eval("TaskName")%>' /></li>
                    <li style="width: 10%"><%#Eval("SiteId")%></li>
                    <li style="width: 25%" id="Title<%# Eval("TaskName")%>"><%#Eval("TaskName")%></li>
                    <li style="width: 10%"><%#Eval("FrequencyType")%></li>
                    <li style="width: 10%"><%#Eval("LastExecuteDate")%></li>
                    <li style="width: 5%"><%#AllPower.Common.Utils.ParseState((Eval("IsEnabled").ToString()), "0")%></li>
                    <li style="width: 30%">
                        <asp:LinkButton ID="lnkbEdit" class="abtn" runat="server" CommandArgument='<%#Eval("TaskName") %>' OnCommand="Task_Edit">修改</asp:LinkButton>
                        <asp:LinkButton ID="lnkbState" class="abtn" runat="server" CommandArgument='<%#Eval("TaskName")+"|"+Eval("IsEnabled") %>' OnCommand="Task_State"><%#Eval("IsEnabled").ToString()=="True"?"禁用":"启用" %></asp:LinkButton>
                        <asp:LinkButton ID="lnkbDelete" class="abtn" runat="server" CommandArgument='<%#Eval("TaskName") %>' OnCommand="Task_Del" OnClientClick='selectThisRow();selfconfirm({msg:"确定要执行删除操作吗？",fn:function(data){setAction(data)}});return false;'>删除</asp:LinkButton>
                    </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
        <br clear="left" />
    </div>
    </form>
</body>
</html>
