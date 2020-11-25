<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SdfList.aspx.cs" Inherits="Admin_SdfList" %>

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
			<table style="Z-INDEX: 101; WIDTH: 1000px; left: 1px; position: absolute; top: 0px;" cellspacing="1" cellpadding="1"  border="1" id="TABLE1">
				<tr>
					<td align="left" colspan="7" style="width: 740px">
                        收费单号：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="查询" Width="54px" /></td>
				</tr>
				<tr align="center">
					<td class="bt12b" colspan="7" style="width: 740px">
                        <span style="font-family: 宋体">水电气费收费列表</span></td>
				</tr>
				<tr>
					<td style="width: 871px" ><font face="宋体">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="收费单号"
                            OnRowCommand="GridView1_RowCommand" Width="100%" OnRowDataBound="GridView1_RowDataBound"  >
                            <Columns>
                                <asp:BoundField DataField="收费单号" HeaderText="收费单号" />
                                <asp:BoundField DataField="收费时间" HeaderText="收费时间" >
                                    <HeaderStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="信息" HeaderText="住户信息" />
                                <asp:BoundField DataField="收费月份" HeaderText="收费月份" >
                                    <HeaderStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="收费总额" HeaderText="收费总额" />
                                <asp:BoundField DataField="员工名称" HeaderText="操作员" >
                                    <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:ButtonField CommandName="See" HeaderText="操作" Text="详细" ButtonType="Button">
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
