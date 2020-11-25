<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileEditTxt.aspx.cs" Inherits="AllPower.WEB.SysAdmin.FileManage.FileEditTxt" ValidateRequest="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>文件管理 - 编辑文本类文件</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <script type="text/javascript" src="../js/listcheck.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <style type="text/css">
    .cRed,.cRed:visited,.cRed a,a.cRed:hover{color:#0000FF;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h4>
            位置： 系统管理 &gt; <asp:LinkButton runat="server" ID="lnkFileManage" 
                CssClass="breadcrumb_current" onclick="lnkFileManage_Click">文件管理</asp:LinkButton> &gt; <span class="breadcrumb_current">编辑文件</span><asp:HiddenField runat="server" ID="hidUrlReferrer" />
        </h4>
        <div id="searchContainer" style="height:25px;">
            <span style="float:left; line-height:25px;">
                <asp:Label runat="server" ID="lblPathTips"></asp:Label>
            </span>
        </div>
        <div class="function" style="height:10px;">        
        </div>
        <ul class="ulheader">
            <li style="width: 100%">编辑文件：<asp:Label runat="server" ID="lblObjectPath"></asp:Label></li>
        </ul>
        <ul class="ulheader ulbody" style="height:400px;">
            <li style="width:10%; height:400px;">内容：</li><li style="width:88%;height:400px;">
            <asp:TextBox runat="server" ID="txtContent" Height="397px" TextMode="MultiLine" 
                Width="100%"></asp:TextBox></li>
        </ul>
        <ul class="ulheader ulbody" style="height:30px;">
            <li style="width: 10%;"></li>
            <li style="width:80%; height:30px;"><asp:Button runat="server" ID="btnSubmit" Text="<%$Resources:Common,Update %>" onclick="btnSubmit_Click" />   
                <asp:Button runat="server" ID="btnBack" Text="返回" onclick="btnBack_Click"/></li>
        </ul>
        <span class="function fr">
        </span>
        <br clear="left" />
    </div>
    </form>
</body>
</html>
