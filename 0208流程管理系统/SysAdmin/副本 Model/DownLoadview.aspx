<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlManageView.aspx.cs" Inherits="KingTop.Web.Admin.ControlManageView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title><%=hsFieldValue["Title"]%></title>
        <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
        <script type="text/javascript" src="../js/publicform.js"></script>
        <script type="text/javascript" src="../js/public.js"></script>
        <script type="text/javascript" src="../js/regExp.js"></script>
        <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
        <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="../js/jquery.dialog.js"></script>
        <script type="text/javascript" src="../js/win.js"></script>
    <script src="../JS/ControlManageView.js" type="text/javascript"></script>

    <link href="../css/public.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="theForm" runat="server">
<div class="container">
<h4>位置： <a href="#">内容管理</a><a> ></a> <a href="#">文章查看</a></span></h4> 
<div id="panel"><dl><dt>所属节点：</dt><dd id="K_U_DownLoad_NodeCode"><%=hsFieldValue["NodeCode"]%></dd></dl><dl><dt>软件名称：</dt><dd id="K_U_DownLoad_Title"><%=hsFieldValue["Title"]%></dd></dl><dl><dt>软件类型：</dt><dd id="K_U_DownLoad_SoftType"><%=ctrManageView.ParseFieldValueToText("100011237477364",hsFieldValue["SoftType"])%></dd></dl><dl><dt>软件语言：</dt><dd id="K_U_DownLoad_SoftLang"><%=ctrManageView.ParseFieldValueToText("100011240855986",hsFieldValue["SoftLang"])%></dd></dl><dl><dt>软件授权形式：</dt><dd id="K_U_DownLoad_Authorization"><%=ctrManageView.ParseFieldValueToText("100011241525114",hsFieldValue["Authorization"])%></dd></dl><dl><dt>软件平台：</dt><dd id="K_U_DownLoad_RunSystem"><%=ctrManageView.ParseFieldValueToText("100011237534383",hsFieldValue["RunSystem"])%></dd></dl><dl><dt>版本号：</dt><dd id="K_U_DownLoad_FilesVer"><%=hsFieldValue["FilesVer"]%></dd></dl><dl><dt>软件截图：</dt><dd id="K_U_DownLoad_SmallImg"><%=hsFieldValue["SmallImg"]%></dd></dl><dl><dt>上传软件文件：</dt><dd id="K_U_DownLoad_UploadFiles"><%=hsFieldValue["UploadFiles"]%></dd></dl><dl><dt>关键字：</dt><dd id="K_U_DownLoad_Keyword"><%=hsFieldValue["Keyword"]%></dd></dl><dl><dt>简介：</dt><dd id="K_U_DownLoad_Intro"><%=hsFieldValue["Intro"]%></dd></dl><dl><dt>软件说明：</dt><dd id="K_U_DownLoad_Content"><%=hsFieldValue["Content"]%></dd></dl><dl><dt>搜索关键字：</dt><dd id="K_U_DownLoad_MetaKeyword"><%=hsFieldValue["MetaKeyword"]%></dd></dl><dl><dt>页面描述：</dt><dd id="K_U_DownLoad_MetaDescript"><%=hsFieldValue["MetaDescript"]%></dd></dl><dl><dt>发布时间：</dt><dd id="K_U_DownLoad_PubDate"><%=hsFieldValue["PubDate"]%></dd></dl><dl><dt>是否生成静态文件：</dt><dd id="K_U_DownLoad_IsHtml"><%=ctrManageView.ParseFieldValueToText("100011236922273",hsFieldValue["IsHtml"])%></dd></dl><dl><dt>是否启用：</dt><dd id="K_U_DownLoad_IsEnable"><%=ctrManageView.ParseFieldValueToText("100011235584017",hsFieldValue["IsEnable"])%></dd></dl></div>
<asp:HiddenField Value="K_U_DownLoad" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000040333728" runat="server" />
</div>
<center><input type="button" value="返回" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
