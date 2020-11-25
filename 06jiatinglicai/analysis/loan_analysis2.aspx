<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="loan_analysis2.aspx.cs" Inherits="loan_analysis2" Title="" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<td>
 
<table border="0" cellpadding="0" cellspacing="1" style="width: 100%;">  
<tr><td width="25%" align="right">

    分期偿还贷款：</td><td>

                                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><asp:Button 
                                        ID="Button3" runat="server" Text="分 析" onclick="Button3_Click" />
                                    <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>

</td></tr>

<tr><td width="25%" align="right">

    小额质押贷款：</td><td>

                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    <asp:Button ID="Button1" runat="server" Text="分 析" />
                                    <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>

</td></tr>

<tr><td width="25%" align="right">

    个体工商户贷款：</td><td>

        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
 <asp:Button ID="Button2" runat="server" Text="分 析" />
                                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
</td></tr>
</table>
    </td>
</asp:Content>

