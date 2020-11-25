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
<ul id="tags"><li class="selectTag"><a href="javascript:;">专用属性</a></li></ul><div id="panel"><fieldset><dl><dt>标题：</dt><dd id="K_U_Coupon_title"><%=hsFieldValue["title"]%></dd></dl><dl><dt>图片(尺寸360x270)：</dt><dd id="K_U_Coupon_Image"><%=hsFieldValue["Image"]%></dd></dl><dl><dt>描述：</dt><dd id="K_U_Coupon_Desc"><%=hsFieldValue["Desc"]%></dd></dl><dl><dt>下载次数：</dt><dd id="K_U_Coupon_DownCount"><%=hsFieldValue["DownCount"]%></dd></dl><dl><dt>流水号：</dt><dd id="K_U_Coupon_Number"><%=hsFieldValue["Number"]%></dd></dl><dl><dt>过期是否显示：</dt><dd id="K_U_Coupon_IsDisplay"><%=ctrManageView.ParseFieldValueToText("100000036342996",hsFieldValue["IsDisplay"])%></dd></dl><dl><dt>是否撤消：</dt><dd id="K_U_Coupon_IsUndo"><%=ctrManageView.ParseFieldValueToText("100000036547033",hsFieldValue["IsUndo"])%></dd></dl><dl><dt>首页推荐：</dt><dd id="K_U_Coupon_IsPub"><%=ctrManageView.ParseFieldValueToText("100000135826183",hsFieldValue["IsPub"])%></dd></dl><dl><dt>开始日期：</dt><dd id="K_U_Coupon_Starttime"><%=hsFieldValue["Starttime"]%></dd></dl><dl><dt>结束日期：</dt><dd id="K_U_Coupon_EndTime"><%=hsFieldValue["EndTime"]%></dd></dl><dl><dt>首页排序：</dt><dd id="K_U_Coupon_OrderIndex"><%=hsFieldValue["OrderIndex"]%></dd></dl><div style="clear:left"></div></fieldset></div>
<asp:HiddenField Value="K_U_Coupon" ID="hdnTableName" runat="server" /><asp:HiddenField ID="hdnModelID" Value="100000010970354" runat="server" />
</div>
<center><input type="button" value="返回" onclick="history.back();"  class="AddBtn"/></center>
</form>
</body>
</html>
