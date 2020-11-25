<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FieldList.aspx.cs" EnableEventValidation="false"  Inherits="AllPower.WEB.SysAdmin.Collection.FieldList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>采集字段</title>
    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
    <script src="../JS/Common.js" type="text/javascript"></script>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4>当前位置：信息采集->采集任务-> 采集字段</h4>
        <div id="searchContainer">
            <asp:DropDownList ID="ddlSearchType" runat="server">
                <asp:ListItem Text="字段名称" Value="[Name]"></asp:ListItem>
                <asp:ListItem Text="字段别名" Value="[Alias]"></asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtSearch"  runat="server" Width="180" MaxLength="50" />
            &nbsp;
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="搜 索"  />
        </div>
        <div class="function">
            <input type="button" onclick="location.href='TaskList.aspx'" value="返回" />
            <input type="button" onclick="location.href='FieldEdit.aspx?Action=add&TaskID=<%=this.ID %>'" value="添加" />
        </div>
        <ul class="ulheader">
            <li style="width:120px">字段名</li>
            <li style="width:100px">字段别名</li>
            <li style="width:120px">所属表名</li>
            <li style="width:120px;">所属规则</li>
            <li style="width:80px;">字段类型</li>
            <li style="width:70px;">循环采集</li>
            <li style="width:50px;">关键字</li>
            <li style="width:60px;">需要合并</li>
            <li style="width:50px;">状态</li>
            <li style="width:50px;">排序</li>
            <li style=" width:180px;">操作</li>
        </ul>
        <asp:Repeater ID="rptField" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width:120px" title="<%#Eval("Name")%>"><%#Eval("Name")%></li>
                    <li style="width: 100px;"><%#Eval("Alias")%></li>
                    <li style="width: 120px;"><%#Eval("TableName")%></li>
                    <li style="width: 120px;"><%#Eval("RuleName")%></li>
                    <li style="width: 80px;"><%#field.ParseFieldType(Eval("FieldType"))%></li>
                    <li style=" width:70px;"><asp:LinkButton ID="LinkButton3" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsCycle").ToString()%>' CommandName="ISCYCLE" runat="server"><%#AllPower.Common.Utils.ParseState(Eval("IsCycle"), "未知")%></asp:LinkButton></li>
                    <li style=" width:50px;"><asp:LinkButton ID="LinkButton1" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsKeyword").ToString()%>' CommandName="ISKEYWORD" runat="server"><%#AllPower.Common.Utils.ParseState(Eval("IsKeyword"), "未知")%></asp:LinkButton></li>
                    <li style=" width:60px;"><asp:LinkButton ID="LinkButton4" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsJoin").ToString()%>' CommandName="ISJOIN" runat="server"><%#AllPower.Common.Utils.ParseState(Eval("IsJoin"), "未知")%></asp:LinkButton></li>
                    <li style=" width:50px;"><asp:LinkButton ID="LinkButton2" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsEnable").ToString()%>' CommandName="STATE" runat="server"><%#AllPower.Common.Utils.ParseState(Eval("IsEnable"), "未知")%></asp:LinkButton></li>
                    <li style="width:50px; text-align:center;" id="HQB_Orders_<%#Eval("ID") %>"><div style=" display:none;" ><img src="../image/loading.gif"/></div><span><input type="text" style="width: 35px;" value="<%#Eval("Orders") %>" onblur="setOrders('K_CollectionField', '<%#Eval("ID") %>', this.value)" /></span></li>
                   <li style="width: 180px">
                    <input type="button"  value="修改" onclick="location.href='FieldEdit.aspx?action=edit&id=<%# Eval("ID")%>&TaskID=<%=this.ID %>'" />
                        <asp:Button ID="LinkButton5" runat="server" OnCommand="Field_Del" CommandName="DELDP" CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定要彻底删除该记录吗?")' Text="删除"></asp:Button>
                    <input type="button"  value="结果替换" onclick="location.href='FieldReplaceList.aspx?id=<%# Eval("ID")%>&TaskID=<%=this.ID %>'" />
                                 </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
    </div>
   <span class="function fr"></span>
    <webdiyer:aspnetpager CssClass="page" id="FieldSplit" runat="server" pagesize="15" alwaysshow="True" onpagechanged="FieldSplit_PageChanged" showcustominfosection="Left"  showpageindexbox="always" pageindexboxtype="DropDownList" UrlPaging="true" custominfohtml="" CustomInfoSectionWidth="0px"></webdiyer:aspnetpager>
    </form>
    <script type="text/javascript"> <%=jsMessage %></script>
</body>
</html>
