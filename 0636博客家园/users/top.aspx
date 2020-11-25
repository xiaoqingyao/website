<%@ Page Language="C#" AutoEventWireup="true" CodeFile="top.aspx.cs" Inherits="users_top" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
        body
        {
            margin: 0px;
            padding: 0px;
        }
        .style1
        {
            width: 100%;
            height: 100%;
        }
    </style>

    <script language="JavaScript">
        function logout() {
            if (confirm("您确定要退出系统吗？"))
                window.parent.location.href = "logout.aspx";
        }
    </script>

    <link href="images1/skin.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%" height="68" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td height="41" valign="top">
                    <table width="100%" height="41" border="0" cellpadding="0" cellspacing="0" class="login_top_bg">
                        <tr>
                            <td width="400" style="color: White; font-size: 24px; font-weight: bold;">
                                &nbsp;&nbsp;&nbsp;&nbsp;[毕业设计]心灵阶梯博客会员管理中心
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td align="right" valign="top">
                                <div id="divTop" style="float: right; padding-top: 5px; padding-right: 10px;">
                                    <a href="javascript:window.parent.location.href = '../index.aspx'">家园首页</a> <a href="javascript:window.parent.location.href = 'mysite.aspx?uid=<%=uid %>'">
                                        我的博客</a> <a href="javascript:logout();">退出系统</a>
                                </div>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="27" align="left">
                    <table cellpadding="0" cellspacing="0" class="style1" style="background-image: url('images1/gggg.jpg');
                        background-repeat: repeat-x; padding-top: 0px;">
                        <tr>
                            <td class="divtip" valign="top">
                                &nbsp;&nbsp;&nbsp;&nbsp; <a>管理员：<b style="color: Red;"><%=uuuu %></b> &nbsp;您好，欢迎您进入该系统！</a>
                            </td>
                            <td class="divtip" valign="top" align="right">
                                <a>

                                    <script language="javascript">
                                    today = new Date();
                                    var hours = today.getHours();
                                    var minutes = today.getMinutes();
                                    var seconds = today.getSeconds();
                                    var timeValue = "<FONT COLOR=black>" + (hours); timeValue += ((minutes < 10) ? "<BLINK><FONT   COLOR=black>:</FONT></BLINK>0" : "<BLINK><FONT COLOR=black>:</FONT></BLINK>") + minutes + "</FONT></FONT>";
                                    function initArray() {
                                        this.length = initArray.arguments.length
                                        for (var i = 0; i < this.length; i++)
                                            this[i + 1] = initArray.arguments[i]
                                    }
                                    var d = new initArray("<font color=black><font-size：12px>星期日", "<font color=RED><font-size：12px>星期一", "<font color=RED><font-size：12px>星期二", "<font color=RED><font-size：12px>星期三", "<font color=RED><font-size：12px>星期四", "<font color=RED><font-size：12px>星期五", "<font   color=GREEN><font-size：12px>星期六");
                                    document.write("<font color=black><font font-size：12px>今天是：", today.getYear(), "<font color=black><font font-size：12px>年", "<font color=RED><font font-size：12px>", today.getMonth() + 1, "<font color=black><font font-size：12px>月", "<font color=RED><font font-size：12px>", today.getDate(), "<font color=black><font font-size：12px>日 </FONT>", d[today.getDay() + 1]);
                                    </script>

                                </a>&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
