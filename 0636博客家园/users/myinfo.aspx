<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myinfo.aspx.cs" Inherits="users_myinfo" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
                <td width="17" valign="top" background="../images1/mail_leftbg.gif">
                    <img src="images1/left-top-right.gif" width="17" height="29" />
                </td>
                <td valign="top" background="../images1/content-bg.gif">
                    <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg"
                        id="table2">
                        <tr>
                            <td height="31">
                                <div class="titlebt">
                                    档案信息</div>
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="16" valign="top" background="../images1/mail_rightbg.gif">
                    <img src="images1/nav-right-bg.gif" width="16" height="29" />
                </td>
            </tr>
            <tr>
                <td valign="middle" background="../images1/mail_leftbg.gif">
                    &nbsp;
                </td>
                <td valign="top" bgcolor="#F7F8F9">
                    <table cellspacing="1" cellpadding="5" width="90%" align="center" border="0">
                        <tbody>
                            <tr>
                                <td align="right">
                                    姓名
                                </td>
                                <td style="background-color: #F2F9FF;" align="left">
                                    <asp:TextBox ID="txtusername" Width="150px" ReadOnly="false" runat="server"></asp:TextBox>
                                </td>
                                <td align="right">
                                </td>
                                <td rowspan="3" style="background-color: #F2F9FF;" align="left" valign="middle">
                                    <img runat="server" id="Photos" alt="" src="" width="80" height="90" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    帐号
                                </td>
                                <td style="background-color: #F2F9FF;" align="left">
                                    <asp:TextBox ID="txtloginame" Width="150px" ReadOnly="true" Enabled="false" runat="server"></asp:TextBox>
                                </td>
                                <td align="right">
                                    照片
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    昵称
                                </td>
                                <td style="background-color: #F2F9FF;" align="left">
                                    <asp:TextBox ID="txtnickname" Width="150px" ReadOnly="true" runat="server"></asp:TextBox>
                                </td>
                                <td align="right">
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    &nbsp;性别</td>
                                <td style="background-color: #F2F9FF;" align="left">
                                    <asp:DropDownList ID="ddlsex" runat="server" Width="150px">
                                        <asp:ListItem Value="-1" Selected="True">性别</asp:ListItem>
                                        <asp:ListItem Value="男">男</asp:ListItem>
                                        <asp:ListItem Value="女">女</asp:ListItem>
                                    </asp:DropDownList></td>
                                <td align="right">
                                    上传照片
                                </td>
                                <td style="background-color: #F2F9FF;" align="left">
                                    <asp:FileUpload ID="fu" runat="server" />
                                    <asp:Button ID="btnUpLoad" runat="server" Text="上传" OnClick="btnUpLoad_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    电话号码
                                </td>
                                <td style="background-color: #F2F9FF;" align="left">
                                    <asp:TextBox ID="txttel" Width="150px" ReadOnly="false" runat="server"></asp:TextBox>
                                </td>
                                <td align="right">
                                    移动电话
                                </td>
                                <td style="background-color: #F2F9FF;" align="left">
                                    <asp:TextBox ID="txtmobile" Width="150px" ReadOnly="false" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    生日&nbsp;</td>
                                <td style="background-color: #F2F9FF;" align="left">
                                    <asp:TextBox Width="150px" ID="txtbirthday" runat="server"></asp:TextBox><img src="images/calendar.gif"
                                        align="absmiddle" alt="点击选择日期!" style="cursor: pointer" onclick="showDateControl(document.getElementById('txtbirthday'));"></td>
                                <td align="right">
                                    邮箱&nbsp;</td>
                                <td style="background-color: #F2F9FF;" align="left">
                                    <asp:TextBox ID="txtEmail" Width="150px" ReadOnly="false" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td align="right">
                                    职业&nbsp;</td>
                                <td style="background-color: #F2F9FF;" align="left">
                                    <asp:TextBox ID="txtProfesstion" Width="150px" ReadOnly="false" runat="server"></asp:TextBox>
                                </td>
                                <td align="right">
                                    注册日期&nbsp;</td>
                                <td style="background-color: #F2F9FF;" align="left">
                                    <asp:TextBox Width="150px" ID="txtregtime" ReadOnly="true" Enabled="false" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td align="right">
                                    &nbsp;现居住地</td>
                                <td style="background-color: #F2F9FF;" align="left">
                                    <asp:TextBox ID="txtAddress" Width="250px" ReadOnly="false" runat="server"></asp:TextBox></td>
                                <td align="right">
                                    &nbsp;</td>
                                <td style="background-color: #F2F9FF;" align="left">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    &nbsp;简介
                                </td>
                                <td colspan="4" style="background-color: #F2F9FF;" align="left">
                                    <FCKeditorV2:FCKeditor ID="fckdescription" runat="server" BasePath="~/fckeditor/"
                                        Height="300px" Width="98%">
                                    </FCKeditorV2:FCKeditor>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5" align="center">
                                    <asp:Button ID="btnAdd" runat="server" class="button" Width="50" Height="23" Text="确 定"
                                        OnClick="btnAdd_Click" />
                                    <asp:HiddenField ID="hidphoto" runat="server" />
                                    <asp:HiddenField ID="hiduid" runat="server" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
                <td background="../images1/mail_rightbg.gif">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td valign="bottom" background="../images1/mail_leftbg.gif">
                    <img src="../images1/buttom_left2.gif" width="17" height="17" />
                </td>
                <td background="../images1/buttom_bgs.gif">
                    <img src="../images1/buttom_bgs.gif" width="17" height="17">
                </td>
                <td valign="bottom" background="../images1/mail_rightbg.gif">
                    <img src="../images1/buttom_right2.gif" width="16" height="17" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
