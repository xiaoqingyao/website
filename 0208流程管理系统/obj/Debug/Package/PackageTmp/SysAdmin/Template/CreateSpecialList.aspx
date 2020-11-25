<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateSpecialList.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.SysManage.CreateSpecialList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>发布管理</title>
    <link href="../CSS/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script src="../Calendar/WdatePicker.js" type="text/javascript"></script>
 </head>
 <body>
<form id="theForm" runat="server">
<div class="container">
    <h4>位置：<a href="TemplateList.aspx">模板管理</a> > <a>发布专题列表</a></h4>
    <div id="panel">
    <dl>
    <dt></dt>
    <dd>
    <asp:ListBox ID="lstbSpecialMenu" class="selectList" SelectionMode="Multiple" runat="server"
            Width="360" Height="450"></asp:ListBox>
    </dd></dl>
    </div>
    <div class="Submit" >
        <asp:Button runat="server" ID="btnCreateSpecialList" Text="立即生成" CssClass="subButton" onclick="btnCreateSpecialList_Click"/>
    </div>
</div>
</form>
</body>
</html>