<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="FileList.aspx.cs" ValidateRequest="false"
    Inherits="AllPower.WEB.SysAdmin.FileManage.FileList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>上传文件管理</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <script type="text/javascript" src="../js/listcheck.js"></script>

    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script type="text/javascript" src="../js/common.js"></script>

    <style type="text/css">
        .cRed, .cRed:visited, .cRed a, a.cRed:hover
        {
            color: #0000FF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： 系统管理 &gt; <span class="breadcrumb_current">文件管理</span>
        </h4>
        <div id="searchContainer" style="height: 25px;">
            <span style="float: left; line-height: 25px;">
                <asp:Label runat="server" ID="lblPathTips"></asp:Label>
            </span><span style="float: right">
                <asp:TextBox ID="txtDirectoryName" runat="server"></asp:TextBox>
                <asp:Button ID="btnCreateDirectory" runat="server" Text="<%$Resources:Common,CreateDirectory %>"
                    OnClick="btnCreateDirectory_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 目录/文件关键字：
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                <asp:Button ID="btnQuery" runat="server" Text="<%$Resources:Common,Search %>" OnClick="btnQuery_Click" /></span>
        </div>
        <div class="function" style="height: 25px;">
            <span style="float: left;">
                <asp:Button ID="btnHidAction" runat="server" OnClick="butdel_Click" Style="display: none" />
                <asp:Button ID="btnDelFileAll" runat="server" Text="<%$Resources:Common,DelFileAll %>"
                    OnClientClick="document.getElementById('btnHidAction').value=0;selfconfirm({msg:'确定要删除选中的文件？',fn:function(data){setAction(data)}});return false;" />
                <asp:Button ID="btnDelDirectory" runat="server" Text="<%$Resources:Common,DelDirectory %>"
                    OnClientClick="document.getElementById('btnHidAction').value=1;selfconfirm({msg:'确定要删除选中的目录/文件？',fn:function(data){setAction(data)}});return false;" />
                <asp:Button ID="btnDelFile" runat="server" Text="<%$Resources:Common,DelFile %>"
                    OnClientClick="document.getElementById('btnHidAction').value=2;selfconfirm({msg:'确定要删除选中的文件？',fn:function(data){setAction(data)}});return false;" />&nbsp;&nbsp;|&nbsp;&nbsp;<asp:Label
                        runat="server" ID="lblParentPath"></asp:Label>
                <asp:Label runat="server" ID="lblDirectoryPath"></asp:Label></span>
        </div>
        <ul class="ulheader">
            <li style="width: 5%; text-align: center">
                <input type="checkbox" name="checkBoxAll" id="checkBoxAll" value="" /></li>
            <li style="width: 36%">文件名称</li>
            <li style="width: 7%">大小</li>
            <li style="width: 15%">创建时间</li>
            <li style="width: 15%">修改时间</li>
            <li style="width: 18%">操作</li>
        </ul>
        <asp:Repeater ID="rptFileList" runat="server" OnItemDataBound="rptFileList_ItemDataBound">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 5%; text-align: center">
                        <input type="checkbox" name="chkId" id="chkId" value='<%#Eval("FileName")%>' /></li>
                    <li style="width: 36%">
                        <img src="<%#Eval("ExtensionPhoto")%>" alt="" style="vertical-align: middle;" />
                        <%# GetDirPath(Eval("FullName").ToString(), Eval("FileName").ToString(), Convert.ToBoolean(Eval("IsDir")))%></a></li>
                    <li style="width: 7%">
                        <%#Eval("FileSize")%></li>
                    <li style="width: 15%">
                        <%#Eval("AddTime")%></li>
                    <li style="width: 15%">
                        <%#Eval("UpdateTime")%></li>
                    <li style="width: 18%">
                        <asp:LinkButton ID="lnkbDelete" class="abtn" runat="server" CommandName='<%# Convert.ToInt32(Eval("IsDir"))%>'
                            ToolTip='删除' CommandArgument='<%#Eval("FileName") %>' OnClientClick='document.getElementById("btnHidAction").value=3;selectThisRow();selfconfirm({msg:"确定要删除吗？",fn:function(data){setAction(data)}});return false;'>删除</asp:LinkButton>
                        <asp:LinkButton ID="lnkRename" class="abtn" runat="server" OnCommand="FileList_Rename"
                            CommandName='<%# Convert.ToInt32(Eval("IsDir"))%>' ToolTip='改名' CommandArgument='<%#Eval("FileName") %>'>改名</asp:LinkButton>
                        <asp:LinkButton ID="lnkDown" class="abtn" runat="server" OnCommand="FileList_Down"
                            CommandName='<%# Convert.ToInt32(Eval("IsDir"))%>' ToolTip='下载' CommandArgument='<%#Eval("FileName") %>'>下载</asp:LinkButton>
                        <asp:LinkButton ID="lnkEidt" class="abtn" runat="server" OnCommand="FileList_Edit"
                            CommandName='<%# Convert.ToInt32(Eval("IsDir"))%>' ToolTip='编辑' CommandArgument='<%#Eval("FileName") %>'>编辑</asp:LinkButton>
                    </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
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
