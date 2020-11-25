<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TableMapping.aspx.cs" EnableViewState="false" ValidateRequest="false" Inherits="AllPower.WEB.SysAdmin.Collection.TabelMapping" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>编辑映射</title>
    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>
    <script src="../JS/Common.js" type="text/javascript"></script>
    <script src="../JS/Collection.js" type="text/javascript"></script>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4>当前位置：信息采集->数据库发布->编辑映射</h4>
        
        <ul class="ulheader">
            <li style="width:300px">源表</li>
            <li style="width:300px;">目标表</li>
            <li style=" width:120px;">操作</li>
        </ul>
        <asp:repeater runat="server" ID="rptMapping">
            <ItemTemplate>
                <ul class="ulheader ulbody" id="<%#Container.DataItem%>">
                <li style=" width:300px;"><%#Container.DataItem%></li>
                <li style=" width:300px;"><%#tbMapping.GetTargetTableSelect(Container.DataItem)%></li>
                <li style=" width:120px;"><input type="button" value="字段映射" onclick="openFieldMapping('<%#Container.DataItem%>')" /></li>
                <input type="hidden" name="hdn_Field_<%#Container.DataItem%>" value="" id="hdn_Field_<%#Container.DataItem%>" />
                </ul>
            </ItemTemplate>
        </asp:repeater>
        
    <div class="Submit">
        <asp:Button ID="btnSave" OnClick="Save" runat="server" Text="确定" />&nbsp;<input type="button" onclick="location.href='PublishTaskList.aspx'" value="返 回" />
    </div>
   </div>
    <input type="hidden" id="PublishTaskID" value="<%=PublishTaskID %>" />
    <input type="hidden" id="CollectionTaskID" value="<%=CollectionTaskID %>" />
    </form>
    <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>

