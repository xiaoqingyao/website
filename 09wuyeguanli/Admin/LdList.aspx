<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LdList.aspx.cs" Inherits="Admin_LdList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>楼栋信息列表</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR"/>
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE"/>
		<meta content="JavaScript" name="vs_defaultClientScript"/>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema"/>
		<link href="../CSS/master.css" type="text/css" rel="stylesheet"/>
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<table style="Z-INDEX: 101; WIDTH: 1000px; left: 0px; position: absolute; top: 0px;" cellspacing="1" cellpadding="1"  border="1" id="TABLE1">
                <tr>
                    <td id="Terr" runat="server" align="right" colspan="7">
                    </td>
                </tr>
				<tr>
					<td align="right" colspan="7">
                     楼栋名称：<asp:TextBox   ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="查询" Width="54px" />
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="新楼栋" Width="50px" /></td>
				</tr>
				<tr align="center">
					<td class="bt12b" colspan="7">
                        <span style="font-family: 宋体">楼栋信息列表</span></td>
				</tr>
				<tr>
					<td style="width: 524px; "><font face="宋体">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="楼栋代码"
                            OnRowCommand="GridView1_RowCommand" Width="100%"  >
                            <Columns>
                                <asp:BoundField DataField="楼栋代码" HeaderText="楼栋代码" Visible="False" />
                                <asp:BoundField DataField="楼栋名称" HeaderText="楼栋名称" />
                                <asp:BoundField DataField="楼层数量" HeaderText="楼层数量" />
                                <asp:BoundField DataField="楼栋电梯数量" HeaderText="楼栋电梯数量" />
                                <asp:BoundField DataField="楼栋住户数量" HeaderText="楼栋住户数量" />
                                <asp:BoundField DataField="楼栋备注" HeaderText="楼栋备注" />
                               
                                <asp:ButtonField ButtonType="Button" CommandName="Mod" HeaderText="操作" Text="修改" >
                                    <ControlStyle Width="40px" />
                                    <ItemStyle Width="30px" />
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
