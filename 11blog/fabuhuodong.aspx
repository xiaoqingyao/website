<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fabuhuodong.aspx.cs" Inherits="fabuhuodong" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>发布活动</title>

    <script src="js/Calendar.js" type="text/javascript"></script>

    <link href="images/CSS.css" type="text/css" rel="stylesheet">

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
    <div style="margin-top: 5px; margin-left: 5px;">
        <table>
            <tr>
                <td>
                    活动标题：
                </td>
                <td>
                    <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    活动日期：
                </td>
                <td>
                    <input id="txtDate" runat="server" name="txttime1" onclick="getDateString(this,oCalendarChs)"
                        type="text" value="--请选择日期--" />
                </td>
            </tr>
            <tr>
                <td>
                    活动内容：
                </td>
                <td>
                    <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Width="400" Height="300">
                    
                    </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    赠送积分：
                </td>
                <td>
                    <asp:TextBox ID="txtJfen" runat="server" Text="0" >
                    </asp:TextBox><label style="color:Red">请填写阿拉伯数字</label>
                </td>
            </tr>
            <tr>
                <td>
                    最大人数上限：
                </td>
                <td>
                    <asp:TextBox ID="txtMaxRenShu" runat="server" Text="1">
                    </asp:TextBox><label style="color:Red">请填写阿拉伯数字</label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btn_fb" runat="server" Text="发 布"  OnClick="btn_fb_Onclick"/>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
