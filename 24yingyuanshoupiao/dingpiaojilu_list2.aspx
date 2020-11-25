﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dingpiaojilu_list2.aspx.cs" Inherits="dingpiaojilu_list2" %>

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
                        我的订票记录信息列表  <label style="color:red">【友情提示】：电影开场15分钟钱得退票和修改。</label></td>
                </tr>
                <tr class="tr1">
                    <td style="padding-left: 5px; height: 25px">
                        &nbsp;影片编号：<asp:TextBox ID="bh" runat="server"></asp:TextBox>影片名称：<asp:TextBox ID="mc"
                            runat="server"></asp:TextBox>&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click"
                                Text="查找" />
                        <asp:DataGrid ID="DataGrid1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            BorderColor="Black" CellPadding="2" font-name="verdana" Font-Names="verdana"
                            Font-Size="8pt" HeaderStyle-BackColor="#F8FAFC"  OnItemDataBound="DataGrid1_ItemDataBound"
                           
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
                                <asp:BoundColumn DataField=dingpiaoren HeaderText='订票人'></asp:BoundColumn>
                                <asp:BoundColumn DataField=yingpianbianhao HeaderText='影片编号'></asp:BoundColumn>
                                <asp:BoundColumn DataField=yingpianmingcheng HeaderText='影片名称'></asp:BoundColumn>
                                <asp:BoundColumn DataField=fangyingshijian HeaderText='放映时间'></asp:BoundColumn>
                                <asp:BoundColumn DataField=fangyingdidian HeaderText='放映地点'></asp:BoundColumn>
                                <asp:BoundColumn DataField=zuowei HeaderText='座位'></asp:BoundColumn>
                                <asp:BoundColumn DataField=piaojia HeaderText='票价'></asp:BoundColumn>
                                <asp:BoundColumn DataField="" HeaderText='状态'></asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="修改">
                                <ItemTemplate>
                                    <a href='dingpiaojilu_updt.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'
                                       >修改</a>
                                </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="退订">
                                 <ItemTemplate>
                                    <a href='delid.aspx?delid=<%#DataBinder.Eval(Container.DataItem, "id") %>&tablename=dingpiaojilu&npage=dingpiaojilu_list2.aspx'
                                        onclick="return confirm('确定要退订？')">退订</a>
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

