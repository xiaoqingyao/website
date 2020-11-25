<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SourceList.aspx.cs" EnableEventValidation="false"
    Inherits="AllPower.Web.Admin.SourceList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <script type="text/javascript" src="../js/regExp.js"></script>

    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>
            <script type="text/javascript">
                $(function() {
                $("#btnNew").click(function() { location.href = "SourceEdit.aspx?action=add&NodeCode=<%=NodeCode %>"; })
                    $("body").find("input").each(function() {
                        if ($(this).attr("id").indexOf("_btnEdit") > -1) {
                            $(this).click(function() { location.href = "SourceEdit.aspx?action=edit&ID=" + $(this).attr("RecordID") + "&NodeCode=<%=NodeCode %>"; })
                        }
                    });
                });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" />
    <div class="container" id="SourceInfoList">
        <h4>
            位置:<%GetPageNav(NodeCode);%></h4>
        <div id="searchContainer">
            <asp:DropDownList ID="ddlSearchType" runat="server">
                <asp:ListItem Text="名称" Value="[Name]"></asp:ListItem>
                <asp:ListItem Text="主页" Value="[HomePage]"></asp:ListItem>
            </asp:DropDownList>
            &nbsp;
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            &nbsp;
            <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" Text='<%$Resources:Common,Search %>' />
        </div>
        <div class="function">
            <input type="button" id="btnNew" runat="server" value="添加" />
            <asp:Button ID="btnDelete" runat="server" Text="删除所选" OnClientClick="return reConfirmMulti(this, '确定要删除当前所选记录吗？', 'SourceInfo')"
                CommandName="Bacth" OnCommand="Source_Delete" />
        </div>
        <ul class="ulheader">
            <li style="width: 45px;">
                <input type="checkbox" id="SelAll" name="SelAll" onclick="SelectAll('SelAll', 'SourceInfoList')" /></li>
            <li style="width: 15%">序号</li>
            <li style="width: 20%">名称</li>
            <li style="width: 10%">主页</li>
            <li style="width: 6%">状态</li>
            <li style="width: 6%;">推荐状态</li>
            <li style="width: 6%;">置顶状态</li>
            <li style="width: 8%;">排序</li>
            <li style="width: 18%">操作</li>
        </ul>
        <div id="SourceInfo">
            <asp:Repeater ID="rptSourceList" runat="server">
                <ItemTemplate>
                    <ul class="ulheader ulbody">
                        <li style="width: 45px;">
                            <input type="checkbox" name="chkID" value="<%#Eval("ID") %>"></li>
                        <li style="width: 15%;">
                            <%#Eval("ID") %></li>
                        <li style="width: 20%;">
                            <span id="Title<%# Eval("ID")%>"> <%#Eval("Name") %></span></li>
                        <li style="width: 10%;">
                            <%#Eval("HomePage") %></li>
                        <li style="width: 6%;">
                            <asp:LinkButton ID="LinkButton2" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsEnable").ToString()%>'  RecordID='<%#Eval("ID") %>'
                                CommandName="STATE" runat="server" OnClientClick="setLogTitle(this)">
                                <%#AllPower.Common.Utils.ParseState(Eval("IsEnable"),"状态不明")%>
                            </asp:LinkButton></li>
                        <li style="width: 6%;">
                            <asp:LinkButton ID="LinkButton3" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsRecommend").ToString()%>'  RecordID='<%#Eval("ID") %>'
                                CommandName="RECOMMEND" runat="server" OnClientClick="setLogTitle(this)">
                                <%#AllPower.Common.Utils.ParseIsRecommend(Eval("IsRecommend"), "不推荐")%>
                            </asp:LinkButton></li>
                        <li style="width: 6%;">
                            <asp:LinkButton ID="LinkButton4" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsTop").ToString()%>'  RecordID='<%#Eval("ID") %>'
                                CommandName="TOP" runat="server" OnClientClick="setLogTitle(this)">
                                <%#AllPower.Common.Utils.ParseIsTop(Eval("IsTop"), "不置顶")%>
                            </asp:LinkButton></li>
                        <li style="width: 8%;">
                            <input type="text" style="width: 50px;" value="<%#Eval("Orders") %>" onblur="setOrders('K_Source', '<%#Eval("ID") %>', this.value)" /></li>
                        <li style="width: 18%;">
                                             <asp:Button ID="btnDelete" runat="server" OnCommand="Source_Delete"  CommandName="Single" CommandArgument='<%#Eval("ID") %>' OnClientClick="return reConfirm(this,'确定要删除当前记录吗?');"
                            RecordID='<%#Eval("ID") %>' Text="删除"></asp:Button>
                <input type="button" value="修改" id="btnEdit" runat="server" btntype="edit" RecordID='<%#Eval("ID") %>' />

                        </li>
                    </ul>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <ul class="page">
            <webdiyer:AspNetPager ID="Split" runat="server" CssClass="page" PageSize="18" AlwaysShow="True"
                UrlPaging="true" ShowCustomInfoSection="left" CustomInfoSectionWidth="28%" ShowPageIndexBox="always"
                PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>"
                HorizontalAlign="Center" NumericButtonCount="6">
            </webdiyer:AspNetPager>
        </ul>
    </div>
    </form>
    <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>
