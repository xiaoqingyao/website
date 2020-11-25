<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CheckNeed.aspx.cs" Inherits="houseIntermediaryMIS.Admin.HouseNeed.CheckNeed" %>
<%@ Import Namespace="houseIntermediaryMIS.Components" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <table cellspacing="0" cellpadding="0" width="100%" border="0" style=" padding-left :15px">
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
                    <font color="#373737" style="font-size: 18px;"><%=strType %>需求审核：</font>
                    <asp:Repeater ID="Repeater1" runat="server" EnableViewState="False">
                        <HeaderTemplate>
                            <table style="font-size: 13px; border-right: #d2d2d2 1px solid; border-top: #d2d2d2 1px solid;
                                border-left: #d2d2d2 1px solid; border-bottom: #d2d2d2 1px solid; border-collapse: collapse"
                                bordercolor="#d2d2d2" cellspacing="0" cellpadding="0" width="100%" border="1"
                                id="table3" class="tableDataCss">
                                <tr height="26" align="center" class="tableTitle">
                                    <td width="8%">
                                        编号
                                    </td>
                                    <td width="12%">
                                        所属区域
                                    </td>
                                    <td width="25%">
                                        地 点
                                    </td>
                                    <td width="10%">
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
                                    <td width="10%" style=" font-size:11px">
                                        状态/操作
                                    </td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr height="26" class="cp" onmouseover="this.style.backgroundColor='#C5D5E5'" onmouseout="this.style.backgroundColor=''">
                                <td align="left">
                                    <%# DataBinder.Eval(Container.DataItem, "ID")%>
                                </td>
                                <td align="center">
                                    <%# Tools.GetAreaName(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "Area_ID")))%>
                                </td>
                                <td>
                                    <a href='<%# Url.GetNeedDetailUrl(Convert.ToInt32(DataBinder.Eval( Container.DataItem,"ID")))%>'
                                        target="_blank"><font class="Orange">
                                            <%# DataBinder.Eval( Container.DataItem,"Addr")%></font></a>
                                </td>
                                <td>
                                    <%# Tools.GetHouseType(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "Ht_ID")))%>
                                </td>
                                <td>
                                    <%# DataBinder.Eval( Container.DataItem,"FYHX")%>
                                </td>
                                <td align="right">
                                    <%# Tools.GetPriceUnit(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "Price")), bType)%>
                                </td>
                                <td align="center">
                                    <%# DataBinder.Eval( Container.DataItem,"AddTime","{0:d}")%>
                                </td>
                                <td align="center">
                                    <a href='CNeedDetail.aspx?ID=<%# DataBinder.Eval( Container.DataItem,"ID")%>&type=<%# DataBinder.Eval( Container.DataItem,"type")%>'>
                                        <%# Tools.GetShowedState( DataBinder.Eval( Container.DataItem,"State").ToString()) %></a>
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

</asp:Content>
