<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecommendAreaList.aspx.cs" EnableEventValidation="false" Inherits="AllPower.WEB.SysAdmin.Model.RecommendAreaList" %>


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
            当前位置：模型管理->推荐区域列表</h4>
            <div id="searchContainer">
            <span>
                <asp:DropDownList ID="ddlSearchType" runat="server">
                    <asp:ListItem Text="区域名称" Value="[Name]"></asp:ListItem>
                </asp:DropDownList>
            </span>
            <asp:TextBox ID="txtSearch" runat="server" Width="180" MaxLength="50" />
            &nbsp;
            <asp:Button ID="btnSearch" runat="server" Text="搜 索"  OnClick="btnSearch_Click" />
        </div>
          <div class="function">
                      <%if (SpecialID != "")
                        { %>
              <input type="button" value="返回" onclick="location.href='../SysManage/SpecialList.aspx'" />
              <%} %>
             <input type="button" onclick="location.href='RecommendAreaEdit.aspx?action=add&SpecialID=<%=SpecialID %>'" value="添加" />
              <input type="button" onclick="location.href='?SpecialID=<%=SpecialID %>'" value="区域列表" />
            <input type="button" value="回收站" onclick="location.href='?IsDel=1&SpecialID=<%=SpecialID %>'" />
        </div>
             <ul class="ulheader">
            <li style="width:120px;">推荐区域名称</li>
               <li style="width: 80px;">字段名</li>
            <li style="width: 100px;">所属站点</li>
            <li style="width: 80px;">添加用户</li>
            <li  style="width: 40px;">状态</li>
            <li style="width: 60px;">排序</li>
            <li style="width: 300px;">操作</li>
        </ul>
                <asp:Repeater ID="rptRecommendArea" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">    
        <li style="width:120px;"><%#Eval("Name") %></li>
               <li style="width: 80px;"><%#Eval("FieldName") %></li>
            <li style="width: 100px;"><%#GetSiteName(Eval("SiteID")) %></li>
            <li style="width: 80px;"><%#Eval("AddMan") %></li>
                    <li style="width: 40px;">
                        <asp:LinkButton ID="LinkButton2" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsEnable").ToString()%>'
                            CommandName="STATE" runat="server">
                                <%#AllPower.Common.Utils.ParseState(Eval("IsEnable"),"状态不明")%>
                        </asp:LinkButton>
                    </li>            <li style="width: 60px;"><input type="text" style="width: 50px;" value="<%#Eval("Orders") %>" onblur="setOrders('K_RecommendArea', '<%#Eval("ID") %>', this.value)" /></li>
            <li style="width:300px;">
            <% if (IsDel == "")
              { %>
            <input type="button" value="修改" id="btnEdit"  onclick="location.href='RecommendAreaEdit.aspx?action=edit&id=<%# Eval("ID")%>&SpecialID=<%=SpecialID %>'"/>
            <asp:Button ID="btnLogicDelete" runat="server" OnCommand="RecommendArea_Del"
                CommandName="del" CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定要删除当前记录至回收站吗?")' Text="删除"></asp:Button>
          <input type="button" value="区域位置"  onclick="location.href='RecommendAreaPositionList.aspx?id=<%# Eval("ID")%>&SpecialID=<%=SpecialID %>'"/>
               <%}else{ %>
            <asp:Button ID="btnRevert" runat="server" OnCommand="RecommendArea_Del" CommandName="revert" CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定还原当前记录吗?")' Text="还原"></asp:Button>
           <asp:Button ID="btnDelete" runat="server" OnCommand="RecommendArea_Del" CommandName="deldp" CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定要彻底删除当前区域，将连同删除区域下的所有位置。")' Text="删除"></asp:Button>
                <%} %>
            </li> 
            </ul>
            </ItemTemplate>
        </asp:Repeater>
</div> 
<span class="function fr">  </span>

    <webdiyer:aspnetpager CssClass="page" id="Split" runat="server" pagesize="15" alwaysshow="True" onpagechanged="Split_PageChanged"
        showcustominfosection="Left"  showpageindexbox="always"
        pageindexboxtype="DropDownList" custominfohtml="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，每页显示%PageSize%条记录">
        </webdiyer:aspnetpager>
    </form>
</body>
</html>
