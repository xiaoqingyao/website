<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SerilsSetting.aspx.cs" Inherits="SerilsSetting" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
     <title><%=System.Configuration.ConfigurationManager.AppSettings["SYSTitle"]%></title>
    <LINK href="Style/Style.css" type="text/css" rel="STYLESHEET">
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <table width="100%">
            <tr>
                <td style="width: 250px; text-align: right">
                    您的机器码：</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" BorderWidth="0px" ReadOnly="True"
                        Width="386px"></asp:TextBox></td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 250px; text-align: right">
                    系统授权码：</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Height="90px" TextMode="MultiLine" Width="464px"></asp:TextBox></td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 250px">
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Font-Bold="False" Height="27px" OnClick="Button1_Click"
                        Text="写入序列号" Width="93px" /></td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 250px">
                </td>
                <td>
                  
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
