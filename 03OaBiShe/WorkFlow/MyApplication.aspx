<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyApplication.aspx.cs" Inherits="WorkFlow_MyApplication" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .hidden {
            display: none;
        }
    </style>
</head>
<body style="background-image: url(../image/rightFrame.gif); background-size: cover;">
    <form id="form1" runat="server">
        <div>
            <table style="width: 586px; height: 1px" align="center" class="css" border="1">
                <tr>
                    <td align="center" colspan="3" style="height: 15px" class="cssTitle">－＝我的事务申请＝－</td>
                </tr>
                <tr>
                    <td colspan="3" style="height: 75px" align="left"><%-- OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting"--%>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                            CellPadding="4" Font-Size="Small" OnRowCommand="GridView1_RowCommand"
                            Width="800px" DataKeyNames="billcode" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px">
                            <PagerSettings FirstPageText="第一页" LastPageText="最后一页"
                                NextPageText="下一页" PreviousPageText="上一页" Mode="NextPreviousFirstLast" />
                            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                            <Columns>
                                 <asp:BoundField DataField="billcode" HeaderText="申请说明" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" FooterStyle-CssClass="hidden">
                                    <HeaderStyle />
                                </asp:BoundField>
                                <asp:BoundField DataField="wfType" HeaderText="流程类型">
                                    <HeaderStyle   />
                                </asp:BoundField>
                                <asp:BoundField DataField="title" HeaderText="流程标题">
                                    <HeaderStyle  />
                                </asp:BoundField>
                                <asp:BoundField DataField="billuser" HeaderText="发起人">
                                    <HeaderStyle   />
                                </asp:BoundField>
                                <asp:BoundField DataField="billdept" HeaderText="所属院系">
                                    <HeaderStyle  />
                                </asp:BoundField>
                                <asp:BoundField DataField="billdate" HeaderText="发起时间">
                                    <HeaderStyle />
                                </asp:BoundField>
                                <asp:BoundField DataField="statusExplain" HeaderText="状态">
                                    <HeaderStyle   />
                                </asp:BoundField>
                                <asp:BoundField DataField="bohuiSm" HeaderText="驳回说明">
                                    <HeaderStyle   />
                                </asp:BoundField>
                                <%--                            <asp:HyperLinkField HeaderText="编辑" Text="编辑" DataNavigateUrlFields="deptID" DataNavigateUrlFormatString="UpdateWorkFlowType.aspx?id={0}" >
                                <HeaderStyle Width="60px" />
                            </asp:HyperLinkField>--%>
                                 <asp:ButtonField CommandName="del" HeaderText="删除" Text="删除" />
                               <%-- <asp:CommandField HeaderText="删除">
                                    <ItemStyle Font-Size="Small" />
                                    <HeaderStyle Width="60px" />
                                </asp:CommandField>--%>
                            </Columns>
                            <RowStyle BackColor="White" ForeColor="#003399" />
                            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Right" />
                            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
