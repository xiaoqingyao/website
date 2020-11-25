<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditWorkFlowType.aspx.cs" Inherits="WorkFlow_EditWorkFlowType" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>修改流程类型</title>
    <link rel="stylesheet" type ="text/css" href="../CSS/CSS.css"/>
</head>
<body style="background-image: url(../image/rightFrame.gif);background-size: cover;">
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <br />
        <table style="width: 586px; height: 1px" align="center" class="css" border="1">
            <tr>
                <td align="center" colspan="3" style="height: 15px" class="cssTitle">
                    －＝编辑流程类型信息＝－</td>
            </tr>
            <tr>
                <td colspan="3" style="height: 75px" align="left">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                        CellPadding="4" Font-Size="Small"
                        Width="610px" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="code" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" >
                        <PagerSettings FirstPageText="第一页" LastPageText="最后一页"
                            NextPageText="下一页" PreviousPageText="上一页" Mode="NextPreviousFirstLast" />
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <Columns>
                            <asp:BoundField DataField="code" HeaderText="流程类型编号" >
                                <HeaderStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="name" HeaderText="流程类型名称" >
                                <HeaderStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="note" HeaderText="描述" >
                                <HeaderStyle Width="200px" />
                            </asp:BoundField>
                            <asp:HyperLinkField HeaderText="编辑" Text="编辑" DataNavigateUrlFields="code" DataNavigateUrlFormatString="UpdateWorkFlowType.aspx?id={0}" >
                                <HeaderStyle Width="60px" />
                            </asp:HyperLinkField>
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True">
                                <ItemStyle Font-Size="Small" />
                                <HeaderStyle Width="60px" />
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
