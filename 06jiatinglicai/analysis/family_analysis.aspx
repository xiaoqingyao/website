<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="family_analysis.aspx.cs" Inherits="analysis_family_analysis" Title="" %>


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
    <th >总数量</th>
    <th >总金额</th>    
   
   </tr>
   
   
      
    <asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
        <tr bgcolor="" onclick="javascript:if(this.bgColor=='#f4f4e0') {this.bgColor='#FFFFFF'}else{this.bgColor='#f4f4e0';}" onmouseover="javascript:if (this.bgColor!='#f4f4e0'){this.bgColor='#E7F2FD';}" onmouseout="javascript:if(this.bgColor!='#f4f4e0'){this.bgColor='';}" >

 <td align="center"><%# Eval("mm")%></td>
 <td align="center" ><%# Eval("t1")%></td>
 <td align="center" ><%# Eval("t2")%></td>

</tr>
    </ItemTemplate>
    </asp:Repeater>
</table>


<table border="0" cellpadding="0" cellspacing="1" style="width: 100%;">
  <tr>
   <td align="center"> &nbsp;&nbsp;&nbsp;&nbsp; 资产合计：<asp:Label ID="Label2" 
          runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#00CC00"></asp:Label>元</td>
  </tr>


</table>
    </td>
</asp:Content>

