<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="Loan_Money_Manage" Title="" %>
<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager"%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<td>
<table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
    <tr>
        <td align="center" class="tdbg">
<strong> �����</strong><asp:DropDownList ID="ddlfamily_Id" runat="server" Width="200">
</asp:DropDownList>
        <asp:Button ID="btnSearch" runat="server" Text="��ѯ"  OnClick="btnSearch_Click" ></asp:Button>   
        </td>
    </tr>
</table>
          
<table width="100%" border="0" cellspacing="0" cellpadding="1" class="tbbc">
  <tr height='30'>
    <th width="5%">���</th>
    <th >�������</th>
    <th >Ԥ������</th>
    <th >�����</th>
    <th >�����</th>
    <th >������</th>
          <th >״̬</th>
    <th >����</th>
   </tr>
      
    <asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
        <tr bgcolor="" onclick="javascript:if(this.bgColor=='#f4f4e0') {this.bgColor='#FFFFFF'}else{this.bgColor='#f4f4e0';}" onmouseover="javascript:if (this.bgColor!='#f4f4e0'){this.bgColor='#E7F2FD';}" onmouseout="javascript:if(this.bgColor!='#f4f4e0'){this.bgColor='';}" >
<td align="center">
<%# Container.ItemIndex+1 %></td>
 <td align="center"><%# Eval("im_Time1", "{0:yyyy-MM-dd}")%></td>
 <td align="center"><%# Eval("im_Time2", "{0:yyyy-MM-dd}")%></td>
 <td align="center"><%# Eval("family_Name")%></td>
 <td align="center"><%# Eval("im_Name")%></td>
 <td align="center"><%# Eval("im_Money")%></td>
 <td align="center"><%# Eval("zt").ToString() == "���ͨ��" ? "<span style='color:Green'>���ͨ��</span>" :Eval("zt").ToString() == ""?"�����": "<span style='color:Red'>��˲���</span>"%></td>


<td align="center">
    <a href="Detail.aspx?id=<%# Eval("lm_Id") %>"><img src="../images/ico_view.gif" width="16" height="16" style="border:0px;" title="�鿴�ü�¼" /></a> 
     <% if (Session["power"].ToString() == "����Ա")
       { %>
       <a href="Detail1.aspx?id=<%# Eval("lm_Id") %>">���</a>
    <a href="Modify.aspx?id=<%# Eval("lm_Id") %>"><img src="../images/ico_edit.gif" width="16" height="16" style="border:0px;" title="�޸ĸü�¼" /></a> 
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../images/ico_del.gif" ToolTip="ɾ���ü�¼"  OnClick="del_Click"  CommandArgument='<%# Eval("lm_Id") %>' OnClientClick='return confirm("��ȷ��Ҫɾ������Ϣô��");' />
<%} %>
</td>
</tr>
    </ItemTemplate>
    </asp:Repeater>
</table>


<table border="0" cellpadding="0" cellspacing="1" style="width: 100%;">
  <tr>
  
  <td align="left"> &nbsp;&nbsp;&nbsp;&nbsp; �ϼƣ�<asp:Label ID="Label2" 
          runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#00CC00"></asp:Label>Ԫ
<td align="right"> <webdiyer:AspNetPager ID="AspNetPager1" runat="server" AlwaysShow="false" FirstPageText="��ҳ" LastPageText="ĩҳ" NextPageText="��һҳ" OnPageChanged="AspNetPager1_PageChanged"  PageIndexBoxType="DropDownList" PageSize="10" PrevPageText="��һҳ" ShowPageIndexBox="Always" Width="90%" ></webdiyer:AspNetPager></td>

  </tr>


</table>
    </td>
</asp:Content>
