<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChooseCompany.aspx.cs" Inherits="Admin_ChooseCompany" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title><style type="text/css">
            .dn{display:none;}
            </style>
            <base target="_self" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" style="font-size: 11px" width="100%">
            <tr>
                <td align="center">
                    <asp:GridView ID="gvCompany" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" OnRowEditing="gvCompany_RowEditing" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="companyId">
                                <ItemStyle CssClass="dn" />
                                <HeaderStyle CssClass="dn" />
                                <FooterStyle CssClass="dn" />
                            </asp:BoundField>
                            <asp:BoundField DataField="companyName" HeaderText="公司名" />
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
