<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GoodsManager.aspx.cs" Inherits="GoodsManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head> 
<body>
    <form id="form1" runat="server">
    <div>
    		<table cellSpacing="0" borderColorDark="#9cc7ef" cellPadding="4" width="60%" align="center"
				borderColorLight="#145aa0" border="1">
				<tr bgColor="#4296e7">
					<td colSpan="2">
						<div align="center">
                            商品管理</div>
					</td>
				</tr>
				<tr style="font-family: Times New Roman; font-size: 12pt;">
					<td noWrap width="30" style="WIDTH: 164px; height: 34px;">
						<FONT face="宋体">商品名称:</FONT>
					</td>
					<td width="79%" style="height: 34px">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
				</tr>
                <tr style="font-family: Times New Roman; font-size: 12pt;">
					<td noWrap width="30" style="WIDTH: 164px; height: 34px;">
						<FONT face="宋体">商家:</FONT>
					</td>
					<td width="79%" style="height: 34px">
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
				</tr>
                <tr style="font-family: Times New Roman; font-size: 12pt;">
					<td noWrap width="30" style="WIDTH: 164px; height: 34px;">
						<FONT face="宋体">库存:</FONT>
					</td>
					<td width="79%" style="height: 34px">
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
				</tr>
				<tr style="font-family: Times New Roman; font-size: 12pt;">
					<td noWrap width="30" style="WIDTH: 164px; height: 34px;">
                        商品类别：</td>
					<td width="79%" style="height: 34px">
                        <asp:DropDownList ID="DropDownList1" runat="server">
                        </asp:DropDownList>
                    </td>
				</tr>
				<tr style="font-family: Times New Roman; font-size: 12pt;">
					<td noWrap width="30" style="WIDTH: 164px; height: 34px;">
						价格：</td>
					<td width="79%" style="height: 34px">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
				</tr>
				<tr style="font-family: Times New Roman; font-size: 12pt;">
					<td noWrap width="30" style="WIDTH: 164px; height: 34px;">
						介绍：</td>
					<td width="79%" style="height: 34px">
                        <asp:TextBox ID="TextBox3" runat="server" Height="92px" TextMode="MultiLine" 
                            Width="305px"></asp:TextBox>
                    </td>
				</tr>
				<tr style="font-family: Times New Roman; font-size: 12pt;">
					<td noWrap width="30" style="WIDTH: 164px; height: 34px;">
						图片：</td>
					<td width="79%" style="height: 34px">
                        <asp:Image ID="Image1" runat="server" />
                        <input id="UploadFile" runat="server" name="UploadFile" size="50" type="file" /></td>
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
