<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModelFieldList.aspx.cs"
    Inherits="KingTop.Web.Admin.ModelFieldList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>部门管理</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

</head>
<body>
    <form name="theForm" method="post" runat="server">
    <div class="container">
        <h4>
            当前位置：扩展应用-><a href="CustomFormList.aspx?NodeCode=<%=NodeCode %>">自定义表单></a><span
                style="color: Blue">字段管理</span></h4>
        <div class="function">
            <input type="button" name="btnBack" value="返回自定义表单管理" onclick="javascript:location.href='CustomFormList.aspx?NodeCode=<%=NodeCode %>';" />
            <asp:Button ID="btnCreateModel" OnCommand="CreateModel" runat="server" Text="生成模型">
            </asp:Button>
            <input type="button" name="btnAddField" value="增加字段" onclick="javascript:location.href='ModelFieldEdit.aspx?modelid=<%=StrModelId %>&type=<%=StrType %>';" />
            <input type="button" name="btnClassManager" value="分组管理" onclick="javascript:location.href='ModelFieldGroupList.aspx?modelid=<%=StrModelId %>';" />
            <input type="button" name="btnModelManager" value="模型管理" onclick="javascript:location.href='ModelManageList.aspx';" />
            <input type="button" name="btnFormManager" value="表单管理" onclick="javascript:location.href='CustomFormList.aspx';" />
        </div>
        <ul class="ulheader">
            <li style="width: 10%;">
                <%= Resources.Model.ModelListFieldName%></li>
            <li style="width: 10%;">
                <%= Resources.Model.ModelListFieldAlias%></li>
            <li style="width: 10%;">
                <%= Resources.Model.ModelListFiledGroup%></li>
            <li style="width: 10%;">
                <%= Resources.Model.ModelListFiledType%></li>
            <li style="width: 5%;">
                <%= Resources.Model.ModelListFiledSys%></li>
            <li style="width: 5%;">
                <%= Resources.Model.ModelListFiledRequired%></li>
            <li style="width: 5%;">
                <%= Resources.Model.ModelListFiledSerach%></li>
            <li style="width: 5%;">
                <%= Resources.Common.ModelOrder%></li>
            <li style="width: 5%;">
                <%= Resources.Model.ModelListColumnEnable%></li>
            <li style="width: 5%;">
                <%= Resources.Common.ON%></li>
            <li width="20%">
                <%= Resources.Common.Operation%></li>
        </ul>
        <asp:Repeater ID="rptModelFieldList" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 10%;"><a href="ModelFieldEdit.aspx?action=edit&id=<%#Eval("id") %>&modelid=<%#Eval("modelid") %>"
                        title="<%#Eval("name") %>">
                        <%# GetSubString(Eval("Name").ToString(),10)%></a></li>
                    <li style="width: 10%;">
                        <%#Eval("FieldAlias") %></li>
                    <li style="width: 10%;">
                        <%#Eval("modelname") %></li>
                    <li style="width: 10%;">
                        <%#GetControlsName(Eval("Controls").ToString(), Eval("BasicField").ToString())%></li>
                    <li style="width: 5%;" style="color: red">
                        <%# KingTop.Common.Utils.ParseModelFieldState(Eval("IsSystemFiierd"),"") %></li>
                    <li style="width: 5%;" style="color: red">
                        <%# KingTop.Common.Utils.ParseModelFieldState(Eval("IsRequired"), "")%></li>
                    <li style="width: 5%;" style="color: red">
                        <%# KingTop.Common.Utils.ParseModelFieldState(Eval("IsSearch"), "")%></li>
                    <li style="width: 5%;" style="color: red">
                        <%# KingTop.Common.Utils.ParseModelFieldState(Eval("ListIsOrder"), "")%></li>
                    <li style="width: 5%;" style="color: red">
                        <%# KingTop.Common.Utils.ParseModelFieldState(Eval("IsListEnable"), "")%></li>
                    <li style="width: 5%;" style="color: red">
                        <%# KingTop.Common.Utils.ParseModelFieldState(Eval("IsEnable"), "")%></li>
                    <li width="20%">
                        <asp:LinkButton ID="lbtnDel" runat="server" Text="<%$Resources:Common,Del %>" Enabled='<%#!Convert.ToBoolean(Eval("IsSystemFiierd")) %>'
                            OnClientClick='<%# ("return confirm(\""+Resources.Common.DelConfirm+"\")") %>'
                            OnCommand="lbtnDel_Click" CommandArgument='<%#Eval("id") %>'></asp:LinkButton>
                        | <a href="ModelFieldEdit.aspx?action=edit&type=<%#StrType %>&id=<%#Eval("id") %>&modelid=<%#Eval("modelid") %>">
                            <%= Resources.Common.Update%></a> |
                        <asp:LinkButton ID="lbtnEnable" runat="server" Text='<%#KingTop.Common.Utils.ParseState(!Convert.ToBoolean(Eval("IsEnable")),Resources.Common.ON) %>'
                            OnCommand="lbtnEnable_Click" CommandArgument='<%#Eval("id")+"|"+Eval("IsEnable") %>'></asp:LinkButton>
                        | <a href="ModelFieldEdit.aspx?action=copy&type=<%#StrType %>&id=<%#Eval("id") %>&modelid=<%#Eval("modelid") %>">
                            <%= Resources.Common.COPY%></a> |
                        <input type="text" size="2" runat="server" id="txtOrder" value='<%#Eval("orders") %>'><asp:Button
                            ID="btnOrder" runat="server" OnCommand="btnOrder_Click" CommandArgument='<%#Eval("id") %>'
                            Text="<%$Resources:Common,ModelOrder %>" />
                    </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <input type="hidden" name="selcomp">
    <span class="function fr"></span>
    <webdiyer:AspNetPager ID="Split" CssClass="page" runat="server" PageSize="20" AlwaysShow="True"
        OnPageChanged="Split_PageChanged" ShowCustomInfoSection="Left" ShowPageIndexBox="always"
        UrlPaging="True" PageIndexBoxType="DropDownList" CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，每页显示%PageSize%条记录">
    </webdiyer:AspNetPager>
    <input type="hidden" name="edittype" value="">
    </form>

    <script type="text/javascript"><%=jsMessage %></script>

</body>
</html>
