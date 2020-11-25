<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shijuanshengcheng_list.aspx.cs" Inherits="shijuanshengcheng_list" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table id="search" align="center" border="1" bordercolor="#cccccc" cellpadding="0"
            cellspacing="1" class="table_1" width="98%">
            <tbody>
                <tr class="tr2">
                    <td bgcolor="#f1f8f5" style="padding-left: 5px; height: 25px">
                        所有试卷生成信息列表</td>
                </tr>
                <tr class="tr1">
                    <td style="padding-left: 5px; height: 25px">
                        &nbsp;试卷编号：<asp:TextBox ID="bh" runat="server"></asp:TextBox>科目：<asp:TextBox ID="mc"
                            runat="server"></asp:TextBox>&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click"
                                Text="查找" />
                        <asp:DataGrid ID="DataGrid1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            BorderColor="Black" CellPadding="2" font-name="verdana" Font-Names="verdana"
                            Font-Size="8pt" HeaderStyle-BackColor="#F8FAFC" 
                           
                            PageSize="8" Width="100%" OnPageIndexChanged="DataGrid1_PageIndexChanged" AllowPaging="True">
                            <HeaderStyle BackColor="#F8FAFC" Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                            <PagerStyle Font-Bold="True" Font-Names="宋体" ForeColor="Blue" HorizontalAlign="Right"
                NextPageText="下一页" PrevPageText="上一页" />
                            <EditItemStyle BackColor="#E9F0F8" CssClass="input_text" Font-Bold="False" Font-Italic="False"
                                Font-Overline="False" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False"
                                HorizontalAlign="Left" VerticalAlign="Middle" Wrap="False" />
                            <Columns>
                                <asp:TemplateColumn HeaderText="序号">
                                    <HeaderStyle Width="50px" />
                                    <ItemTemplate>
                                    <%#Container.ItemIndex+1 %>
                                </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField=shijuanbianhao HeaderText='试卷编号'></asp:BoundColumn><asp:BoundColumn DataField=zhangjie HeaderText='科目'></asp:BoundColumn><asp:BoundColumn DataField=xuanzetishu HeaderText='选择题数'></asp:BoundColumn><asp:BoundColumn DataField=xuanzetifenzhi HeaderText='选择题分值'></asp:BoundColumn><asp:BoundColumn DataField=panduantishu HeaderText='判断题数'></asp:BoundColumn><asp:BoundColumn DataField=panduantifenzhi HeaderText='判断题分值'></asp:BoundColumn><asp:BoundColumn DataField=tiankongtishu HeaderText='填空题数'></asp:BoundColumn><asp:BoundColumn DataField=tiankongtifenzhi HeaderText='填空题分值'></asp:BoundColumn>
                                <asp:BoundColumn DataField=xuanzeti HeaderText='选择题ID'></asp:BoundColumn>
                                <asp:BoundColumn DataField=panduanti HeaderText='判断题ID'></asp:BoundColumn>
                                <asp:BoundColumn DataField=tiankongti HeaderText='填空题ID'></asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="手工修改">
                                <ItemTemplate>
                                    <a href='shijuanshengcheng_updt2.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'
                                       >手工修改</a>
                                </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="查看详细">
                                <ItemTemplate>
                                    <a href='shijuan_detail.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'
                                       >查看详细</a>
                                </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="删除">
                                 <ItemTemplate>
                                    <a href='delid.aspx?delid=<%#DataBinder.Eval(Container.DataItem, "id") %>&tablename=shijuanshengcheng&npage=shijuanshengcheng_list.aspx'
                                        onclick="return confirm('确定要删除？')">删除</a>
                                </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" HorizontalAlign="Center" />
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
