<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dafu_add.aspx.cs" Inherits="dafu_add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>集约化水产养殖设备管理系统的设计与实现</title>
     <link href="css/css.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style2
        {
            width: 107px;
            height: 28px;
        }
        .style3
        {
            height: 28px;
        }
        .style6
        {
            width: 107px;
            height: 29px;
        }
        .style7
        {
            height: 29px;
        }
        .style8
        {
            width: 107px;
            height: 31px;
        }
        .style9
        {
            height: 31px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center" style="font-size: large">
    
        <br />
        <br />
        答复信息添加<br /><br /><table border="1" cellpadding="0" cellspacing="0" 
            style="width: 63%;">
            <tr>
                <td class="style2" align="right">
                    留言编号：</td>
                <td class="style3" align="left">
                    <asp:TextBox ID="id" runat="server" Width="189px" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style6" align="right">
                   答复内容：</td>
                <td align="left" class="style7">
                    <asp:TextBox ID="message_dafu" runat="server" Rows="5" style="margin-left: 0px" 
                        TextMode="MultiLine" Width="277px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    </td>
                <td align="left" class="style9">
                    <asp:Button ID="Button1" runat="server" Text="答复" onclick="Button1_Click" />
&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="放弃" onclick="Button2_Click" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
