<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RuleList.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Collection.RuleList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>采集规则列表</title>
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
        <h4>当前位置：信息采集->采集任务->采集规则</h4>
        <div class="function">
            <input type="button" onclick="location.href='TaskList.aspx?page=<%=PageIndex %>'" value="返回" />
            <input type="button" onclick="location.href='RuleEdit.aspx?Action=add&TaskID=<%=this.ID %>&page=<%=PageIndex %>'" value="添加" />
        </div>
        <ul class="ulheader">
            <li style="width:250px">规则名称</li>
            <li style="width:100px;">规则类型</li>
            <li style="width:80px;">取分页地址</li>
            <li style="width:80px;">取下层地址</li>
             <li style="width:50px;">状态</li>
            <li style="width:50px;">排序</li>
            <li style=" width:150px;">操作</li>
        </ul>
        <asp:Repeater ID="rptRule" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width:250px" title="<%#Eval("Name")%>"><%#Eval("Name")%></li>
                    <li style="width: 100px;"><%#rule.ParseRuleType(Eval("RuleType"))%></li>
                    <li style="width:80px;"><%#AllPower.Common.Utils.ParseState(Eval("IsSA"), "未知")%></li>
                    <li style="width:80px;"><%#AllPower.Common.Utils.ParseState(Eval("IsCA"), "未知")%></li>
                    <li style=" width:50px;"><asp:LinkButton ID="LinkButton2" OnCommand="SetIsEnable" CommandArgument='<%#Eval("ID").ToString() + "|" + Eval("IsEnable").ToString()%>' CommandName="STATE" runat="server"><%#AllPower.Common.Utils.ParseState(Eval("IsEnable"),"状态不明")%></asp:LinkButton></li>
                    <li style="width:50px; text-align:center;" id="HQB_Orders_<%#Eval("ID") %>"><div style=" display:none;" ><img src="../image/loading.gif"/></div><span><input type="text" style="width: 35px;" value="<%#Eval("Orders") %>" onblur="setOrders('K_CollectionRule', '<%#Eval("ID") %>', this.value)" /></span></li>
                   <li style="width: 150px">
                    <input type="button"  value="修改" onclick="location.href='RuleEdit.aspx?action=edit&id=<%# Eval("ID")%>&TaskID=<%=this.ID %>&page=<%=PageIndex %>'" />
                        <asp:Button ID="LinkButton5" runat="server" OnCommand="Rule_Del" CommandName="DELDP" CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定要彻底删除该记录吗?")' Text="删除"></asp:Button>
                                 </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    </form>
  <script type="text/javascript"><%=jsMessage %></script>  
</body>
</html>
