<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lb_add.aspx.cs" Inherits="lb_add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
	<LINK href="qtimages/main.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" borderColorDark="#9cc7ef" cellPadding="4" width="60%" align="center"
				borderColorLight="#145aa0" border="1">
				<tr bgColor="#4296e7">
					<td colSpan="2">
						<div align="center"><font color="#ffffff">添加商品类别</font></div>
					</td>
				</tr>
				<tr>
					<td noWrap width="41%">
						<div align="right">类名</div>
					</td>
					<td width="59%">&nbsp;
						<asp:textbox id="TextBox1" runat="server"></asp:textbox></td>
				</tr>
				<tr>
					<td noWrap width="41%" height="25">
						<div align="right"><FONT face="宋体"></FONT>&nbsp;</div>
					</td>
					<td width="59%" height="25">&nbsp;
						<asp:button id="Button1" runat="server" Text="添加" onclick="Button1_Click"></asp:button><FONT face="宋体">&nbsp;</FONT>
						<asp:button id="Button2" runat="server" Text="重填"></asp:button></td>
				</tr>
				<tr>
					<td colSpan="2">
						<div align="center"></div>
					</td>
				</tr>
				<tr bgColor="#4296e7">
					<td colSpan="2">&nbsp;</td>
				</tr>
			</table>
			<br>
			<table cellSpacing="0" borderColorDark="#c6dbe7" cellPadding="2" width="80%" align="center"
				borderColorLight="#092094" border="1">
				<tr bgColor="#5ea5e6">
					<td noWrap width="6%"><asp:datagrid id="DataGrid1" runat="server" Width="100%" AutoGenerateColumns="False" BorderColor="DodgerBlue">
							<SelectedItemStyle BackColor="Blue"></SelectedItemStyle>
							<ItemStyle BackColor="White"></ItemStyle>
							<Columns>
								<asp:TemplateColumn HeaderText="序号">
									<ItemTemplate>
										<%#Container.ItemIndex+1 %>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="lb" HeaderText="类别名称"></asp:BoundColumn>
								<asp:BoundColumn DataField="addtime" HeaderText="添加时间"></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="修改">
									<ItemTemplate>
										<a href='lb_updt.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>' >修改</a>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="删除">
									<ItemTemplate>
										<a href='delid.aspx?delid=<%#DataBinder.Eval(Container.DataItem, "id") %>&tablename=alllb&npage=lb_add.aspx' onclick="return confirm('确定要删除？')">
											删除</a>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid></td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
