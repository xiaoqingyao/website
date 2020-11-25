<%@ Page Language="C#" MasterPageFile="~/zt.master" AutoEventWireup="true" CodeFile="shoplist3.aspx.cs" Inherits="shoplist3" Title="恭喜，订单提交成功了！" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/xstlye.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="shoplist">
<div><img src="images/pay_setp_03[1].gif" /></div>
<div class="s_5">
<table cellpadding="0" cellspacing="0" width="100%">
<tr>
<td  colspan="4" style=" padding:15px 0;">
<div style="  font-size:22px; color:#ec659f;">恭喜，订单提交成功了！</div><br />
您的订单号：<asp:Label ID="ordernum" runat="server" Text=""></asp:Label>   您的应付款金额为：￥<asp:Label ID="wprice" runat="server" Text=""></asp:Label>元    支付方式：<asp:Label ID="waysgive" runat="server" Text=""></asp:Label> </td>
</tr>
<tr><td style="text-align:left;color:#ec659f;  border:0;">请点击以下银行支付：</td></tr>
<tr>
<td>
<a href=""><img src="images/bank_abc.gif" /></a>
<a href=""><img src="images/bank_bocb2c.gif" /></a>
<a href=""><img src="images/bank_ccb.gif" /></a>
<a href=""><img src="images/bank_cib.gif" /></a><br />


<a href=""><img src="images/bank_cib.gif" /></a>
<a href=""><img src="images/bank_citic.gif" /></a>
<a href=""><img src="images/bank_cmb.gif" /></a>
<a href=""><img src="images/bank_cmbc.gif" /></a><br />


<a href=""><img src="images/bank_comm.gif" /></a>
<a href=""><img src="images/bank_gdb.gif" /></a>
<a href=""><img src="images/bank_icbcb2c.gif" /></a>
<a href=""><img src="images/bank_sdb.gif" /></a>
</td></tr>
<tr><td style="text-align:left;color:#ec659f;  border:0;">请选择以下支付平台支付：</td></tr>
<tr>
<td>
&nbsp;<a href=""><img src="images/11_05.jpg" /></a>
<a href=""><img src="images/11_03.jpg" /></a>
</td>
</tr>
</table>

</div>
 
</div>
</asp:Content>

