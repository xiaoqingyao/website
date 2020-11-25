<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserManger.aspx.cs" Inherits="Admin_UserManger" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 663px">
            <tr>
                <td style="width: 72px">
                </td>
                <td style="width: 491px">
                    <asp:Button ID="btnAdd" runat="server" OnClick="btnOK_Click" Text="添加" Width="73px" /></td>
                <td style="width: 70px">
                </td>
            </tr>
            <tr>
                <td style="width: 72px; height: 156px">
                </td>
                <td style="width: 491px; height: 156px">
                    <asp:GridView ID="gvUser" runat="server" AutoGenerateColumns="False" Height="114px"
                        OnRowDataBound="gvUser_RowDataBound" OnRowDeleting="gvUser_RowDeleting" Style="vertical-align: middle;
                        text-align: center" Width="533px">
                        <Columns>
                            <asp:BoundField DataField="userName" HeaderText="用户名" />
                            <asp:BoundField DataField="roleId" HeaderText="角色" />
                            <asp:CommandField CancelText="" DeleteText="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗?')&quot;&gt;删除"
                                EditText="" HeaderText="删除" InsertText="" NewText="" SelectText="" ShowDeleteButton="True"
                                UpdateText="" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td style="width: 70px; height: 156px">
                </td>
            </tr>
            <tr>
                <td style="width: 72px; height: 21px">
                </td>
                <td style="width: 491px; height: 21px">
                </td>
                <td style="width: 70px; height: 21px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
