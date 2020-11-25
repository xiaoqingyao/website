<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentAdd_piliang.aspx.cs" Inherits="admin_studentAdd_piliang" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../Mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <div>
            <div>
                <div>
                    <strong>
                        <div>
                            <fieldset style="width: 344px; height: 178px; text-align: left">
                                <legend class="mailTitle">批量添加学生</legend>
                                <br />
                                &nbsp;<br />
                                <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 316px; height: 154px">
                                    <tr>
                                        <td style="width: 220px; text-align: right">
                                            所在院系：</td>
                                        <td style="width: 281px">
                                            <asp:DropDownList ID="DropDownList3" runat="server" Width="165px">
                                            </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 220px; text-align: right">
                                            专业名称：</td>
                                        <td style="width: 281px">
                                            <asp:DropDownList ID="DropDownList1" runat="server" Width="165px">
                                            </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 220px; text-align: right">
                                            班级名称：</td>
                                        <td style="width: 281px">
                                            <asp:DropDownList ID="DropDownList2" runat="server" Width="166px">
                                            </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 220px; text-align: right">
                                            &nbsp;起始学号：</td>
                                        <td style="width: 281px">
                                            <asp:TextBox ID="NumMin" runat="server" Width="158px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 220px; text-align: right">
                                            &nbsp;终止学号：</td>
                                        <td style="width: 281px">
                                            <asp:TextBox ID="NumMax" runat="server" Width="158px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center">
                                            &nbsp;<asp:Button ID="btnAdd" runat="server" Text="添加" OnClick="btnAdd_Click" /></td>
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
        </div>
    
    </div>
    </form>
</body>
</html>
