<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>发起团购</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 570px">
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="height: 150px">
                </td>
                <td style="height: 150px">
                    <asp:GridView ID="gvOrder" runat="server" AutoGenerateColumns="False" Style="text-align: center"
                        Width="555px" OnRowDataBound="gvOrder_RowDataBound" OnRowDeleting="gvOrder_RowDeleting" OnRowEditing="gvOrder_RowEditing">
                        <Columns>
                            <asp:BoundField DataField="orderId" HeaderText="定单编号" />
                            <asp:BoundField DataField="gatherId" HeaderText="团购编号" />
                            <asp:BoundField DataField="productId" HeaderText="产品编号" />
                            <asp:BoundField DataField="perName" HeaderText="用户名" />
                            <asp:BoundField DataField="state" HeaderText="状态" />
                            <asp:BoundField DataField="sumTotal" HeaderText="总价格" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td style="height: 150px">
                </td>
            </tr>
            <tr>
                <td style="height: 21px">
                </td>
                <td style="height: 21px">
                </td>
                <td style="height: 21px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>