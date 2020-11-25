<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModifyJieMoney.aspx.cs" Inherits="Admin_ModifyJieMoney" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>家庭财务管理系统</title>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css" />
<link rel="stylesheet" type="text/css" href="skin/css/main.css" />
<script src="../JavaScript/Calendar.js" type="text/javascript"></script>
		 
    <script language="JavaScript">
         <!--
        function killErrors() {
            return true;
        }
        window.onerror = killErrors;
          // -->
     </script>
    <script type="text/javascript">

        var oCalendarChs = new PopupCalendar("oCalendarChs"); //初始化控件时,请给出实例名称:oCalendarChs
        oCalendarChs.weekDaySting = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
        oCalendarChs.monthSting = new Array("一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月");
        oCalendarChs.oBtnTodayTitle = "Today";
        oCalendarChs.oBtnCancelTitle = "Cancel";
        oCalendarChs.Init();
	</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
<table width="100%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px;margin-top:8px;">
  <tr>
    <td   class='title'><span>修改借款信息</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="left">
        <table border="0" cellpadding="0" cellspacing="0" class="text008" width="100%">
            <tr align="center" class="bg04">
                <td align="right" style="width: 128px; height: 35px">
                    借款人：</td>
                <td align="left" style="height: 35px">
                    <asp:TextBox ID="TextBox1" runat="server" Width="122px"></asp:TextBox></td>
            </tr>
            <tr align="center" class="bg04">
                <td align="right" height="35" style="width: 128px">
                    涉及金额：</td>
                <td align="left">
                    <asp:TextBox ID="TxtMoney" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr align="center" class="bg04">
                <td align="right" height="35" style="width: 128px">
                    借款类型：</td>
                <td align="left">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="91px">
                        <asp:ListItem>借出款</asp:ListItem>
                        <asp:ListItem>借入款</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr align="center">
                <td align="right" height="168" style="width: 128px" valign="top">
                    <div class="mar009">
                        备注</div>
                </td>
                <td align="left" valign="top">
                    <asp:TextBox ID="TxtStatement" runat="server" Height="157px" TextMode="MultiLine"
                        Width="545px"></asp:TextBox>
                    &nbsp;</td>
            </tr>
            <tr align="center">
                <td align="center" colspan="2" style="height: 21px" valign="top">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确认" /></td>
            </tr>
        </table>
    </td>
  </tr>
</table>
    </div>
    </form>
</body>
</html>
