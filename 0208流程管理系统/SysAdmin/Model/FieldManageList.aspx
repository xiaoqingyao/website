<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FieldManageList.aspx.cs"   Inherits="AllPower.Web.Admin.FieldManageList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>模型字段列表</title>
        <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
        <script type="text/javascript" src="../js/publicform.js"></script>
        <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="../js/jquery.dialog.js"></script>
        <script type="text/javascript" src="../js/win.js"></script>
        <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
        <script type="text/javascript" src="../js/Common.js"></script>
        <script src="../JS/FieldManage.js" type="text/javascript"></script>
        <style type="text/css">.rowSelected{background-color:#efefef;} a{color:#000000;}</style>
        <script type="text/javascript">
            $(function() {
            $("#btnNew").click(function() { location.href = "FieldManageEdit.aspx?action=add&<%= urlParam%>"; })
                $("body").find("input").each(function() {
                    if ($(this).attr("id").indexOf("_btnEdit") > -1) {
                        $(this).click(function() { location.href = "FieldManageEdit.aspx?action=edit&id=" + $(this).attr("RecordID") + "&<%= urlParam%>"; })
                    }
                });
            });
</script>
</head>
<body >
    <form name="theForm" method="post" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" />
    <div class="container">
        <h4>
            当前位置： <%GetPageNav(NodeCode);%></h4>
            <div id="searchContainer">
            <span>
                <asp:DropDownList ID="ddlSearchType" runat="server">
                    <asp:ListItem Text="名称" Value="[Name]"></asp:ListItem>
                    <asp:ListItem Text="别名" Value="[FieldAlias]"></asp:ListItem>
                </asp:DropDownList>
            </span>
            <asp:TextBox ID="txtSearch" runat="server" Width="180" MaxLength="50" />
            &nbsp;
            <asp:Button ID="btnSearch" runat="server" Text="搜 索"  OnClick="btnSearch_Click" />
        </div>
        <div class="function">
        <ul style=" list-style:none; height:25px;">
            <li style=" width:38%; float:left; text-align:left;">    
                <input type="button" value="显示全部" onclick="location.href='?ModelID=<%=ModelID %>&TableName=<%=TableName %>&NodeCode=<%=NodeCode %>&ModelName=<%=ModelName %>&IsSub=<%=IsSub %>'" />
                <input type="button" value="回收站"  onclick="location.href='?IsDel=1&ModelID=<%=ModelID %>&TableName=<%=TableName %>&IsSub=<%=IsSub %>'" />
                <input type="button"  value="刷新" onclick="javascript:location.href=location.href;">
                <input type="button" value="返回" onclick="javascript:location.href='ModelManageList.aspx?NodeCode=<%=NodeCode %>&IsSub=<%=IsSub %>';">
            </li>
            <li style="width:58%; float:left; text-align:right;">
                <input type="button"  value="增加字段" onclick="javascript:location.href='FieldManageEdit.aspx?<%=urlParam %>';">
                <input type="button" value="参数设置" onclick="location.href='ModelListConfig.aspx?ID=<%=ModelID %>&RefUrl=FieldManageList.aspx&TableName=<%=TableName %>&NodeCode=<%=NodeCode %>&IsSub=<%=IsSub %>'" />
                <input type="button" value="推荐区域" onclick="openframe({url:'RecommendAreaSet.aspx?ID=<%=ModelID %>&NodeCode=<%=NodeCode %>&ModelName=<%=ModelName %>',width:'600', height:'300'})" />
                <input type="button" value="分组管理" onclick="javascript:location.href='ModelFieldGroupList.aspx?<%= urlParam%>';">
               <asp:Button ID="btnCreateModel"  OnCommand="CreateModel" runat="server" Text="生成模型"></asp:Button>
            </li>
        </ul>
        </div>
        <ul class="ulheader">
            <li style="width:100px;"><a href="javascript:sort('Name')">字段名</a></li>
            <li style="width:100px;">别名</li>
            <li style="width:110px;"><a href="javascript:sort('ModelFieldGroupId')">所属分组</a></li>
            <li style="width:80px;"><a href="javascript:sort('BasicField')">字段类型</a></li>
            <li style="width:40px;"><a href="javascript:sort('IsSystemFiierd')">系统</a></li>
            <li  style="width:60px;"><a href="javascript:sort('IsSearch')">搜索显示</a></li>
            <li style="width:60px;"><a href="javascript:sort('IsListEnable')">列表显示</a></li>
            <li style="width:60px;"><a href="javascript:sort('IsInputValue')">编辑显示</a></li>
            <li style="width:40px;"><a href="javascript:sort('IsEnable')">状态</a></li>
            <li style="width:40px;"><a href="javascript:sort('IsRequired')">必填</a></li>
            <li style="width:50px;"><a href="javascript:sort('Orders')">排序</a></li>
            <li  style="width:100px;">操作</li>
         </ul>
         <div id="FiledManageList">
        <asp:Repeater ID="rptModelField" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody" onmouseover="$(this).addClass('rowSelected')" onmouseout="$(this).removeClass('rowSelected')">
                    <li style="width:100px;"><span id="Title<%# Eval("ID")%>"><%#Eval("Name") %></span></li>
                    <li style="width:100px;"><%#Eval("FieldAlias")%></li>
                    <li style="width:110px; text-align:center;" id="HQB_FileGroup_<%#Eval("ID") %>"><div style=" display:none;" ></div><span><%#fieldManage.FieldGroupHtml.Replace("{#Selected#}", Eval("ModelFieldGroupId").ToString()).Replace("{#ID#}", Eval("ID").ToString())%></span></li>
                    <li style="width:80px;"><%#fieldManage.BasicType[Eval("BasicField")]%></li>
                    <li style="width:40px; color:Red;"><%#AllPower.Common.Utils.ParseModelFieldState(Eval("IsSystemFiierd"), "")%></li>
                    <li  style="width:60px;">
                        <asp:LinkButton ID="LinkButton4"  OnCommand="SetIsEnable"  OnClientClick="setLogTitle(this)"  RecordID='<%#Eval("ID") %>' CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsSearch").ToString()%>' CommandName="ISSEARCH" runat="server"><%#AllPower.Common.Utils.ParseIsOrNot(Eval("IsSearch"), "否")%></asp:LinkButton>&nbsp;
                        <a title="点击配置搜索相关属性" href="javascript:openConfig('1','<%#Eval("ID") %>')">设置</a>
                    </li>
                    <li style="width:60px;">
                        <asp:LinkButton ID="LinkButton3"  OnCommand="SetIsEnable"  OnClientClick="setLogTitle(this)"  RecordID='<%#Eval("ID") %>' CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsListEnable").ToString()%>' CommandName="ISLIST" runat="server"><%#AllPower.Common.Utils.ParseIsOrNot(Eval("IsListEnable"), "否")%></asp:LinkButton>
                        &nbsp;<a title="点击配置列表列相关属性" href="javascript:openConfig('2','<%#Eval("ID") %>')">设置</a>
                    </li>
                    <li style="width:60px;">
                        <asp:LinkButton ID="LinkButton5"  OnCommand="SetIsEnable"  OnClientClick="setLogTitle(this)"  RecordID='<%#Eval("ID") %>' CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsInputValue").ToString()%>' CommandName="ISEDIT" runat="server"><%#AllPower.Common.Utils.ParseIsOrNot(Eval("IsInputValue"), "否")%></asp:LinkButton>
                        &nbsp;<a title="点击配置编辑页相关属性" href="javascript:openConfig('3','<%#Eval("ID") %>')">设置</a>
                    </li>
                    <li style="width:40px;">
                    <asp:LinkButton ID="LinkButton2"  OnCommand="SetIsEnable"  OnClientClick="setLogTitle(this)"  RecordID='<%#Eval("ID") %>' CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsEnable").ToString()%>' CommandName="STATE" runat="server"><%#AllPower.Common.Utils.ParseState(Eval("IsEnable"),"状态不明")%></asp:LinkButton></li>
                    <li style="width:40px;">
                    <asp:LinkButton ID="LinkButton1"  OnCommand="SetIsEnable"  OnClientClick="setLogTitle(this)"  RecordID='<%#Eval("ID") %>' CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsRequired").ToString()%>' CommandName="REQUIRED" runat="server"><%#AllPower.Common.Utils.ParseIsOrNot(Eval("IsRequired"), "否")%></asp:LinkButton>
                   </li>
                    <li style="width:50px; text-align:center;" id="HQB_Orders_<%#Eval("ID") %>"><div style=" display:none;" ><img src="../image/loading.gif"/></div><span><input type="text" style="width: 35px;" value="<%#Eval("Orders") %>" onblur="setOrders('K_ModelField', '<%#Eval("ID") %>', this.value)" /></span></li>
                    <li  style="width:100px;">
                        <%if (IsDel == "0" || IsDel == "")
                          { %>
                        <input type="button" value="修改"　id="btnEdit"　runat="server" BtnType="edit"  RecordID='<%#Eval("ID") %>' />
                        <asp:Button ID="btnDelete" runat="server"　OnCommand="FieldManage_Del" CommandName="DELONE" Enabled='<%#!Convert.ToBoolean(Eval("IsSystemFiierd")) %>' CommandArgument='<%#Eval("ID") %>'  OnClientClick="return reConfirm(this,'确定要删除这个字段至回收站吗?');" RecordID='<%#Eval("ID") %>' Text="删除"></asp:Button>
                            <%}
                          else
                          { %>
                          <span>
                        <asp:Button ID="btnRevert" runat="server" OnCommand="FieldManage_Del" CommandName="REVERT" CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定还原这个字段吗?")' Text="还原"></asp:Button>
                           <asp:Button runat="server" OnCommand="FieldManage_Del" CommandName="DELDP" Enabled='<%#!Convert.ToBoolean(Eval("IsSystemFiierd")) %>' CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定要彻底删除这个字段吗?")' Text="删除"></asp:Button>
                            </span>
                             <%} %>
                    </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
        </div>
    </div>
        <ul class="page">
            <webdiyer:AspNetPager ID="Split" runat="server" CssClass="page" PageSize="18" AlwaysShow="True"
                UrlPaging="true" ShowCustomInfoSection="left" CustomInfoSectionWidth="28%" ShowPageIndexBox="always"
                PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>"
                HorizontalAlign="Center" NumericButtonCount="6">
            </webdiyer:AspNetPager>
        </ul>
    <asp:hiddenfield ID="hdnUrlParm" runat="server"></asp:hiddenfield>
    <input type="hidden" id="IsListPage"  value="1"/>
    </form>
    <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>

