<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateSkinFileList.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.Template.TemplateSkinFileList" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>风格文件列表</title>
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <script type="text/javascript" src="../js/listcheck.js"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script type="text/javascript" src="../js/common.js"></script>

</head>
<body>
    <form id="frmFileList" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div>
        <div class="container">
            <h4>
                位置： <a href="#">模板模型</a> ><a href="TemplateSkinList.aspx?Action=ALL&NodeCode=<%=NodeCode %>">风格管理
                </a>><a href="TemplateSkinFileList.aspx?Path=<%=tPath%>&Action=ALL&NodeCode=<%=NodeCode %>">
                    <span style="color: Blue">风格文件列表</span></a></h4>
            <div class="function" style="height: 25px;">
                <span style="float: right;">
                    <asp:Button ID="btnHidAction" runat="server" OnClick="btnDelete_Click" Style="display: none" />
                    <asp:Button runat="server" ID="btnBack" Text="返回风格管理" OnClick="btnBack_Click" />
                    <asp:Button runat="server" ID="btnAddDir" Text="添加目录" OnClick="btnAddDir_Click" />
                    <asp:Button runat="server" ID="btnAddSkin" Text="添加风格文件" OnClick="btnAddSkin_Click" />
                    <asp:Button runat="server" ID="btnSkinImport" Text="风格导入" />
                    <asp:Button ID="btnDelete" runat="server" Text="<%$Resources:Common,DelFileAll %>"
                        OnClientClick="document.getElementById('btnHidAction').value=0;selfconfirm({msg:'确定要删除选中的文件？',fn:function(data){setAction(data)}});return false;" />
                    <asp:Literal ID="ltlRootPath" runat="server" Visible="false"></asp:Literal>&nbsp;|<asp:Label
                        runat="server" ID="lblDirectoryPath"></asp:Label></span>
            </div>
            <br />
            <asp:Repeater ID="rptSkinFileList" runat="server" OnItemCommand="rptSkinFileList_ItemCommand"
                OnItemDataBound="rptSkinFileList_ItemDataBound">
                <HeaderTemplate>
                    <ul class="ulheader">
                        <li style="width: 5%; text-align: center">
                            <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
                        <li style="width: 15%">
                            <asp:ImageButton ID="ibtnBack" runat="server" ImageUrl="~/SysAdmin/img/back.gif"
                                CommandName="back" Width="25px" />
                            &nbsp;文件列表 </li>
                        <li style="width: 15%;">类型</li>
                        <li style="width: 20%;">站用空间</li>
                        <li style="width: 15%;">最后修改时间</li>
                        <li style="width: 18%">文件操作</li>
                    </ul>
                </HeaderTemplate>
                <ItemTemplate>
                    <ul class="ulheader ulbody">
                        <li style="width: 5%; text-align: center">
                            <input type="checkbox" name="chkId" id="chkId" value='<%#Eval("FileName")%>' /></li>
                        <li style="width: 15%" id='Title<%# Eval("FileName") %>'>
                            <img src="<%#Eval("ExtensionPhoto")%>" alt="" style="vertical-align: middle;" />
                            <asp:LinkButton ID="lbtnFileName" runat="server" CommandName="check" CommandArgument='<%# Eval("FullName") %>'
                                Text='<%# Eval("FileName") %>' /></li>
                        <li style="width: 15%">
                            <%# Eval("FileType")%></li>
                        <li style="width: 20%">
                            <%# Eval("FileSize")%></li>
                        <li style="width: 15%">
                            <%# Eval("AddTime")%></li>
                        <li style="width: 18%">
                            <asp:LinkButton ID="lbtnDelete" class="abtn" runat="server" CommandName='<%# Convert.ToInt32(Eval("IsDir"))%>'
                                ToolTip='删除' CommandArgument='<%#Eval("FileName") %>' OnClientClick='document.getElementById("btnHidAction").value=0;selectThisRow();selfconfirm({msg:"确定要删除吗？",fn:function(data){setAction(data)}});return false;'>删  除</asp:LinkButton>
                            <asp:LinkButton ID="lbtnkRename" class="abtn" runat="server" OnCommand="FileList_Rename"
                                CommandName='<%# Convert.ToInt32(Eval("IsDir"))%>' ToolTip='改名' CommandArgument='<%#Eval("FileName") %>'>重命名</asp:LinkButton>
                            <asp:LinkButton ID="lbtnEdit" class="abtn" runat="server" OnCommand="FileList_Edit"
                                CommandName='<%# Convert.ToInt32(Eval("IsDir"))%>' ToolTip='编辑' CommandArgument='<%#Eval("FullName") %>'>编  辑</asp:LinkButton>
                        </li>
                    </ul>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <ul class="page">
            <webdiyer:AspNetPager ID="Split" runat="server" CssClass="page" PageSize="20" AlwaysShow="True"
                UrlPaging="true" ShowCustomInfoSection="left" CustomInfoSectionWidth="28%" ShowPageIndexBox="always"
                PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>"
                HorizontalAlign="Center" NumericButtonCount="6">
            </webdiyer:AspNetPager>
        </ul>
        <br clear="left" />
    </div>
    </form>
</body>
</html>
