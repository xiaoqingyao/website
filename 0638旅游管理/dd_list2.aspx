<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dd_list2.aspx.cs" Inherits="dd_list2" %>

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
			</FONT><FONT face="宋体"></FONT><FONT face="宋体"></FONT><FONT face="宋体"></FONT><FONT face="宋体">
			</FONT><FONT face="宋体"></FONT>
			<br>
			<table cellSpacing="0" borderColorDark="#c6dbe7" cellPadding="2" align="center"
				borderColorLight="#092094" border="1" style="width: 100%">
				<tr>
					<td>
                        所有购物车管理列表</td>
				</tr>
				<tr bgColor="#5ea5e6">
					<td noWrap width="6%"><asp:datagrid id="DataGrid1" runat="server" Width="100%" AutoGenerateColumns="False" BorderColor="DodgerBlue" PageSize="6">
							<SelectedItemStyle BackColor="Blue"></SelectedItemStyle>
							<ItemStyle BackColor="White"></ItemStyle>
							<Columns>
								<asp:TemplateColumn HeaderText="序号">
									<ItemTemplate>
										<%#Container.ItemIndex+1 %>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="yonghuming" HeaderText="买家用户名">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundColumn>
								<asp:BoundColumn DataField="mingcheng" HeaderText="玩具名称">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundColumn>
								<asp:BoundColumn DataField="leibie" HeaderText="玩具类别">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundColumn>
								<asp:BoundColumn DataField="jiage" HeaderText="价格">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundColumn>
								<asp:TemplateColumn HeaderText="玩具图片">
									<ItemTemplate>
										<a href='<%#DataBinder.Eval(Container.DataItem, "tupian") %>' target=_blank ><img src='<%#DataBinder.Eval(Container.DataItem, "tupian") %>' width=60 height=60 border=0></a>
									</ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="addtime" HeaderText="下订时间">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="状态">
                                <ItemTemplate>
										<a href='dd_list2.aspx?ztid=<%#DataBinder.Eval(Container.DataItem, "id") %>&yuan=<%#DataBinder.Eval(Container.DataItem, "zt") %>' onclick="return confirm('确定要执行此操作吗？')">
											<%#DataBinder.Eval(Container.DataItem, "zt") %></a>
									</ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="shuliang" HeaderText="购买数量"></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="删除">
									<ItemTemplate>
										<a href='delid.aspx?delid=<%#DataBinder.Eval(Container.DataItem, "id") %>&tablename=gwc&npage=dd_list.aspx' onclick="return confirm('确定要删除？')">
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
