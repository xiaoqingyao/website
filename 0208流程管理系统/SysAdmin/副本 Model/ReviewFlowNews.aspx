<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewFlowNews.aspx.cs"
    Inherits="KingTop.Web.Admin.ReviewFlowNews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>审核流程管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <link rel="stylesheet" href="../css/mm.css" type="text/css">
    <link rel="stylesheet" href="css/main.css" type="text/css">
    <meta name="Microsoft Theme" content="none, default">
    <meta name="Microsoft Border" content="none, default">
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
                                        位置:系统管理&gt;<span style="color: Blue"> 新闻审核</span>
                                    </td>
                                    <td align="right" width="30">
                                        <a href="javascript:history.go(-1);">返回</a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr class="btd2">
                        <td colspan="5" height="20">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            新闻信息
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <table border="0" cellspacing="1" cellpadding="3" width="100%">
                                <tr class="btd2">
                                    <td width="4%" align="right">
                                        <%=Resources.Common.Title%>
                                    </td>
                                    <td width="13%">
                                        <asp:Label ID="lblTitle" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="btd2">
                                    <td width="4%" align="right">
                                        <%=Resources.Common.Content%>
                                    </td>
                                    <td width="13%">
                                        <asp:Label ID="lblContent" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="btd2">
                                    <td width="4%" align="right">
                                        <%=Resources.Common.Author%>
                                    </td>
                                    <td width="13%">
                                        <asp:Label ID="lblAuthor" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="btd2">
                                    <td width="4%" align="right">
                                        <%=Resources.Common.Source%>
                                    </td>
                                    <td width="13%">
                                        <asp:Label ID="lblSource" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="btd2">
                                    <td width="4%" align="right">
                                        <%=Resources.Common.AddTime%>
                                    </td>
                                    <td width="13%">
                                        <asp:Label ID="lblAddtime" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="btd">
                                        <table border="0" cellspacing="0" cellpadding="5" width="100%">
                                            <tr>
                                                <td align="center" height="16">
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
                    <tr>
                        <td colspan="5">
                            审核日志
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" cellspacing="1" cellpadding="3" width="100%">
                                <tr>
                                    <td colspan="5" class="btd">
                                    </td>
                                </tr>
                                <tr class="btd3" align="center">
                                    <td>
                                        <span class="ct">
                                            <%= Resources.Common.UserNo%></span>
                                    </td>
                                    <td width="20%">
                                        <div align="left">
                                            <%= Resources.Common.Operation%></div>
                                    </td>
                                    <td width="35%">
                                        <div align="left">
                                            <%= Resources.Model.Notation%></div>
                                    </td>
                                    <td width="15%">
                                        <div align="left">
                                            IP</div>
                                    </td>
                                    <td width="10%">
                                        <span class="ct">
                                            <%= Resources.Common.AddTime%></span>
                                    </td>
                                </tr>
                                <asp:Repeater ID="rptModelFileGroup" runat="server">
                                    <ItemTemplate>
                                        <tr class="btd2">
                                            <td align="center">
                                                <%#Eval("AddMan")%>
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;<%#Eval("Desc").ToString() + " " + (Convert.ToBoolean(Eval("isSuccess")) ? Resources.Common.FlowSuccess : Resources.Common.FlowFail)%>
                                            </td>
                                            <td>
                                                <%#Eval("Notation")%>
                                            </td>
                                            <td>
                                                <%#Eval("IP")%>
                                            </td>
                                            <td align="center">
                                                <%#Eval("AddDate")%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                        </td>
                    </tr>
                    <tr class="btd2">
                        <td align="right" height="36" colspan="5">
                            <webdiyer:AspNetPager ID="AspNetPager1" runat="server" PageSize="10" AlwaysShow="True"
                                OnPageChanged="AspNetPager1_PageChanged" ShowCustomInfoSection="Left" CustomInfoSectionWidth="20%"
                                ShowPageIndexBox="always" PageIndexBoxType="DropDownList" CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，每页显示%PageSize%条记录"
                                UrlPaging="True">
                            </webdiyer:AspNetPager>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            审核操作
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <table border="0" cellspacing="1" cellpadding="3" width="100%">
                                <tr class="btd2">
                                    <td width="4%" align="right">
                                        <%=Resources.Model.Notation%>
                                    </td>
                                    <td width="13%">
                                        <asp:TextBox ID="txtDescribe" runat="server" Height="150px" TextMode="MultiLine"
                                            Width="273px"></asp:TextBox>*
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="btd">
                                        <table border="0" cellspacing="0" cellpadding="5" width="100%">
                                            <tr>
                                                <td align="center" height="36">
                                                    <asp:Button ID="btnSave" runat="server" Text="<%$Resources:Common,FlowSuccess %>"
                                                        OnClick="btnSave_Click1" />
                                                    <asp:Button ID="btnFail" runat="server" Text="<%$Resources:Common,FlowFail %>" OnClick="btnFail_Click" />
                                                    &nbsp;<input type="button" name="Submit422" value="<%= Resources.Common.Back %>"
                                                        onclick='location.href="ReviewFlowNewsList.aspx<%=StrPageParams %>";'>
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
