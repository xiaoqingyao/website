<%@ Page Language="C#" AutoEventWireup="true" CodeFile="voteResult.aspx.cs" Inherits="communion_voteResult" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-image: url(../image/rightFrame.gif);background-size: cover;">
    <form id="form1" runat="server">
    <div>
        <table style="width: 591px; height: 1px" align="center">
            <tr>
                <td align="center" colspan="3" class="cssTitle">
                    活动投票结果</td>
            </tr>
            <tr>
                <td colspan="3" rowspan="2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CellSpacing="2"
                        Height="23px" Width="618px" AllowPaging="false" CssClass="css" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing">
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <Columns>
                            <asp:BoundField DataField="voteTitle" HeaderText="标题" />
                            <asp:BoundField DataField="voteContent" HeaderText="活动描述" />
                            <asp:BoundField DataField="voteQty" HeaderText="投票数量" />
                            <asp:CommandField HeaderText="删除活动" ShowDeleteButton="True" />
                            <asp:CommandField EditText="投票清零" HeaderText="投票清零" ShowEditButton="True" />
                        </Columns>
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerSettings FirstPageText="第一页" LastPageText="最后一页" Mode="NextPreviousFirstLast"
                            NextPageText="下一页" PreviousPageText="上一页" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
