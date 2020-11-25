<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsList.aspx.cs" Inherits="Admin_NewsList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新闻管理</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td><h3>新闻管理</h3></td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="gvNews" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvNews_RowDataBound"
                        OnRowDeleting="gvNews_RowDeleting" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="newsId" HeaderText="新闻编号" />
                            <asp:BoundField DataField="newsTitle" HeaderText="新闻标题" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibtndelete" runat="server" CommandName="Delete" ImageUrl="~/Image/delete.jpg" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
