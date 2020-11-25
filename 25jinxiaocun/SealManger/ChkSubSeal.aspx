<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChkSubSeal.aspx.cs" Inherits="SealManger_ChkSubSeal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> 销售退货</title>
    <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #EEF2FB;
}
-->
</style>
<link href="images/skin.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif" style="height: 49px"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="images/content-bg.gif" style="height: 49px"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">
            销售退货</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif" style="height: 49px"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr height="20">
                <td lang="zh-cn" style="height: 20px">
                    <span></span>商品类别：<asp:TextBox ID="txtType" runat="server" Width="133px" ReadOnly="True"></asp:TextBox>
                    <input id="Hidden1" runat="server" type="hidden" /></td>
            </tr>
        <tr height="20">
            <td lang="zh-cn" style="height: 20px">
                商品名称：<asp:TextBox ID="txtGoodsName" runat="server" Width="163px" ReadOnly="True"></asp:TextBox>
                <input id="Hidden2" runat="server" type="hidden" /></td>
        </tr>
            <tr height="20">
                <td>
                    <span lang="zh-cn">商品编码：</span><asp:TextBox ID="txtCode" runat="server" Width="212px" ReadOnly="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="必填"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr height="20">
                <td>
                    <span lang="zh-cn">进货单价：</span><asp:TextBox ID="txtdanjia" runat="server" Width="86px" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr height="20">
                <td>
                    <span lang="zh-cn">商品规格：</span><asp:TextBox ID="txtguige" runat="server" Width="189px" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
        </table>
    </td>
    <td background="images/mail_rightbg.gif">&nbsp;</td>
  </tr>
        <tr>
            <td background="images/mail_leftbg.gif" valign="middle" style="height: 19px">
            </td>
            <td align="center" bgcolor="#f7f8f9" valign="top" style="height: 19px">
                销售信息</td>
            <td background="images/mail_rightbg.gif" style="height: 19px">
            </td>
        </tr>
        <tr>
            <td background="images/mail_leftbg.gif" style="height: 24px" valign="middle">
            </td>
            <td align="left" bgcolor="#f7f8f9" style="height: 24px" valign="top">
                销售单价：<asp:TextBox ID="txtSealDanJia" runat="server" Width="110px" ReadOnly="True"></asp:TextBox></td>
            <td background="images/mail_rightbg.gif" style="height: 24px">
            </td>
        </tr>
        <tr>
            <td background="images/mail_leftbg.gif" style="height: 24px" valign="middle">
            </td>
            <td align="left" bgcolor="#f7f8f9" style="height: 24px" valign="top">
                销售数量：<asp:TextBox ID="txtSL" runat="server" Width="110px" AutoPostBack="True" ReadOnly="True" ></asp:TextBox></td>
            <td background="images/mail_rightbg.gif" style="height: 24px">
            </td>
        </tr>
        <tr>
            <td background="images/mail_leftbg.gif" style="height: 24px" valign="middle">
            </td>
            <td align="left" bgcolor="#f7f8f9" style="height: 24px" valign="top">
                往来单位：<asp:TextBox ID="txtDanWei" runat="server" AutoPostBack="True"
                    Width="110px" ReadOnly="True"></asp:TextBox></td>
            <td background="images/mail_rightbg.gif" style="height: 24px">
            </td>
        </tr>
        <tr>
            <td background="images/mail_leftbg.gif" style="height: 24px" valign="middle">
            </td>
            <td align="left" bgcolor="#f7f8f9" style="height: 24px" valign="top">
                销售金额：<asp:TextBox ID="txtSumMoeny" runat="server" Width="110px" ReadOnly="True"></asp:TextBox></td>
            <td background="images/mail_rightbg.gif" style="height: 24px">
            </td>
        </tr>
        <tr>
            <td background="images/mail_leftbg.gif" style="height: 24px" valign="middle">
            </td>
            <td align="center" bgcolor="#f7f8f9" style="height: 24px" valign="top">
                退货信息</td>
            <td background="images/mail_rightbg.gif" style="height: 24px">
            </td>
        </tr>
        <tr>
            <td background="images/mail_leftbg.gif" style="height: 24px" valign="middle">
            </td>
            <td align="left" bgcolor="#f7f8f9" style="height: 24px" valign="top">
                退货数量：<asp:TextBox ID="TextBox5" runat="server" Width="156px" AutoPostBack="True" OnTextChanged="TextBox5_TextChanged"></asp:TextBox>输入退货数量<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
            <td background="images/mail_rightbg.gif" style="height: 24px">
            </td>
        </tr>
        <tr>
            <td background="images/mail_leftbg.gif" style="height: 24px" valign="middle">
            </td>
            <td align="left" bgcolor="#f7f8f9" style="height: 24px" valign="top">
                退货金额：<asp:TextBox ID="TextBox1" runat="server" Width="110px"></asp:TextBox></td>
            <td background="images/mail_rightbg.gif" style="height: 24px">
            </td>
        </tr>
        <tr>
            <td background="images/mail_leftbg.gif" style="height: 19px" valign="middle">
            </td>
            <td align="center" bgcolor="#f7f8f9" style="height: 19px" valign="top">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确 认" />
                &nbsp;<asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td background="images/mail_rightbg.gif" style="height: 19px">
            </td>
        </tr>
  <tr>
    <td valign="bottom" background="images/mail_leftbg.gif"><img src="images/buttom_left2.gif" width="17" height="17" /></td>
    <td background="images/buttom_bgs.gif"><img src="images/buttom_bgs.gif" width="17" height="17"></td>
    <td valign="bottom" background="images/mail_rightbg.gif"><img src="images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
    </div>
    </form>
</body>
</html>
