<%@ Page Language="C#" AutoEventWireup="true" CodeFile="commentsdetails.aspx.cs"
    Inherits="users_commentsdetails" %>

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

    <script>
        function funSetValue()
        {
            
        }
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
                                    文章详细</div>
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
                <td valign="middle">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0"">
                        <tr>
                            <td>
                                <table border="0" cellpadding="0" cellspacing="1" width="100%">
                                    <tr>
                                        <td style="height: 40px; background-color: #c6d2e3; border-bottom: solid 1px #000000;">
                                            &nbsp;&nbsp;<asp:Label ID="lblTitle" runat="server" Text="" Font-Bold="true"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 30px; border-bottom: solid 1px #000000;">
                                            &nbsp;&nbsp;类别：<asp:Label ID="lblType" runat="server" Text=""></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作者：<asp:Label
                                                ID="lblAuthor" runat="server" Text=""></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期：<asp:Label
                                                    ID="lblDate" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="min-height: 60px; border-bottom: solid 1px #000000;" valign="top">
                                            &nbsp;&nbsp;<asp:Label ID="lblContent" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="padding-bottom: 5px; padding-top: 5px;">
                                <asp:Repeater ID="repInfo" runat="server" OnItemCommand="rptMenuList_ItemCommand">
                                    <ItemTemplate>
                                        <table cellpadding="0" cellspacing="1" border="1" width="100%" height="120" style="background-color: #c6d2e3;">
                                            <tr>
                                                <td align="center" valign="top" bgcolor="#ffffff" width="214" style="border-bottom: solid 1px #000000;">
                                                    <table cellpadding="0" cellspacing="0" border="0" width="100%" bgcolor="#ffffff"
                                                        style="line-height: 30px; padding-top: 5px;">
                                                        <tr>
                                                            <td align="center">
                                                                <img src="../UpFile/Photos/<%#GetUserInfo("AvatarImg",Eval("CommentUser").ToString()) %>"
                                                                    style="width: 80px; height: 80px;" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="middle" align="center">
                                                                家园好友：<%#GetUserInfo("UserName", Eval("CommentUser").ToString())%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="middle" align="center">
                                                                更新日期：<%#Convert.ToDateTime(Eval("CommentDate").ToString()).ToShortDateString()%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="middle" align="center">
                                                                [
                                                                <asp:LinkButton ID="BtnEdit" CommandName="BtnEdit" ForeColor="red" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "Id")%>'
                                                                    runat="server">立即回复</asp:LinkButton>] [
                                                                <asp:LinkButton ID="BtnDel" CommandName="BtnDel" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "Id")%>'
                                                                    runat="server">删除此评论</asp:LinkButton>]
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="left" valign="top" bgcolor="#ffffff" style="padding-left: 30px; padding-top: 10px;
                                                    border-left: solid 1px #cccccc; border-bottom: solid 1px #000000; height: 120px;">
                                                    <%#Eval("StrContent") %>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="1" border="0" width="100%" style="background-color: #c6d2e3">
                                    <tr>
                                        <td align="center" bgcolor="#ffffff" style="height: 200px;">
                                            <FCKeditorV2:FCKeditor ID="fckEditor" runat="server" BasePath="~/fckeditor/" Width="800"
                                                Height="200px">
                                            </FCKeditorV2:FCKeditor>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" bgcolor="#ffffff" style="padding-top: 10px">
                                            <asp:Button ID="Button1" runat="server" Text="发 表" OnClick="Button1_Click" />
                                        </td>
                                    </tr>
                                </table>
                                <asp:HiddenField ID="hidrepid" runat="server" />
                            </td>
                        </tr>
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
