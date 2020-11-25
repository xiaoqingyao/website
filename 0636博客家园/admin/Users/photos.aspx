<%@ Page Language="C#" AutoEventWireup="true" CodeFile="photos.aspx.cs" Inherits="admin_Users_photos" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>会员照片管理</title>
    <link rel="stylesheet" type="text/css" href="../images/style.css" />
    <link href="../../css/pagination.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../js/jquery-1.3.2.min.js"></script>

    <script type="text/javascript" src="../../js/jquery.pagination.js"></script>

    <script type="text/javascript" src="../js/function.js"></script>

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
        <div class="navigation">
            <b>您当前的位置：首页 &gt; 会员管理 &gt; 照片列表</b></div>
        <div class="spClear">
        </div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="50" align="center" style="height: 50px">
                    请选择：</td>
                <td style="height: 50px">
                    <asp:DropDownList ID="ddlClassId" runat="server" CssClass="select" AutoPostBack="True"
                        Width="120px" OnSelectedIndexChanged="ddlClassId_SelectedIndexChanged">
                    </asp:DropDownList></td>
                <td>
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
                                    <img src="../../UpFile/Photos/<%#DataBinder.Eval(Container.DataItem, "StrImgPath")%>"
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
        <div class="spClear">
        </div>
        <div style="line-height: 30px; height: 30px;">
            <div id="Pagination" class="right flickr">
                <webdiyer:AspNetPager ID="myPager" runat="server" FirstPageText="首页" LastPageText="末页"
                    NextPageText="下页" PrevPageText="上页" ShowMoreButtons="False" PageSize="20" AlwaysShow="True"
                    OnPageChanged="myPager_PageChanged" CustomInfoSectionWidth="80" CssClass="pages"
                    CustomInfoTextAlign="Right" CurrentPageButtonClass="cpb" ShowPageIndexBox="Always"
                    PageIndexBoxType="DropDownList" ShowPageIndex="false" CustomInfoHTML="页次<font color='red'><b>%currentPageIndex%</b></font>|%PageCount%"
                    CurrentPageButtonPosition="End" SubmitButtonText="Go" TextAfterPageIndexBox="页"
                    TextBeforePageIndexBox="转到" LayoutType="Table" PagingButtonLayoutType="Span">
                </webdiyer:AspNetPager>
            </div>
        </div>
    </form>
</body>
</html>
