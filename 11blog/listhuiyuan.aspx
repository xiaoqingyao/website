<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listhuiyuan.aspx.cs" Inherits="listhuiyuan" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td align="left" style="height: 17px">
                    &nbsp;<table align="center" border="1" bordercolordark="#9cc7ef" bordercolorlight="#145aa0"
                        cellpadding="4" cellspacing="0" style="width: 90%">
                        <tr bgcolor="#4296e7">
                            <td colspan="1">
                                <div align="center">
                                    <font color="#ffffff">会员列表</font></div>
                            </td>
                        </tr>
                        <tr>
                            <td width="100%">
                                &nbsp;<asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    BorderColor="DodgerBlue" Height="139px" PageSize="6" Width="90%">
                                    <SelectedItemStyle BackColor="Blue" />
                                    <PagerStyle NextPageText="上一页" PrevPageText="下一页" />
                                    <ItemStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateColumn HeaderText="序号">
                                            <ItemTemplate>
                                                <%#Container.ItemIndex+1 %>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:BoundColumn DataField="username" HeaderText="用户名"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="password" HeaderText="密码"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="Sex" HeaderText="性别"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="Tel" HeaderText="电话"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="ADdress" HeaderText="住址"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="wenti" HeaderText="问题"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="Daan" HeaderText="答案"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="jifen" HeaderText="积分"></asp:BoundColumn>
                                        <asp:TemplateColumn HeaderText="操作">
                                            <ItemTemplate>
                                                <a href='delid.aspx?delid=<%#DataBinder.Eval(Container.DataItem, "id") %>&tablename=huiyuan&npage=listhuiyuan.aspx'
                                                    onclick="return confirm('确定要删除？')">删除</a>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                    </Columns>
                                </asp:DataGrid>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="1">
                                <div align="center">
                                </div>
                            </td>
                        </tr>
                        <tr bgcolor="#4296e7">
                            <td colspan="1">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" style="height: 18px">
                </td>
            </tr>
            <tr>
                <td align="left">
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
