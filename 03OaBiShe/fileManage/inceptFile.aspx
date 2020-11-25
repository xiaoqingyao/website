<%@ Page Language="C#" AutoEventWireup="true" CodeFile="inceptFile.aspx.cs" Inherits="fileManage_inceptFile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link rel="stylesheet" type="text/css" href="../CSS/CSS.css" />
</head>
<body style="background-image: url(../image/rightFrame.gif)">
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <table style="width: 432px; height: 1px" class="css" align="center" border="1">
            <tr>
                <td align="center" class="cssTitle" colspan="3" style="height: 1px">
                    －＝文件接收＝－</td>
            </tr>
            <tr>
                <td align="right" class="css" colspan="3" style="height: 1px">
                    <asp:RadioButton ID="RadioButton1" runat="server" AutoPostBack="True" Checked="True"
                        GroupName="aa" Text="显示未接受" />
                    <asp:RadioButton ID="RadioButton2" runat="server" AutoPostBack="True" GroupName="aa"
                        Text="显示已接收" />&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="3" rowspan="2">
                    <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#E7E7FF"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnEditCommand="DataList1_EditCommand">
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <ItemTemplate>
                            <table border="1" style="width: 523px; height: 1px">
                                <tr>
                                    <td style="width: 63px; height: 11px" align="center">
                                        文件标题：</td>
                                    <td colspan="2" style="height: 11px" class ="cssTitle" align="center">
                                    <%# DataBinder.Eval(Container.DataItem,"fileTitle") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="width: 63px; height: 13px">
                                        来自：</td>
                                    <td style="width: 237px">
                                    <%# DataBinder.Eval(Container.DataItem,"fileSender") %>
                                    </td>
                                    <td align="center">
                                        接收状态：<%#DataBinder.Eval(Container.DataItem,"examine") %>&nbsp;
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit" CssClass="blueButtonCss">确认接收</asp:LinkButton></td>
                                </tr>
                                <tr>
                                    <td style="width: 63px; height: 35px;" align="center">
                                        文件内容：</td>
                                    <td colspan="2" style="height: 35px">
                                    <%#DataBinder.Eval(Container.DataItem, "fileContent") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 63px; height: 18px;" align="center">
                                        附件：</td>
                                    <td style="width: 237px; height: 18px;" align="center">
                                    <%#DataBinder.Eval(Container.DataItem, "fileName") %> <a href="<%#DataBinder.Eval(Container.DataItem, "path")%>">下载</a>
                                    </td>
                                    <td style="height: 18px">
                                        时间：<%#DataBinder.Eval(Container.DataItem, "fileTime") %></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <AlternatingItemStyle BackColor="#F7F7F7" />
                        <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    </asp:DataList></td>
            </tr>
            <tr>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
