<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchDemandCtrl.ascx.cs"
    Inherits="houseIntermediaryMIS.UserControls.SearchDemandCtrl" %>
<script type="text/javascript" language="javascript">
<!--
    function IsShowTR2() {
        if (document.all.radType2[1].checked == true) {
            document.all['TrPrice11'].style.display = "none";
            document.all['TrPrice22'].style.display = "";
        }
        else {
            document.all['TrPrice11'].style.display = "";
            document.all['TrPrice22'].style.display = "none";
        }
    }
//-->
</script>
<table border="0" width="100%" class="tableCss" cellpadding="0" cellspacing="0">
    <tr style="height:30px">
        <td width="178" height="32" style="background-color: #C5D5E5; font-size: 18px;">
            &nbsp;
            求租求购查询
        </td>
    </tr>
    <tr style="height:30px">
        <td>
            <input title="出租" type="radio" checked="checked" value="1" name="radType2" onclick="IsShowTR2()" />求租&nbsp;
            <input type="radio" name="radType2" value="2" onclick="IsShowTR2()" />求购
        </td>
    </tr>
    <tr style="height:30px">
        <td>
            &nbsp;
            类别:
            <asp:DropDownList ID="ddlHouseType" runat="server" Width="100px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr style="height:30px">
        <td style="height: 13px">
            &nbsp;
            中介:
            <asp:DropDownList ID="ddlAgency" runat="server" Width="100px">
                <asp:ListItem Value="0">不限...</asp:ListItem>
                <asp:ListItem Value="1">个人信息</asp:ListItem>
                <asp:ListItem Value="2">中介信息</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr style="height:30px">
        <td>
            &nbsp;
            区域:
            <asp:DropDownList ID="ddlArea" runat="server" Width="100px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr style="height:30px">
        <td>
            &nbsp;
            面积:
            <asp:DropDownList ID="ddlSquare" runat="server" Width="100px">
                <asp:ListItem Value="0">不限...</asp:ListItem>
                <asp:ListItem Value="0,50">50平米以下</asp:ListItem>
                <asp:ListItem Value="50,100">50-100平米</asp:ListItem>
                <asp:ListItem Value="100,150">100-150平米</asp:ListItem>
                <asp:ListItem Value="150,200">150-200平米</asp:ListItem>
                <asp:ListItem Value="200,M">200平米以上</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr id="TrPrice11" style="height:30px">
        <td>
            &nbsp;
            租金:
            <asp:DropDownList ID="dllRentPrice" runat="server" Width="100px">
                <asp:ListItem Value="0">不限...</asp:ListItem>
                <asp:ListItem Value="0,500">500元以下</asp:ListItem>
                <asp:ListItem Value="500,1000">500-1000元</asp:ListItem>
                <asp:ListItem Value="1000,1500">1000-1500元</asp:ListItem>
                <asp:ListItem Value="1500,2000">1500-2000元</asp:ListItem>
                <asp:ListItem Value="2000,2500">2000-2500元</asp:ListItem>
                <asp:ListItem Value="2500,M">2500元以上</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr id="TrPrice22" style="display: none" style="height:30px">
        <td>
            &nbsp;
            总价:
            <asp:DropDownList ID="dllTotalPrice" runat="server" Width="100px">
                <asp:ListItem Value="0">不限...</asp:ListItem>
                <asp:ListItem Value="0,10">10万元以下</asp:ListItem>
                <asp:ListItem Value="10,20">10-20万元</asp:ListItem>
                <asp:ListItem Value="20,30">20-30万元</asp:ListItem>
                <asp:ListItem Value="30,40">30-40万元</asp:ListItem>
                <asp:ListItem Value="40,50">40-50万元</asp:ListItem>
                <asp:ListItem Value="50,60">50-60万元</asp:ListItem>
                <asp:ListItem Value="60,M">60万元以上</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr style="height:30px">
        <td>
            &nbsp;
            时间:
            <asp:DropDownList ID="ddlLatestTime" runat="server" Width="100px">
                <asp:ListItem Value="0">不限...</asp:ListItem>
                <asp:ListItem Value="3">三天以内</asp:ListItem>
                <asp:ListItem Value="7">一周以内</asp:ListItem>
                <asp:ListItem Value="15">半月以内</asp:ListItem>
                <asp:ListItem Value="30">一个月内</asp:ListItem>
                <asp:ListItem Value="90">三个月内</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr style="height:30px">
        <td>
            &nbsp;
            地点:
            <asp:TextBox ID="txtKeyword" runat="server" Width="95px"></asp:TextBox>
            <br />
        </td>
    </tr>
    <tr style="height:30px">
        <td height="20" align="center">
            <asp:Button ID="btnSearch" runat="server" Text=" 搜 索 " OnClick="btnSearch_Click" />
            <br />
        </td>
    </tr>
</table>