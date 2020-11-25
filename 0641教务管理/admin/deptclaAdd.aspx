<%@ Page Language="C#" AutoEventWireup="true" CodeFile="deptclaAdd.aspx.cs" Inherits="admin_deptclaAdd" %>

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
                <div style="text-align: center">
                    <strong>
                        <div>
                            <fieldset style="width: 462px; height: 225px; text-align: left">
                                <legend class="mailTitle">添加班级信息</legend>
                                <br />
                                &nbsp;<br />
                                <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 396px; height: 147px">
                                    <tr>
                                        <td style="width: 78px; text-align: left; height: 30px;">
                                            所属专业：</td>
                                        <td style="width: 273px; height: 30px">
                                            <asp:DropDownList ID="claProfessional" runat="server" Width="154px" AutoPostBack="True">
                                            </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 78px; height: 33px; text-align: left">
                                            所属年级：</td>
                                        <td style="width: 273px; height: 33px">
                                            <asp:DropDownList ID="claGrade" runat="server" Width="154px">
                                                <asp:ListItem>2013</asp:ListItem>
                                                <asp:ListItem>2014</asp:ListItem>
                                                <asp:ListItem>2015</asp:ListItem>
                                                <asp:ListItem>2016</asp:ListItem>
                                                <asp:ListItem>2017</asp:ListItem>
                                                <asp:ListItem>2018</asp:ListItem>
                                                <asp:ListItem>2019</asp:ListItem>
                                                <asp:ListItem>2020</asp:ListItem>
                                            </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 78px; text-align: left; height: 33px;">
                                            &nbsp;班级ID：</td>
                                        <td style="width: 273px; height: 33px">
                                            <asp:TextBox ID="claId" runat="server" Width="145px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 78px; text-align: left; height: 38px;">
                                            &nbsp;班级名称：</td>
                                        <td style="width: 273px; height: 38px">
                                            <asp:TextBox ID="claName" runat="server" ReadOnly="True" Width="147px"></asp:TextBox>
                                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="生成班级" Width="75px" /></td>
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
        </div>
    
    </div>
    </form>
</body>
</html>
