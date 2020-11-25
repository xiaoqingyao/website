<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WysbList.aspx.cs" Inherits="Admin_WysbList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>Environmentlist</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR"/>
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE"/>
		<meta content="JavaScript" name="vs_defaultClientScript"/>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema"/>
		<link href="../CSS/master.css" type="text/css" rel="stylesheet"/>
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<table style="Z-INDEX: 101; WIDTH: 1000px; left: 0px; position: absolute; top: 0px;" cellspacing="1" cellpadding="1" border="1" id="TABLE1">
				<tr>
					<td align="right" colspan="7" style="width: 740px">
                     设备名称：<asp:TextBox   ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="查询" Width="54px" />
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="新设备登记" Width="96px" /></td>
				</tr>
				<tr align="center">
					<td class="bt12b" colspan="7" style="width: 740px">
                        <span style="font-family: 宋体">物业设备列表</span></td>
				</tr>
				<tr>
					<td style="width: 495px; "><font face="宋体">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="设备代码"
                            OnRowCommand="GridView1_RowCommand" Width="100%" OnRowDataBound="GridView1_RowDataBound"  >
                            <Columns>
                                <asp:BoundField DataField="设备代码" HeaderText="设备代码" Visible="False" />
                                <asp:BoundField DataField="设备名称" HeaderText="设备名称" >
                                </asp:BoundField>
                                <asp:BoundField DataField="购买时间" HeaderText="购买时间" />
                                <asp:BoundField DataField="数量" HeaderText="数量" />
                                <asp:ButtonField ButtonType="Button" CommandName="Mod" HeaderText="操作" Text="修改" >
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="Del" HeaderText="操作" Text="删除" ButtonType="Button">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="40px" />
                                    <ControlStyle Width="40px" />
                                </asp:ButtonField>
                            </Columns>
                        </asp:GridView>
                    </font></td>
				</tr>
			</table>
			&nbsp;
		</form>
	</body>
</html>
