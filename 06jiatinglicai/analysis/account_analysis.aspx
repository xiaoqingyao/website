<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="account_analysis.aspx.cs" Inherits="analysis_account_analysis" Title="" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<td>
 <table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
    <tr>
        <td align="center" class="tdbg">
            年份：<asp:DropDownList ID="ddlfamily_Id" runat="server" Width="200">
</asp:DropDownList>
        <asp:Button ID="btnSearch" runat="server" Text="查询"  OnClick="btnSearch_Click" ></asp:Button>   

        </td>
    </tr>
</table>
                   
<table width="100%" border="0" cellspacing="0" cellpadding="1" class="tbbc">
  <tr height='30'>
   
    <th >月份</th>
    <th >存款金额</th>
    <th >取款金额</th>    
    <th >存款分析</th>
  
   </tr>
   
   
      
    <asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
        <tr bgcolor="" onclick="javascript:if(this.bgColor=='#f4f4e0') {this.bgColor='#FFFFFF'}else{this.bgColor='#f4f4e0';}" onmouseover="javascript:if (this.bgColor!='#f4f4e0'){this.bgColor='#E7F2FD';}" onmouseout="javascript:if(this.bgColor!='#f4f4e0'){this.bgColor='';}" >

 <td align="center"><%# Eval("mm")%></td>
 <td align="center" style="color:Blue"><%# Eval("t1")%></td>
 <td align="center"  style="color:Gray;"><%# Eval("t2")%></td>
 <td align="center"><%# decimal.Parse(Eval("t3").ToString()) > 0 ? "<span style='color:green'> ↑</span>" : decimal.Parse(Eval("t3").ToString()) == 0 ? "<span > --</span>" : "<span style='color:Red'> ↓</span>"%></td>

</tr>
    </ItemTemplate>
    </asp:Repeater>
</table>


<table border="0" cellpadding="0" cellspacing="1" style="width: 100%;">
  <tr>
   <td align="center">&nbsp;&nbsp;&nbsp;&nbsp; 共存款：<asp:Label ID="Label2" 
          runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#00CC00"></asp:Label>元，共取款：<asp:Label 
          ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" 
          Text="Label"></asp:Label>元，实际存款：<asp:Label 
          ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Blue" 
          Text="Label"></asp:Label>元</td>
  </tr>


</table>
    </td>
</asp:Content>

