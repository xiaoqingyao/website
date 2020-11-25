<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cj2.aspx.cs" Inherits="cj2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" border="1" bordercolordark="#9cc7ef" bordercolorlight="#145aa0"
            cellpadding="4" cellspacing="0" style="width: 100%">
            <tr bgcolor="#d1dcf2">
                <td colspan="1">
                    <div align="center">
                        <font color="#3366ff">成绩查询</font></div>
                </td>
            </tr>
            <tr>
                <td width="79%">
                    &nbsp;
                    <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        BorderColor="DodgerBlue" Height="139px" PageSize="6" Width="100%">
                        <SelectedItemStyle BackColor="Blue" />
                        <PagerStyle NextPageText="上一页" PrevPageText="下一页" />
                        <ItemStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateColumn HeaderText="考试序号">
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:BoundColumn DataField="sjbh" HeaderText="试卷编号"></asp:BoundColumn>
                            <asp:BoundColumn DataField="xzt" HeaderText="选择题得分"></asp:BoundColumn>
                            <asp:BoundColumn DataField="pdt" HeaderText="判断题得分"></asp:BoundColumn>
                            <asp:BoundColumn DataField="tkt" HeaderText="填空题得分"></asp:BoundColumn>
                            <asp:BoundColumn DataField="zf" HeaderText="总分"></asp:BoundColumn>
                            <asp:BoundColumn DataField="xh" HeaderText="学号"></asp:BoundColumn>
                            <asp:BoundColumn DataField="xm" HeaderText="姓名"></asp:BoundColumn>
                            <asp:BoundColumn DataField="bj" HeaderText="班级"></asp:BoundColumn>
                            <asp:BoundColumn DataField="addtime" HeaderText="考试时间"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="删除"> <ItemTemplate>
                                    <a href='delid.aspx?delid=<%#DataBinder.Eval(Container.DataItem, "id") %>&tablename=chengji&npage=cj2.aspx'
                                        onclick="return confirm('确定要删除？')">删除</a>
                                </ItemTemplate></asp:TemplateColumn>
                        </Columns>
                    </asp:DataGrid></td>
            </tr>
            <tr>
                <td colspan="1">
                    <div align="center">
                    </div>
                </td>
            </tr>
            <tr bgcolor="#d1dcf2">
                <td colspan="1">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
