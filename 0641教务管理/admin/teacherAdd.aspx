<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teacherAdd.aspx.cs" Inherits="admin_teacherAdd" %>

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
            <strong>
                <div>
                    <fieldset style="width: 399px; height: 292px; text-align: left">
                        <legend class="mailTitle">添加教师</legend>
                        <br />
                        &nbsp;<br />
                        <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 364px; height: 207px">
                            <tr>
                                <td style="width: 220px; text-align: left; height: 20px;">
                                    &nbsp;教师编号(*)：</td>
                                <td width="281" style="height: 20px">
                                    <asp:TextBox ID="teacherNum" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 220px; text-align: left; height: 20px;">
                                    &nbsp;教师姓名(*)：</td>
                                <td style="height: 20px">
                                    <asp:TextBox ID="teacherName" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 220px; text-align: left; height: 20px;">
                                    &nbsp;教师密码：</td>
                                <td style="height: 20px">
                                    <asp:TextBox ID="teacherPwd" runat="server">111111</asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 220px; height: 20px; text-align: left">
                                    &nbsp;教师性别：&nbsp;</td>
                                <td style="height: 20px">
                                    <asp:DropDownList ID="techSex" runat="server" Width="153px">
                                        <asp:ListItem Selected="True">男</asp:ListItem>
                                        <asp:ListItem>女</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="width: 220px; height: 20px; text-align: left">
                                    &nbsp;教师职称：</td>
                                <td style="height: 20px">
                                    <asp:DropDownList ID="techTitles" runat="server" Width="154px">
                                        <asp:ListItem>教授</asp:ListItem>
                                        <asp:ListItem>副教授</asp:ListItem>
                                        <asp:ListItem>讲师</asp:ListItem>
                                        <asp:ListItem>助教</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="width: 220px; height: 20px; text-align: left">
                                    &nbsp;联系电话：</td>
                                <td style="height: 20px">
                                    <asp:TextBox ID="techTel" runat="server">111111</asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 220px; height: 20px; text-align: left">
                                    &nbsp;所属院系：</td>
                                <td style="height: 20px">
                                    <asp:DropDownList ID="DropDownList1" runat="server" Width="154px">
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center">
                                    &nbsp;<asp:Button ID="btnchange" runat="server" OnClick="btnchange_Click" Text="添加" /></td>
                            </tr>
                        </table>
                    </fieldset>
                </div>
            </strong>
            <br />
            <div style="text-align: center">
                &nbsp;</div>
        </div>
    
    </div>
    </form>
</body>
</html>
