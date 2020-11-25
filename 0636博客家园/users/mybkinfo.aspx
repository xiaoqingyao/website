<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mybkinfo.aspx.cs" Inherits="users_mybkinfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="images1/skin.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <style type="text/css">
        body
        {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            background-color: #EEF2FB;
            font-size: 12px;
        }
    </style>

    <script src="../js/calendar2.js" type="text/javascript"></script>

    <script type="text/javascript">
        var myCalendar = new myCalendar;
        myCalendar.render();
        var isContent = false;  
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td width="17" valign="top" background="images1/mail_leftbg.gif">
                <img src="images1/left-top-right.gif" width="17" height="29" />
            </td>
            <td valign="top" background="images1/content-bg.gif">
                <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg"
                    id="table2">
                    <tr>
                        <td height="31">
                            <div class="titlebt">
                                博客信息</div>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="16" valign="top" background="images1/mail_rightbg.gif">
                <img src="images1/nav-right-bg.gif" width="16" height="29" />
            </td>
        </tr>
        <tr>
            <td valign="middle" background="images1/mail_leftbg.gif">
                &nbsp;
            </td>
            <td valign="top" bgcolor="#F7F8F9" style="padding-top: 50px">
                <table cellspacing="1" class="warp_table" cellpadding="5" width="90%" align="center"
                    border="0">
                    <tbody>
                        <tr>
                            <td align="right" width="200">
                                博客标题
        <asp:HiddenField ID="hidid" runat="server" />
                            </td>
                            <td style="background-color: #F2F9FF;" class="yi_hang_9" align="left">
                                <asp:TextBox ID="txttitle" runat="server" Width="400"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                博客描述
                            </td>
                            <td style="background-color: #F2F9FF;" class="yi_hang_9" align="left">
                                <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Width="400" Height="50"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;
                            </td>
                            <td align="left">
                                <asp:Button ID="btnAdd" runat="server" class="button" Width="70" Height="23" Text="保 存"
                                    OnClick="btnAdd_Click" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
            <td background="images1/mail_rightbg.gif">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="bottom" background="images1/mail_leftbg.gif">
                <img src="images1/buttom_left2.gif" width="17" height="17" />
            </td>
            <td background="images1/buttom_bgs.gif">
                <img src="images1/buttom_bgs.gif" width="17" height="17">
            </td>
            <td valign="bottom" background="images1/mail_rightbg.gif">
                <img src="images1/buttom_right2.gif" width="16" height="17" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
