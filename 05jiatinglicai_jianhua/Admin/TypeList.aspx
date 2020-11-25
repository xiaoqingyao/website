﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TypeList.aspx.cs" Inherits="Admin_TypeList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>家庭财务管理系统</title>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css" />
<link rel="stylesheet" type="text/css" href="skin/css/main.css" />
</head>
<body>
    <form id="form2" runat="server">
    <div>
<table width="100%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px;margin-top:8px;">
  <tr>
    <td   class='title'><span>收支类别信息管理</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id"
            OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting"
            OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="100%">
            <RowStyle ForeColor="#000066" />
            <Columns>
                <asp:TemplateField HeaderText="类别名称">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("name") %>' Width="60"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server"><%# Eval("name")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField HeaderText="编辑" ShowEditButton="True" />
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    </td>
  </tr>
    <tr bgcolor="#ffffff">
        <td align="center">
            类别名称：<asp:TextBox ID="txtUser" runat="server" Width="79px"></asp:TextBox>
            &nbsp;
            <asp:Button ID="Button1" runat="server" OnClick="btnAdd_Click" Text="添 加" />&nbsp;
            <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label></td>
    </tr>
</table>
    </div>
    </form>
</body>
</html>
