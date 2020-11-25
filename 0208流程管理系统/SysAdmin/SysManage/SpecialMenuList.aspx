<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpecialMenuList.aspx.cs"
    EnableEventValidation="false" Inherits="AllPower.WEB.SysAdmin.SysManage.SpecialMenuList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>专题栏目管理</title>

    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script type="text/javascript">
        $(function() {
            $("#btnNew").click(function() { location.href = "SpecialMenuEdit.aspx?action=add&NodeCode=<%=NodeCode %>"; })
            $("body").find("input").each(function() {
                if ($(this).attr("id").indexOf("_btnEdit") > -1) {
                    $(this).click(function() { location.href = "SpecialMenuEdit.aspx?action=edit&ID=" + $(this).attr("RecordID") + "&NodeCode=<%=NodeCode %>&SpecialID=<%=this.ID %>"; })
                }
            });
        });
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" />
    <div class="container">
        <h4>
            位置：<%GetPageNav(NodeCode); %></h4>
        <div id="searchContainer">
            <asp:DropDownList ID="ddlSearchType" runat="server">
                <asp:ListItem Text="名称" Value="[Name]"></asp:ListItem>
                <asp:ListItem Text="描述" Value="[Desc]"></asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtSearch" runat="server" Width="180" MaxLength="50" />
            &nbsp;
            <asp:Button ID="btnSearch" runat="server" Text="搜 索" OnClick="btnSearch_Click" />
        </div>
        <div class="function">
            <input type="button" onclick="location.href='SpecialList.aspx?NodeCode=<%=NodeCode %>'" value="返回" />
            <input type="button" onclick="location.href='SpecialMenuEdit.aspx?SpecialID=<%=this.ID %>&NodeCode=<%=NodeCode %>'" value="添加" />
            <input type="button" onclick="location.href='SpecialMenuList.aspx?ID=<%=this.ID %>&NodeCode=<%=NodeCode %>'" value="专题栏目列表" />
            <input type="button" style="display:none;" value="回收站" onclick="location.href='?IsDel=1&ID=<%=this.ID %>'" />
        </div>
        <ul class="ulheader">
            <li style="width: 15%">专题栏目名称</li>
            <li style="width: 10%">所属专题</li>
            <li style="width: 10%">所属模型</li>
            <li style="width: 10%">打开方式</li>
            <li style="width: 20%">专题栏目描述</li>
            <li style="width: 10%">排序</li>
            <li style="width: 18%">专题栏目操作</li>
        </ul>
        <asp:Repeater ID="rptSpecialMenu" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 15%">
                        <span id="Title<%# Eval("ID")%>">
                        <%#Eval("Name") %></span>
                    </li>
                    <li style="width: 10%">
                        <%#Eval("SpecialName") %>
                    </li>
                    <li style="width: 10%">
                        <%#Eval("ModelName")%>
                    </li>
                    <li style="width: 10%">
                        <%#AllPower.BLL.SysManage.SpecialMenu.ParseOpenType(Eval("OpenType"))%></li>
                    <li style="width: 20%">
                        <%#Eval("Desc") %>
                    </li>
                    <li style="width: 10%">
                        <input type="text" value="<%#Eval("Orders") %>" onblur="setOrders('K_SpecialMenu', '<%#Eval("ID") %>', this.value)" />
                    </li>
                    <li style="width: 18%">
                        <%if (IsDel == "")
                          { %>
                        <asp:Button ID="btnDelete" runat="server" OnCommand="SpecialMenu_Del" CommandName="DELONE" CommandArgument='<%#Eval("ID") %>' OnClientClick="return reConfirm(this,'确定要删除当前记录吗?');" RecordID='<%#Eval("ID") %>' Text="删除"></asp:Button>
                        <input type="button" value="修改" id="btnEdit" runat="server" btntype="edit"  recordid='<%#Eval("ID") %>' />
                        <input type="button" value="信息" onclick="location.href='SpecialInfoList.aspx?SpecialID=<%#Eval("SpecialID") %>&SpecialMenuID=<%#Eval("ID") %>&NodeCode=<%=NodeCode %>'" />
                        <%}
                          else
                          { %>
                          <span style="display:none;">
                        <asp:Button ID="LinkButton5" runat="server" OnCommand="SpecialMenu_Del" CommandName="DELDP"
                            CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定要彻底删除这个专题栏目吗?")'
                            Text="删除"></asp:Button>
                        <asp:Button ID="btnRevert" runat="server" OnCommand="SpecialMenu_Del" CommandName="REVERT"
                            CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定还原当前记录吗?")'
                            Text="还原"></asp:Button>
                            </span>
                        <%} %>
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
    </form>
    <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>
