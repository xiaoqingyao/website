<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="save_analysis.aspx.cs" Inherits="save_analysis" Title="" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<td>
 
<table border="0" cellpadding="0" cellspacing="1" style="width: 100%;">  
<tr><td width="25%" align="right">

    ���˻��ڴ��</td><td>

                                    �����<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>����<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox><asp:Button 
                                        ID="Button3" runat="server" Text="�� ��" onclick="Button3_Click" />
                                    <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>

</td></tr>

<tr><td width="25%" align="right">

    ���˶��ڴ��</td><td>
 �����<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>����<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox><asp:Button 
                                        ID="Button4" runat="server" Text="�� ��" 
            onclick="Button4_Click"  />
                                    <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
</td></tr>
<tr><td width="25%" align="right">

    ֪ͨ��</td><td>

                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    <asp:Button ID="Button1" runat="server" Text="�� ��" />
                                    <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>

</td></tr>

<tr><td width="25%" align="right">

    �����ȡ��</td><td>

        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
 <asp:Button ID="Button2" runat="server" Text="�� ��" />
                                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
</td></tr>
</table>
    </td>
</asp:Content>

