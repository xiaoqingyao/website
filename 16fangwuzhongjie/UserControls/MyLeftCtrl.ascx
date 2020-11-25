<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyLeftCtrl.ascx.cs"
    Inherits="houseIntermediaryMIS.UserControls.MyLeftCtrl" %>
    <style type="text/css">

    </style>
<table cellspacing="0" cellpadding="0" width="100%" border="0" class="tableCss">
    <tr>
        <td align="left" width="174" colspan="2" height="32" style="background-color: #C5D5E5; font-size:18px">
            交易平台
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
            <a href="AddMyHouse.aspx?type=1">我要出租房屋</a>
        </td>
    </tr>
    <tr>
        <td align="center" width="8%">
        </td>
        <td align="left" width="92%" height="30">
            <a href="AddMyHouse.aspx?type=2">我要出售房屋</a>
        </td>
    </tr>
    <tr>
        <td align="center" width="8%">
        </td>
        <td align="left" width="92%" height="30">
            <a href="AddMyNeed.aspx?type=1">我要求租房屋</a>
        </td>
    </tr>
    <tr>
        <td align="center" width="8%">
        </td>
        <td align="left" width="92%" height="30">
            <a href="AddMyNeed.aspx?type=2">我要求购房屋</a>
        </td>
    </tr>
    <tr>
        <td align="center" width="8%">
        </td>
        <td align="left" width="92%" height="30">
            <a href="MyRentSell.aspx">我的出租出售信息</a>
        </td>
    </tr>
    <tr>
        <td align="center" width="8%">
        </td>
        <td align="left" width="92%" height="30">
            <a href="MyNeed.aspx">我的求租求购信息</a>
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
            会员修改
        </td>
    </tr>
    <tr>
        <td colspan="2" height="10">
        </td>
    </tr>
    <tr>
        <td align="center" width="8%" ></td>
        <td align="left" width="92%" height=".0">
            <a href="UpdateUserInfo.aspx">修改会员资料</a>
        </td>
    </tr>
    <tr>
        <td align="center" width="8%">
        </td>
        <td align="left" width="92%" height="30">
            <a href="UpdateMyPWD.aspx">修改密码</a>
        </td>
    </tr>
    <tr>
        <td align="center" width="8%" >
        </td>
        <td align="left" width="92%" height="30">
            <asp:LinkButton ID="lkbLogout" runat="server" OnClick="lkbLogout_Click">退出管理系统</asp:LinkButton>
        </td>
    </tr>
</table>
