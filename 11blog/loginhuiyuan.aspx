<%@ Page Language="C#" AutoEventWireup="true" CodeFile="loginhuiyuan.aspx.cs" Inherits="loginhuiyuan" %>

<%@ Register Src="left5.ascx" TagName="left5" TagPrefix="uc4" %>
<%@ Register Src="top3.ascx" TagName="top3" TagPrefix="uc3" %>
<%@ Register Src="WebUserControl.ascx" TagName="WebUserControl" TagPrefix="uc2" %>
<%@ Register TagPrefix="uc1" TagName="hsgleft" Src="hsgleft.ascx" %>
<%@ Register TagPrefix="uc1" TagName="hsgtop2" Src="hsgtop2.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>会员登录</title>
    <link href="images/CSS.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    </div>
    <div align="center">
        <uc3:top3 ID="Top3_1" runat="server" />
    </div>
    <table style="border-collapse: collapse" bordercolor="#cccccc" cellspacing="0" cellpadding="0"
        width="778" border="1" frame="vsides" align="center">
        <tr>
            <td valign="top" style="width: 781px; height: 841px">
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tbody>
                        <tr>
                            <td style="height: 5px">
                                <uc1:hsgtop2 ID="Hsgtop21" runat="server"></uc1:hsgtop2>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tbody>
                        <tr>
                            <td style="height: 576px" valign="top" align="left" width="203" height="576" rowspan="2">
                                <table cellspacing="0" cellpadding="0" width="100" border="0">
                                    <tbody>
                                        <tr>
                                            <td valign="top" background="images/bian-bg.gif" height="183">
                                                <font face="宋体">&nbsp;<table id="Table2" style="width: 191px; height: 32px" background="images/ttt.gif"
                                                    border="0">
                                                    <tr>
                                                        <td>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 站内导航
                                                        </td>
                                                    </tr>
                                                </table>
                                                    <uc1:hsgleft ID="Hsgleft1" runat="server"></uc1:hsgleft>
                                                </font>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="bottom" background="images/bian-bg.gif" style="height: 40px">
                                                <font face="宋体">
                                                    <table id="Table3" style="width: 191px; height: 32px" background="images/ttt.gif"
                                                        border="0">
                                                        <tr>
                                                            <td>
                                                                &nbsp; &nbsp; &nbsp; &nbsp; 友情链接
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </font>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" align="left" background="images/bian-bg.gif" style="height: 17px">
                                                <uc4:left5 ID="Left5_1" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" align="center" background="images/bian-bg.gif" height="0">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" align="right" height="8">
                                                <img height="8" src="images/di-bg.gif" width="195">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                            <td valign="top" align="left" width="571" bgcolor="#f2f2f2" style="height: 22px">
                                <strong>当前位置:<a href="default.aspx">首页</a>&gt;&gt;专辑列表</strong>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 527px" valign="top" height="527">
                                <table bgcolor="#e4f4e1" border="0" cellpadding="0" cellspacing="1" style="width: 90%">
                                    <tbody>
                                        <tr>
                                            <td align="left" bgcolor="#e4f4e1" style="height: 19px">
                                                &nbsp;<img border="0" height="15" src="images/news.gif" width="15" />
                                                用户登录
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 44px">
                                                <table border="0" cellpadding="2" cellspacing="1" style="width: 100%">
                                                    <tr>
                                                        <td align="center" bgcolor="#ffffff" style="height: 22px">
                                                            账号：<asp:TextBox ID="TxtUserName" runat="server"></asp:TextBox>
                                                            密码：<asp:TextBox ID="TxtPassword" runat="server"></asp:TextBox>
                                                            <asp:ImageButton ID="ImageButton1" runat="server" Height="24px" ImageUrl="images/icon_login.gif"
                                                                OnClick="ImageButton1_Click" Width="100px" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div align="center">
                    <table style="border-collapse: collapse" bordercolor="#cccccc" cellspacing="0" cellpadding="0"
                        width="778" border="0" frame="vsides">
                        <tbody>
                            <tr>
                                <td align="left" width="10%" background="images/down-bg.gif" style="height: 42px">
                                    <img height="35" src="images/down-left.gif" width="1">
                                </td>
                                <td valign="bottom" align="center" width="80%" background="images/down-bg.gif" style="height: 42px">
                                </td>
                                <td align="right" width="10%" background="images/down-bg.gif" style="height: 42px">
                                    <img height="35" src="images/down-left.gif" width="1">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <uc2:WebUserControl ID="WebUserControl1" runat="server" />
    </form>
</body>
</html>
