<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskList.aspx.cs" EnableEventValidation="false" Inherits="AllPower.WEB.SysAdmin.Collection.Task" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>任务列表</title>
    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/Common.js" type="text/javascript"></script>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4>
            当前位置：信息采集->任务列表</h4>
        <div id="searchContainer">
            <asp:DropDownList ID="ddlSearchType" runat="server">
                <asp:ListItem Text="名称" Value="[Name]"></asp:ListItem>
                <asp:ListItem Text="英文名称" Value="[EnName]"></asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtSearch" runat="server" Width="180" MaxLength="50" />
            &nbsp;
            <asp:Button ID="btnSearch" runat="server" Text="搜 索"  OnClick="btnSearch_Click" />
        </div>
        <div class="function">
                                        <%if (IsDel == "")
                                          { %>

            <input type="button" onclick="location.href='TaskEdit.aspx?Action=add'" value="添加" />
            <%} %>
                          <input type="button" onclick="location.href='?'" value="任务列表" />
            <input type="button" value="回收站" onclick="location.href='?IsDel=1'" />
        </div>
        <ul class="ulheader">
            <li style="width: 120px">任务名称</li>
            <li style="width: 120px;">英文名称</li>
            <li style=" width:200px;">简述</li>
            <li style="width:50px;">状态</li>
            <li style="width: 60px">添加用户</li>
            <li style="width: 80px">添加时间</li>
            <li style="width:50px">排序</li>
            <li style="width: 300px">操作</li>
        </ul>
        <asp:Repeater ID="rptTask" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width:120px" title="<%#Eval("Name")%>"><%#Eval("Name")%></li>
                    <li style="width:120px" title="<%#Eval("EnName")%>"><%#Eval("EnName")%></li>
                    <li style="width: 200px;" title="<%#Eval("Brief")%>"><%#Eval("Brief")%></li>
                    <li style=" width:50px;"><asp:LinkButton ID="LinkButton2" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsEnable").ToString()%>' CommandName="STATE" runat="server"><%#AllPower.Common.Utils.ParseState(Eval("IsEnable"),"状态不明")%></asp:LinkButton></li>
                    <li style="width: 60px"><%#Eval("AddMan")%></li>
                    <li style="width:80px;"><%#Eval("AddDate")%></li>
                    <li style="width:50px; text-align:center;" id="HQB_Orders_<%#Eval("ID") %>"><div style=" display:none;" ><img src="../image/loading.gif"/></div><span><input type="text" style="width: 35px;" value="<%#Eval("Orders") %>" onblur="setOrders('K_CollectionTask', '<%#Eval("ID") %>', this.value)" /></span></li>
                    <li style="width: 300px">
                                <%if (IsDel == ""){ %>
                    <input type="button"  value="修改" onclick="location.href='TaskEdit.aspx?ID=<%#Eval("ID") %>&action=edit'" />
                    <asp:Button ID="btnLabelVar" runat="server" OnCommand="Task_Del" CommandName="DELONE" CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定要删除该任务至回收站吗?")' Text="删除"></asp:Button>
                    <input type="button" onclick="location.href='Address.aspx?ID=<%#Eval("ID") %>&page=<%=Request.QueryString["page"] %>'" value="地址" />
                    <input type="button" onclick="location.href='RuleList.aspx?ID=<%#Eval("ID") %>&page=<%=Request.QueryString["page"] %>'" value="规则" />
                    <input type="button" onclick="location.href='FieldList.aspx?ID=<%#Eval("ID") %>&page=<%=Request.QueryString["page"] %>'" value="字段" />
                    <input type="button" onclick="location.href=''" value="测试" />
                    <input type="button" onclick="location.href='Spider.aspx?TaskID=<%#Eval("ID") %>'" value="采集" />
                                <%}
              else
                { %>
                    <asp:Button ID="LinkButton5" runat="server" OnCommand="Task_Del" CommandName="DELDP" CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定要彻底删除该任务吗?")' Text="删除"></asp:Button>
                    <asp:Button ID="btnRevert" runat="server" OnCommand="Task_Del" CommandName="REVERT" CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定还原该任务吗?")' Text="还原"></asp:Button>
                <%} %>
                </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
    </div>
   <span class="function fr"></span>
    <webdiyer:aspnetpager CssClass="page" id="Split" runat="server" pagesize="15" alwaysshow="True" onpagechanged="Split_PageChanged" showcustominfosection="Left"  showpageindexbox="always" pageindexboxtype="DropDownList" UrlPaging="true" custominfohtml="" CustomInfoSectionWidth="0px"></webdiyer:aspnetpager>
    </form>
</body>
</html>
