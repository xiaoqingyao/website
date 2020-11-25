<%@ Page Language="C#" AutoEventWireup="true" CodeFile="noteBook.aspx.cs" Inherits="BaseInfo_noteBook" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-image: url(../image/rightFrame.gif);background-size: cover;" class="css">
    <form id="form1" runat="server">
    <div>
        <table border="1" class="css" style="width: 648px; height: 138px" align="center">
            <tr>
                <td align="center" class="cssTitle" colspan="3">
                    记事本</td>
            </tr>
            <tr>
                <td style="width: 137px">
                    记事标题：</td>
                <td colspan="2">
                    <asp:TextBox ID="TextBox1" runat="server" Width="407px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="** 必填项" Width="67px"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 137px">
                    记事内容：</td>
                <td colspan="2">
                    <asp:TextBox ID="TextBox2" runat="server" Height="124px" TextMode="MultiLine" Width="408px"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="提　交" Width="77px" /></td>
            </tr>
            <tr>
                <td align="center" class="cssTitle" colspan="3" style="height: 22px">
                    记事本信息列表</td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px"
                        CellPadding="4" CssClass="css" Height="1px" OnRowDeleting="GridView1_RowDeleting"
                        Width="629px" CellSpacing="1" OnRowDataBound="GridView1_RowDataBound">
                        <PagerSettings FirstPageText="第一条" LastPageText="最后一条" Mode="NextPreviousFirstLast"
                            NextPageText="下一条" PreviousPageText="上一条" />
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="ID" >
                                <ItemStyle Width="20px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="title" HeaderText="标题" />
                            <asp:BoundField DataField="content" HeaderText="内容" >
                                <ItemStyle Width="260px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="noteTime" HeaderText="记事时间" >
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/icon/del.gif" DeleteText="删除记事"
                                HeaderText="删除信息" ShowDeleteButton="True" >
                                <ItemStyle Width="80px" />
                            </asp:CommandField>
                        </Columns>
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
