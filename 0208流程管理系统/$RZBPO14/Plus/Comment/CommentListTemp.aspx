<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentListTemp.aspx.cs"
    Inherits="AllPower.WEB.main.Plus.Comment.CommentListTemp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>评论列表页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link rel="stylesheet" href="/SysAdmin/CSS/mm.css" type="text/css" />
    <link rel="stylesheet" href="/SysAdmin/CSS/main.css" type="text/css" />
    <meta name="Microsoft Theme" content="none, default" />
    <meta name="Microsoft Border" content="none, default" />
</head>
<body>
    <form id="theFrom" name="theForm" method="post" runat="server">
    <%
        Response.WriteFile("../../IncludeFile/head.html");
    %>
    <div>
        <table width="100%" border="0" cellspacing="10" cellpadding="0">
            <tr>
                <td>
                    <h3 style="color: #0080FF; size: 10px; font: 黑体">
                        评论列表</h3>
                </td>
            </tr>
            <tr>
                <td>
                    <table border="0" cellspacing="1" cellpadding="3" width="100%">
                        <tr>
                            <td colspan="2" class="btd">
                            </td>
                        </tr>
                        <asp:Repeater ID="rptModelFileGroup" runat="server">
                            <ItemTemplate>
                                <tr class="btd2">
                                    <td align="center">
                                        <%#Eval("username")%>
                                    </td>
                                    <td colspan="5" style="text-align: right">
                                        <%#Eval("AddDate") %>发表
                                    </td>
                                </tr>
                                <tr class="btd2">
                                    <td colspan="6">
                                        <%#Eval("Content")%>
                                    </td>
                                </tr>
                                <tr class="btd2">
                                    <td>
                                        <asp:Label ID="lblScore" runat="server" Text='<%#"评分:"+Eval("Score") %>' Visible='<%#GetLinkButtonVisible("IsScore") %>'></asp:Label>
                                    </td>
                                    <td colspan="5" align="right">
                                        <asp:LinkButton ID="lbtnSquare" runat="server" CommandArgument='<%#Eval("id").ToString()+"|Square" %>'
                                            OnCommand="lbtnl_Click" Visible='<%#GetLinkButtonVisible("IsSquare") %>' Text='<%#GetLinkButtonText("SquareName",Eval("SquareCount").ToString()) %>'></asp:LinkButton>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton ID="lbtnNeutral" runat="server" CommandArgument='<%#Eval("id").ToString()+"|Neutral" %>'
                                            OnCommand="lbtnl_Click" Visible='<%#GetLinkButtonVisible("isNeutral") %>' Text='<%#GetLinkButtonText("NeutralName",Eval("NeutralCount").ToString()) %>'></asp:LinkButton>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton ID="lbtnCounter" runat="server" CommandArgument='<%#Eval("id").ToString()+"|Counter" %>'
                                            OnCommand="lbtnl_Click" Visible='<%#GetLinkButtonVisible("isCounter") %>' Text='<%#GetLinkButtonText("CounterName",Eval("CounterCount").ToString()) %>'></asp:LinkButton>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="height: 2px">
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </td>
            </tr>
            <tr class="btd2">
                <td>
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" CssClass="page" PageSize="10"
                        AlwaysShow="True" UrlPaging="true" ShowCustomInfoSection="left" CustomInfoSectionWidth="28%"
                        ShowPageIndexBox="always" PageIndexBoxType="DropDownList" CustomInfoHTML="<%$Resources:Common,CustomInfoHTML %>"
                        HorizontalAlign="Center" NumericButtonCount="5">
                    </webdiyer:AspNetPager>
                </td>
            </tr>
        </table>
    </div>
    <%
        Response.WriteFile("../../IncludeFile/foot.html");
    %>
    </form>
        <script type="text/javascript"><%=jsMessage %></script>
</body>
</html>
