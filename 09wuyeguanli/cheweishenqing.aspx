<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cheweishenqing.aspx.cs" Inherits="cheweishenqing" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>车位</title>
    <link href="../css/admin.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="padding-top: 15px">
        <table style="border: 1px solid #cbcbcb; background-color: #EEEEEE" cellpadding="4"
            cellspacing="0" align="center">
            <tr>
                <td align="center" colspan="2">
                    <strong>所有的可申请的车位</strong>
                </td>
            </tr>
            <tr>
                <td align="center" style="margin-left: 30px; font-size: 12px" colspan="2">
                    <asp:DataGrid ID="GridView1" runat="server" AllowPaging="True" PageSize="18" AutoGenerateColumns="False"
                        BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px"
                        CellPadding="3">
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <SelectedItemStyle BackColor="#FF6666" Font-Bold="True" ForeColor="#F7F7F7" />
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" Mode="NumericPages"
                            Visible="False" />
                        <AlternatingItemStyle BackColor="#9ABFE9" />
                        <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" Height="14px" />
                        <Columns>
                            <asp:TemplateColumn HeaderText="编号">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="40px" Font-Size="13px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="12px" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container, "DataItem.rownum")%>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="车位名称">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="350px" Font-Size="13px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="12px" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container, "DataItem.车位名称")%>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="车牌号">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="350px" Font-Size="13px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="12px" />
                                <ItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn>
                                <ItemTemplate>
                                    <asp:Button runat="server" ID="ShenQing" Text="申请" OnClick="ShenQing_Click" CommandArgument='<%#Eval("ID") %>' />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                        <HeaderStyle BackColor="#4292C6" Font-Bold="True" ForeColor="#F7F7F7" Font-Size="18pt"
                            Height="25px" />
                    </asp:DataGrid>
                </td>
            </tr>
            <tr>
                <td align="right" colspan="2" style="font-size: 12px">
                    总记录数：<%= zjl %>条 共<%= pagecount%>页/第<%= cruentpage%>页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="lbtfirst" runat="server" OnClick="lbtfirst_Click">首页</asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="lbtprev" runat="server" OnClick="lbtprev_Click">上一页</asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="lbtnext" runat="server" OnClick="lbtnext_Click">下一页</asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="lbtlast" runat="server" OnClick="lbtlast_Click">末页</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <p class="style1">
        &nbsp;</p>
    </form>
</body>
</html>
