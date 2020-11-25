<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModelManageList.aspx.cs"
    EnableEventValidation="false" Inherits="AllPower.Web.Admin.ModelManageList" %>

<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>模型管理</title>
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/Common.js"></script>
    <script type="text/javascript" src="../js/ModelManage.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#btnLogicDelete").click(function() { location.href = "?IsDel=1&IsSub=<%= IsSub%>" + "&NodeCode=" + $("#hdnNodeCode").val(); });
            $("#btnNew").click(function() { location.href = "ModelManageEdit.aspx?action=add&NodeCode=" + $("#hdnNodeCode").val() + "&IsSub=<%= IsSub%>"; })
            $("body").find("input").each(function() {
                if ($(this).attr("id").indexOf("_btnEdit") > -1) {
                    $(this).click(function() { location.href = "ModelManageEdit.aspx?action=edit&ID=" + $(this).attr("RecordID") + "&NodeCode=" + $("#hdnNodeCode").val() + "&IsSub=<%= IsSub%>"; })
                }
            });
        });
    </script>

    <style type="text/css">
        .rowSelected
        {
            background-color: #efefef;
        }
        a
        {
            color: #000000;
        }
    </style>
</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" />
    <div class="container" id="ModelManageInfoList">
        <h4>
            当前位置：
            <%GetPageNav(NodeCode);%></h4>
        <div id="searchContainer">
            <span>
                <asp:DropDownList ID="ddlSearchType" runat="server">
                    <asp:ListItem Text="名称" Value="[Title]"></asp:ListItem>
                    <asp:ListItem Text="数据表" Value="[TableName]"></asp:ListItem>
                </asp:DropDownList>
            </span>
            <asp:TextBox ID="txtSearch" runat="server" Width="180" MaxLength="50" />
            &nbsp;
            <asp:Button ID="btnSearch" runat="server" Text="搜 索" OnClick="btnSearch_Click" />
        </div>
        <div class="function">
            <input type="button" value="添加模型" runat="server" id="btnNew" />
            <input type="button" onclick="location.href='ModelManageList.aspx?NodeCode=<%=NodeCode %>&IsSub=<%= IsSub%>'"
                value="模型列表" />
            <input type="button" value="回收站"  runat="server" id="btnLogicDelete" />
            <asp:Button ID="btnCreateModel" OnCommand="CreateAllModel" runat="server" Text="生成全部模型"  OnClientClick="return reConfirm(this,'当全操作将耗费很大的系统资源，是否确定？?');" />
        </div>
        <ul class="ulheader">
            <li style="width: 100px">名称</li>
            <li style="width: 150px;">数据表</li>
            <li style="width: 70px;">模块类型</li>
            <li style="width: 40px">状态</li>
            <li style="width: 80px;">生成HTML</li>
            <li style="width: 40px;">排序</li>
            <li style="width: 500px;">操作</li>
        </ul>
        <asp:Repeater ID="rptModelManage" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody" onmouseover="$(this).addClass('rowSelected')" onmouseout="$(this).removeClass('rowSelected')">
                    <li style="width: 100px;"><a href="ModelManageEdit.aspx?action=edit&id=<%# Eval("ID")%>">
                        <span id="Title<%# Eval("ID")%>">
                            <%# Eval("Title")%></span></a></li>
                    <li style="width: 150px">
                        <%#Eval("TableName")%></li>
                    <li style="width: 70px;">
                        <%#ParseModel[Eval("ModuleID").ToString()]%></li>
                    <li style="width: 40px;">
                        <asp:LinkButton ID="LinkButton2" OnCommand="SetIsEnable" OnClientClick="setLogTitle(this)"
                            RecordID='<%#Eval("ID") %>' CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsEnable").ToString()%>'
                            CommandName="STATE" runat="server">
                                <%#AllPower.Common.Utils.ParseState(Eval("IsEnable"),"状态不明")%>
                        </asp:LinkButton>
                    </li>
                    <li style="width: 80px">
                        <asp:LinkButton ID="LinkButton3" OnCommand="SetIsEnable" OnClientClick="setLogTitle(this)"
                            RecordID='<%#Eval("ID") %>' CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsHtml").ToString()%>'
                            CommandName="HTML" runat="server">
                                 <%#AllPower.Common.Utils.ParseIsOrNot(Eval("IsHtml"),"未知") %>
                        </asp:LinkButton>
                    </li>
                    <li style="width: 50px; text-align: center;" id="HQB_Orders_<%#Eval("ID") %>">
                        <div style="display: none;">
                            <img src="../image/loading.gif" /></div>
                        <span>
                            <input type="text" style="width: 35px;" value="<%#Eval("Orders") %>" onblur="setOrders('K_ModelManage', '<%#Eval("ID") %>', this.value)" /></span></li>
                    <li style="width: 500px">
                        <%if (IsDel == "")
                          { %>
                        <input type="button" value="字段" onclick="return lookFieldList('FieldManageList.aspx?NodeCode=<%=NodeCode %>&ModelName=<%#Eval("Title") %>&modelid=<%#Eval("id") %>&tableName=<%#Eval("TableName") %>&IsSub=<%=IsSub %>','<%#Eval("IsEnable") %>')" />
                        <input type="button" value="修改" id="btnEdit" runat="server" btntype="edit" recordid='<%#Eval("ID") %>' />
                        <asp:Button ID="btnDelete" runat="server" OnCommand="ModelManage_Del" CommandName="del"
                            CommandArgument='<%#Eval("ID") %>' OnClientClick="return reConfirm(this,'确定要删除这个模型至回收站吗?');"
                            RecordID='<%#Eval("ID") %>' Text="删除"></asp:Button>
                        <input type="button" value="参数设置" onclick="location.href='ModelListConfig.aspx?ID=<%#Eval("ID") %>&RefUrl=ModelManageList.aspx&NodeCode=<%=NodeCode %>&ModelName=<%# Eval("Title")%>&IsSub=<%=IsSub %>'" />
                        <input type="button" value="推荐区域" onclick="openframe({url:'RecommendAreaSet.aspx?ID=<%#Eval("ID") %>&NodeCode=<%=NodeCode %>&ModelName=<%# Eval("Title")%>',width:'600', height:'300'})" />
                        <asp:Button ID="btnCreateModel" RecordID='<%#Eval("ID") %>' OnClientClick="setLogTitle(this)"
                            CommandName='<%#Eval("IsEnable")%>' ToolTip='<%#Eval("TableName") %>' CommandArgument='<%#Eval("ID") %>'
                            OnCommand="CreateModel" runat="server" Text='<%$Resources:Common,Create %>'>
                        </asp:Button>
                        <%}
                          else
                          { %>
                        <span>
                            <asp:Button ID="btnRevert" runat="server" OnCommand="ModelManage_Del" CommandName="revert"
                                CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定还原这个模型吗?")'
                                Text="还原"></asp:Button>
                            <asp:Button runat="server" OnCommand="ModelManage_Del" CommandName="deldp" ToolTip='<%#Eval("TableName")%>'
                                CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定要彻底删除这个模型吗?")'
                                Text="删除"></asp:Button>
                        </span>
                        <%} %>
                    </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
        <ul class="page">
            <webdiyer:AspNetPager ID="Split" runat="server" CssClass="page" PageSize="18" AlwaysShow="True"
                UrlPaging="true" ShowCustomInfoSection="left" CustomInfoSectionWidth="28%" ShowPageIndexBox="always"
                PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>"
                HorizontalAlign="Center" NumericButtonCount="6">
            </webdiyer:AspNetPager>
        </ul>
    </div>
    <asp:HiddenField ID="hdnNodeCode" runat="server" />
    </form>

    <script type="text/javascript"><%=jsMessage %></script>

</body>
</html>
