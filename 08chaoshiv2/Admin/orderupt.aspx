<%@ Page Language="C#" AutoEventWireup="true" CodeFile="orderupt.aspx.cs" Inherits="Admin_orderupt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style2
        {
            width: 143px;
            color: #FF0000;
        } 
    </style>
</head> 
<body>
    <form id="form1" runat="server">
    <div>
       <table id="Table1" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="100%">
                <tbody>
                    <tr>
                        <td valign="middle" colspan="3">
                            <strong>
                                <br />
                            </strong>
                            订单号码：<%=order.OrderID %>&nbsp;
                            下单日期：<%=order.OrderDate%>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table id="Table3" bgcolor="#ffffff" border="0" cellpadding="1" cellspacing="0" width="100%">
                <tbody>
                    <tr>
                        <td valign ="bottom" >
                            <strong>订单信息</strong>
                            <hr noshade="noshade" size="1" />
                            <br />
                            <span style="color: red">
                            </span>
                            <asp:GridView ID="gvOrder" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="5">
                                <Columns>
                                    <asp:BoundField HeaderText="编号" DataField="GoodsID" />
                                    <asp:BoundField HeaderText="名称" DataField="GoodsName" />
                                    <asp:BoundField HeaderText="数量" DataField="Num" />
                                    <asp:BoundField HeaderText="单价" DataField="Price" />
                                    <asp:BoundField HeaderText="金额" DataField="SumPrice" />
                                </Columns>
                            </asp:GridView>
                            <br />
                            <table id="Table6" width="50%">
							    <tr>
								    <td style="width: 381px">
                                        定单状态(是否处理/是否支付)&nbsp; ：<%=order.OrderState %>|<%=order.IsPayed %>支付</td>
							    </tr>
							    <tr>
								    <td style="width: 381px">
                                        支付方式&nbsp; ：货到付款</td>
							    </tr>
							     <tr>
								    <td style="width: 381px; height: 20px;">订单总金额：<%=order.TotalMoney%></td>
							    </tr>
						    </table>
                        </td>
                    </tr>
                </tbody>
            </table>
           
            <table id="Table8" bgcolor="#ffffff" border="0" cellpadding="3" cellspacing="3" width="100%">
                <tr>
                    <td>
                        <strong>购物人信息</strong></td>
                    <td>
                        <strong>收货人信息</strong></td>
                </tr>
                <tr>
                    <td style="border-right: #000000 1px solid; border-top: #000000 1px solid; border-left: #000000 1px solid;
                        border-bottom: #000000 1px solid" width="50%">
                        <span style="color: red">
                        <br />
                        </span>
                        <table id="Table9">
                            <tr>
                                <td align="right" style="text-align: right;" class="style2">
                                    购货人姓名：</td>
                                <td style="width: 323px">
                                    <%=order.MemberName%>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style2">
                                    联系电话：</td>
                                <td style="width: 323px">
                                    <%=order.MobileTel %>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style2">
                                    Email：</td>
                                <td style="width: 323px">
                                    <%=order.Email%>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style2">
                                    购货人地址：</td>
                                <td style="width: 323px">
                                    <% =order.Address%>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style2">
                                    邮政编码：</td>
                                <td style="width: 323px">
                                    <% =order.Code%>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="border-right: #000000 1px solid; border-top: #000000 1px solid; border-left: #000000 1px solid;
                        border-bottom: #000000 1px solid" width="50%">
                        <span style="color: red">
                        <br />
                        </span>
                        <table id="Table2">
							<tr>
								<td align="right" class="style2">
                                    收货人姓名：</td>
								<td style="width: 325px"><%=order.ReceiverName%></td>
							</tr>
							
							<tr>
								<td align="right" class="style2">联系电话：</td>
								<td style="width: 325px"><%=order.ReceiverTel%></td>
							</tr>
							<tr>
								<td align="right" class="style2">
                                    Email：</td>
								<td style="width: 325px"><%=order.ReceiverEmail%></td>
							</tr>
							<tr>
								<td align="right" class="style2">
                                    收货人地址：</td>
								<td style="width: 325px"><% =order.ReceiverAddress%></td>
							</tr>
							<tr>
								<td align="right" class="style2">邮政编码：</td>
								<td style="width: 325px"><% =order.ReceiverCode%></td>
							</tr>
						</table>
                    </td>
                </tr>
            </table>
            <table id="Table11" bgcolor="#ffffff" width="100%">
                <tr>
                    <td>
                        <strong>修改订单状态</strong>
                    </td>
                </tr>
                <tr>
                    <td style="height: 22px">
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>发货</asp:ListItem>
                        </asp:DropDownList>
                        物流名称：<asp:DropDownList ID="DropDownList2" runat="server">
                            <asp:ListItem>圆通</asp:ListItem>
                            <asp:ListItem>申通</asp:ListItem>
                            <asp:ListItem>EMS</asp:ListItem>
                            <asp:ListItem>韵达</asp:ListItem>
                            <asp:ListItem>中通</asp:ListItem>
                        </asp:DropDownList>物流编号：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="center" height="20" valign="middle">
                        <asp:Button ID="btnClose" runat="server" Height="22"   Style="border-right: #000000 1px solid;
                            border-top: #000000 1px solid; border-left: #000000 1px solid; border-bottom: #000000 1px solid"
                            Text="关 闭" Width="69" OnClientClick="javascript:window.close();" />
                        <asp:Button ID="btnSave" runat="server" Height="22" OnClick="btnSave_Click" Style="border-right: #000000 1px solid;
                            border-top: #000000 1px solid; border-left: #000000 1px solid; border-bottom: #000000 1px solid"
                            Text="修 改" Width="69" />
                        <input id="btnInput" onclick="javascript:window.print();" style="border-right: #000000 1px solid;
                            border-top: #000000 1px solid; border-left: #000000 1px solid; border-bottom: #000000 1px solid; width: 76px;"
                            type="button" value="打印文档" /></td>
                </tr>
            </table>
    </div>
    </form>
</body>
</html>
