<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Modify.aspx.cs" Inherits="Loan_Money_Modify" ValidateRequest="false" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script src="../My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<td>
    <table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
        <tr>
            <td class="tdbg">
                
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
<tr>
<td  style=" text-align:right; width:30%;">借款日期:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_im_Time1" runat="server" width="200" class="Wdate" onfocus="WdatePicker()"></asp:TextBox></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:30%;">预还日期:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_im_Time2" runat="server" width="200" class="Wdate" onfocus="WdatePicker()"></asp:TextBox></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:30%;">借款人:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:DropDownList ID="ddlfamily_Id" runat="server" Width="200">
</asp:DropDownList> </td></tr>

<tr>
<td  style=" text-align:right; width:30%;">借贷人:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_im_Name" runat="server" width="200"></asp:TextBox></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:30%;">借贷金额:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_im_Money" runat="server" width="200"></asp:TextBox></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:30%;">备注:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_im_Bz" runat="server" width="240px" Height="93px" 
        TextMode="MultiLine"></asp:TextBox></div>
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

