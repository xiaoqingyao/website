<%@ Page Language="C#" AutoEventWireup="true" CodeFile="courseManage.aspx.cs" Inherits="admin_courseManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../Mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
 <form id="form1" runat="server">
    <div>
    <fieldset style="width: 750px; height: 400px; text-align: left">
    <legend class="mailTitle"><strong>课程信息管理</strong></legend>
        &nbsp;<br />
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2"
            DataKeyNames="id" Font-Size="Small" ForeColor="Black" GridLines="None" Height="350px"
            OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"
            Width="600px">
            <FooterStyle BackColor="Tan" />
            <Columns>
                <asp:BoundField DataField="CourseId" HeaderText="课程编号" />
                <asp:BoundField DataField="courseName" HeaderText="课程名称" />
                <asp:BoundField DataField="courseMode" HeaderText="课程状态" ReadOnly="True" />
                <asp:HyperLinkField HeaderText="添加" NavigateUrl="~/admin/courseAdd.aspx" Text="添加" />
                <asp:CommandField HeaderText="编辑" ShowEditButton="True" />
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
            </Columns>
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
