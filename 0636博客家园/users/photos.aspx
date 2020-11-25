<%@ Page Language="C#" AutoEventWireup="true" CodeFile="photos.aspx.cs" Inherits="users_photos" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
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
                                    相册列表</div>
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
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="50" align="center" style="height: 50px">
                                请选择：</td>
                            <td style="height: 50px">
                                <asp:DropDownList ID="ddlClassId" runat="server" CssClass="select" AutoPostBack="True"
                                    Width="120px" OnSelectedIndexChanged="ddlClassId_SelectedIndexChanged">
                                </asp:DropDownList></td>
                            <td>
                                <div style="float: right; padding-right: 20px;">
                                    <img src="../users/images1/add.gif" /><a href="uphotos.aspx">上传相片</a></div>
                            </td>
                        </tr>
                    </table>
                    <asp:Repeater ID="rptList" runat="server" OnItemCommand="rptList_ItemCommand">
                        <HeaderTemplate>
                            <table cellpadding='0' cellspacing='0' border='0' class='pictb'>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:PlaceHolder ID="PlaceHolder1" runat="server" Visible='<%# (Container.ItemIndex + 1) % 8 ==1 %>'>
                                <tr>
                            </asp:PlaceHolder>
                            <td align="left" style="padding: 20px;">
                                <table cellpadding='0' cellspacing='0' border='0' class='pictbs'>
                                    <tr>
                                        <td>
                                            <a href="#">
                                                <img src="../UpFile/Photos/<%#DataBinder.Eval(Container.DataItem, "StrImgPath")%>"
                                                    width="150" height="120" style="border: solid 1px #cdcdcd;" alt="" /></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border-bottom: solid 1px #cdcdcd;">
                                            <a href="#"><strong>
                                                <%#reftitlepic(DataBinder.Eval(Container.DataItem, "StrName"),10) %>
                                            </strong></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:LinkButton ID="btndel" CommandName="btndel" ForeColor="red" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "Id")%>'
                                                runat="server">删除</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <asp:PlaceHolder ID="PlaceHolder2" runat="server" Visible='<%# (Container.ItemIndex + 1) % 8 ==0 %>'>
                                </tr> </asp:PlaceHolder>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table></FooterTemplate>
                    </asp:Repeater>
                    <br />
                </td>
                <td background="images1/mail_rightbg.gif">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td valign="middle" background="images1/mail_leftbg.gif">
                    &nbsp;
                </td>
                <td valign="top" bgcolor="#F7F8F9" height="30">
                    
                    <div style="float: right; padding-right: 20px;">
                        <webdiyer:AspNetPager ID="myPager" runat="server" FirstPageText="首页" LastPageText="末页"
                            NextPageText="下页" PrevPageText="上页" ShowMoreButtons="False" PageSize="20" AlwaysShow="True"
                            OnPageChanged="myPager_PageChanged" CustomInfoSectionWidth="80" CssClass="pages"
                            CustomInfoTextAlign="Right" CurrentPageButtonClass="cpb" ShowPageIndexBox="Always"
                            PageIndexBoxType="DropDownList" ShowPageIndex="false" CustomInfoHTML="页次<font color='red'><b>%currentPageIndex%</b></font>|%PageCount%"
                            CurrentPageButtonPosition="End" SubmitButtonText="Go" TextAfterPageIndexBox="页"
                            TextBeforePageIndexBox="转到" LayoutType="Table" PagingButtonLayoutType="Span">
                        </webdiyer:AspNetPager>
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
