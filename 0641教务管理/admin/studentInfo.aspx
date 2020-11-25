<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentInfo.aspx.cs" Inherits="admin_studentInfo" %>

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
                <fieldset style="width: 461px; height: 400px; text-align: center">
                    <legend class="mailTitle"><strong>学生详细信息</strong></legend>&nbsp;<table style="text-align: center">
                        <tr>
                            <td style="width: 71px">
                                学号：</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                            <td style="width: 100px">
                                <asp:Button ID="selectStudent" runat="server" Text="查询" Width="50px" OnClick="selectStudent_Click" /></td>
                        </tr>
                    </table>
                    <br />
                    &nbsp;<br />
                    <table align="center" border="0" cellpadding="0" cellspacing="0" height="145" style="width: 436px">
                        <tr>
                            <td style="width: 97px; height: 14px; text-align: right">
                                &nbsp;学号：</td>
                            <td style="width: 300px; height: 14px; text-align: left;">
                                <asp:TextBox ID="stuID" runat="server" CausesValidation="True" ForeColor="Red" Width="150px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 97px; text-align: right">
                                &nbsp;姓名(*)：</td>
                            <td style="width: 300px; text-align: left;">
                                <asp:TextBox ID="stuName" runat="server" Width="150px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 97px; height: 22px; text-align: right">
                                &nbsp;性别：</td>
                            <td style="width: 300px; height: 22px; text-align: left;">
                                <asp:DropDownList ID="stuSex" runat="server" Width="153px">
                                    <asp:ListItem Value="男"></asp:ListItem>
                                    <asp:ListItem Value="女"></asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="width: 97px; height: 15px; text-align: right">
                                出生日期：</td>
                            <td style="width: 300px; height: 15px; text-align: left;">
                                <asp:TextBox ID="stuBirth" runat="server" Width="150px"></asp:TextBox>格式：1980-01-01</td>
                        </tr>
                        <tr>
                            <td style="width: 97px; height: 15px; text-align: right">
                                籍贯：</td>
                            <td style="width: 300px; height: 15px; text-align: left;">
                                <asp:TextBox ID="stuBirthplace" runat="server" Width="150px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 97px; height: 15px; text-align: right">
                                就读院系：</td>
                            <td style="width: 300px; height: 15px; text-align: left;">
                                <asp:TextBox ID="stuCollege" runat="server" Width="150px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 97px; height: 15px; text-align: right">
                                所学专业：</td>
                            <td style="width: 300px; height: 15px; text-align: left;">
                                <asp:TextBox ID="stuProfessional" runat="server" Width="150px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 97px; height: 15px; text-align: right">
                                所在班级：</td>
                            <td style="width: 300px; height: 15px; text-align: left;">
                                <asp:TextBox ID="stuClass" runat="server" Width="150px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 97px; height: 15px; text-align: right">
                                联系电话：</td>
                            <td style="width: 300px; height: 15px; text-align: left;">
                                <asp:TextBox ID="stuTel" runat="server" Width="150px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 97px; height: 15px; text-align: right">
                                家庭住址：</td>
                            <td style="width: 300px; height: 15px; text-align: left;">
                                <asp:TextBox ID="stuHomeAddr" runat="server" Width="150px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 97px; height: 15px; text-align: right">
                                家长姓名：</td>
                            <td style="width: 300px; height: 15px; text-align: left;">
                                <asp:TextBox ID="stuParent" runat="server" Width="150px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 97px; height: 15px; text-align: right">
                                家庭联系电话：</td>
                            <td style="width: 300px; height: 15px; text-align: left;">
                                <asp:TextBox ID="stuHomephone" runat="server" Width="150px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 23px; text-align: center">
                                <asp:Button ID="btnUpdate" runat="server"  Text="修改" OnClick="btnUpdate_Click" />&nbsp;</td>
                        </tr>
                    </table>
                </fieldset>
            </div>
        </div>
    
    </div>
    </form>
</body>
</html>
