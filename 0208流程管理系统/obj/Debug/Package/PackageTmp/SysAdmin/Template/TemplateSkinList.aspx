<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateSkinList.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.Template.TemplateSkinList" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>模板风格列表</title>
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
                位置： <a href="#">模板模型</a> > <a href="TemplateSkinList.aspx?Action=ALL&NodeCode=<%=NodeCode %>">
                    风格管理</a> > <span style="color: Blue">风格列表</span></h4>
            <br />
            <div class="function">
                <ul>
                    <li style="float: left">方案选择：<asp:DropDownList ID="ddlProjects" runat="server" AutoPostBack="True"
                        Width="150px" OnSelectedIndexChanged="ddlProjects_SelectedIndexChanged">
                    </asp:DropDownList>
                    </li>
                </ul>
                <asp:Button ID="btnHidAction" runat="server" OnClick="btnDelete_Click" Style="display: none" />
                <asp:Button ID="btnNew" runat="server" Text="添加风格" OnClick="btnNew_Click" />&nbsp;
                <asp:Button ID="btnDelete" runat="server" Text="删除选中风格" OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction(data)}});return false;" />
            </div>
            <asp:Repeater ID="rptSkinList" runat="server">
                <HeaderTemplate>
                    <ul class="ulheader">
                        <li style="width: 8%;">选中</li>
                        <li style="width: 10%;">风格名称</li>
                        <li style="width: 10%;">目录名</li>
                        <li style="width: 10%;">所属方案</li>
                        <li style="width: 10%;">设计者</li>
                        <li style="width: 8%;">是否默认</li>
                        <li style="width: 35%;">风格操作</li>
                    </ul>
                </HeaderTemplate>
                <ItemTemplate>
                    <ul class="ulheader ulbody">
                        <li style="width: 8%;">
                            <input type="checkbox" id="chkId" name="chkId" value='<%#Eval("ID")%>_<%#Eval("Dirct") %>' />
                        </li>
                        <li style="width: 10%;" id="Title<%#Eval("ID")%>_<%#Eval("Dirct") %>"><a href='TemplateSkinFileList.aspx?path=/SysAdmin/Template/<%#Eval("Dirct")%>&sid=<%#Eval("ID")%>&NodeCode=<%=NodeCode %>&Action=ALL'>
                            <%#Eval("SkinName")%></a></li>
                        <li style="width: 10%;">
                            <%#Eval("Dirct")%></li>
                        <li style="width: 10%;">
                            <%#GetProjectNameById(Convert.ToString(Eval("ProjectID")))%></li>
                        <li style="width: 10%;">
                            <%# Eval("Devise")%></li>
                        <li style="width: 8%;"><font color="red">
                            <%# AllPower.Common.Utils.ParseModelFieldState(Eval("IsDefault"), "")%></font></li>
                        <li style="width: 35%;">
                            <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID")%>' ID="lbtnDelete"
                                CommandName='<%#Eval("Dirct") %>' class="abtn" Text="删除风格" OnClientClick='<%# ("selectThisRow();selfconfirm({msg:\"删除同时风格底下的文件夹和文件也会删除哦~\",fn:function(data){setAction(data)}});return false;")%>'
                                Enabled='<%#Convert.ToInt32(Eval("IsDefault"))==1? false:true%>'></asp:LinkButton>
                            <a href='TemplateSkinEdit.aspx?NodeCode=<%=NodeCode %>&Action=EDIT&id=<%#Eval("ID") %>'
                                title="edit" class="abtn">修改风格</a>
                            <asp:LinkButton runat="server" Text="设为默认" CommandArgument='<%#Eval("ID")%>' class="abtn"
                                CommandName='<%#Eval("Dirct")%>' OnCommand="lbtnDefault_Click" ID="lbtnDefault"
                                Enabled='<%#Convert.ToInt32(Eval("IsDefault"))==1? false:true%>'></asp:LinkButton></li>
                    </ul>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    </form>
</body>
</html>
