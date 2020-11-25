<%@ Page Language="C#" AutoEventWireup="true" CodeFile="paipianlist.aspx.cs" Inherits="paipianlist" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>

<body>
    <form id="form2" runat="server">
        <div>
            <table id="search" align="center" border="1" bordercolor="#cccccc" cellpadding="0"
                cellspacing="1" class="table_1" width="98%">
                <tbody>
                    <tr class="tr2">
                        <td bgcolor="#f1f8f5" style="padding-left: 5px; height: 25px">所有排片</td>
                    </tr>
                    <tr class="tr1">
                        <td style="padding-left: 5px; height: 25px">&nbsp;名称：<asp:TextBox ID="name" runat="server"></asp:TextBox>地址：<asp:TextBox ID="address"
                            runat="server"></asp:TextBox>&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click"
                                Text="查找" /><span style="color: #0000ff; text-decoration: underline"> </span>
                            <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" BorderColor="Black" CellPadding="2" font-name="verdana"
                                Font-Names="verdana" Font-Size="8pt" HeaderStyle-BackColor="#F8FAFC" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                PageSize="8" Width="100%">
                                <EditItemStyle BackColor="#E9F0F8" CssClass="input_text" Font-Bold="False" Font-Italic="False"
                                    Font-Overline="False" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False"
                                    HorizontalAlign="Left" VerticalAlign="Middle" Wrap="False" />
                                <PagerStyle Font-Bold="True" Font-Names="宋体" ForeColor="Blue" HorizontalAlign="Right"
                                    NextPageText="下一页" PrevPageText="上一页" />
                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                    Font-Underline="False" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#F8FAFC" Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <Columns>
                                    <asp:TemplateColumn HeaderText="序号">
                                        <ItemTemplate>
                                            <%#Container.ItemIndex+1 %>
                                        </ItemTemplate>
                                        <HeaderStyle Width="50px" />
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="id" HeaderText="排片编号"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="yingpianid" HeaderText="影片编号"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="yingpianname" HeaderText="影片名称"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="yingyuanid" HeaderText="影院编号"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="yingyuanname" HeaderText="影院名称"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="playtime" HeaderText="放映时间"></asp:BoundColumn>
                                    <asp:TemplateColumn HeaderText="删除">
                                        <ItemTemplate>
                                            <a href='delid.aspx?delid=<%#DataBinder.Eval(Container.DataItem, "id") %>&tablename=paipian&npage=paipianlist.aspx'
                                                onclick="return confirm('确定要删除？')">删除</a>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                </Columns>
                            </asp:DataGrid></td>
                    </tr>
                    <tr class="tr1">
                        <td bgcolor="#f1f8f5" style="padding-left: 5px; height: 25px">
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            <a href="#" onclick="javascript:window.print();">打印本页</a></td>
                    </tr>
                </tbody>
            </table>

        </div>
    </form>
</body>
</html>
