<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="xuanti_dy.aspx.cs" Inherits="WebApplication2.xuanti_dy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
               
                <tr>
                    <td style="text-align:right">姓名：</td>
                    <td><asp:TextBox runat="server" ID="xm" Width="400" Height="30" Font-Size="Large"></asp:TextBox><br /></td>
                </tr>
                <tr>
                    <td style="text-align:right">学号：</td>
                    <td><asp:TextBox runat="server" ID="xh" Width="400" Height="30" Font-Size="Large"></asp:TextBox><br /></td>
                </tr>
                <tr>
                    <td style="text-align:right">电话：</td>
                    <td><asp:TextBox runat="server" ID="dh" Width="400" Height="30" Font-Size="Large"></asp:TextBox><br /></td>
                </tr>
                <tr>
                    <td style="text-align:right">   邮箱：</td>
                    <td><asp:TextBox runat="server" ID="yx" Width="400" Height="30" Font-Size="Large"></asp:TextBox><br /></td>
                </tr>
                <tr>
                    <td style="text-align:right"> 组别：</td>
                    <td><asp:TextBox runat="server" ID="zb" Width="400" Height="30" Font-Size="Large"></asp:TextBox><br /></td>
                </tr>
                <tr>
                    <td style="text-align:right">组号：</td>
                    <td><asp:TextBox runat="server" ID="zh" Width="400" Height="30" Font-Size="Large"></asp:TextBox><br /></td>
                </tr>
                <tr>
                    <td style="text-align:right">论文题目：</td>
                    <td><asp:TextBox runat="server" ID="tm" Width="400" Height="30" Font-Size="Large"></asp:TextBox><br /></td>
                </tr>
                <tr>
                    <td style="text-align:right">是否自定题：</td>
                    <td><asp:TextBox runat="server" ID="sfzdy" Width="400" Height="30" Font-Size="Large">否</asp:TextBox><br /></td>
                </tr>
                <tr>
                    <td style="text-align:right"><label style="color:red">学位英语是否通过：</label></td>
                    <td> <asp:TextBox runat="server" ID="TextBox1" Width="400" Height="30" Font-Size="Large"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td colspan="2" style="color:red">
                        自行填写学位英语通过情况并检查无误后直接打印该网页到A4纸即可。
                    </td>
                </tr>
            </table>
            
            
            
         
           
            
            
            
           
        </div>
    </form>
</body>
</html>
