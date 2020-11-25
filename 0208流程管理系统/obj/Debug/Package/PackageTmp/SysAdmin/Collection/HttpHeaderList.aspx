<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HttpHeaderList.aspx.cs" EnableEventValidation="false" Inherits="AllPower.WEB.SysAdmin.Collection.HttpHeaderList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>HttpHeader值列</title>
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
        <h4>当前位置：信息采集->HttpHeader值</h4>
        <div class="function">
            <input type="button" onclick="location.href='HttpHeaderConfigList.aspx'" value="返回" />
            <input type="button" onclick="location.href='HttpHeaderEdit.aspx?ConfigID=<%=ID %>'" value="添加" />
        </div>
        <ul class="ulheader">
            <li style="width: 230px">请求头</li>
            <li style="width:380px;">值</li>
            <li style=" width:120px;">操作</li>
        </ul>
        <asp:Repeater ID="rptHttpHeader" runat="server">
            <ItemTemplate>
                <ul class="ulheader ulbody">
                    <li style="width:230px" title="<%#Eval("RequestHeader")%>"><%#Eval("RequestHeader")%></li>
                    <li style="width: 380px;" title="<%#Eval("RequestValue")%>"><%#Eval("RequestValue")%></li>
                   <li style="width: 120px">
                    <input type="button"  value="修改" onclick="location.href='HttpHeaderEdit.aspx?action=edit&id=<%# Eval("ID")%>&ConfigID=<%=ID %>'" />
                        <asp:Button ID="LinkButton5" runat="server" OnCommand="HttpHeader_Del" CommandName="DELDP" CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定要彻底删除该记录吗?")' Text="删除"></asp:Button>
                                 </li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
     </div>
    </form>
</body>
</html>
