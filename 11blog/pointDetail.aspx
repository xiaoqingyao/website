<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pointDetail.aspx.cs" Inherits="pointDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>积分详细</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style=" margin:5px;">
        获得积分的详细列表
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="100%">
            <Columns>
                <asp:BoundField HeaderText="序号" DataField="listid" />
                <asp:BoundField HeaderText="活动标题" DataField="huodongname" />
                <asp:BoundField HeaderText="日期" DataField="bmdate" />
                <asp:BoundField HeaderText="获得积分" DataField="jifen" />
               
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
