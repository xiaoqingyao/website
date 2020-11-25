<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecommendAreaPositionList.aspx.cs"  EnableEventValidation="false"   Inherits="KingTop.WEB.SysAdmin.Model.RecommendAreaPositionList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../JS/Common.js" type="text/javascript"></script>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <script src="../JS/Common.js" type="text/javascript"></script>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4>
            当前位置：模型管理->推荐区域位置列表</h4>
            <div id="searchContainer">
            <span>
                <asp:DropDownList ID="ddlSearchType" runat="server">
                    <asp:ListItem Text="位置名称" Value="[Name]"></asp:ListItem>
                     <asp:ListItem Text="位置标识" Value="[Tags]"></asp:ListItem>
                </asp:DropDownList>
            </span>
            <asp:TextBox ID="txtSearch" runat="server" Width="180" MaxLength="50" />
            &nbsp;
            <asp:Button ID="btnSearch" runat="server" Text="搜 索"  OnClick="btnSearch_Click" />
        </div>
           <div class="function">
               <input type="button" onclick="location.href='RecommendArealist.aspx?SpecialID=<%=SpecialID %>'" value="返回" />
             <input type="button" onclick="location.href='RecommendAreaPositionEdit.aspx?action=add&AreaID=<%=areaID %>&SpecialID=<%=SpecialID %>'" value="添加" />
              <input type="button" onclick="location.href='?ID=<%=areaID %>&SpecialID=<%=SpecialID %>'" value="区域位置列表" />
            <input type="button" value="回收站" onclick="location.href='?IsDel=1&ID=<%=areaID %>&SpecialID=<%=SpecialID %>'" />
        </div>

        <ul class="ulheader">
            <li style="width: 120px;">所属推荐区域</li>
            <li style="width: 80px;">位置名称</li>
            <li style="width: 100px;">位置标识</li>
            <li style="width: 80px;">添加用户</li>
            <li  style="width: 40px;">状态</li>
            <li style="width: 60px;">排序</li>
            <li style="width: 260px;">操作</li>
        </ul>
        <asp:Repeater ID="rptRecommendAreaPosition" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width: 120px;"><%#GetRecommendAreaName(Eval("RecommendAreaID")) %></li>
                    <li style="width: 80px; color:<%#Eval("FontColor")%>;<%#Eval("FontSylte")%>"><%#Eval("Name") %></li>
                    <li style="width: 100px;"><%#Eval("Tags")%></li>
                    <li style="width: 80px;"><%#Eval("AddMan")%></li>
                    <li style="width: 40px;"><asp:LinkButton ID="LinkButton2" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsEnable").ToString()%>' CommandName="STATE" runat="server"><%#KingTop.Common.Utils.ParseState(Eval("IsEnable"),"状态不明")%></asp:LinkButton></li>
                    <li style="width: 60px;"><input type="text" style="width: 50px;" value="<%#Eval("Orders") %>" onblur="setOrders('K_RecommendAreaPosition', '<%#Eval("ID") %>', this.value)" /></li>
                    <li style="width: 260px;">
                        <%if (IsDel == "")
                          { %>
                        <input type="button" value="修改" id="btnEdit"  onclick="location.href='RecommendAreaPositionEdit.aspx?action=edit&id=<%# Eval("ID").ToString()%>&areaID=<%=areaID %>&SpecialID=<%=SpecialID %>'"/>
                        <asp:Button ID="btnLogicDelete" runat="server" OnCommand="RecommendAreaPosition_Del" CommandName="del" CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定要删除当前记录至回收站吗?")' Text="删除"></asp:Button>
                            <%}
                          else
                          { %>
                        <asp:Button ID="btnRevert" runat="server" OnCommand="RecommendAreaPosition_Del" CommandName="revert" CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定还原当前记录吗?")' Text="还原"></asp:Button>
                        <asp:Button ID="btnDelete" runat="server" OnCommand="RecommendAreaPosition_Del" CommandName="deldp" CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定要彻底删除当前区域位置。")' Text="删除"></asp:Button>
                           <%} %>
                    </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <span class="function fr"></span>
    <webdiyer:AspNetPager CssClass="page" ID="Split" runat="server" PageSize="15" AlwaysShow="True"
        OnPageChanged="Split_PageChanged" ShowCustomInfoSection="Left" ShowPageIndexBox="always"
        PageIndexBoxType="DropDownList" CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，每页显示%PageSize%条记录">
    </webdiyer:AspNetPager>
    </form>
</body>
</html>
