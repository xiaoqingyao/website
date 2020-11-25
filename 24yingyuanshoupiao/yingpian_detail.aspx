<%@ Page Language="C#" AutoEventWireup="true" CodeFile="yingpian_detail.aspx.cs" Inherits="yingpian_detail" %>

<%@ Register src="tHead.ascx" tagname="head" tagprefix="uc2" %>
<%@ Register Src="qtleft.ascx" TagName="qtleft" TagPrefix="uc3" %>
<%--<%@ Register src="ascx/foot.ascx" tagname="foot" tagprefix="uc3" %>
<%@ Register src="ascx/category.ascx" tagname="category" tagprefix="uc4" %>
<%@ Register src="ascx/product_click.ascx" tagname="product_click" tagprefix="uc5" %>
<%@ Register src="ascx/product_by_category.ascx" tagname="product_by_category" tagprefix="uc6" %>
<%@ Register src="ascx/category_2.ascx" tagname="category_2" tagprefix="uc7" %>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>影院在线订票系统</title>
<link href="style/common.css" rel="stylesheet" type="text/css" />
<link href="style/index.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.2.6.pack.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="js/indexhome.js"></script>
<script language="javascript" type="text/javascript" src="js/flash.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $($("ul.navigation a")[0]).addClass('hover');
    });
</script>
</head>
<body>
<form id="form1" runat="server">
<uc2:head ID="head1" runat="server" />

<!-- /end banner -->
<div class="defaultMain">
 <div class="defaultMainLeft">
                <uc3:qtleft ID="Qtleft1" runat="server" />
 
 </div>
 <!-- /end defaultMainLeft -->
 <div class="defaultMainRight">
 <table id="Table6" width="684" border="0" cellpadding="0" cellspacing="0" style="height: 566px">
              <tr>
                <td width="684" background="qtimages/index_04_02_01.gif" style="height: 37px"><table width="100%" height="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="19%" align="center" valign="bottom" class="STYLE1">
                        影片详细</td>
                    <td width="81%">&nbsp;</td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="100%" valign="top">
                    <table align="center" border="1" bordercolordark="#9cc7ef" bordercolorlight="#145aa0"
                        cellpadding="4" cellspacing="0" width="100%">
                        <tr>
                            <td nowrap="nowrap" style="width: 164px" width="30">
                                <font face="宋体">编号:</font></td>
                            <td style="width: 48%"><%=nbianhao %>
                            </td>
                            <td rowspan="7" width="79%">
                                <img src="<%=ntupian %>" style="width: 261px" /></td>
                        </tr>
                        <tr style="color: #000000; font-family: 宋体">
                            <td nowrap="nowrap" style="width: 164px" width="30">
                                <font face="宋体"><span style="font-family: Times New Roman">影片名称</span>:</font></td>
                            <td style="width: 48%"><%=nyingpianmingcheng%>
                            </td>
                        </tr>
                        <tr style="color: #000000; font-family: 宋体">
                            <td nowrap="nowrap" style="width: 164px" width="30">
                                <font face="宋体"><span style="font-family: Times New Roman">上映时间:</span></font></td>
                            <td style="width: 48%; font-family: Times New Roman">
                                <span style="font-family: 宋体"><%=nshangyingshijian %></span>
                            </td>
                        </tr>
                        <tr style="color: #000000">
                            <td nowrap="nowrap" style="width: 164px" width="30">
                                <font face="宋体">票数:</font></td>
                            <td style="width: 48%">
                                <span style="font-family: 宋体"><%=npiaoshu %></span>
                            </td>
                        </tr>
                        <tr style="color: #000000">
                            <td nowrap="nowrap" style="width: 164px" width="30">
                                <font face="宋体">地点:</font></td>
                            <td style="width: 48%">
                                <span style="font-family: 宋体"><%=ndidian %></span>
                            </td>
                        </tr>
                        <tr style="color: #000000">
                            <td nowrap="nowrap" style="width: 164px" width="30">
                                <font face="宋体">影片类型:</font></td>
                            <td style="width: 48%; font-family: Times New Roman"><%=nyingpianleixing %>
                            </td>
                        </tr>
                        <tr style="font-family: Times New Roman">
                            <td nowrap="nowrap" style="width: 164px" width="30">
                                <font face="宋体">票价:</font></td>
                            <td style="width: 48%"><%=npiaojia %>
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" rowspan="2" style="width: 164px; height: 128px" width="30">
                                <font face="宋体">备注:</font><div align="right">
                                    <font face="宋体"></font>&nbsp;</div>
                            </td>
                            <td colspan="2" rowspan="2" style="height: 128px"><%=nbeizhu %>
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="我要订票" /></td>
                        </tr>
         
 </div>
 <!-- /end defaultMainRight -->
</div>
<!-- /end defaultMain -->
<div class="banner"></div>
<!-- /end banner -->
<%--<uc1:help ID="help1" runat="server" />--%>    
<!-- /end help -->
<%--<uc3:foot ID="foot1" runat="server" />--%>
    </form>
</body>
</html>

