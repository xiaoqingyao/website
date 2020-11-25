<%@ Page Language="C#" AutoEventWireup="true" CodeFile="scoremenuCreate.aspx.cs" Inherits="admin_scoremenuCreate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
     <link href="../Mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="container">
            <fieldset style="width: 700px; height: 383px; text-align: center">
                <legend class="mailTitle"><strong>学生考试名单生成</strong></legend>
                <table style="width: 693px; height: 22px">
                    <tr>
                        <td style="width: 578px; height: 40px">
                            考试科目：</td>
                        <td style="width: 578px; height: 40px; text-align: left">
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="145px">
                            </asp:DropDownList></td>
                        <td style="width: 637px; height: 40px">
                            考试班级：</td>
                        <td style="width: 637px; height: 40px; text-align: left">
                            <asp:DropDownList ID="DropDownList2" runat="server" Width="161px">
                            </asp:DropDownList></td>
                        <td style="width: 637px; height: 40px">
                            <asp:Button ID="Button1" runat="server" Height="38px" OnClick="Button1_Click" Text="查询学生名单"
                                Width="108px" /></td>
                    </tr>
                </table>
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                    BorderColor="Black" Font-Size="12px"  Width="694px">
                    <Columns>
                        <asp:TemplateField HeaderText="学号">
                            <ControlStyle Width="100px" />
                            <ItemTemplate>
                                <asp:TextBox ID="txtstuID" runat="server" Text='<%# Eval("stuID") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="姓名">
                            <ControlStyle Width="100px" />
                            <ItemTemplate>
                                <asp:TextBox ID="txtstuName" runat="server" Text='<%# Eval("stuName") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="科目">
                            <ControlStyle Width="100px" />
                            <ItemTemplate>
                                <asp:TextBox ID="txtcourseName" runat="server" Text='<%# Eval("courseName") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle BackColor="Azure" Font-Size="12px" HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" />
                    <PagerStyle HorizontalAlign="Center" />
                </asp:GridView>
                <br />
                &nbsp;<asp:Button ID="update" runat="server" OnClick="update_Click" Text="添加名单" Width="102px" /></fieldset>
        </div>
    
    </div>
    </form>
</body>
</html>
