<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teacherInfo.aspx.cs" Inherits="admin_studentInfo" %>

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
                    <legend class="mailTitle"><strong>教师详细信息</strong></legend>&nbsp;&nbsp;<br />
                    <table align="center" border="0" cellpadding="0" cellspacing="0" height="145" style="width: 436px">
                        <tr>
                            <td style="width: 97px; height: 14px; text-align: right">
                                &nbsp;教师工号(*)：</td>
                            <td style="width: 300px; height: 14px; text-align: left;">
                                <asp:TextBox ID="techID" runat="server" CausesValidation="True" ForeColor="Red" Width="150px" ReadOnly="True"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 97px; text-align: right">
                                &nbsp;教师姓名(*)：</td>
                            <td style="width: 300px; text-align: left;">
                                <asp:TextBox ID="techName" runat="server" Width="150px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 97px; height: 22px; text-align: right">
                                &nbsp;性别：</td>
                            <td style="width: 300px; height: 22px; text-align: left;">
                                <asp:DropDownList ID="techSex" runat="server" Width="153px">
                                    <asp:ListItem Value="男"></asp:ListItem>
                                    <asp:ListItem Value="女"></asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="width: 97px; height: 15px; text-align: right">
                                职称：</td>
                            <td style="width: 300px; height: 15px; text-align: left;"><asp:DropDownList ID="techTitles" runat="server" Width="153px">
                                <asp:ListItem>教授</asp:ListItem>
                                <asp:ListItem>副教授</asp:ListItem>
                                <asp:ListItem>讲师</asp:ListItem>
                                <asp:ListItem>助教</asp:ListItem>
                            </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="width: 97px; height: 15px; text-align: right">
                                所属院系：</td>
                            <td style="width: 300px; height: 15px; text-align: left;"><asp:DropDownList ID="techPro" runat="server" Width="153px">
                            </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="width: 97px; height: 15px; text-align: right">
                                联系电话：</td>
                            <td style="width: 300px; height: 15px; text-align: left;">
                                <asp:TextBox ID="techTel" runat="server" Width="150px"></asp:TextBox></td>
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
