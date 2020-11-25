<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyRentSell.aspx.cs" Inherits="houseIntermediaryMIS.UserCenter.MyRentSell" %>

<%@ Register TagPrefix="UCtrl" TagName="Foot" Src="../UserControls/FootCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="Head" Src="../UserControls/HeadCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="MyLeft" Src="../UserControls/MyLeftCtrl.ascx" %>
<%@ Import Namespace="houseIntermediaryMIS.Components" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <UCtrl:Head ID="Head1" runat="server"></UCtrl:Head>
    <table id="table1" width="900" align="center" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top" width="180">
                <UCtrl:MyLeft ID="MyLeft1" runat="server"></UCtrl:MyLeft>
            </td>
            <td valign="top">
                <table width="100%" align="center" border="0">
                    <tr>
                        <td>
                            <p>
                                <b><font face="宋体" color="Red">当前位置：-&gt;我的出租出售信息</font></b></p>
                        </td>
                    </tr>
                </table>
                <table id="tableList" width="100%" align="center" border="0" style="padding-left: 20px">
                    <tbody>
                        <tr>
                            <td bgcolor="#f0f0f0">
                                租售信息管理
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="center">
                                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound">
                                    <HeaderTemplate>
                                        <table id="table2" bordercolor="#111111" cellspacing="1" cellpadding="1" width="100%"
                                            align="center" border="0" style="font-size: 13px">
                                            <tr>
                                                <td width="10%">
                                                    所属区域
                                                </td>
                                                <td width="28%">
                                                    地 点
                                                </td>
                                                <td width="12%">
                                                    信息类型
                                                </td>
                                                <td width="10%">
                                                    户 型
                                                </td>
                                                <td width="10%">
                                                    价 格
                                                </td>
                                                <td width="13%">
                                                    登记日期
                                                </td>
                                                <td width="7%">
                                                    状 态
                                                </td>
                                                <td width="5%">
                                                    修改
                                                </td>
                                                <td width="5%">
                                                    删除
                                                </td>
                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr onmouseover="this.style.backgroundColor='#B6D2E0'" onmouseout="this.style.backgroundColor=''">
                                            <td align="left">
                                                <%# GetAreaName(Convert.ToInt32(DataBinder.Eval( Container.DataItem,"Area_ID")))%>
                                            </td>
                                            <td align="left">
                                                <a href='<%# Url.GetHouseDetailUrl(Convert.ToInt32(DataBinder.Eval( Container.DataItem,"ID")))%>'
                                                    target="_blank"><font class="Orange">
                                                        <%# GetShowedAddr( Convert.ToString( DataBinder.Eval( Container.DataItem,"Addr")))%></font>
                                                </a>
                                            </td>
                                            <td>
                                                <%# GetInfoType(Convert.ToByte(DataBinder.Eval( Container.DataItem,"Type")))%>
                                            </td>
                                            <td>
                                                <%# DataBinder.Eval( Container.DataItem,"FYHX")%>
                                            </td>
                                            <td>
                                                <%# Tools.GetPriceUnit(Convert.ToInt32(DataBinder.Eval( Container.DataItem,"Price")), byte.Parse(DataBinder.Eval(Container.DataItem,"Type").ToString()))%>
                                            </td>
                                            <td>
                                                <%# DataBinder.Eval( Container.DataItem,"AddTime","{0:d}")%>
                                            </td>
                                            <td>
                                                <%# Tools.GetShowedState(DataBinder.Eval(Container.DataItem, "State").ToString())%>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="lkbModify" runat="server" CommandName='<%# Eval("ID") %>' CommandArgument='<%# DataBinder.Eval( Container.DataItem,"type")%>' OnCommand="lkbModify_Click">修改</asp:LinkButton>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="lkbDelete" runat="server" CommandName="Delete" OnClientClick="return confirm('确定要删除吗？该操作不可恢复！！！')"
                                                    CommandArgument='<%# Eval("ID") %>'>删除</asp:LinkButton>
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
                <table width="100%" align="center" border="0">
                    <tr>
                        <td align="right">
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
    </table>
    <UCtrl:Foot ID="Foot1" runat="server"></UCtrl:Foot>
    </form>
</body>
</html>
