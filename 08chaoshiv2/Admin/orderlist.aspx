<%@ Page Language="C#" AutoEventWireup="true" CodeFile="orderlist.aspx.cs" Inherits="Admin_orderlist" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head> 
<body>
    <form id="form1" runat="server">
    <div>
      <table align="center" border="0" cellpadding="0" cellspacing="0"  >
                <tr>
                    <td align="center" style="height: 15px; text-align: left">
                        <strong>订单管理<br />
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <table align="center" cellpadding="0" cellspacing="0"  >
                            <tr>
                                <td align="right" style="text-align: right; height: 24px;">
                                    订单编号：</td>
                                <td style="text-align: left; width: 248px; height: 24px;">
                                    <asp:TextBox ID="txtKeyword" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="revInt" runat="server" ControlToValidate="txtKeyword"
                                        ErrorMessage="请输入整数" ValidationExpression="\d{1,} "></asp:RegularExpressionValidator></td>
                            </tr>
                            <tr>
                                <td align="right" style="text-align: right">
                                    是否付款：</td>
                                <td style="text-align: left; width: 248px;">
                                    <asp:DropDownList ID="ddlPayed" runat="server" Width="155px">
                                        <asp:ListItem Selected="True"></asp:ListItem>
                                        <asp:ListItem Value="已付款">已付款</asp:ListItem>
                                        <asp:ListItem Value="未付款">未付款</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td align="right" style="text-align: right">
                                    是否处理（发货）:</td>
                                <td style="text-align: left; width: 248px;">
                                    <asp:DropDownList ID="ddlShipped" runat="server" Width="155px" AutoPostBack="True">
                                        <asp:ListItem Selected="True"></asp:ListItem>
                                        <asp:ListItem Value="已发货">已发货</asp:ListItem>
                                        <asp:ListItem Value="未发货">未发货</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td align="right" style="text-align: center" colspan="2">
                                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="搜索" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="height: 23px; text-align: left;">
                        <asp:GridView ID="gvOrderList" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            DataKeyNames="OrderID" HorizontalAlign="Center" OnPageIndexChanging="gvOrderList_PageIndexChanging"
                            OnRowDeleting="gvOrderList_RowDeleting" OnRowEditing="gvOrderList_RowEditing" OnRowUpdating="gvOrderList_RowUpdating" >
                            <HeaderStyle Font-Bold="True" />
                            <Columns>
                                <asp:BoundField DataField="OrderID" HeaderText="单号" />
                                <asp:BoundField DataField="OrderDate" DataFormatString="{0:d} " HeaderText="下订时间" HtmlEncode="False">
                                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TotalMoney" HeaderText="总额">
                                    <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="PayType" HeaderText="支付方式">
                                    <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IsPayed" HeaderText="是否付款">
                                    <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="OrderState" HeaderText="订单状态">
                                    <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ReceiverTel" HeaderText="收货人电话">
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:HyperLinkField DataNavigateUrlFields="OrderID" DataNavigateUrlFormatString="orderupt.aspx?orderid={0} &amp;&amp;opt=view" HeaderText="详细信息"  Text="详细信息">
                                    <ItemStyle Width="100px" />
                                </asp:HyperLinkField>
                                <asp:TemplateField HeaderText="删除">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                            Text="删除" OnClientClick ="return confirm('确定删除吗？');"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="编辑">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                                            Text="更新"></asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                            Text="取消"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Edit"
                                            Text="编辑"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <br />
                        <%--<asp:ButtonColumn Text="&lt;div id=&quot;de&quot; onclick=&quot;javascript:return confirm('确认删除吗？')&quot;&gt;删除&lt;/div&gt;"
									CommandName="Delete">
									<ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
								</asp:ButtonColumn>
							</Columns>
							<PagerStyle Mode="NumericPages"></PagerStyle>
						</asp:datagrid>--%>
                    </td>
                </tr>
            </table>
    </div>
    </form>
</body>
</html>
