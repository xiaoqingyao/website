<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="family_Manage" Title="" %>
<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager"%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<td>
          
<table width="100%" border="0" cellspacing="0" cellpadding="1" class="tbbc">
  <tr height='30'>
    <th width="5%">���</th>
    <th >��½��</th>
    <th >��½����</th>
    <th >����</th>
    <th >����</th>
   </tr>
      
    <asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
        <tr bgcolor="" onclick="javascript:if(this.bgColor=='#f4f4e0') {this.bgColor='#FFFFFF'}else{this.bgColor='#f4f4e0';}" onmouseover="javascript:if (this.bgColor!='#f4f4e0'){this.bgColor='#E7F2FD';}" onmouseout="javascript:if(this.bgColor!='#f4f4e0'){this.bgColor='';}" >
<td align="center">
<%# Container.ItemIndex+1 %></td>
 <td align="center"><%# Eval("family_Lname")%></td>
 <td align="center"><%# Eval("family_Pass")%></td>
 <td align="center"><%# Eval("family_Name")%></td>


<td align="center">
    <a href="Detail.aspx?id=<%# Eval("family_Id") %>"><img src="../images/ico_view.gif" width="16" height="16" style="border:0px;" title="�鿴�ü�¼" /></a> 
    <a href="Modify.aspx?id=<%# Eval("family_Id") %>"><img src="../images/ico_edit.gif" width="16" height="16" style="border:0px;" title="�޸ĸü�¼" /></a> 
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../images/ico_del.gif" ToolTip="ɾ���ü�¼"  OnClick="del_Click"  CommandArgument='<%# Eval("family_Id") %>' OnClientClick='return confirm("��ȷ��Ҫɾ������Ϣô��");' />
</td>
</tr>
    </ItemTemplate>
    </asp:Repeater>
</table>


<table border="0" cellpadding="0" cellspacing="1" style="width: 100%;">
  <tr>
<td align="right"> <webdiyer:AspNetPager ID="AspNetPager1" runat="server" AlwaysShow="false" FirstPageText="��ҳ" LastPageText="ĩҳ" NextPageText="��һҳ" OnPageChanged="AspNetPager1_PageChanged"  PageIndexBoxType="DropDownList" PageSize="10" PrevPageText="��һҳ" ShowPageIndexBox="Always" Width="90%" ></webdiyer:AspNetPager></td>
  </tr>


</table>
    </td>
</asp:Content>
