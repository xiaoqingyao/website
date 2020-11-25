<%@ Page Language="C#" AutoEventWireup="true" CodeFile="comments.aspx.cs" Inherits="users_comments" %>

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
                                    文章列表</div>
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
                                    </div>
                            </td>
                        </tr>
                    </table>
                    <asp:Repeater ID="rptList" runat="server">
                        <HeaderTemplate>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
                                <tr>
                                    <th width="6%">
                                        选择
                                    </th>
                                    <th width="6%">
                                        编号
                                    </th>
                                    <th align="left">
                                        文章标题
                                    </th>
                                    <th width="13%">
                                        所属类别
                                    </th>
                                    <th width="16%">
                                        发布时间
                                    </th>
                                    <th width="8%">
                                        操作
                                    </th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td align="center">
                                    <asp:CheckBox ID="cb_id" CssClass="checkall" runat="server" />
                                </td>
                                <td align="center">
                                    <asp:Label ID="lb_id" runat="server" Text='<%#Eval("Id")%>'></asp:Label>
                                </td>
                                <td>
                                    <a href="edit.aspx?id=<%#Eval("Id") %>">
                                        <%#Eval("StrTitle")%>
                                    </a>
                                </td>
                                <td align="center">
                                    <%#GetType(Eval("StrType").ToString())%>
                                </td>
                                <td>
                                    <%#string.Format("{0:g}", Eval("ReleaseDate"))%>
                                </td>
                                <td align="center">
                                    <span><a href="commentsdetails.aspx?id=<%#Eval("Id") %>">详细</a></span>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
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
                    <div style="float: left; padding-left: 20px;">
                        <span class="btn_bg">
                            <asp:LinkButton ID="lbtnDel" runat="server" OnClientClick="return confirm( '确定要删除这些记录吗？ ');"
                                OnClick="lbtnDel_Click">删 除</asp:LinkButton></span>
                    </div>
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
