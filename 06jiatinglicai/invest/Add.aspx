<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" ValidateRequest="false" Inherits="invest_Add" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script src="../My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<td>
    <table style="width: 100%;line-height:25px;" cellpadding="2" cellspacing="1" class="border">
        <tr>
            <td class="tdbg">
                
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
<tr>
<td  style=" text-align:right; width:30%;">投资项目:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_invest_Title" runat="server" width="200"></asp:TextBox></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:30%;">投资时间:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_invest_Time" runat="server" width="200" class="Wdate" onfocus="WdatePicker()"></asp:TextBox></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:30%;">投资金额:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_invest_Money" runat="server" width="200"></asp:TextBox></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:30%;">操作人:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:DropDownList ID="ddlfamily_Id" runat="server" Width="200">
</asp:DropDownList> </td></tr>

<tr>
<td  style=" text-align:right; width:30%;">备注:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_invest_Bz" runat="server" width="276px" Height="119px" 
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
    <br />
    </td>
    
</asp:Content>

