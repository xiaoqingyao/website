<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication2.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td colspan="2" style="color: red">填报须知：1.先填写学号和姓名，然后点击“信息查询”按钮，身份验证通过后再进一步完善信息。2.没有工作单位的直接填写“无”。
                    </td>
                </tr>
                <tr>
                    <td>学号</td>
                    <td>
                        <asp:TextBox runat="server" ID="xh">618231</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>姓名</td>
                    <td>
                        <asp:TextBox runat="server" ID="xm"></asp:TextBox>
                        <asp:Button runat="server" ID="select" OnClick="select_Click" Text="信息查询" /><asp:Label ID="msg" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>手机号</td>
                    <td>
                        <asp:TextBox runat="server" ID="dh"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>工作单位</td>
                    <td>
                        <asp:TextBox runat="server" ID="gzdw"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>邮箱</td>
                    <td>
                        <asp:TextBox runat="server" ID="yx"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button runat="server" ID="save" OnClick="save_Click" Text="保存" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
