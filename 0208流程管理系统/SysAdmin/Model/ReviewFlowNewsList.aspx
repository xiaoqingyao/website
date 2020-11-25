<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewFlowNewsList.aspx.cs"
    Inherits="AllPower.Web.Admin.ReviewFlowNewsList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="../css/mm.css" type="text/css">
    <link rel="stylesheet" href="css/main.css" type="text/css">

    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript" src="../JS/Common.js"></script>

    <script language="javascript" src="../JS/ControlManageList.js" type="text/javascript"></script>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <form id="Form2" name="theForm" method="post" runat="server">
    <table width="100%" border="0" cellspacing="10" cellpadding="0">
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bborder">
                    <tr>
                        <td height="22">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        位置:系统管理&gt; <span style="color: Blue">内容审核</span>
                                    </td>
                                    <td align="right" width="30">
                                        <a href="#" onclick="self.history.back();"></a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" cellspacing="1" cellpadding="3" width="100%">
                                <tr>
                                    <td colspan="11" class="btd">
                                        <table cellspacing="0" cellpadding="0" width="95%" align="center" background="../images/bg0007.gif"
                                            border="0">
                                            <tbody>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:Repeater ID="rptFlowStep" runat="server">
                                                            <ItemTemplate>
                                                                <a href="ReviewFlowNewsList.aspx?ModelID=<%=StrModelId %>&flowStepId=<%#Eval("id") %>">
                                                                    <%#Eval("name") %></a>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table>
                                            <tr>
                                                <td>
                                                    状态:<asp:RadioButtonList ID="rbtlFlowState" runat="server" RepeatDirection="Horizontal">
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                        </table>
                                        <table cellspacing="0" cellpadding="0" width="95%" align="center" background="../images/bg0002.gif"
                                            border="0">
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <img height="5" src="../images/bg0002.gif" width="1">
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="btd3" align="center">
                                    <td width="5%">
                                        <div align="left">
                                            <input type="checkbox" name="cbIdAll" /></div>
                                    </td>
                                    <td width="75%">
                                        <div align="left">
                                            标题</div>
                                    </td>
                                    <td width="5%">
                                        状态
                                    </td>
                                    <td>
                                        <span class="ct">
                                            <%= Resources.Common.Operation%></span>
                                    </td>
                                </tr>
                                <asp:Repeater ID="rptListInfo" runat="server">
                                    <ItemTemplate>
                                        <tr class="btd2">
                                            <td width="5%">
                                                <input type="checkbox" name="cbId" value="<%#Eval("id") %>" />
                                            </td>
                                            <td width="80%">
                                                <%#Eval("title")%>
                                            </td>
                                            <td width="5%">
                                                <%#Eval("StateName")%>
                                            </td>
                                            <td>
                                                <a href="">修改</a> | <a href="ReviewFlowNews.aspx?NewsId=<%#Eval("id") %>&ModelId=<%# StrModelId %>&flowStepId=<%#StrflowStepId %>">
                                                    审核</a> | <a href="ReviewFlowNewsLogList.aspx?NewsId=<%#Eval("id") %>">日志</a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                            <table width="95%">
                                <tr>
                                    <td>
                                        <asp:Button ID="btnSuccess" runat="server" Text="通过审核" OnClick="btnSuccess_Click" />
                                        <asp:Button ID="Button1" runat="server" Text="退稿" OnClick="Button1_Click" />
                                    </td>
                                    <td align="center">
                                        <webdiyer:AspNetPager ID="Split" runat="server" PageSize="20" AlwaysShow="True" OnPageChanged="Split_PageChanged"
                                            ShowCustomInfoSection="Left" CustomInfoSectionWidth="20%" ShowPageIndexBox="always"
                                            PageIndexBoxType="DropDownList" CustomInfoHTML="第<font color='red'><b>%currentPageIndex%</b></font>页，共%PageCount%页，每页显示%PageSize%条记录">
                                        </webdiyer:AspNetPager>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
