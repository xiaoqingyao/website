<%@ Page Language="C#" AutoEventWireup="true" CodeFile="topTitle.aspx.cs" Inherits="indexFrame_top" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-image: url(../image/OA办公自动化系统首页.jpg); background-repeat:no-repeat; background-color:#067BDA">


    <form id="form1" runat="server">
    <div>
        <table style="width: 998px; height: 20px" align="center" class="css">
            <tr>
                <td align="center" colspan="5" style="height: 37px">
                    </td>
            </tr>
            <tr>
                 <td colspan="2"></td>
                <td style="width: 187px; height: 23px;color: White;font-weight: bold;">
                   
                       当前登录用户：
                        <asp:Label ID="Label1" runat="server" Text="" CssClass="css"></asp:Label>
                   
                </td>
                <td style="width: 87px; height: 23px;">
                <asp:HyperLink ID="hLinkUser" runat="server" Target="_parent" NavigateUrl="../Login/sysLogin.aspx" Width="56px" CssClass="css" Font-Bold="True" ForeColor="White">注销</asp:HyperLink></td>
                <td style="width: 123px; height: 23px;">
                    &nbsp; &nbsp;
                    <asp:HyperLink ID="hLinkSys" runat="server" NavigateUrl="../Login/sysLogin.aspx" Target="_parent" CssClass="css" Font-Bold="True" ForeColor="White">重新登录</asp:HyperLink>
                    

                </td>
                
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
