<%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeFile="admin_Manage.aspx.cs" Inherits="admin_adminManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
     <link href="../Mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
    <fieldset style="width: 700px; height: 328px; text-align:center">
            <legend class="mailTitle"><strong>管理员管理</strong></legend>
        &nbsp;<br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow"
            BorderColor="Tan" BorderWidth="1px" CellPadding="2" Font-Size="Small" ForeColor="Black"
            GridLines="None" Height="297px" OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"
            Width="600px" DataKeyNames="id" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" >
            <FooterStyle BackColor="Tan" />
            <Columns>
                <asp:BoundField DataField="adminID" HeaderText="用户ID" ReadOnly="True" />
                <asp:BoundField DataField="adminName" HeaderText="姓名"/>
                <asp:BoundField DataField="adminPwd" HeaderText="密码" ReadOnly="True" />
                <asp:HyperLinkField HeaderText="添加" NavigateUrl="~/admin/admin_Add.aspx" Text="添加" />
                <asp:CommandField HeaderText="编辑" ShowEditButton="True" />
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
            </Columns>
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
        </asp:GridView>
        &nbsp;<br />
    
    </div>
    </form>
</body>
</html>
