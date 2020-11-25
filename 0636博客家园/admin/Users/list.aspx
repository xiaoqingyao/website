<%@ Page Language="C#" AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="admin_Users_list" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>会员管理</title>
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
<body style="padding: 10px;">
    <form id="form1" runat="server">
        <div class="navigation">
            <b>您当前的位置：首页 &gt; 会员管理 &gt; 会员列表</b></div>
        <div class="spClear">
        </div>
        <asp:Repeater ID="rptList" runat="server">
            <HeaderTemplate>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
                    <tr>
                        <th width="40px">
                            选择
                        </th>
                        <th width="40px">
                            编号
                        </th>
                        <th width="80px">
                            姓名
                        </th>
                        <th width="80px">
                            登录名
                        </th>
                         <th width="100px">
                            昵称
                        </th>
                        <th width="40px">
                            性别
                        </th>
                         <th width="80px">
                            电话
                        </th>
                         <th width="80px">
                            手机
                        </th>
                         <th width="100px">
                            邮箱
                        </th>
                         <th width="80px">
                            注册日期
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
                    <td align="left">
                        <a href="photos.aspx?uid=<%#Eval("Id") %>" title="点击进入相册管理页面">
                            <%#Eval("UserName")%>
                        </a>
                    </td>
                    <td align="left">
                        <%#Eval("LogName")%>
                    </td>
                    <td align="left">
                        <%#Eval("Nickname")%>
                    </td>
                    <td align="left">
                        <%#Eval("Sex")%>
                    </td>
                    <td align="left">
                        <%#Eval("Tel")%>
                    </td>
                    <td align="left">
                        <%#Eval("Mobile")%>
                    </td>
                    <td align="left">
                        <%#Eval("Email")%>
                    </td>
                    <td>
                        <%#string.Format("{0:g}", Eval("RegisDate"))%>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <div class="spClear">
        </div>
        <div style="line-height: 30px; height: 30px;">
            <div id="Pagination" class="right flickr">
                <webdiyer:aspnetpager id="myPager" runat="server" firstpagetext="首页" lastpagetext="末页"
                    nextpagetext="下页" prevpagetext="上页" showmorebuttons="False" pagesize="20" alwaysshow="True"
                    onpagechanged="myPager_PageChanged" custominfosectionwidth="80" cssclass="pages"
                    custominfotextalign="Right" currentpagebuttonclass="cpb" showpageindexbox="Always"
                    pageindexboxtype="DropDownList" showpageindex="false" custominfohtml="页次<font color='red'><b>%currentPageIndex%</b></font>|%PageCount%"
                    currentpagebuttonposition="End" submitbuttontext="Go" textafterpageindexbox="页"
                    textbeforepageindexbox="转到" layouttype="Table" pagingbuttonlayouttype="Span">
                    </webdiyer:aspnetpager>
            </div>
            <div class="left">
                 <span class="btn_bg">
                    <asp:LinkButton ID="lbtnDel" runat="server" OnClientClick="return confirm( '确定要删除这些记录吗？ ');"
                        OnClick="lbtnDel_Click">删 除</asp:LinkButton>
                </span>
            </div>
        </div>
    </form>
</body>
</html>
