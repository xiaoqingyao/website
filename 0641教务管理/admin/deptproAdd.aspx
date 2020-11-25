<%@ Page Language="C#" AutoEventWireup="true" CodeFile="deptproAdd.aspx.cs" Inherits="admin_deptproAdd" %>

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
            <div style="text-align: center">
                <strong>
                    <div>
                        <fieldset style="width: 344px; height: 178px; text-align: left">
                            <legend class="mailTitle">添加专业信息</legend>
                            <br />
                            &nbsp;<br />
                            <table align="center" border="0" cellpadding="0" cellspacing="0" height="145" width="316">
                                <tr>
                                    <td style="width: 220px; text-align: right">
                                        &nbsp;专业ID：</td>
                                    <td width="281">
                                        <asp:TextBox ID="proId" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 220px; text-align: right">
                                        &nbsp;专业名称：</td>
                                    <td>
                                        <asp:TextBox ID="proName" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 220px; text-align: right">
                                        &nbsp;所属学院：</td>
                                    <td>
                                        <asp:DropDownList ID="proCollege" runat="server" Width="154px">
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
    
    </div>
    </form>
</body>
</html>
