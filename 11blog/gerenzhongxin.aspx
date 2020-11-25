<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gerenzhongxin.aspx.cs" Inherits="gerenzhongxin" %>

<%@ Register Src="left5.ascx" TagName="left5" TagPrefix="uc4" %>
<%@ Register Src="top3.ascx" TagName="top3" TagPrefix="uc3" %>
<%@ Register Src="WebUserControl.ascx" TagName="WebUserControl" TagPrefix="uc2" %>
<%@ Register TagPrefix="uc1" TagName="hsgleft" Src="hsgleft.ascx" %>
<%@ Register TagPrefix="uc1" TagName="hsgtop2" Src="hsgtop2.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>个人中心</title>
    <link href="images/CSS.css" type="text/css" rel="stylesheet">

    <script type="text/javascript">
        function openDetail(openUrl) {
            //showModalDialog 显示的页面不刷新，加随机数即可实现随时刷新
            window.showModalDialog(openUrl, 'newwindow', 'center:yes;dialogHeight:400px;dialogWidth:600px;status:no;scroll:yes');

        }
        function openMx() { 
            var url = "pointDetail.aspx?uid="+<%=uid %>;
            openDetail(url);
        }
        function dh() {
            openDetail("duihuan.aspx");
        }
    </script>

    <style>
        .hidden
        {
            display: none;
        }
    </style>
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
                                <strong>当前位置:<a href="default.aspx">首页</a>&gt;&gt;个人中心</strong>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 527px" valign="top">
                                <table>
                                    <tr>
                                        <td>
                                            <h3>
                                                个人信息</h3>
                                            <table border="1" style="border-color: Black; width: 100%">
                                                <tr>
                                                    <td>
                                                        姓名：
                                                    </td>
                                                    <td style="width: 300px">
                                                        <asp:Label ID="lblname" runat="server" Text=""></asp:Label>
                                                        <asp:LinkButton ID="lbZhuxiao" runat="server" OnClick="lbZhuxiao_Click">【注销登录】</asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        性别：
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblSex" runat="server" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        出生日期：
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        联系地址：
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        积分：
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblPoint" runat="server" Text=""></asp:Label>
                                                        <a id="pointdetail" onclick="openMx()">[查看积分详细]</a>
                                                        <input type="button" id="duihuan" value="积分兑换" onclick="dh();" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h3>
                                                可参加活动</h3>
                                            注：单击报名数可以查看报名明细
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="100%"
                                                OnRowDataBound="GridView1_OnRowDataBound">
                                                <Columns>
                                                    <asp:BoundField HeaderText="序号" DataField="listid" />
                                                    <asp:BoundField HeaderText="标题" DataField="biaoti" />
                                                    <asp:BoundField HeaderText="报名数" DataField="bms" />
                                                    <asp:BoundField HeaderText="最大人数上限" DataField="maxrenshu" />
                                                    <asp:BoundField HeaderText="积分" DataField="jifen" />
                                                    <asp:TemplateField HeaderText="操作">
                                                        <ItemTemplate>
                                                            <asp:Button runat="server" ID="btnbm" Text="我要报名" CommandArgument='<%# Bind("listid") %>'
                                                                OnClick="bm_Click" CommandName='<%# Bind("jifen") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="我的报名数" DataField="mybms" HeaderStyle-CssClass="hidden"
                                                        ItemStyle-CssClass="hidden" FooterStyle-CssClass="hidden" />
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                    </tr>
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
