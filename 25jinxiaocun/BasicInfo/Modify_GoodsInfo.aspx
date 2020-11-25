<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Modify_GoodsInfo.aspx.cs" Inherits="BasicInfo_Modify_GoodsInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>商品管理</title>
      <script language="javascript" type="text/javascript" src="../JavaScript/Calendar.js"></script>
    <script type="text/javascript">
var oCalendarEn=new PopupCalendar("oCalendarEn");    //初始化控件时,请给出实例名称如:oCalendarEn
oCalendarEn.Init();
var oCalendarChs=new PopupCalendar("oCalendarChs");    //初始化控件时,请给出实例名称:oCalendarChs
oCalendarChs.weekDaySting=new Array("日","一","二","三","四","五","六");
oCalendarChs.monthSting=new Array("一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月");
oCalendarChs.oBtnTodayTitle="今天";
oCalendarChs.oBtnCancelTitle="取消";
oCalendarChs.Init();</script> 
	<script language="javascript">
function clockon(){
var date=new Date();
var YY=date.getYear();
var MM=date.getMonth()+1;
var DD=date.getDate();
var KK=date.getDay();
var HH=date.getHours();
var mm=date.getMinutes();
var SS=date.getSeconds();
if (MM<10) MM="0"+MM;
if (DD<10) DD="0"+DD;
if (HH<10) HH="0"+HH;
if (mm<10) mm="0"+mm;
if (SS<10) SS="0"+SS;
switch (KK){
   case 1:
    KK="星期一";
    break;
   case 2:
    KK="星期二";
    break;
   case 3:
    KK="星期三";
    break;
   case 4:
    KK="星期四";
    break;
   case 5:
    KK="星期五";
    break;
   case 6:
    KK="星期六";
    break;
   case 0:
    KK="星期日";
    break;
}
var str_date=""+YY+"年"+MM+"月"+DD+"日 "+KK+" "+HH+":"+mm+":"+SS;
if(document.all){
div_date.innerHTML=str_date;
}
var timer=setTimeout("clockon()",200);
}
</script>
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
            修改商品</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif" style="height: 49px"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr height="20">
                <td lang="zh-cn">
                    <span></span>商品名称：<asp:TextBox ID="txtname" runat="server" Width="353px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname"
                            ErrorMessage="必填"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr height="20">
                <td>
                    <span lang="zh-cn">商品编码：</span><asp:TextBox ID="TextBox1" runat="server" Width="212px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="必填"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <span lang="zh-cn">商品类别：</span><asp:DropDownList ID="DropDownList1" runat="server"
                        Width="137px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr height="20">
                <td>
                    <span lang="zh-cn">商品单价：</span><asp:TextBox ID="txtdanjia" runat="server" Width="86px"></asp:TextBox>
                </td>
            </tr>
            <tr height="20">
                <td>
                    <span lang="zh-cn">商品规格：</span><asp:TextBox ID="txtguige" runat="server" Width="189px"></asp:TextBox>
                </td>
            </tr>
            <tr height="20">
                <td>
                    <span lang="zh-cn">生产日期：</span><asp:TextBox ID="txtriqi" runat="server" onfocus="getDateString(this,oCalendarChs)"></asp:TextBox>
                </td>
            </tr>
            <tr height="20">
                <td align="center" style="height: 20px">
                    <span lang="zh-cn">商品描述</span></td>
            </tr>
            <tr height="20">
                <td align="center">
                    <asp:TextBox ID="txtds" runat="server" Height="81px" TextMode="MultiLine" Width="100%"></asp:TextBox>
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
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="修 改" />
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
