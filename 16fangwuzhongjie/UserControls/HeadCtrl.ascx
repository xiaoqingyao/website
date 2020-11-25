<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HeadCtrl.ascx.cs" Inherits="houseIntermediaryMIS.UserControls.HeadCtrl" %>
<link rel="stylesheet" type="text/css" href="/Styles/Site.css" />
<table class="tableCss" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <img alt="房屋中介管理系统" src="Images/headPic.jpg" width="900" />
        </td>
    </tr>
    <tr>
        <td style="width: 900px; background-color: Blue; font-size: 16px;" height="30px">
            &nbsp; <a href="<%=appPath%>/Default.aspx"><font color="white">首页</font></a> <font
                color="white">| </font><a href="<%=appPath%>/UserCenter/Index.aspx"><font color="white">
                    会员中心 </font></a><font color="white">| </font><a href="<%=appPath%>/HouseList.aspx?type=1">
                        <font color="white">出租信息</font></a> <font color="white">| </font><a href="<%=appPath%>/HouseList.aspx?type=2">
                            <font color="white">出售信息</font></a> <font color="white">| </font>
            <a href="<%=appPath%>/NeedList.aspx?type=1"><font color="white">求租信息</font></a>
            <font color="white">| </font><a href="<%=appPath%>/NeedList.aspx?type=2"><font color="white">
                求购信息</font></a> <font color="white">| </font><a href="<%=appPath%>/UserCenter/Message.aspx">
                    <font color="white">消息管理</font></a>
        </td>
    </tr>
    <tr>
        <td height="10px" style="height: 10px; background-color: White">
        </td>
    </tr>
</table>
