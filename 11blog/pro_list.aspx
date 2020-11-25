<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pro_list.aspx.cs" Inherits="pro_list" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="qtimages/main.css" type="text/css" rel="stylesheet">
    <style>
        .hidden
        {
            display: none;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <font face="宋体"></font><font face="宋体"></font><font face="宋体"></font><font face="宋体">
    </font><font face="宋体"></font><font face="宋体"></font><font face="宋体"></font><font
        face="宋体"></font><font face="宋体"></font><font face="宋体"></font><font face="宋体">
    </font>
    <br>
    <table cellspacing="0" bordercolordark="#c6dbe7" cellpadding="2" width="100%" align="center"
        bordercolorlight="#092094" border="1">
        <tr>
            <td>
                专辑管理列表
            </td>
        </tr>
        <tr bgcolor="#5ea5e6">
            <td nowrap width="6%">
                <asp:DataGrid ID="DataGrid1" runat="server" Width="100%" AutoGenerateColumns="False"
                    BorderColor="DodgerBlue" PageSize="6">
                    <SelectedItemStyle BackColor="Blue"></SelectedItemStyle>
                    <ItemStyle BackColor="White"></ItemStyle>
                    <Columns>
                        <asp:TemplateColumn HeaderText="序号">
                            <ItemTemplate>
                                <%#Container.ItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="mc" HeaderText="专辑名称"></asp:BoundColumn>
                        <asp:BoundColumn DataField="lb" HeaderText="所属类别"></asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="专辑图片">
                            <ItemTemplate>
                                <a href='uppic/<%#DataBinder.Eval(Container.DataItem, "fn") %>' target="_blank">
                                    <img src='uppic/<%#DataBinder.Eval(Container.DataItem, "fn") %>' width="60" height="60"
                                        border="0"></a>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="addtime" HeaderText="添加时间"></asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="修改" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"
                            FooterStyle-CssClass="hidden">
                            <ItemTemplate>
                                <a href='pro_updt.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'>修改</a>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="删除">
                            <ItemTemplate>
                                <a href='delid.aspx?delid=<%#DataBinder.Eval(Container.DataItem, "id") %>&tablename=allpro&npage=pro_list.aspx'
                                    onclick="return confirm('确定要删除？')">删除</a>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                    <PagerStyle NextPageText="上一页" PrevPageText="下一页"></PagerStyle>
                </asp:DataGrid>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
