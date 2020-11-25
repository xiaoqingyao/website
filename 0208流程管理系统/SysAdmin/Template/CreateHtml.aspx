<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateHtml.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Template.CreateHtml" %>
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
    <h4>位置：<a href="TemplateList.aspx">模板管理</a> > <a>发布管理</a></h4>
    <div id="panel">
        <!--<dl>
            <dt>生成页面类型：</dt>
            <dd><asp:RadioButton runat="server" GroupName="CreateType" ID="rbtnCreateType1" Text="静态页面" />　<asp:RadioButton runat="server" GroupName="CreateType" ID="rbtnCreateType0" Text="动态页面" /></dd>
        </dl>-->
        <dl>
            <dt>生成的页面包括：</dt>
            <dd><asp:CheckBox runat="server" Checked="true" ID="cbtnIndex" Text="网站首页" />
            <asp:CheckBox runat="server" Checked="true" ID="cbtnClassIndex" Text="栏目首页" />
            <asp:CheckBox runat="server" ID="cbtnClassList" Checked="true" Text="栏目列表" />　<asp:CheckBox runat="server" ID="cbtnClassDetail" Checked="true" Text="内容页面" /></dd>
        </dl>
                   <dl>
            <dt>是否复制样式及相关动态文件：</dt>
            <dd><asp:CheckBox ID="chkIsCopyFile"  runat="server" /></dd>
        </dl>

        <dl>
            <dt>只生成未生成页面：</dt>
            <dd><asp:CheckBox ID="chkUnPublished" runat="server" /></dd>
        </dl>
        <dl>
            <dt>生成内容的ID：</dt>
            <dd><asp:RadioButton runat="server" ID="rbtnCreate2" GroupName="create" /> <asp:TextBox runat="server" ID="txtDetailId" Width="300"></asp:TextBox>（多个ID可由 , 分隔）</dd>
        </dl>
        <dl>
            <dt>生成更新时间为：</dt>
            <dd><asp:RadioButton runat="server" ID="rbtnCreate4" GroupName="create" /> 
            <asp:TextBox runat="server" ID="txtStartTime" onFocus="WdatePicker({lang:'zh-cn',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" Width="100"></asp:TextBox> - <asp:TextBox onFocus="WdatePicker({lang:'zh-cn',skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" runat="server" ID="txtEndTime" Width="100"></asp:TextBox></dd>
        </dl>
        <dl>
            <dt>选择需要生成的栏目：<br />（不选为全部生成）</dt>
            <dd><asp:ListBox runat="server" ID="lstbMenu" Rows="30" Width="400" SelectionMode="Multiple"></asp:ListBox></dd>
        </dl>
    </div>
    <div class="Submit" id="HQB_Operation_Button">
        　<asp:Button runat="server" ID="btnCreatePub" Text="立即生成" CssClass="subButton" onclick="btnCreatePub_Click"/>　<input type="button" value="返回" Class="subButton" onclick="javascript:history.back();" />
    </div>
</div>
</form>
</body>
</html>