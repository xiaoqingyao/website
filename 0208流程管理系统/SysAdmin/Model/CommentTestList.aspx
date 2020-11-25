<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentTestList.aspx.cs"
    Inherits="AllPower.Web.Admin.CommentTestList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>评论前台列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link rel="stylesheet" href="../CSS/mm.css" type="text/css" />
    <link rel="stylesheet" href="../CSS/main.css" type="text/css" />
    <meta name="Microsoft Theme" content="none, default" />
    <meta name="Microsoft Border" content="none, default" />
    <style type="text/css">
        <!
        -- .STYLE1
        {
            color: #FF0000;
        }
        -- ></style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <form id="Form1" name="theForm" method="post" runat="server">
    <table width="100%" border="0" cellspacing="10" cellpadding="0">
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bborder">
                    <tr>
                        <td height="22">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        位置:评论管理&gt;
                                    </td>
                                    <td align="right" width="30">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            评论列表
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" cellspacing="1" cellpadding="3" width="100%">
                                <tr>
                                    <td colspan="10" class="btd">
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
                                            <tr class="btd2">
                                                <td colspan="6">
                                                    <%#Eval("contents")%>
                                                </td>
                                            </tr>
                                            <tr class="btd2">
                                                <td>
                                                    <asp:Label ID="lblScore" runat="server" Text='<%#"评分:"+Eval("Score") %>' Visible='<%#GetLinkButtonVisible("IsScore") %>'></asp:Label>
                                                </td>
                                                <td colspan="5" align="right">
                                                    <asp:LinkButton ID="lbtnSquare" runat="server" CommandArgument='<%#Eval("id").ToString()+"|Square" %>'
                                                        OnCommand="lbtnl_Click" Visible='<%#GetLinkButtonVisible("IsSquare") %>' Text='<%#GetLinkButtonText("SquareName",Eval("SquareCount").ToString()) %>'></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:LinkButton ID="lbtnNeutral" runat="server" CommandArgument='<%#Eval("id").ToString()+"|Neutral" %>'
                                                        OnCommand="lbtnl_Click" Visible='<%#GetLinkButtonVisible("isNeutral") %>' Text='<%#GetLinkButtonText("NeutralName",Eval("NeutralCount").ToString()) %>'></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:LinkButton ID="lbtnCounter" runat="server" CommandArgument='<%#Eval("id").ToString()+"|Counter" %>'
                                                        OnCommand="lbtnl_Click" Visible='<%#GetLinkButtonVisible("isCounter") %>' Text='<%#GetLinkButtonText("CounterName",Eval("CounterCount").ToString()) %>'></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6" style="height: 2px">
                                                </td>
                                            </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                        </td>
                    </tr>
                    <tr class="btd2">
                        <td align="right" height="36" colspan="10">
                            <webdiyer:AspNetPager ID="AspNetPager1" runat="server" PageSize="10" AlwaysShow="True"
                                OnPageChanged="AspNetPager1_PageChanged" ShowCustomInfoSection="Left" CustomInfoSectionWidth="20%"
                                ShowPageIndexBox="always" PageIndexBoxType="DropDownList" CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，每页显示%PageSize%条记录"
                                UrlPaging="True">
                            </webdiyer:AspNetPager>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="10">
                            我要评论
                        </td>
                    </tr>
                    <tr>
                        <td colspan="10">
                            <table border="0" cellspacing="1" cellpadding="3" width="100%">
                                <asp:Panel ID="plScore" runat="server" Visible="false">
                                    <tr class="btd2">
                                        <td width="4%" align="right">
                                            评分
                                        </td>
                                        <td>
                                            <asp:RadioButtonList ID="rbtlScore" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                                <asp:ListItem Selected>5</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </asp:Panel>
                                <tr class="btd2">
                                    <td width="4%" align="right">
                                        内容
                                    </td>
                                    <td width="13%">
                                        <asp:TextBox ID="txtDescribe" runat="server" Height="150px" TextMode="MultiLine"
                                            Width="273px"></asp:TextBox>*
                                    </td>
                                </tr>
                                <asp:Panel ID="plcode" runat="server" Visible="false">
                                    <tr class="btd2">
                                        <td width="4%" align="right">
                                            验证码
                                        </td>
                                        <td>
                                            <input name="validate" id='validate' type="text" size="6" class="validate[required]"
                                                maxlength="6" onfocus="this.select()" /><img src='../ValidateCode.aspx' alt='看不清楚？点击刷新验证码！'
                                                    style='cursor: pointer' onclick="src='../ValidateCode.aspx?s='+Math.random()" />&nbsp;&nbsp;请输入验证码
                                        </td>
                                    </tr>
                                </asp:Panel>
                                <tr>
                                    <td colspan="2" class="btd">
                                        <table border="0" cellspacing="0" cellpadding="5" width="100%">
                                            <tr>
                                                <td align="center" height="36">
                                                    <asp:Button ID="btnSave" runat="server" Text="确定" OnClick="btnSave_Click1" />
                                                    &nbsp;
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
        </tr>
    </table>
    </td> </tr> </table> </td> </tr> </table>
    </form>
</body>
</html>
