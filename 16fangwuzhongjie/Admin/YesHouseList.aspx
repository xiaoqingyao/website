<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="YesHouseList.aspx.cs" Inherits="houseIntermediaryMIS.Admin.YesHouseList" %>

<%@ Import Namespace="houseIntermediaryMIS.Components" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 39px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <table width="650px">
        <tr>
            <td align="center" class="style1">
                <asp:Panel ID="plSearchItems" runat="server">
详情查看条件：
                    <asp:DropDownList ID="ddlCheckItems" runat="server" AutoPostBack="true"
                        onselectedindexchanged="ddlCheckItems_SelectedIndexChanged">
                        <asp:ListItem Value="0">--所有操作信息--</asp:ListItem>
                        <asp:ListItem Value="1">审核通过的出租出售信息</asp:ListItem>
                        <asp:ListItem Value="2">审核通过的求租求购信息</asp:ListItem>
                        <asp:ListItem Value="3">正在审核中的信息</asp:ListItem>
                        <asp:ListItem Value="4">审核不通过的信息</asp:ListItem>
                    </asp:DropDownList>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td valign="top" height="22">
                <font color="#373737" style="font-size: 18px;"></font>
                <asp:Repeater ID="Repeater1" runat="server" EnableViewState="False" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound">
                    <HeaderTemplate>
                        <table style="font-size: 13px; border-right: #d2d2d2 1px solid; border-top: #d2d2d2 1px solid;
                            border-left: #d2d2d2 1px solid; border-bottom: #d2d2d2 1px solid; border-collapse: collapse"
                            bordercolor="#d2d2d2" cellspacing="0" cellpadding="0" width="100%" border="1"
                            id="table3" class="tableDataCss">
                            <tr height="26" align="center" class="tableTitle">
                                <td width="10%">
                                    编号
                                </td>
                                <td width="8%">
                                类 别
                                </td>
                                <td width="12%">
                                    所属区域
                                </td>
                                <td width="25%">
                                    地 点
                                </td>
                                <td width="10%">
                                    房屋类别
                                </td>
                                <td width="10%">
                                    户 型
                                </td>
                                <td width="10%">
                                    价 格
                                </td>
                                <td width="12%">
                                    登记日期
                                </td>
                                <td width="12%">
                                    审核日期
                                </td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr height="26" class="cp" onmouseover="this.style.backgroundColor='#C5D5E5'" onmouseout="this.style.backgroundColor=''">
                            <td align="left">
                                <%# DataBinder.Eval(Container.DataItem, "ID")%>
                            </td>
                            <td>
                            <%# Tools.GetHouseNeedType(int.Parse(showtype) ,int.Parse(DataBinder.Eval(Container.DataItem, "Type").ToString()))%>
                            </td>
                            <td align="center">
                                <%# Tools.GetAreaName(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "Area_ID")))%>
                            </td>
                            <td>
                                <a href='<%# Url.GetAllUrl(Convert.ToInt32(DataBinder.Eval( Container.DataItem,"showtype")),Convert.ToInt32(DataBinder.Eval( Container.DataItem,"ID")))%>'
                                    target="_blank"><font class="Orange">
                                      <%#  Tools.GetShowedAddr( DataBinder.Eval( Container.DataItem,"Addr").ToString(),10)%></font></a>
                            </td>
                            <td>
                                <%# Tools.GetHouseType(Convert.ToInt32(DataBinder.Eval( Container.DataItem,"Ht_ID")))%>
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
                    <asp:LinkButton ID="lkbShowMsg" runat="server" Text="" CommandName='<%# DataBinder.Eval(Container.DataItem,"ID").ToString() %>' CommandArgument='<%# DataBinder.Eval(Container.DataItem,"State") %>'
                       ToolTip='<%#  Tools.GetToolTipShow( DataBinder.Eval(Container.DataItem,"CheckedMemo").ToString()) %>'>
                      <%# DataBinder.Eval( Container.DataItem,"CheckedTime","{0:d}")%>
                    </asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </td>
        </tr>
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
    <table width="100%" border="0">
    <tr><td style=" font-size:14px">&nbsp;&nbsp; 审核日期 <font style=" color:Green">绿色</font>--通过，<font style=" color:Red">红色</font>--未通过，<font style=" color:Blue">蓝色</font>--审核中，鼠标移上审核日期上可查看审核留下的备注</td></tr>
        <tr>
            <td align="center">
                <asp:Panel ID="Panel1" runat="server">
                </asp:Panel>
            </td>
        </tr>
    </table>

</asp:Content>
