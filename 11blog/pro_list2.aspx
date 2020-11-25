<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pro_list2.aspx.cs" Inherits="pro_list2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
	<LINK href="qtimages/main.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体"></FONT><FONT face="宋体"></FONT><FONT face="宋体"></FONT><FONT face="宋体">
			</FONT><FONT face="宋体"></FONT><FONT face="宋体"></FONT><FONT face="宋体"></FONT><FONT face="宋体">
			</FONT><FONT face="宋体"></FONT><FONT face="宋体"></FONT><FONT face="宋体"></FONT>
			<br>
			<table cellSpacing="0" borderColorDark="#c6dbe7" cellPadding="2" width="100%" align="center"
				borderColorLight="#092094" border="1">
				<tr>
					<td>商品管理列表</td>
				</tr>
				<tr bgColor="#5ea5e6">
					<td noWrap width="6%"><asp:datagrid id="DataGrid1" runat="server" Width="100%" AutoGenerateColumns="False" BorderColor="DodgerBlue"
							AllowPaging="True" PageSize="6">
							<SelectedItemStyle BackColor="Blue"></SelectedItemStyle>
							<ItemStyle BackColor="White"></ItemStyle>
							<Columns>
								<asp:TemplateColumn HeaderText="序号">
									<ItemTemplate>
										<%#Container.ItemIndex+1 %>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="mc" HeaderText="商品名称"></asp:BoundColumn>
								<asp:BoundColumn DataField="lb" HeaderText="所属类别"></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="商品图片">
									<ItemTemplate>
										<a href='uppic/<%#DataBinder.Eval(Container.DataItem, "fn") %>' target=_blank ><img src='uppic/<%#DataBinder.Eval(Container.DataItem, "fn") %>' width=60 height=60 border=0></a>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="addtime" HeaderText="添加时间"></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="删除">
									<ItemTemplate>
										<a href='delid.aspx?delid=<%#DataBinder.Eval(Container.DataItem, "id") %>&tablename=allpro&npage=pro_list2.aspx' onclick="return confirm('确定要删除？')">
											删除</a>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
							<PagerStyle NextPageText="上一页" PrevPageText="下一页"></PagerStyle>
						</asp:datagrid></td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
