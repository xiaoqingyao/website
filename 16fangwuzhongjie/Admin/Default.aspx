<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="houseIntermediaryMIS.Admin.Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <table id="table1" cellspacing="0" cellpadding="0" width="500" align="center" border="0">
        <tr>
            <td>
                <table id="table2" cellspacing="1" cellpadding="3" width="100%" border="0">
                    <tr>
                        <td class="title" align="center" colspan="2" height="20">
                            <font color="Red"><strong>员工基本信息</strong></font>
                        </td>
                    </tr>
                    <tr bgcolor="#f1f1f1">
                        <td align="left" width="22%" colspan="2" height="20">
                            <font face="宋体">您好 <font color="#009900"><strong>
                                <asp:Label ID="lblEmpName" runat="server"></asp:Label>&nbsp;</strong></font>这是本房屋中介系统的工作台</font>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <hr />
                <asp:Panel ID="plCount" runat="server" Visible="false" Width="600">
                    <font color="Red"><strong>各员工审核情况统计分析</strong></font>
                    <asp:Repeater ID="Repeater1" runat="server" EnableViewState="False">
                        <HeaderTemplate>
                            <table style="font-size: 13px; border-right: #d2d2d2 1px solid; border-top: #d2d2d2 1px solid;
                                border-left: #d2d2d2 1px solid; border-bottom: #d2d2d2 1px solid; border-collapse: collapse"
                                bordercolor="#d2d2d2" cellspacing="0" cellpadding="0" width="100%" border="1"
                                id="table3" class="tableDataCss">
                                <tr height="26" align="center" class="tableTitle">
                                    <td width="8%">
                                        员工号
                                    </td>
                                    <td width="10%">
                                        姓名
                                    </td>
                                    <td width="10%">
                                        出租审核
                                    </td>
                                    <td width="10%">
                                        出售审核
                                    </td>
                                    <td width="10%">
                                        求租审核
                                    </td>
                                    <td width="10%">
                                        求购审核
                                    </td>
                                    <td width="10%">
                                        审核中
                                    </td>
                                    <td width="10%">
                                        不通过数
                                    </td>
                                    <td width="12%">
                                        合计
                                    </td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr height="26" class="cp" onmouseover="this.style.backgroundColor='#C5D5E5'" onmouseout="this.style.backgroundColor=''">
                                <td align="left">
                                    <%# DataBinder.Eval(Container.DataItem, "empID")%>
                                </td>
                                <td align="left">
                                    <%# DataBinder.Eval(Container.DataItem, "empRName")%>
                                </td>
                                <td align="center">
                                    <%# DataBinder.Eval(Container.DataItem, "HouseYes1")%>
                                </td>
                                <td align="left">
                                    <%# DataBinder.Eval(Container.DataItem, "HouseYes2")%>
                                </td>
                                <td align="left">
                                    <%# DataBinder.Eval(Container.DataItem, "NeedYes1")%>
                                </td>
                                <td align="center">
                                    <%# DataBinder.Eval(Container.DataItem, "NeedYes2")%>
                                </td>
                                <td align="center">
                                    <%# DataBinder.Eval(Container.DataItem, "checking")%>
                                </td>
                                <td align="center">
                                    <%# DataBinder.Eval(Container.DataItem, "checkno")%>
                                </td>
                                <td>
                                    <%# DataBinder.Eval(Container.DataItem, "totalcount")%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <br />
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <div style="float: right">
                                            <asp:Button ID="btCount" runat="server" Text="按时间统计" OnClick="btCount_Click" /></div>
                                        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="650px">
                                            <Series>
                                                <asp:Series Name="出租" ChartType="StackedColumn" XValueMember="empRName" YValueMembers="HouseYes1"
                                                    ToolTip="出租">
                                                </asp:Series>
                                                <asp:Series Name="出售" ChartType="StackedColumn" XValueMember="empRName" YValueMembers="HouseYes2"
                                                    ToolTip="出售">
                                                </asp:Series>
                                                <asp:Series Name="求租" ChartType="StackedColumn" XValueMember="empRName" YValueMembers="NeedYes1"
                                                    ToolTip="求租">
                                                </asp:Series>
                                                <asp:Series Name="求购" ChartType="StackedColumn" XValueMember="empRName" YValueMembers="NeedYes2"
                                                    ToolTip="求购">
                                                </asp:Series>
                                                <asp:Series Name="审核中" ChartType="StackedColumn" XValueMember="empRName" YValueMembers="checking"
                                                    ToolTip="审核中">
                                                </asp:Series>
                                                <asp:Series Name="不通过" ChartType="StackedColumn" XValueMember="empRName" YValueMembers="checkno"
                                                    ToolTip="不通过">
                                                </asp:Series>
                                            </Series>
                                            <Legends>
                                                <asp:Legend Alignment="Center">
                                                </asp:Legend>
                                            </Legends>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1">
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:houseIntermediaryDBConnectionString %>"
                                            SelectCommand="sp_SuperAdminCount" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                        <asp:Chart ID="Chart2" runat="server" Width="580px" Visible="false">
                                            <Series>
                                                <asp:Series Name="时间" ChartType="Spline" XValueMember="dayTime" YValueMembers="dayTotal"
                                                    ToolTip="天">
                                                </asp:Series>
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1">
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
                <asp:Panel ID="plDuty" runat="server">
                    <hr />
                    <table id="table3" cellspacing="1" cellpadding="3" width="100%" border="0">
                        <tr>
                            <td align="center" height="15">
                                <font color="Red"><strong>工作职责</strong></font>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#f1f1f1" height="43">
                                <ul>
                                    <li>审核出租、出售、求租、求购信息，通过后才予以显示</li>
                                    <li>在左边房屋管理点击任何一个连接可看到一个待审核的列表，点击最右侧的连接可进入审核环节</li>
                                    <li>可以查看自己审核过的信息记录</li>
                                    <li>请务必操作规范，不用时退出系统</li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td height="20">
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
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
                            我的<font color="Red"><strong>工作情况</strong></font>
                        </td>
                    </tr>
                    <tr>
                        <td class="title" align="center" width="37%" bgcolor="#f1f1f1" height="24">
                            信息类型
                        </td>
                        <td class="title" align="center" width="19%" bgcolor="#f1f1f1" height="24">
                            处理条数
                        </td>
                        <td class="title" align="center" width="26%" bgcolor="#f1f1f1" height="24">
                            更多
                        </td>
                    </tr>
                    <tr>
                        <td align="center" bgcolor="#f1f1f1" height="26">
                            <a href="YesHouseList.aspx?showtype=1">审核通过的出租出售信息</a>
                        </td>
                        <td align="center" bgcolor="#f1f1f1" height="26">
                            <font color="Red">
                                <asp:Label ID="lblNum1" runat="server"></asp:Label></font> 条
                        </td>
                        <td align="center" bgcolor="#f1f1f1" height="26">
                            <a href="YesHouseList.aspx?showtype=1">查看详情&gt;&gt;</a>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" bgcolor="#f1f1f1" height="28">
                            <a href="YesHouseList.aspx?showtype=2">审核通过的求租求购信息</a>
                        </td>
                        <td align="center" bgcolor="#f1f1f1" height="28">
                            <font color="Red">
                                <asp:Label ID="lblNum2" runat="server"></asp:Label></font> 条
                        </td>
                        <td align="center" bgcolor="#f1f1f1" height="28">
                            <a href="YesHouseList.aspx?showtype=2">查看详情&gt;&gt;</a>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" bgcolor="#f1f1f1" height="25">
                            <a href="YesHouseList.aspx?showtype=3">正在审核中的信息</a>
                        </td>
                        <td align="center" bgcolor="#f1f1f1" height="25">
                            <font color="Red">
                                <asp:Label ID="lblNum3" runat="server"></asp:Label></font> 条
                        </td>
                        <td align="center" bgcolor="#f1f1f1" height="25">
                            <a href="YesHouseList.aspx?showtype=3">查看详情&gt;&gt;</a>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" bgcolor="#f1f1f1" height="25">
                            <a href="YesHouseList.aspx?showtype=4">审核不通过的信息</a>
                        </td>
                        <td align="center" bgcolor="#f1f1f1" height="25">
                            <font color="Red">
                                <asp:Label ID="lblNum4" runat="server"></asp:Label></font> 条
                        </td>
                        <td align="center" bgcolor="#f1f1f1" height="25">
                            <a href="YesHouseList.aspx?showtype=4">查看详情&gt;&gt;</a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" height="20">
                            待审： 出租<asp:Label ID="lbWait1" runat="server" Text=""></asp:Label>条&nbsp; 出售<asp:Label
                                ID="lbWait2" runat="server" Text=""></asp:Label>条&nbsp; 求租<asp:Label ID="lbWait3"
                                    runat="server" Text=""></asp:Label>条&nbsp; 求购<asp:Label ID="lbWait4" runat="server"
                                        Text=""></asp:Label>条
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
