<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FenLei.aspx.cs" Inherits="Admin_FenLei" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            text-align: center;
        } 
    </style>
</head> 
<body>
    <form id="form1" runat="server">
    <div>
    	<table cellSpacing="0" borderColorDark="#9cc7ef" cellPadding="4" width="60%" align="center"
				borderColorLight="#145aa0" border="1">
				<tr bgColor="#4296e7">
					<td colSpan="2" class="style1">
						 
                    分类管理</td>
				</tr>
				<tr style="font-family: Times New Roman; font-size: 12pt;">
					<td noWrap width="30" style="WIDTH: 164px; height: 34px;">
						<FONT face="宋体">分类:</FONT>
					</td>
					<td width="79%" style="height: 34px">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
				</tr>
				<tr style="font-size: 12pt">
					<td noWrap width="164" height="25" style="WIDTH: 164px">
						<div align="right">&nbsp;</div>
					</td>
					<td width="59%" height="25">&nbsp;
						<asp:button id="Button1" runat="server" Text="确定" onclick="Button1_Click"></asp:button><FONT face="宋体">&nbsp;</FONT>
						<asp:button id="Button2" runat="server" Text="重填" onclick="Button2_Click"></asp:button></td>
				</tr>
				<tr style="font-size: 12pt">
					<td colSpan="2">
						<div align="center"></div>
					</td>
				</tr>
				<tr bgColor="#4296e7" style="font-size: 12pt">
					<td colSpan="2">&nbsp;</td>
				</tr>
			</table>
    </div>
    </form>
</body>
</html>
