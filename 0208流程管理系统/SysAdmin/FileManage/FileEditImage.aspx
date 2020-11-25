<%@ Page Language="C#" AutoEventWireup="true" validateRequest="false" CodeBehind="FileEditImage.aspx.cs" Inherits="AllPower.WEB.SysAdmin.FileManage.FileEditImage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>文件管理 - 图片生成缩略图</title>
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
                CssClass="breadcrumb_current" onclick="lnkFileManage_Click">文件管理</asp:LinkButton> &gt; <span class="breadcrumb_current">图片生成缩略图</span><asp:HiddenField runat="server" ID="hidUrlReferrer" />
        </h4>
        <div id="searchContainer" style="height:25px;">
            <span style="float:left; line-height:25px;">
                <asp:Label runat="server" ID="lblPathTips"></asp:Label>
            </span>
        </div>
        <div class="function" style="height:10px;">        
        </div>
        <ul class="ulheader">
            <li style="width: 100%">图片生成缩略图：<asp:Label runat="server" ID="lblObjectPath"></asp:Label></li>
        </ul>
        <ul class="ulheader ulbody" style="height:130px;">
            <li style="width:10%; height:130px;">原始图片：<br />（缩小）</li><li style="width:80%;height:130px;"><asp:Image runat="server" ID="imgPhoto" /></li>
        </ul>
        <ul class="ulheader ulbody" style="height:50px;">
            <li style="width:10%">水印图片：</li><li style="width:80%;height:50px;"><asp:Image runat="server" ID="imgWaterMark" /></li>
        </ul>
        <ul class="ulheader ulbody" style="height:30px;">
            <li style="width: 10%;">图片长宽：</li>
            <li style="width:80%;height:30px;"><asp:TextBox runat="server" ID="txtWidth" Width="40px"></asp:TextBox> X <asp:TextBox runat="server" ID="txtHeight" Width="40px"></asp:TextBox> 如果不生成缩略图，请将缩略图长宽设置为 0</li>
        </ul>
        <ul class="ulheader ulbody" style="height:30px;">
            <li style="width: 10%;">水印类型：</li>
            <li style="width:80%;height:30px;"><asp:RadioButtonList runat="server" ID="radlWaterMarkType" 
                    RepeatDirection="Horizontal">
                <asp:ListItem Selected="True" Value="-1">不加水印</asp:ListItem>
                <asp:ListItem Value="0">文字水印</asp:ListItem>
                <asp:ListItem Value="1">图片水印</asp:ListItem>
                </asp:RadioButtonList></li>
        </ul>
        <ul class="ulheader ulbody" style="height:30px;">
            <li style="width: 10%;"></li>
            <li style="width:80%; height:30px;"><asp:Button runat="server" ID="btnSubmit" Text="<%$Resources:Common,UploadMsg3 %>" onclick="btnSubmit_Click" />   <asp:Button runat="server" ID="btnWaterMark" Text="<%$Resources:Common,AddWaterMark %>" onclick="btnWaterMark_Click" />
            <asp:Button runat="server" ID="btnBack" Text="返回" onclick="lnkFileManage_Click"/></li>
            </li>
        </ul>
        <span class="function fr">
        </span>
        <br clear="left" />
    </div>
    </form>
</body>
</html>