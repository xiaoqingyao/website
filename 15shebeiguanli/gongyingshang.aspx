<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gongyingshang.aspx.cs" Inherits="gongyingshang" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
     <LINK href="css/css.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style1
        {
        }
        .style8
        {
            height: 31px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="style1" align="right">
                    编号：</td>
                <td>
                    <asp:TextBox ID="g_no" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1" align="right">
                    名称：</td>
                <td>
                    <asp:TextBox ID="g_name" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1" align="right">
                    地址：</td>
                <td>
                    <asp:TextBox ID="g_dizhi" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td class="style1" align="right">
                    电话：</td>
                <td>
                    <asp:TextBox ID="g_tel" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td class="style1" align="right">
                    简介：</td>
                <td>
                    <asp:TextBox ID="g_jianjie" runat="server" Height="53px" TextMode="MultiLine" 
                        Width="386px"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td class="style1" align="right">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="添加" onclick="Button1_Click" />
&nbsp;&nbsp;
                    <input id="Reset1" type="reset" value="重置" /></td>
            </tr>
             <tr>
                <td class="style8" align="left" colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" 
                        BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" 
                        onpageindexchanging="GridView1_PageIndexChanging" 
                        onrowcancelingedit="GridView1_RowCancelingEdit" 
                        onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" 
                        onrowupdating="GridView1_RowUpdating" PageSize="8" Width="603px">
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="g_no" HeaderText="编号" ReadOnly="True">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="g_name" HeaderText="名称" ReadOnly="True">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="g_dizhi" HeaderText="地址">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="g_tel" HeaderText="电话">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="g_jianjie" HeaderText="简介" ReadOnly="True">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="shijian" HeaderText="时间" ReadOnly="True">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:CommandField HeaderText="处理" ShowEditButton="True">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                        </Columns>
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                 </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
