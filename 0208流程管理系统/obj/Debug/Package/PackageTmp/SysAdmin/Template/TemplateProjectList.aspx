<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateProjectList.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.Template.TemplateProjectList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>方案列表</title>
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
    <form id="theForm" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div>
        <div class="container">
            <h4>
                位置： <a href="#">模板管理</a> > <a href="TemplateProjectList.aspx">方案管理</a> ><span style="color: Blue">
                    方案列表</span></h4>
            <div class="function">
                <asp:Button ID="btnHidAction" runat="server" OnClick="btnDelete_Click" Style="display: none" />
                <asp:Button ID="btnNew" runat="server" Text="添加方案" OnClick="btnNew_Click" />
            </div>
            <asp:Repeater ID="rptTemplateProject" runat="server">
                <HeaderTemplate>
                    <ul class="ulheader">
                        <li style="width: 8%; display: none">选中</li>
                        <li style="width: 10%;">方案名称</li>
                        <li style="width: 15%;">所在目录</li>
                        <li style="width: 10%;">设计者</li>
                        <li style="width: 8%;">是否默认</li>
                        <li style="width: 10%;">添加的时间</li>
                        <li style="width: 30%;">方案操作</li>
                    </ul>
                </HeaderTemplate>
                <ItemTemplate>
                    <ul class="ulheader ulbody">
                        <li style="width: 8%; display: none">
                            <input type="checkbox" id="chkId" name="chkId" value='<%#Eval("ID")%>_<%#Eval("Directory") %>' />
                        </li>
                        <li style="width: 10%;" id="Title<%#Eval("ID")%>_<%#Eval("Directory") %>">
                            <%#Eval("Title")%></li>
                        <li style="width: 15%;">
                            <%#Eval("Directory") %></li>
                        <li style="width: 10%;">
                            <%# Eval("Devise")%></li>
                        <li style="width: 8%;"><font color="red">
                            <%# AllPower.Common.Utils.ParseModelFieldState(Eval("IsDefault"), "")%></font></li>
                        <li style="width: 10%;">
                            <%# Eval("AddTime")%></li>
                        <li style="width: 30%;">
                            <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID")%>' ID="lbtnDelete"
                                CommandName='<%#Eval("Directory") %>' class="abtn" Text="删除方案" OnClientClick='<%# ("selectThisRow();selfconfirm({msg:\"删除同时方案底下的模板和风格也会被删除哦~\",fn:function(data){setAction(data)}});return false;")%>'
                                Enabled='<%#Convert.ToInt32(Eval("IsDefault"))==1? false:true%>'></asp:LinkButton>
                            <a href='TemlateProjectEdit.aspx?NodeCode=<%=NodeCode %>&Action=EDIT&id=<%#Eval("ID") %>'
                                title="edit" class="abtn">修改方案</a>
                            <asp:LinkButton runat="server" Text="设为默认" CommandArgument='<%#Eval("ID")%>' class="abtn"
                                CommandName='<%#Eval("IsDefault")%>' OnCommand="lbtnDefault_Click" ID="lbtnDefault"
                                Enabled='<%#Convert.ToInt32(Eval("IsDefault"))==1? false:true%>'></asp:LinkButton></li>
                    </ul>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    </form>
</body>
</html>
