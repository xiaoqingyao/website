<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Modify.aspx.cs" Inherits="in_Type_Modify" ValidateRequest="false" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<td>
    <table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
        <tr>
            <td class="tdbg">
                
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
<tr>
<td  style=" text-align:right; width:30%;">收支类型名称:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_inTitle" runat="server" width="200"></asp:TextBox></div>
 </td></tr>

	
</table>

            </td>
        </tr>
        <tr>
            <td class="tdbg" align="center" valign="bottom">
              <asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click" class="inputbutton" ></asp:Button>
               <input id="btnCancle" type="button"  onclick="location.href='Manage.aspx';"  class="inputbutton" value="取消" />
            </td>
        </tr>
    </table>
    </td>
    
</asp:Content>

