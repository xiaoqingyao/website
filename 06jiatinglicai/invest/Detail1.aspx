<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Detail1.aspx.cs" Inherits="invest_Detail1" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<td>
<table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
                <tr>                   
                    <td class="tdbg">
                               
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	 <tr>
	<td height="25" width="17%" align="right">Ͷ����Ŀ��</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblinvest_Title" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="17%" align="right">Ͷ��ʱ�䣺</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblinvest_Time" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="17%" align="right">Ͷ�ʽ�</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblinvest_Money" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="17%" align="right">�����ˣ�</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblfamily_Id" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="17%" align="right">��ע��</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblinvest_Bz" runat="server" Text=""></asp:Label></td>
	</tr>
		<tr>
	<td height="25" width="17%" align="right">���״̬��</td>
	<td height="25" width="*" align="left" style="text-align:left">
	
	    <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
            RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Selected="True">���ͨ��</asp:ListItem>
            <asp:ListItem>��˲���</asp:ListItem>
        </asp:RadioButtonList>
	
	</td>
	</tr>
		<tr>
	<td height="25"  align="left" colspan="2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button 
            ID="Button2" runat="server" Text="�ύ���" onclick="Button2_Click" />
        &nbsp;
        <input id="Button1" type="button" value="������ҳ" onclick="location.href='Manage.aspx'" />
	        </td>
	</tr>
</table>

                    </td>
                </tr>
            </table></td>
</asp:Content>

