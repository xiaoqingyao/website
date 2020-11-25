<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shijuan_detail2.aspx.cs" Inherits="shijuan_detail2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" border="1" bordercolordark="#9cc7ef" bordercolorlight="#145aa0"
            cellpadding="4" cellspacing="0" style="width: 98%">
            <tr bgcolor="#4296e7">
                <td colspan="1">
                    <div align="center">
                        <font color="#ffffff">试卷编号：<%=nshijuanbianhao %></font></div>
                </td>
            </tr>
            <tr>
                <td width="79%">
                    &nbsp;选择题：（共<%=nxuanzetishu %>道，每题分值：<%=nxuanzetifenzhi %>）</td>
            </tr>
            <tr>
                <td colspan="1">
                    <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="White"
                        BorderStyle="Double" CellPadding="4" Font-Size="9pt" Height="588px" Width="100%">
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <SelectedItemStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <ItemTemplate>
                            &nbsp;<asp:Label ID="Label2" runat="server" Font-Size="9pt" Height="19px" Width="1px" Text=""></asp:Label>
                            <%#DataBinder.Eval(Container.DataItem, "timu")%>
                            
                            <asp:TextBox ID="TextBox1" runat="server" Text=""></asp:TextBox>
                            <asp:TextBox ID="TextBoxtmid" runat="server" Text=""></asp:TextBox>
                            <table style="width: 246px; font-size: 9pt;">
                                <tr>
                                    <td colspan="3">
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="4" style="width: 42px">
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Font-Size="9pt" Height="98px">
                                            <asp:ListItem>A</asp:ListItem>
                                            <asp:ListItem>B</asp:ListItem>
                                            <asp:ListItem>C</asp:ListItem>
                                            <asp:ListItem>D</asp:ListItem>
                                        </asp:RadioButtonList></td>
                                    <td colspan="2">
                                        <%#DataBinder.Eval(Container.DataItem, "xuanxiangA")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <%#DataBinder.Eval(Container.DataItem, "xuanxiangB")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <%#DataBinder.Eval(Container.DataItem, "xuanxiangC")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <%#DataBinder.Eval(Container.DataItem, "xuanxiangD")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <ItemStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    </asp:DataList></td>
            </tr>
            <tr>
                <td colspan="1">
                    判断题：（共<%=npanduantishu %>道，每题分值：<%=npanduantifenzhi %>）</td>
            </tr>
            <tr>
                <td colspan="1">
                    <asp:DataList ID="DataList2" runat="server" BackColor="White" BorderColor="White"
                        BorderStyle="Double" CellPadding="4" Font-Size="9pt" Height="588px" Width="100%">
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <SelectedItemStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <ItemTemplate>
                            &nbsp;<asp:Label ID="Label3" runat="server" Font-Size="9pt" Height="19px" Width="1px"></asp:Label>
                            <%#DataBinder.Eval(Container.DataItem, "timu")%>
                            
                            <asp:TextBox ID="TextBox2" runat="server" Text=""></asp:TextBox>
                            <asp:TextBox ID="TextBoxtmid2" runat="server" Text=""></asp:TextBox>
                            <table style="width: 246px; font-size: 9pt;">
                                <tr>
                                    <td colspan="3">
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="4" style="width: 42px">
                                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" Font-Size="9pt" Height="98px">
                                            <asp:ListItem>对</asp:ListItem>
                                            <asp:ListItem>错</asp:ListItem>
                                           
                                        </asp:RadioButtonList></td>
                                   
                                </tr>
                               
                            </table>
                        </ItemTemplate>
                        <ItemStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    </asp:DataList></td>
            </tr>
            <tr>
                <td colspan="1">
                    填空题：（共<%=ntiankongtishu %>道，每题分值：<%=ntiankongtifenzhi%>）</td>
            </tr>
            <tr>
                <td colspan="1"><asp:DataList ID="DataList3" runat="server" BackColor="White" BorderColor="White"
                        BorderStyle="Double" CellPadding="4" Font-Size="9pt" Height="588px" Width="100%">
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <SelectedItemStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <ItemTemplate>
                        &nbsp;<asp:Label ID="Label4" runat="server" Font-Size="9pt" Height="19px" Width="1px"></asp:Label>
                        <%#DataBinder.Eval(Container.DataItem, "timu")%>
                        <asp:TextBox ID="TextBox3" runat="server" Text=""></asp:TextBox>
                        <asp:TextBox ID="TextBoxtmid3" runat="server" Text=""></asp:TextBox>
                        <table style="width: 246px; font-size: 9pt;">
                            <tr>
                                <td colspan="3">
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="4" style="width: 42px">
                                    <asp:TextBox ID='TextBoxListtkt' runat='server'></asp:TextBox></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <ItemStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                </asp:DataList></td>
            </tr>
            
            <tr bgcolor="#4296e7">
                <td colspan="1" align="center">
                    &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="交卷" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
