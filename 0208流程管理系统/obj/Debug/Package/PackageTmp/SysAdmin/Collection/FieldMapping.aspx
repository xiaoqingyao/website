<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FieldMapping.aspx.cs" EnableViewState="false" Inherits="AllPower.WEB.SysAdmin.Collection.FieldMapping" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>字段映射</title>
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
<body style=" margin:0; padding:0;">
    <form id="theForm" runat="server">
    <div class="container">
        <ul class="ulheader">
            <li style="width:180px;">目标</li>
            <li style="width:180px;">源</li>
            <li style=" width:60px;">类型</li>
            <li style="width:60px;">为空</li>
            <li style=" width:80px;">是否存在缺省值</li>
        </ul>
        <div id="FiledList">
        <asp:repeater runat="server" ID="rptMapping">
            <ItemTemplate>
                <ul class="ulheader ulbody" id="<%#Eval("FieldName")%>">
                    <li style=" width:180px;" id="Target<%#Eval("FieldName")%>"><%#Eval("FieldName")%></li>
                    <li style=" width:180px;"><%#tbMapping.GetSourceTableFieldSelect(Eval("FieldName"))%></li>
                    <li style=" width:60px;" id="Type<%#Eval("FieldName")%>"><%#Eval("FieldType") %></li>
                    <li style="width:60px;"><%#AllPower.Common.Utils.ParseState(Eval("IsNull"),"")%></li>
                    <li style="width:80px;" title="点击设置缺省值"><input id="Default<%#Eval("FieldName")%>" onclick="showSiteMenu('<%#Eval("FieldName")%>')"  type="text" value="<%#Eval("IsDefault").ToString() == "0" ? "否" : "是"%>" />  </li>
                </ul>
            </ItemTemplate>
        </asp:repeater>
        </div>
    </div>
    <center>
        <input type="button" value="确 定" onclick="setFieldMapping()" />
        &nbsp;
        <input type="button" onclick="javascript:parent.Closed();" value="取 消" />
    </center>
    <input type="hidden" value="<%=SourceTableName %>" id="SourceTableName" />
    <input type="hidden" value="<%=TargetTableName %>" id="TargetTableName" />
        <asp:hiddenfield runat="server" ID="hdnSiteID"></asp:hiddenfield>
    <asp:HiddenField ID="hdnUser" runat="server" />
    </form>
</body>
</html>
