<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HouseList.aspx.cs" Inherits="houseIntermediaryMIS.HouseList" %>

<%@ Register TagPrefix="UCtrl" TagName="Left" Src="UserControls/LeftCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="Head" Src="UserControls/HeadCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="Foot" Src="UserControls/FootCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="SearchSupply" Src="UserControls/SearchSupplyCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="SearchDemand" Src="UserControls/SearchDemandCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="GetHouseByArea" Src="UserControls/GetHouseByAreaCtrl.ascx" %>
<%@ Import Namespace="houseIntermediaryMIS.Components" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("span[id^='SearchItem']").mouseover(
                function () {
                    $(this).css("background-color", "green");
                }).mouseout(
                function () {
                    $(this).css("background-color", "white");
                });
        });    
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <UCtrl:Head ID="Head1" runat="server"></UCtrl:Head>
    <table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="160" valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td valign="top">
                            <UCtrl:Left ID="Left1" runat="server"></UCtrl:Left>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td height="15px">
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <UCtrl:SearchSupply ID="SearchSupply1" runat="server"></UCtrl:SearchSupply>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
            <td width="720" valign="top" style="font-size: 16px">
                <table cellspacing="0" cellpadding="0" width="100%" border="0" style="padding-left: 20px">
                    <tbody>
                        <tr>
                            <td height="20">
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Panel ID="plSearchItems" runat="server">
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td class="cp" valign="top" height="22">
                                <font color="#373737" style="font-size: 18px;">条件搜索房源信息：</font>
                                <asp:Repeater ID="Repeater1" runat="server" EnableViewState="False">
                                    <HeaderTemplate>
                                        <table style="font-size: 13px; border-right: #d2d2d2 1px solid; border-top: #d2d2d2 1px solid;
                                            border-left: #d2d2d2 1px solid; border-bottom: #d2d2d2 1px solid; border-collapse: collapse"
                                            bordercolor="#d2d2d2" cellspacing="0" cellpadding="0" width="100%" border="1"
                                            id="table3" class="tableDataCss">
                                            <tr height="26" align="center" class="tableTitle">
                                                <td width="5%">
                                                    编号
                                                </td>
                                                <td width="15%">
                                                    所属区域
                                                </td>
                                                <td width="30%">
                                                    地 点
                                                </td>
                                                <td width="15%">
                                                    类 别
                                                </td>
                                                <td width="10%">
                                                    户 型
                                                </td>
                                                <td width="10%">
                                                    价 格
                                                </td>
                                                <td width="15%">
                                                    登记日期
                                                </td>
                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr height="26" class="cp" onmouseover="this.style.backgroundColor='#C5D5E5'" onmouseout="this.style.backgroundColor=''">
                                            <td align="left">
                                                <%#DataBinder.Eval( Container.DataItem,"ID")%>
                                            </td>
                                            <td align="center">
                                                <%# Tools.GetAreaName(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "Area_ID")))%>
                                            </td>
                                            <td>
                                                <a href='<%# Url.GetHouseDetailUrl(Convert.ToInt32(DataBinder.Eval( Container.DataItem,"ID")))%>'
                                                    target="_blank"><font class="Orange">
                                                        <%# Tools.GetShowedAddr( DataBinder.Eval( Container.DataItem,"Addr").ToString(),12)%></font></a>
                                            </td>
                                            <td>
                                                <%# Tools.GetHouseType(Convert.ToInt32(DataBinder.Eval( Container.DataItem,"Ht_ID")))%>
                                            </td>
                                            <td>
                                                <%# DataBinder.Eval( Container.DataItem,"FYHX")%>
                                            </td>
                                            <td align="right">
                                                <%# Tools.GetPriceUnit(Convert.ToInt32(DataBinder.Eval( Container.DataItem,"Price")),bType)%>
                                            </td>
                                            <td align="center">
                                                <%# DataBinder.Eval( Container.DataItem,"AddTime","{0:d}")%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table width="100%" border="0">
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblPageInfo" runat="server"></asp:Label>&nbsp;
                            <asp:HyperLink ID="lnkFirst" runat="server">首页</asp:HyperLink>&nbsp;
                            <asp:HyperLink ID="lnkPrev" runat="server">上页</asp:HyperLink>&nbsp;
                            <asp:HyperLink ID="lnkNext" runat="server">下页</asp:HyperLink>&nbsp;
                            <asp:HyperLink ID="lnkLast" runat="server">末页</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="12px">
            </td>
        </tr>
    </table>
    <UCtrl:Foot ID="Foot1" runat="server"></UCtrl:Foot>
    </form>
</body>
</html>
