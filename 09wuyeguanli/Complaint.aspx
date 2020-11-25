<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Complaint.aspx.cs" Inherits="Complaint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>投诉</title>
    <link href="../css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="padding-top: 15px">
        <table style="border: 1px solid #cbcbcb; background-color: #EEEEEE" cellpadding="4"
            cellspacing="0" align="center">
            <tr>
                <td align="center" colspan="2" style="height: 24px">
                    <strong>住户『<%=userinfo%>』的投诉信息</strong> <a href="Yg/ZhtsEdit.aspx?role=yz">【新增】</a>
                </td>
            </tr>
            <tr>
                <td align="center" style="margin-left: 30px; font-size: 12px" colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="投诉代码"
                        OnRowCommand="GridView1_RowCommand" Width="600px" OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="投诉代码" HeaderText="投诉代码" />
                            <asp:BoundField DataField="投诉内容" HeaderText="投诉内容" />
                            <asp:BoundField DataField="参与人员" HeaderText="参与人员" />
                            <asp:BoundField DataField="投诉日期" HeaderText="投诉日期" />
                            <asp:BoundField DataField="是否处理" HeaderText="是否处理" />
                            <asp:BoundField DataField="报修代码" HeaderText="投诉代码" Visible="false" />
                            <asp:ButtonField ButtonType="Button" CommandName="Mod" HeaderText="操作" Text="修改">
                                <ItemStyle Width="30px" />
                            </asp:ButtonField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <p>
        &nbsp;</p>
    </form>
</body>
</html>
