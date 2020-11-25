<%@ Page Language="C#" AutoEventWireup="true" CodeFile="uphotos.aspx.cs" Inherits="users_uphotos" %>

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
    <link rel="stylesheet" type="text/css" href="../admin/images/style.css" />
    <link href="../css/pagination.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.pagination.js"></script>

    <script type="text/javascript" src="../admin/js/function.js"></script>

    <script type="text/javascript">
        $(function() {
            $(".msgtable tr:nth-child(odd)").addClass("tr_bg"); //隔行变色
            $(".msgtable tr").hover(
			    function() {
			        $(this).addClass("tr_hover_col");
			    },
			    function() {
			        $(this).removeClass("tr_hover_col");
			    }
		    );
        });
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
                                    上传照片</div>
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
                <td valign="middle" bgcolor="#F7F8F9">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="line-height: 30px;">
                        <tr>
                            <td width="15%" align="right">
                                标题：
                            </td>
                            <td width="85%">
                                <img runat="server" id="Photos" alt="" src="images/no.gif" width="80" height="90" />
                                <asp:FileUpload ID="fu" runat="server" />
                                <asp:Button ID="btnUpLoad" runat="server" Text="上传" OnClick="btnUpLoad_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td width="15%" align="right">
                                标题：
                            </td>
                            <td width="85%">
                                <asp:TextBox ID="txtTitle" runat="server"  MaxLength="250"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                所属栏目：
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlClassId"  runat="server" Width="150px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                描述：
                            </td>
                            <td>
                                <asp:TextBox ID="txtMiaoshu" runat="server" Width="586px"
                                    Height="150" TextMode="MultiLine"></asp:TextBox>&nbsp;
                                <asp:HiddenField ID="hidphoto" runat="server" />
                            </td>
                        </tr>
                    </table>
                    <div style="margin-top: 10px; text-align: center;">
                        <asp:Button ID="btnSave" runat="server" Text="确认保存" CssClass="submit" OnClick="btnSave_Click" />
                        &nbsp;
                        <input name="重置" type="reset" class="submit" value="重置" />
                    </div>
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
