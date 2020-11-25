<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="houseIntermediaryMIS.UserCenter.Message" %>

<%@ Register TagPrefix="UCtrl" TagName="Head" Src="../UserControls/HeadCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="Foot" Src="../UserControls/FootCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="MyLeft" Src="../UserControls/MyLeftCtrl.ascx" %>
<%@ Import Namespace="houseIntermediaryMIS.Components" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body topmargin="0" leftmargin="0">
    <form id="Form1" method="post" runat="server">
    <UCtrl:Head ID="Head1" runat="server"></UCtrl:Head>
    <table id="table1" width="900" align="center" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top" width="180">
                <UCtrl:MyLeft ID="MyLeft1" runat="server"></UCtrl:MyLeft>
            </td>
            <td valign="top">
                <table border="0" width="100%" align="center">
                    <tr>
                        <td>
                            <p>
                                <b><font face="宋体" color="Red">当前位置：-&gt;我的消息</font></b></p>
                        </td>
                    </tr>
                </table>
                <table id="tableList" width="100%"  align="center" border="0" cellpadding="5"cellspacing="0">
                    <tbody>
                        <tr>
                            <td bgcolor="#f0f0f0">
                                我的收到的消息
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="center">
                                <asp:Repeater ID="Repeater1" runat="server" EnableViewState="False">
                                    <ItemTemplate>
                                        <tr>
                                          <!--  <td>
                                                <a href='<%# Url.GetAllUrl(Convert.ToInt32(DataBinder.Eval( Container.DataItem,"showtype")),Convert.ToInt32(DataBinder.Eval( Container.DataItem,"houseID")))%>'
                                                    target="_blank"><font class="Orange">
                                                        <%# DataBinder.Eval(Container.DataItem, "houseID")%>
                                                    </font></a>
                                            </td>-->
                                            <td>
                                                <%# Tools.GetHouseNeedType(int.Parse(DataBinder.Eval(Container.DataItem,"showtype").ToString()),int.Parse( DataBinder.Eval( Container.DataItem,"Type").ToString()))%>
                                            </td>
                                            <td align="left">
                                                <%#  Tools.GetShowedAddr(DataBinder.Eval(Container.DataItem,"msgContent").ToString(),0)%>
                                            </td>
                                            <td>
                                                <%# Convert.ToDateTime( DataBinder.Eval( Container.DataItem,"sendTime")).ToString("yy/MM/dd hh:mm")%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <HeaderTemplate>
                                        <table width="100%" border="1"  align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                               <!-- <td width="15%">
                                                    房源/需求编号
                                                </td>-->
                                                <td width="10%" align="center">
                                                    类 型
                                                </td>
                                                <td width="50%">
                                                    消息内容
                                                </td>
                                                <td width="25%">
                                                    收到时间
                                                </td>
                                            </tr>
                                    </HeaderTemplate>
                                    <FooterTemplate>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </td>
                        </tr>
                </table>
                <table width="100%" border="0" align="center">
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
        </tbody></table>
    <UCtrl:Foot ID="Foot1" runat="server"></UCtrl:Foot>
    </form>
</body>
</html>
