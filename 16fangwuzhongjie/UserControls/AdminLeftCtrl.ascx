<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminLeftCtrl.ascx.cs" Inherits="houseIntermediaryMIS.UserControls.AdminLeftCtrl" %>
<asp:Panel ID="plSuper" runat="server" Visible="false">
<table cellspacing="0" cellpadding="0" width="100%" border="0" class="tableCss">
    <tr>
        <td align="left" width="174" colspan="2" height="32" style="background-color:#C5D5E5; font-size:18px">
            超级管理
        </td>
    </tr>
    <tr>
        <td colspan="2" height="10">
        </td>
    </tr>
    <tr>
        <td align="center" width="8%" ></td>
        <td align="left" width="92%" height="30">
            <a href="/Admin/Super/EmpManage.aspx">员工管理</a>
        </td>
    </tr>
     <%--   <tr>
        <td align="center" width="8%">
        </td>
        <td align="left" width="92%" height="30">
            <a href="/Admin/Super/HouseDel.aspx">房屋删除</a>
        </td>
    </tr>
    <tr>
        <td align="center" width="8%">
        </td>
        <td align="left" width="92%" height="30">
            <a href="/Admin/Super/AreaConfig.aspx">区域配置</a>
        </td>
    </tr>--%>
    <tr >
        <td height="30px" colspan="2">
        </td>
    </tr>
</table>
</asp:Panel>

<table cellspacing="0" cellpadding="0" width="100%" border="0" class="tableCss">
    <tr>
        <td align="left" width="174" colspan="2" height="32" style="background-color: #C5D5E5; font-size:18px">
            房屋管理
        </td>
    </tr>
    <tr>
        <td colspan="2" height="10">
        </td>
    </tr>
    <tr>
        <td align="center" width="8%" class="style1">
        </td>
        <td align="left" width="92%" class="style1">
            <a href="/Admin/HouseNeed/CheckHouse.aspx?type=1">出租信息审核</a>
        </td>
    </tr>
    <tr>
        <td align="center" width="8%">
        </td>
        <td align="left" width="92%" height="30">
            <a href="/Admin/HouseNeed/CheckHouse.aspx?type=2">出售信息审核</a>
        </td>
    </tr>
    <tr>
        <td align="center" width="8%">
        </td>
        <td align="left" width="92%" height="30">
            <a href="/Admin/HouseNeed/CheckNeed.aspx?type=1">求租需求审核</a>
        </td>
    </tr>
    <tr>
        <td align="center" width="8%">
        </td>
        <td align="left" width="92%" height="30">
            <a href="/Admin/HouseNeed/CheckNeed.aspx?type=2">求购需求审核</a>
        </td>
    </tr>
    <tr >
        <td height="30px" colspan="2">
        </td>
    </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%" border="0" class="tableCss">
    <tr>
        <td align="left" width="174" colspan="2" height="32" style="background-color:#C5D5E5; font-size:18px">
            个人信息管理
        </td>
    </tr>
    <tr>
        <td colspan="2" height="10">
        </td>
    </tr>
   <!-- <tr>
        <td align="center" width="8%" ></td>
        <td align="left" width="92%" height=".0">
            <a href="#">修改信息</a>
        </td>
    </tr>
    <tr>
        <td align="center" width="8%">
        </td>
        <td align="left" width="92%" height="30">
            <a href="#">修改密码</a>
        </td>
    </tr>-->
    <tr>
        <td align="center" width="8%" >
        </td>
        <td align="left" width="92%" height="30">
            <asp:LinkButton ID="lkbLogout" runat="server" OnClick="lkbLogout_Click">退出后台</asp:LinkButton>
        </td>
    </tr>
</table>

