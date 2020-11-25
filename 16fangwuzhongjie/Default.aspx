<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="houseIntermediaryMIS.Default" %>

<%@ Import Namespace="houseIntermediaryMIS" %>
<%@ Register TagPrefix="UCtrl" TagName="Left" Src="UserControls/LeftCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="Head" Src="UserControls/HeadCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="Foot" Src="UserControls/FootCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="SearchSupply" Src="UserControls/SearchSupplyCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="SearchDemand" Src="UserControls/SearchDemandCtrl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>首页-房屋中介管理系统</title>
    <script type="text/javascript" language="javascript">
<!--
        function CheckInput() {
            with (document.Form1) {
                if (txtUserName.value == "") {
                    alert("请选择用户名！");
                    txtUserName.focus();
                    return false;
                }
                if (txtPassword.value == "") {
                    alert("请输入密码！");
                    txtPassword.focus();
                    return false;
                }
            }
        }
//-->
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
                        <td>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#fefbf1">
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <UCtrl:SearchDemand ID="SearchDemand2" runat="server"></UCtrl:SearchDemand>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0">
                                <tr>
                                    <td height="20">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <UCtrl:SearchSupply ID="SearchSupply1" runat="server"></UCtrl:SearchSupply>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="500" valign="top" style="font-size: 16px">
                <table width="480" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table width="480" style="font-size: 16px; border-right: #d2d2d2 1px solid; border-top: #d2d2d2 1px solid;
                                border-left: #d2d2d2 1px solid; border-bottom: #d2d2d2 1px solid; border-collapse: collapse"
                                bordercolor="#d2d2d2" cellspacing="0" cellpadding="0" border="0" id="table3"
                                class="tableDataCss">
                                <tr>
                                    <td width="480" height="28" align="center" style="color:blue">
                                        &nbsp;出租信息
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Repeater ID="Repeater1" runat="server" EnableViewState="False">
                                            <HeaderTemplate>
                                                <table width="100%" style="font-size: 16px; border-right: #d2d2d2 1px solid; border-top: #d2d2d2 1px solid;
                                                    border-left: #d2d2d2 1px solid; border-bottom: #d2d2d2 1px solid; border-collapse: collapse"
                                                    bordercolor="#d2d2d2" cellspacing="0" cellpadding="0" border="0" id="table3"
                                                    class="">
                                                    <tr class="tableTitle" style="font-size: 16px" >
                                                        <td width="45%">
                                                            房源地点
                                                        </td>
                                                        <td width="18%">
                                                            房源户型
                                                        </td>
                                                        <td width="15%">
                                                            价格
                                                        </td>
                                                        <td width="22%">
                                                            发布时间
                                                        </td>
                                                    </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr onmouseover="this.style.backgroundColor='#C5D5E5'" onmouseout="this.style.backgroundColor=''">
                                                    <td>
                                                        <a href='<%# GetHouseDetailUrl(Convert.ToInt32(DataBinder.Eval( Container.DataItem,"ID")))%>'
                                                            target="_blank"><font style="font-size: 16px">
                                                                <%# GetSubString(Convert.ToString(DataBinder.Eval(Container.DataItem, "Addr")), 12)%></font>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <%# DataBinder.Eval( Container.DataItem,"FYHX")%>
                                                    </td>
                                                    <td align="left">
                                                        <%# GetPrice(Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Price")),1)%>
                                                    </td>
                                                    <td>
                                                        <%# DataBinder.Eval( Container.DataItem,"AddTime","{0:d}")%>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <tr>
                                                    <td colspan="4">
                                                        <div align="right">
                                                            <a href="UserCenter/AddMyHouse.aspx?type=1" style="color:blue">我要出租房屋</a> &nbsp;&nbsp; <a href="HouseList.aspx?type=1" style="color:blue">
                                                                更多出租信息</a>&nbsp;&nbsp;</div>
                                                    </td>
                                                </tr>
                                                </table>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="12px">
                        </td>
                    </tr>
                    <table width="480" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <table width="480" style="font-size: 16px; border-right: #d2d2d2 1px solid; border-top: #d2d2d2 1px solid;
                                    border-left: #d2d2d2 1px solid; border-bottom: #d2d2d2 1px solid; border-collapse: collapse"
                                    bordercolor="#d2d2d2" cellspacing="0" cellpadding="0" border="0" id="table1"
                                    class="tableDataCss">
                                    <tr>
                                        <td width="480" height="28" align="center" style="color:blue">
                                            出售信息
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Repeater ID="Repeater2" runat="server" EnableViewState="False">
                                                <HeaderTemplate>
                                                    <table width="100%" style="font-size: 16px; border-right: #d2d2d2 1px solid; border-top: #d2d2d2 1px solid;
                                                        border-left: #d2d2d2 1px solid; border-bottom: #d2d2d2 1px solid; border-collapse: collapse"
                                                        bordercolor="#d2d2d2" cellspacing="0" cellpadding="0" border="0" id="table3"
                                                        class="">
                                                        <tr class="tableTitle" style="font-size: 16px">
                                                        <td width="45%">
                                                            房源地点
                                                        </td>
                                                        <td width="18%">
                                                            房源户型
                                                        </td>
                                                        <td width="15%">
                                                            价格
                                                        </td>
                                                        <td width="22%">
                                                            发布时间
                                                        </td>
                                                        </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr onmouseover="this.style.backgroundColor='#C5D5E5'" onmouseout="this.style.backgroundColor=''">
                                                        <td>
                                                            <a href='<%# GetHouseDetailUrl(Convert.ToInt32(DataBinder.Eval( Container.DataItem,"ID")))%>'
                                                                target="_blank"><font style="font-size: 16px">
                                                                    <%# GetSubString(Convert.ToString(DataBinder.Eval(Container.DataItem, "Addr")), 12)%></font>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <%# DataBinder.Eval( Container.DataItem,"FYHX")%>
                                                        </td>
                                                        <td align="left">
                                                            <%# GetPrice(Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Price")),1)%>
                                                        </td>
                                                        <td>
                                                            <%# DataBinder.Eval( Container.DataItem,"AddTime","{0:d}")%>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <tr>
                                                        <td colspan="4">
                                                            <div align="right">
                                                                <a href="UserCenter/AddMyHouse.aspx?type=2" style="color:blue">我要出售房屋</a> &nbsp;&nbsp; <a href="HouseList.aspx?type=2" style="color:blue">
                                                                    更多出售信息</a>&nbsp;&nbsp;</div>
                                                        </td>
                                                    </tr>
                                                    </table>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="12px">
                            </td>
                        </tr>
                        <table width="480" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <table width="480" style="font-size: 16px; border-right: #d2d2d2 1px solid; border-top: #d2d2d2 1px solid;
                                        border-left: #d2d2d2 1px solid; border-bottom: #d2d2d2 1px solid; border-collapse: collapse"
                                        bordercolor="#d2d2d2" cellspacing="0" cellpadding="0" border="1" id="table2"
                                        class="tableDataCss">
                                        <tr>
                                            <td width="480" height="28" align="center" style="color:blue">
                                                求租信息
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Repeater ID="Repeater3" runat="server" EnableViewState="False">
                                                    <HeaderTemplate>
                                                        <table width="100%" style="font-size: 16px; border-right: #d2d2d2 1px solid; border-top: #d2d2d2 1px solid;
                                                            border-left: #d2d2d2 1px solid; border-bottom: #d2d2d2 1px solid; border-collapse: collapse"
                                                            bordercolor="#d2d2d2" cellspacing="0" cellpadding="0" border="0" id="table3"
                                                            class="">
                                                            <tr class="tableTitle" style="font-size: 16px">
                                                        <td width="45%">
                                                            房源地点
                                                        </td>
                                                        <td width="18%">
                                                            房源户型
                                                        </td>
                                                        <td width="15%">
                                                            价格
                                                        </td>
                                                        <td width="22%">
                                                            发布时间
                                                        </td>
                                                            </tr>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr onmouseover="this.style.backgroundColor='#C5D5E5'" onmouseout="this.style.backgroundColor=''">
                                                            <td>
                                                                <a href='<%# GetNeedDetailUrl(Convert.ToInt32(DataBinder.Eval( Container.DataItem,"ID")))%>'
                                                                    target="_blank"><font style="font-size: 16px">
                                                                        <%# GetSubString(Convert.ToString(DataBinder.Eval(Container.DataItem, "Addr")), 12)%></font>
                                                                </a>
                                                            </td>
                                                            <td>
                                                                <%# DataBinder.Eval( Container.DataItem,"FYHX")%>
                                                            </td>
                                                            <td align="left">
                                                                <%# GetPrice(Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Price")),1)%>
                                                            </td>
                                                            <td>
                                                                <%# DataBinder.Eval( Container.DataItem,"AddTime","{0:d}")%>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <tr>
                                                            <td colspan="4">
                                                                <div align="right">
                                                                    <a href="UserCenter/AddMyNeed.aspx?type=1" style="color:blue">我要求租房屋</a> &nbsp;&nbsp; <a href="NeedList.aspx?type=1" style="color:blue">
                                                                        更多求租信息</a>&nbsp;&nbsp;</div>
                                                            </td>
                                                        </tr>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="12px">
                                </td>
                            </tr>
                            <table width="480" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <table width="480" style="font-size: 16px; border-right: #d2d2d2 1px solid; border-top: #d2d2d2 1px solid;
                                            border-left: #d2d2d2 1px solid; border-bottom: #d2d2d2 1px solid; border-collapse: collapse"
                                            bordercolor="#d2d2d2" cellspacing="0" cellpadding="0" border="1" id="table4"
                                            class="tableDataCss">
                                            <tr>
                                                <td width="480" height="28" align="center" style="color:blue">
                                                    求购信息
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Repeater ID="Repeater4" runat="server" EnableViewState="False">
                                                        <HeaderTemplate>
                                                            <table width="100%" style="font-size: 16px; border-right: #d2d2d2 1px solid; border-top: #d2d2d2 1px solid;
                                                                border-left: #d2d2d2 1px solid; border-bottom: #d2d2d2 1px solid; border-collapse: collapse"
                                                                bordercolor="#d2d2d2" cellspacing="0" cellpadding="0" border="0" id="table3"
                                                                class="">
                                                                <tr class="tableTitle" style="font-size: 16px">
                                                        <td width="45%">
                                                            房源地点
                                                        </td>
                                                        <td width="18%">
                                                            房源户型
                                                        </td>
                                                        <td width="15%">
                                                            价格
                                                        </td>
                                                        <td width="22%">
                                                            发布时间
                                                        </td>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr onmouseover="this.style.backgroundColor='#C5D5E5'" onmouseout="this.style.backgroundColor=''">
                                                                <td>
                                                                    <a href='<%# GetHouseDetailUrl(Convert.ToInt32(DataBinder.Eval( Container.DataItem,"ID")))%>'
                                                                        target="_blank"><font style="font-size: 16px">
                                                                            <%# GetSubString(Convert.ToString(DataBinder.Eval(Container.DataItem, "Addr")), 12)%></font>
                                                                    </a>
                                                                </td>
                                                                <td>
                                                                    <%# DataBinder.Eval( Container.DataItem,"FYHX")%>
                                                                </td>
                                                                <td align="left">
                                                                    <%# GetPrice(Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Price")),1)%>
                                                                </td>
                                                                <td>
                                                                    <%# DataBinder.Eval( Container.DataItem,"AddTime","{0:d}")%>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr>
                                                                <td colspan="4">
                                                                    <div align="right" >
                                                                        <a href="UserCenter/AddMyNeed.aspx?type=2" style="color:blue">我要求购房屋</a> &nbsp;&nbsp; <a href="NeedList.aspx?type=2" style="color:blue">
                                                                            更多求购信息</a>&nbsp;&nbsp;</div>
                                                                </td>
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
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
            </td>
            <td width="175" valign="top">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <asp:Panel ID="panLogin" runat="server">
                                <table cellspacing="0" cellpadding="3" width="100%" bgcolor="#fefbf1" border="0">
                                    <tr>
                                        <td colspan="2" height="22">
                                            <div align="center">
                                                <span class="style1">&nbsp;&nbsp;<strong>会 员 登 录</strong></span></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="30%">
                                            账 号:
                                        </td>
                                        <td width="70%">
                                            <asp:TextBox ID="txtUserName" runat="server" Width="100px" MaxLength="20"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            密 码:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPassword" runat="server" Width="100px" MaxLength="20" TextMode="Password"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="right">
                                            <asp:Button ID="btnLogin" runat="server" Text=" 登 录 " OnClick="btnLogin_Click" />
                                            <asp:LinkButton ID="lkbRegister" runat="server" OnClick="lkbRegister_Click" Font-Size="13px">会员注册</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:Panel ID="panUserInfo" runat="server" Visible="False">
                                <asp:Label ID="lblUserInfo" runat="server" ForeColor="blue"></asp:Label>
                                <asp:LinkButton ID="lkbLogout" runat="server" OnClick="lkbLogout_Click">退出</asp:LinkButton>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td width="173" height="5" hspace="0" vspace="0">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <UCtrl:Left ID="Left1" runat="server"></UCtrl:Left>
                        </td>
                    </tr>
                    <tr>
                        <td>
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
