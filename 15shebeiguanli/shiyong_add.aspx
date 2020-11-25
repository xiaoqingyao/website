﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shiyong_add.aspx.cs" Inherits="shiyong_add" %>

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
        借用情况添加<br /><br /><table border="1" cellpadding="0" cellspacing="0" 
            style="width: 63%;">
            <tr>
                <td class="style2" align="right">
                    借用负责人：</td>
                <td class="style3" align="left">
                    <asp:TextBox ID="y_name" runat="server" Width="189px" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2" align="right">
                    负责人电话：</td>
                <td class="style3" align="left">
                    <asp:TextBox ID="y_tel" runat="server" Width="189px" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2" align="right">
                    归还时间：</td>
                <td class="style3" align="left">
                    <asp:TextBox ID="h_shijian" runat="server" Width="189px" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style6" align="right">
                    运作情况：</td>
                <td align="left" class="style7">
                    <asp:TextBox ID="y_qingkuang" runat="server" Rows="5" style="margin-left: 0px" 
                        TextMode="MultiLine" Width="277px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    </td>
                <td align="left" class="style9">
                    <asp:Button ID="Button1" runat="server" Text="添加" onclick="Button1_Click" />
&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="放弃" onclick="Button2_Click" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
