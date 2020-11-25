<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Detail1.aspx.cs" Inherits="assets_Detail1" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<td>
<table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
                <tr>                   
                    <td class="tdbg">
                               
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	 <tr>
	<td height="25" width="17%" align="right">资产名称：</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblassets_Name" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="17%" align="right">数量：</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblassets_Sl" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="17%" align="right">价格：</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblassets_Price" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="17%" align="right">购入日期：</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblassets_Time" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="17%" align="right">购入人：</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblfamily_Id" runat="server" Text=""></asp:Label></td>
	</tr>
 <tr>
	<td height="25" width="17%" align="right">备注：</td>
	<td height="25" width="*" align="left" style="text-align:left"><asp:Label ID="lblassets_Bz" runat="server" Text=""></asp:Label></td>
	</tr>
		<tr>
	<td height="25" width="17%" align="right">审核状态：</td>
	<td height="25" width="*" align="left" style="text-align:left">
	
	    <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
            RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Selected="True">审核通过</asp:ListItem>
            <asp:ListItem>审核不过</asp:ListItem>
        </asp:RadioButtonList>
	
	</td>
	</tr>
	
		<tr>
	<td height="25"  align="left" colspan="2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button 
            ID="Button2" runat="server" Text="提交审核" onclick="Button2_Click" />&nbsp;
        <input id="Button1" type="button" value="返回上页" onclick="location.href='Manage.aspx'" />
	        </td>
	</tr>
</table>

                    </td>
                </tr>
            </table></td>
</asp:Content>

