<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChooseProduct.aspx.cs" Inherits="Admin_ChooseProduct" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
      <style type="text/css">
            .dn{display:none;}
            </style>
            <base target="_self" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td class="Search_Border" style="height: 28px">
                    通过(产品名字)快速搜索：&nbsp;
                    <asp:TextBox ID="txtSechCompanyName" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="ibtnSreach" runat="server" CausesValidation="False" ImageUrl="~/Image/search.jpg"
                        OnClick="ibtnSreach_Click" /></td>
            </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" style="font-size: 11px" width="100%">
            <tr>
                <td align="center" style="height: 152px">
                    <asp:GridView ID="gvProduct" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        CellPadding="4" ForeColor="#333333" OnPageIndexChanging="gvProduct_PageIndexChanging"
                        OnRowEditing="gvProduct_RowEditing" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="productId">
                                <ItemStyle CssClass="dn" />
                                <HeaderStyle CssClass="dn" />
                            </asp:BoundField>
                            <asp:BoundField DataField="productName" HeaderText="产品名" />
                            <asp:CommandField EditText="选择" ShowEditButton="True" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
