<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editEmployee.aspx.cs" Inherits="BaseInfo_editEmployee" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link rel="stylesheet" type="text/css" href="../CSS/CSS.css"/>
</head>
<body style="background-image: url(../image/rightFrame.gif);background-size: cover;">
    <form id="form1" runat="server">
    <div>
        <table style="width: 1px; height: 1px" class="css" align="center" border="1">
            <tr>
                <td colspan="3" align="center" class="cssTitle">
                    －＝学生基本信息＝－</td>
            </tr>
            <tr>
                <td colspan="3" style="height: 418px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        Width="756px" OnRowDeleting="GridView1_RowDeleting" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="15" AllowPaging="false">
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" />
                            <asp:BoundField HeaderText="姓名" DataField="name" >
                                <HeaderStyle Width="40px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="性别" DataField="sex" >
                                <HeaderStyle Width="30px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="学历" DataField="learn" >
                                <HeaderStyle Width="40px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="年级" DataField="post" >
                                <HeaderStyle Width="40px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="班级" DataField="dept" >
                                <HeaderStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="职务" DataField="job" >
                                <HeaderStyle Width="50px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="联系电话" DataField="tel" >
                                <HeaderStyle Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="联系地址" DataField="address" >
                                <HeaderStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="在职否" DataField="state" >
                                <HeaderStyle Width="50px" />
                            </asp:BoundField>
                            <asp:HyperLinkField HeaderText="编辑" Text="编辑" DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/BaseInfo/updateEmployee.aspx?id={0}" />
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                        </Columns>
                        <SelectedRowStyle BackColor="#009999" ForeColor="#CCFF99" Font-Bold="True" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
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
