<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="account_Detail" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<td>
<table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
                <tr>                   
                    <td class="tdbg">
                               
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	 <tr>
	<td height="25" width="17%" align="right">卡号：</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblbank_Id" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="17%" align="right">操作日期：</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblaccount_Time" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="17%" align="right">操作人：</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblfamily_Id" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="17%" align="right">操作类型：</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblaccount_Type" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="17%" align="right">操作金额：</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblaccount_Money" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="17%" align="right">备注：</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblaccount_Bz" runat="server" Text=""></asp:Label></td>
	</tr>
	
		<tr>
	<td height="25"  align="left" colspan="2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="Button1" type="button" value="返回上页" onclick="location.href='Manage.aspx'" />
	        </td>
	</tr>
</table>

                    </td>
                </tr>
            </table></td>
</asp:Content>

