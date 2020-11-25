<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderMang.aspx.cs" Inherits="Admin_OrderMang" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" style="border-top-width: 1px; border-left-width: 1px;
            border-left-color: #ff00ff; border-bottom-width: 1px; border-bottom-color: #ff00ff;
            border-top-color: #ff00ff; border-right-width: 1px; border-right-color: #ff00ff"
            width="100%">
            <tr>
                <td style="width: 9px" valign="top">
                    <img height="7" src="../Image/JiSu_Admin_22.gif" width="8" />
                </td>
                <td style="background-image: url(../Image/JiSu_Admin_23.gif); width: 100%; height: 7px">
                </td>
                <td style="width: 9px">
                    <img height="7" src="../Image/JiSu_Admin_25.gif" width="8" />
                </td>
            </tr>
            <tr>
                <td style="background-image: url(../Image/JiSu_Admin_30.gif); width: 9px">
                </td>
                <td style="width: 100%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td style="vertical-align: top; text-align: left">
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top; height: 47px; text-align: left">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td class="Search_Border" style="height: 28px">
                                            快速搜索：&nbsp;
                                            <asp:TextBox ID="txtSechCompanyName" runat="server"></asp:TextBox>
                                            <asp:DropDownList ID="ddltype" runat="server">
                                                <asp:ListItem Value="1">定单号</asp:ListItem>
                                                <asp:ListItem Value="2">用户名</asp:ListItem>
                                                <asp:ListItem Value="3">产品名</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:ImageButton ID="ibtnSreach" runat="server" CausesValidation="False" ImageUrl="~/Image/search.jpg"
                                                OnClick="ibtnSreach_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="Search_Border">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td style="height: 19px">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 19px">
                                &nbsp;<asp:GridView ID="gvOrder" runat="server" AutoGenerateColumns="False" Width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="orderId" HeaderText="定单号" />
                                        <asp:BoundField DataField="gatherId" HeaderText="团购编号">
                                            <ItemStyle CssClass="dn" />
                                            <HeaderStyle CssClass="dn" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="productId" HeaderText="产品编号">
                                            <ItemStyle CssClass="dn" />
                                            <HeaderStyle CssClass="dn" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="perName" HeaderText="定购会员" />
                                        <asp:BoundField DataField="sumTotal" HeaderText="价格" />
                                        <asp:BoundField DataField="producName" HeaderText="产品名" />
                                        <asp:BoundField DataField="time" HeaderText="加入时间" />
                                        <asp:BoundField DataField="state" HeaderText="定单状态" />
                                        <asp:BoundField DataField="personalInfoId">
                                            <ItemStyle CssClass="dn" />
                                            <HeaderStyle CssClass="dn" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="Button1" runat="server" Text="通过" OnClick="Button1_Click" CommandArgument='<%#Eval("orderId") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="background-image: url(../Image/JiSu_Admin_32.gif); width: 9px">
                </td>
            </tr>
            <tr>
                <td style="width: 9px">
                    <img height="8" src="../Image/JiSu_Admin_48.gif" width="8" />
                </td>
                <td style="background-image: url(../Image/JiSu_Admin_49.gif); width: 100%; height: 8px">
                </td>
                <td style="width: 9px">
                    <img height="8" src="../Image/JiSu_Admin_51.gif" width="8" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
