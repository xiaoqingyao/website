<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserReg.aspx.cs" Inherits="UserReg" %>

<%@ Register Src="left5.ascx" TagName="left5" TagPrefix="uc4" %>
<%@ Register Src="top3.ascx" TagName="top3" TagPrefix="uc3" %>
<%@ Register Src="WebUserControl.ascx" TagName="WebUserControl" TagPrefix="uc2" %>
<%@ Register TagPrefix="uc1" TagName="hsgleft" Src="hsgleft.ascx" %>
<%@ Register TagPrefix="uc1" TagName="hsgtop2" Src="hsgtop2.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>会员注册</title>

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

    <style type="text/css">
        .style1
        {
            height: 30px;
            width: 149px;
        }
        .style2
        {
            width: 149px;
        }
        .style3
        {
            height: 31px;
            width: 149px;
        }
        .style4
        {
            height: 119px;
            width: 149px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    </div>
    <div align="center">
        <uc3:top3 ID="Top3_1" runat="server" />
    </div>
    <table style="border-collapse: collapse" bordercolor="#cccccc" cellspacing="0" cellpadding="0"
        width="778" border="1" frame="vsides" align="center">
        <tr>
            <td valign="top" style="width: 781px; height: 841px">
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tbody>
                        <tr>
                            <td style="height: 5px">
                                <uc1:hsgtop2 ID="Hsgtop21" runat="server"></uc1:hsgtop2>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tbody>
                        <tr>
                            <td style="height: 576px" valign="top" align="left" width="203" height="576" rowspan="2">
                                <table cellspacing="0" cellpadding="0" width="100" border="0">
                                    <tbody>
                                        <tr>
                                            <td valign="top" background="images/bian-bg.gif" height="183">
                                                <font face="宋体">&nbsp;<table id="Table2" style="width: 191px; height: 32px" background="images/ttt.gif"
                                                    border="0">
                                                    <tr>
                                                        <td>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 站内导航
                                                        </td>
                                                    </tr>
                                                </table>
                                                    <uc1:hsgleft ID="Hsgleft1" runat="server"></uc1:hsgleft>
                                                </font>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="bottom" background="images/bian-bg.gif" style="height: 40px">
                                                <font face="宋体">
                                                    <table id="Table3" style="width: 191px; height: 32px" background="images/ttt.gif"
                                                        border="0">
                                                        <tr>
                                                            <td>
                                                                &nbsp; &nbsp; &nbsp; &nbsp; 友情链接
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </font>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" align="left" background="images/bian-bg.gif" style="height: 17px">
                                                <uc4:left5 ID="Left5_1" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" align="center" background="images/bian-bg.gif" height="0">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" align="right" height="8">
                                                <img height="8" src="images/di-bg.gif" width="195">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                            <td valign="top" align="left" width="571" bgcolor="#f2f2f2" style="height: 22px">
                                <strong>当前位置:<a href="default.aspx">首页</a>&gt;&gt;会员注册</strong>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 527px" valign="top" height="527">
                                <table bgcolor="#e4f4e1" border="0" cellpadding="0" cellspacing="1" style="width: 100%">
                                    <tbody>
                                        <tr>
                                            <td align="left" bgcolor="#e4f4e1" style="height: 19px">
                                                &nbsp;<img border="0" height="15" src="images/news.gif" width="15" />
                                                用户注册
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 44px">
                                                <table border="0" cellpadding="2" cellspacing="1" style="width: 100%">
                                                    <tr>
                                                        <td align="left" bgcolor="#ffffff" colspan="2">
                                                            <table align="center" border="0" cellpadding="3" cellspacing="1" class="" style="width: 100%">
                                                                <tr>
                                                                    <td class="style1">
                                                                        姓名：
                                                                    </td>
                                                                    <td align="left" style="width: 349px; height: 30px">
                                                                        &nbsp;<asp:TextBox ID="txtname" runat="server" Width="109px"></asp:TextBox><asp:RequiredFieldValidator
                                                                            ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname" ErrorMessage="必填"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr style="color: #000000">
                                                                    <td class="style2" height="30">
                                                                        登录密码：
                                                                    </td>
                                                                    <td align="left" height="30" style="width: 349px">
                                                                        <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1"
                                                                            ErrorMessage="必填"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr style="color: #000000">
                                                                    <td class="style3">
                                                                        安全问题：
                                                                    </td>
                                                                    <td align="left" style="width: 349px; height: 31px">
                                                                        <asp:TextBox ID="txtwwenti" runat="server"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtwwenti"
                                                                            ErrorMessage="必填"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr style="color: #000000">
                                                                    <td class="style3">
                                                                        答案：
                                                                    </td>
                                                                    <td align="left" style="width: 349px; height: 31px">
                                                                        <asp:TextBox ID="txtdanan" runat="server"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtdanan"
                                                                            ErrorMessage="必填"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr style="color: #000000">
                                                                    <td class="style2" height="30">
                                                                        性别：
                                                                    </td>
                                                                    <td align="left" height="30" style="width: 349px">
                                                                        &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" Width="89px">
                                                                            <asp:ListItem>男</asp:ListItem>
                                                                            <asp:ListItem>女</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr style="color: #000000">
                                                                    <td class="style1">
                                                                        电话：
                                                                    </td>
                                                                    <td align="left" style="width: 349px; height: 30px">
                                                                        <asp:TextBox ID="txtTel" runat="server" Width="196px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr style="color: #000000">
                                                                    <td class="style1">
                                                                        出生日期：
                                                                    </td>
                                                                    <td align="left" style="width: 349px; height: 30px">
                                                                        <input id="tb_birth" runat="server" name="txttime1" onclick="getDateString(this,oCalendarChs)"
                                                                            style="width: 119px" type="text" value="--请选择日期--" />
                                                                    </td>
                                                                </tr>
                                                                <tr style="color: #000000">
                                                                    <td class="style1">
                                                                        地址：
                                                                    </td>
                                                                    <td align="left" style="width: 349px; height: 30px">
                                                                        <asp:TextBox ID="txtbanquan" runat="server" Width="176px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style4">
                                                                        个人描述：
                                                                    </td>
                                                                    <td align="left" style="width: 349px; height: 119px">
                                                                        <asp:TextBox ID="txtds" runat="server" Font-Size="12pt" Height="115px" TextMode="MultiLine"
                                                                            Width="473px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" class="left_title_1" colspan="2" style="height: 30px">
                                                                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Width="56px">注册</asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div align="center">
                    <table style="border-collapse: collapse" bordercolor="#cccccc" cellspacing="0" cellpadding="0"
                        width="778" border="0" frame="vsides">
                        <tbody>
                            <tr>
                                <td align="left" width="10%" background="images/down-bg.gif" style="height: 42px">
                                    <img height="35" src="images/down-left.gif" width="1">
                                </td>
                                <td valign="bottom" align="center" width="80%" background="images/down-bg.gif" style="height: 42px">
                                </td>
                                <td align="right" width="10%" background="images/down-bg.gif" style="height: 42px">
                                    <img height="35" src="images/down-left.gif" width="1">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <uc2:WebUserControl ID="WebUserControl1" runat="server" />
    </form>
</body>
</html>
