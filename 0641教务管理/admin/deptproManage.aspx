<%@ Page Language="C#" AutoEventWireup="true" CodeFile="deptproManage.aspx.cs" Inherits="admin_deptproManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../Mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
            <div>
                <br />
                <fieldset style="width: 700px; height: 326px; text-align: left">
                    <legend class="mailTitle"><strong>专业信息管理</strong></legend>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2"
                        DataKeyNames="id" Font-Size="Small" ForeColor="Black" GridLines="None" Height="297px"
                        OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                        OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"
                        Width="600px">
                        <FooterStyle BackColor="Tan" />
                        <Columns>
                            <asp:BoundField DataField="deptproId" HeaderText="专业编号" />
                            <asp:BoundField DataField="deptproName" HeaderText="专业名称" />
                            <asp:BoundField DataField="deptproCollege" HeaderText="所属学院" />
                            <asp:HyperLinkField HeaderText="添加" NavigateUrl="~/admin/deptproAdd.aspx" Text="添加" />
                            <asp:CommandField HeaderText="编辑" ShowEditButton="True" />
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                        </Columns>
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    </asp:GridView>
                </fieldset>
            </div>
        </div>
    
    </div>
    </form>
</body>
</html>
