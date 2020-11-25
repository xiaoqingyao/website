<%@ Page Language="C#" AutoEventWireup="true" CodeFile="courseteacher.aspx.cs" Inherits="admin_courseteacher" %>

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
                <strong>
                    <div>
                        <fieldset style="width: 568px; height: 378px; text-align: left">
                            <legend class="mailTitle">课程指定</legend>
                            <br />
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 543px; height: 35px">
                                <tr>
                                    <td style="width: 70px">
                            课程名称：</td>
                                    <td style="width: 85px">
                                        <asp:DropDownList ID="DropDownList1" runat="server" Width="129px">
                                        </asp:DropDownList></td>
                                    <td style="width: 69px">
                                        院系名称：</td>
                                    <td style="width: 116px">
                                        <asp:DropDownList ID="DropDownList2" runat="server" Width="130px">
                                        </asp:DropDownList></td>
                                    <td style="width: 100px" rowspan="2">
                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="查询教师姓名" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 70px; height: 14px">
                                        教学班级：</td>
                                    <td colspan="2" style="height: 14px">
                                        <asp:DropDownList ID="DropDownList3" runat="server" Width="191px">
                                        </asp:DropDownList></td>
                                    <td style="width: 116px; height: 14px">
                                    </td>
                                </tr>
                            </table>
                            <br />
                            &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 546px; height: 274px; text-align: left">
                                <tr>
                                    <td style="width: 220px; text-align: left" rowspan="3">
                                        &nbsp;<asp:ListBox ID="ListBox1" runat="server" Height="235px" Width="200px" SelectionMode="Multiple"></asp:ListBox></td>
                                    <td width="281" style="text-align: center">
                                        <asp:Button ID="Button2" runat="server" Font-Bold="True" Height="50px" OnClick="Button2_Click"
                                            Text=">>" Width="50px" /></td>
                                    <td rowspan="3" style="text-align: left; width: 281px;">
                                        <asp:ListBox ID="ListBox2" runat="server" Height="229px" Width="200px" SelectionMode="Multiple"></asp:ListBox></td>
                                </tr>
                                <tr>
                                    <td style="text-align: center; height: 72px;">
                                        <asp:Button ID="Button3" runat="server" Font-Bold="True" Height="50px" Text="<<"
                                            Width="50px" OnClick="Button3_Click" /></td>
                                </tr>
                                <tr>
                                    <td style="height: 7px; text-align: center">
                                        <asp:Button ID="Button4" runat="server" Height="37px" OnClick="Button4_Click" Text="课程绑定"
                                            Width="85px" /></td>
                                </tr>
                            </table>
                        <br />
                        </fieldset>
                    </div>
                </strong>
                <br />
                <div style="text-align: center">
                    &nbsp;</div>
            </div>
        </div>
    
    </div>
    </form>
</body>
</html>
