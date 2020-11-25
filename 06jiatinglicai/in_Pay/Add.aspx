<%@ Page Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" ValidateRequest="false" Inherits="in_Pay_Add" Title="" %>

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
<td  style=" text-align:right; width:30%;">收支日期:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_in_Date" runat="server" width="200" class="Wdate" onfocus="WdatePicker()"></asp:TextBox></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:30%;">收支人员:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:DropDownList ID="ddlfamily_Id" runat="server" Width="200">
</asp:DropDownList> </td></tr>

<tr>
<td  style=" text-align:right; width:30%;">收支类型:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:RadioButtonList ID="rdlin_Leixing" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
    <asp:ListItem Selected="True">收入</asp:ListItem>
    <asp:ListItem>支出</asp:ListItem>
</asp:RadioButtonList> </td></tr>

<tr>
<td  style=" text-align:right; width:30%;">收支类别:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:DropDownList ID="ddlinId" runat="server" Width="200">
</asp:DropDownList> </td></tr>

<tr>
<td  style=" text-align:right; width:30%;">收支金额:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_in_Money" runat="server" width="200"></asp:TextBox></div>
 </td></tr>

<tr>
<td  style=" text-align:right; width:30%;">收支备注:</td>
<td class="tbright"><div style="display:inline;float:left;">
<asp:TextBox ID="txt_in_Bz" runat="server" width="267px" Height="121px" 
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

