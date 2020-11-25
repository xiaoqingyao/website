<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpecialList.aspx.cs" EnableEventValidation="false"
    Inherits="AllPower.WEB.SysAdmin.SysManage.SpecialList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>专题管理</title>

    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>

    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function() {
            $("#btnNew").click(function() { location.href = "SpecialEdit.aspx?action=add&NodeCode=<%=NodeCode %>"; })
            $("body").find("input").each(function() {
                if ($(this).attr("id").indexOf("_btnEdit") > -1) {
                    $(this).click(function() { location.href = "SpecialEdit.aspx?action=edit&ID=" + $(this).attr("RecordID") + "&NodeCode=<%=NodeCode %>"; })
                }
            });
        });

        function showMenuList(specialID) {
            location.href = "SpecialMenuList.aspx?ID="+ specialID +"&NodeCode=<%=NodeCode %>";
        }
    </script>
</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" />
    <div class="container">
        <h4>
            当前位置：<%GetPageNav(NodeCode); %></h4>
        <div id="searchContainer">
            <asp:DropDownList ID="ddlSearchType" runat="server">
                <asp:ListItem Text="专题名称" Value="[Name]"></asp:ListItem>
                <asp:ListItem Text="专题说明" Value="[Desc]"></asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtSearch" runat="server" Width="180" MaxLength="50" />
            &nbsp;
            <asp:Button ID="btnSearch" runat="server" Text="搜 索" OnClick="btnSearch_Click" />
        </div>
        <div class="function">
            <input type="button" onclick="location.href='SpecialEdit.aspx'" value="添加" />
            <input type="button" onclick="location.href='?'" value="专题列表" />
            <input type="button" value="回收站" style=" display:none;" onclick="location.href='?IsDel=1'" /></div>
        <ul class="ulheader">
            <li style="width: 10%">专题名称</li>
            <li style="width: 100px;">所属模型</li>
            <li style="width: 18%">专题说明</li>
            <li style="width: 60px">打开方式</li>
            <li style="width: 60px">排序</li>
            <li style="width: 30%">操作</li>
        </ul>
        <asp:Repeater ID="rptSpecial" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 10%"><span id="Title<%# Eval("ID")%>">
                        <%#Eval("Name") %></span> </li>
                    <li style="width: 100px;">
                        <%#Eval("ModelName") %>
                    </li>
                    <li style="width: 18%">
                        <%#Eval("Desc") %>
                    </li>
                    <li style="width: 60px;">
                        <%#AllPower.BLL.SysManage.Special.ParseOpenType(Eval("OpenType"))%></li>
                    <li style="width: 60px">
                        <input type="text" style="width: 50px;" value="<%#Eval("Orders") %>" onblur="setOrders('K_Special', '<%#Eval("ID") %>', this.value)" />
                    </li>
                    <li style="width: 30%">
                        <%if (IsDel == "")
                          { %>
                        <asp:Button ID="btnDelete" runat="server" OnCommand="Special_Del" CommandName="DELONE" CommandArgument='<%#Eval("ID") %>' OnClientClick="return reConfirm(this,'确定要删除当前记录吗?');" RecordID='<%#Eval("ID") %>' Text="删除"></asp:Button>
                        <input type="button" value="修改" id="btnEdit" runat="server" btntype="edit" recordid='<%#Eval("ID") %>' />
                        <input type="button" value="栏目列表" onclick="showMenuList('<%#Eval("ID") %>')" />
                        <input type="button" value="推荐区域" onclick="location.href='../Model/RecommendAreaList.aspx?SpecialID=<%#Eval("ID") %>&NodeCode=<%=NodeCode %>'" />
                        <input type="button" value="信息" onclick="location.href='SpecialInfoList.aspx?SpecialID=<%#Eval("ID") %>&NodeCode=<%=NodeCode %>'" />
                        <%}
                          else
                          { %>
                          <span style=" display:none;">
                        <asp:Button ID="LinkButton5" runat="server" OnCommand="Special_Del" CommandName="DELDP"
                            CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("将删除该专题下的所有栏目及所有专题信息，确定要彻底删除这个专题吗?")'
                            Text="删除"></asp:Button>
                        <asp:Button ID="btnRevert" runat="server" OnCommand="Special_Del" CommandName="REVERT"
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
