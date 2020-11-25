<%@ Page Language="C#" AutoEventWireup="true" CodeFile="vote.aspx.cs" Inherits="communion_vote" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-image: url(../image/rightFrame.gif);background-size: cover;">
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <table style="width: 600px; height: 268px" class="css" align="center">
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:DataList ID="DataList1" runat="server" BackColor="#BDD2FF" Width="589px" OnItemCommand="DataList1_ItemCommand">
                        <ItemTemplate>
                            <table border="1" style="width: 595px; height: 60px">
                                <tr>
                                    <td style="width: 97px; height: 5px">
                                        活动：</td>
                                    <td style="width: 413px; height: 5px" align="center">
                                    <%#DataBinder.Eval(Container.DataItem,"voteTitle") %>
                                    </td>
                                    <td style="height: 5px">
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="select">投　票</asp:LinkButton></td>
                                </tr>
                                <tr>
                                    <td style="width: 97px">
                                        活动描述：</td>
                                    <td colspan="2">
                                        <%#DataBinder.Eval(Container.DataItem, "voteContent")%></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList></td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                </td>
            </tr>
        </table>
    
    </div>

    </form>
</body>
</html>
