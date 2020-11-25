<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommonFieldList.aspx.cs"   Inherits="KingTop.Web.Admin.CommonFieldList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>部门管理</title>
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
</head>
<body >
    <form name="theForm" method="post" runat="server">
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
            <li>    
                <%if (IsDel == "0" || IsDel == ""){ %><input type="button"  value="增加字段" onclick="javascript:location.href='CommonFieldEdit.aspx?<%=urlParam %>';"><%} %>
                <input type="button" value="显示全部" onclick="location.href='?NodeCode=<%=NodeCode %>'" />
                <input type="button" value="回收站" onclick="location.href='?IsDel=1'" style=" display:none;" />
                <input type="button"  value="刷新" onclick="javascript:location.href=location.href;">
            </li>
        </ul>
        </div>
        <ul class="ulheader">
            <li style="width:180px;"><a href="javascript:sort('Name')">字段名</a></li>
            <li style="width:200px;">别名</li>
            <li style="width:80px;"><a href="javascript:sort('BasicField')">字段类型</a></li>
            <li  style="width:60px;"><a href="javascript:sort('IsSearch')">搜索显示</a></li>
            <li style="width:60px;"><a href="javascript:sort('IsListEnable')">列表显示</a></li>
            <li style="width:60px;"><a href="javascript:sort('IsInputValue')">编辑显示</a></li>
            <li style="width:40px;"><a href="javascript:sort('IsEnable')">状态</a></li>
            <li style="width:40px;"><a href="javascript:sort('IsRequired')">必填</a></li>
            <li style="width:50px;"><a href="javascript:sort('Orders')">排序</a></li>
             <li style="width:80px;"><a href="javascript:sort('IsDefault')">默认公用</a></li>
            <li  style="width:100px;">操作</li>
         </ul>
         <div id="FiledManageList">
        <asp:Repeater ID="rptModelField" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody" onmouseover="$(this).addClass('rowSelected')" onmouseout="$(this).removeClass('rowSelected')">
                    <li style="width:180px;"><%#Eval("Name") %></li>
                    <li style="width:200px;"><%#Eval("FieldAlias")%></li>
                    <li style="width:80px;"><%#commonField.BasicType[Eval("BasicField")]%></li>
                    <li  style="width:60px;">
                        <asp:LinkButton ID="LinkButton4" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsSearch").ToString()%>' CommandName="ISSEARCH" runat="server"><%#KingTop.Common.Utils.ParseIsOrNot(Eval("IsSearch"), "否")%></asp:LinkButton>&nbsp;
                    </li>
                    <li style="width:60px;">
                        <asp:LinkButton ID="LinkButton3" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsListEnable").ToString()%>' CommandName="ISLIST" runat="server"><%#KingTop.Common.Utils.ParseIsOrNot(Eval("IsListEnable"), "否")%></asp:LinkButton>
                    </li>
                    <li style="width:60px;">
                        <asp:LinkButton ID="LinkButton5" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsInputValue").ToString()%>' CommandName="ISEDIT" runat="server"><%#KingTop.Common.Utils.ParseIsOrNot(Eval("IsInputValue"), "否")%></asp:LinkButton>
                    </li>
                    <li style="width:40px;">
                    <asp:LinkButton ID="LinkButton2" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsEnable").ToString()%>' CommandName="STATE" runat="server"><%#KingTop.Common.Utils.ParseState(Eval("IsEnable"),"状态不明")%></asp:LinkButton></li>
                    <li style="width:40px;">
                    <asp:LinkButton ID="LinkButton1" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsRequired").ToString()%>' CommandName="REQUIRED" runat="server"><%#KingTop.Common.Utils.ParseIsOrNot(Eval("IsRequired"), "否")%></asp:LinkButton>
                   </li>
                    <li style="width:50px; text-align:center;" id="HQB_Orders_<%#Eval("ID") %>"><div style=" display:none;" ><img src="../image/loading.gif"/></div><span><input type="text" style="width: 35px;" value="<%#Eval("Orders") %>" onblur="setOrders('K_ModelCommonField', '<%#Eval("ID") %>', this.value)" /></span></li>
                    <li style="width:80px;">
                        <asp:LinkButton ID="LinkButton6" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsDefault").ToString()%>' CommandName="ISDEFAULT" runat="server"><%#KingTop.Common.Utils.ParseIsOrNot(Eval("IsDefault"), "否")%></asp:LinkButton>
                    </li>
                    <li  style="width:100px;">
                        <%if (IsDel == "0" || IsDel == "")
                          { %>
                        
                        <input type="button" value="修改" id="btnEdit"  onclick="location.href='CommonFieldEdit.aspx?action=edit&id=<%# Eval("ID")%>&<%= urlParam%>'"/>
                        <asp:Button ID="btnLogicDelete" runat="server" OnCommand="CommonField_Del" CommandName="DELONE"  CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定要删除这个字段至回收站吗?")' Text="删除"></asp:Button>
                            <%}
                          else
                          { %>
                        <asp:Button ID="btnRevert" runat="server" OnCommand="CommonField_Del" CommandName="REVERT" CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定还原这个字段吗?")' Text="还原"></asp:Button>
                           <asp:Button ID="btnDelete" runat="server" OnCommand="CommonField_Del" CommandName="DELDP"  CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定要彻底删除这个字段吗?")' Text="删除"></asp:Button>
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
        </ul>    <asp:hiddenfield ID="hdnUrlParm" runat="server"></asp:hiddenfield>
    <input type="hidden" id="IsListPage"  value="1"/>
    </form>
    <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>

