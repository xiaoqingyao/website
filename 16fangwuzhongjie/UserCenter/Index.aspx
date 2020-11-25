<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="houseIntermediaryMIS.UserCenter.Index" %>

<%@ Register TagPrefix="UCtrl" TagName="MyLeft" Src="../UserControls/MyLeftCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="Head" Src="../UserControls/HeadCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="Foot" Src="../UserControls/FootCtrl.ascx" %>
<%@ Import Namespace="houseIntermediaryMIS.Components" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body leftmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <UCtrl:Head ID="Head1" runat="server"></UCtrl:Head>
    <table id="table11" width="900" align="center" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top" width="180">
                <UCtrl:MyLeft ID="MyLeft1" runat="server"></UCtrl:MyLeft>
            </td>
            <td valign="top">
                <table id="table1" cellspacing="0" cellpadding="0" width="500" align="center" border="0">
                    <tr>
                        <td>
                            <table id="table2" cellspacing="1" cellpadding="3" width="100%" border="0">
                                <tr>
                                    <td>
                                        <hr />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="title" align="center" colspan="2" height="20">
                                        <font color="Red"><strong>会员基本信息</strong></font>
                                    </td>
                                </tr>
                                <tr bgcolor="#f1f1f1">
                                    <td align="left" width="22%" colspan="2" height="20">
                                        <font face="宋体">您好 <font color="#009900"><strong>
                                            <asp:Label ID="lblUserName" runat="server"></asp:Label>&nbsp;</strong></font>这是你第
                                            <font color="Red"><strong>
                                                <asp:Label ID="lblLoginNum" runat="server"></asp:Label></strong></font>次登录本系统</font>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table id="table3" cellspacing="1" cellpadding="3" width="100%" border="0">
                                <tr>
                                    <td align="center" height="15">
                                        <font color="Red"><strong>特别提示</strong></font>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#f1f1f1" height="43">
                                        <span style="letter-spacing: 1pt"><font color="Red">提醒注意：</font>为了提升网站信息的准确率，使网站得到更好的运作，请会员在发布信息时，一定要填写正确的联系方式，如若故意发布虚假信息，管理员有权在不告知发布者的情况下直接删除消息。</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="20">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table id="table4" cellspacing="1" cellpadding="1" width="100%" border="0">
                                <tr>
                                    <td class="title" align="center" colspan="3" height="20">
                                        房源或需求信息发布</strong></font>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="title" align="center" width="37%" bgcolor="#f1f1f1" height="24">
                                        发布信息类型
                                    </td>
                                    <td class="title" align="center" width="19%" bgcolor="#f1f1f1" height="24">
                                        已发布信息
                                    </td>
                                    <td class="title" align="center" width="26%" bgcolor="#f1f1f1" height="24">
                                        信息匹配
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" bgcolor="#f1f1f1" height="26">
                                        <a href="AddMyHouse.aspx?type=1">发布出租信息</a>
                                    </td>
                                    <td align="center" bgcolor="#f1f1f1" height="26">
                                        <font color="Red">
                                            <asp:Label ID="lblNum1" runat="server"></asp:Label></font> 条
                                    </td>
                                    <td align="center" bgcolor="#f1f1f1" height="26">
                                        <a href="MyRentSell.aspx?type=1">查看详情&gt;&gt;</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" bgcolor="#f1f1f1" height="28">
                                        <a href="AddMyHouse.aspx?type=2">发布出售信息</a>
                                    </td>
                                    <td align="center" bgcolor="#f1f1f1" height="28">
                                        <font color="Red">
                                            <asp:Label ID="lblNum2" runat="server"></asp:Label></font> 条
                                    </td>
                                    <td align="center" bgcolor="#f1f1f1" height="28">
                                        <a href="MyRentSell.aspx?type=2">查看详情&gt;&gt;</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" bgcolor="#f1f1f1" height="25">
                                        <a href="AddMyNeed.aspx?type=1">发布求租信息</a>
                                    </td>
                                    <td align="center" bgcolor="#f1f1f1" height="25">
                                        <font color="Red">
                                            <asp:Label ID="lblNum3" runat="server"></asp:Label></font> 条
                                    </td>
                                    <td align="center" bgcolor="#f1f1f1" height="25">
                                        <a href="MyNeed.aspx?type=1">查看详情&gt;&gt;</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" bgcolor="#f1f1f1" height="25">
                                        <a href="AddMyNeed.aspx?type=2">发布求购信息</a>
                                    </td>
                                    <td align="center" bgcolor="#f1f1f1" height="25">
                                        <font color="Red">
                                            <asp:Label ID="lblNum4" runat="server"></asp:Label></font> 条
                                    </td>
                                    <td align="center" bgcolor="#f1f1f1" height="25">
                                        <a href="MyNeed.aspx?type=2">查看详情&gt;&gt;</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" height="20">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Repeater ID="Repeater1" runat="server" EnableViewState="False">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <a href='<%# Url.GetHouseDetailUrl(Convert.ToInt32(DataBinder.Eval( Container.DataItem,"houseID")))%>'
                                                target="_blank"><font class="Orange">
                                                    <%# DataBinder.Eval(Container.DataItem, "houseID")%>
                                                </font></a>
                                        </td>
                                        <td>
                                            <%# Tools.GetHouseNeedType(int.Parse(DataBinder.Eval(Container.DataItem,"showtype").ToString()),int.Parse( DataBinder.Eval( Container.DataItem,"Type").ToString()))%>
                                        </td>
                                        <td align="left">
                                            <%#  Tools.GetShowedAddr(DataBinder.Eval(Container.DataItem,"msgContent").ToString(),12)%>
                                        </td>
                                        <td>
                                            <%# DataBinder.Eval( Container.DataItem,"sendTime","{0:d}")%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <HeaderTemplate>
                                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="title" align="center" colspan="3" height="20">
                                                消息管理
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="20%">
                                                房源/需求号
                                            </td>
                                            <td width="15%" align="center">
                                                类 型
                                            </td>
                                            <td width="35%">
                                                消息内容
                                            </td>
                                            <td width="30%">
                                                收到时间
                                            </td>
                                        </tr>
                                </HeaderTemplate>
                                <FooterTemplate>
                                    <tr>
                                        <td colspan="4" align="right">
                                            <div align="right">
                                                <a href="Message.aspx?">更多消息</a>&nbsp;&nbsp;&nbsp;</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <hr />
                                        </td>
                                    </tr>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
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
