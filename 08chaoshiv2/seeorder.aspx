<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="seeorder.aspx.cs" Inherits="seeorder" ValidateRequest="false" %>

<%@ Register assembly="DotNetTextBox" namespace="DotNetTextBox" tagprefix="DNTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
  <asp:Panel ID="Panel3" runat="server" Height="800px">
    <table align="center" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center" style="height: 15px; text-align: left">
                    <strong>我的订单<br />
                    </strong>
                </td>
            </tr>
            <tr>
                <td align="center">
                </td>
            </tr>
            <tr>
                <td style="height: 23px; text-align: left">
                    <asp:GridView ID="gvOrderList" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        DataKeyNames="OrderID" HorizontalAlign="Center" OnPageIndexChanging="gvOrderList_PageIndexChanging" OnSelectedIndexChanging="gvOrderList_SelectedIndexChanging" Width="596px"
                       
                       >
                        <HeaderStyle Font-Bold="True" />
                        <Columns>
                            <asp:BoundField DataField="OrderID" HeaderText="单号" />
                            <asp:BoundField DataField="OrderDate" DataFormatString="{0:d} " HeaderText="下订时间"
                                HtmlEncode="False">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TotalMoney" HeaderText="货物总额">
                            </asp:BoundField>
                            <asp:BoundField DataField="PayType" HeaderText="支付方式">
                            </asp:BoundField>
                            <asp:BoundField DataField="IsPayed" HeaderText="是否付款">
                            </asp:BoundField>
                            <asp:BoundField DataField="OrderState" HeaderText="订单状态">
                            </asp:BoundField>
                            <asp:BoundField DataField="ReceiverTel" HeaderText="收货人电话">
                            </asp:BoundField>
                            <asp:HyperLinkField DataNavigateUrlFields="OrderID" DataNavigateUrlFormatString="admin/orderupt.aspx?orderid={0} &amp;&amp;opt=view"
                                HeaderText="详情" Target="_blank" Text="详情">
                            </asp:HyperLinkField>
                            
                             <asp:HyperLinkField DataNavigateUrlFields="OrderID" DataNavigateUrlFormatString="ShouHuo.aspx?orderid={0}"
                                HeaderText="收货"  Text="收货">
                            </asp:HyperLinkField>
                        </Columns>
                    </asp:GridView>
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
      
</asp:Panel>                                   
</asp:Content>

