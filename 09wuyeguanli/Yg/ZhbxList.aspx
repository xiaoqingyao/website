<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ZhbxList.aspx.cs" Inherits="Yg_ZhbxList" %>

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
			<table style="Z-INDEX: 101; WIDTH: 744px; left: 0px; position: absolute; top: 0px;" cellspacing="1" cellpadding="1"  border="1" id="TABLE1">
                <tr>
                    <td id="Terr" runat="server" align="left" colspan="7">
                    </td>
                </tr>
				<tr>
					<td align="right" colspan="7" style="width: 740px">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="新报修" Width="96px" /></td>
				</tr>
				<tr align="center">
					<td class="bt12b" colspan="7" style="width: 740px">
                        <span style="font-family: 宋体">您管辖的住户报修信息列表</span></td>
				</tr>
				<tr>
					<td style="width: 495px; "><font face="宋体">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="报修代码"
                            OnRowCommand="GridView1_RowCommand" Width="100%" OnRowDataBound="GridView1_RowDataBound"  >
                            <Columns>
                                <asp:BoundField DataField="报修代码" HeaderText="报修代码" Visible="False" />
                                <asp:BoundField DataField="报修时间" HeaderText="报修时间" >
                                </asp:BoundField>
                                <asp:BoundField DataField="信息" HeaderText="住户信息" />
                                <asp:BoundField DataField="问题描述" HeaderText="问题描述" />
                                <asp:BoundField DataField="是否解决" HeaderText="是否解决" />
                                <asp:ButtonField ButtonType="Button" CommandName="Mod" HeaderText="操作" Text="修改" Visible="false" >
                                    <ItemStyle Width="30px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="Del" HeaderText="操作" Text="删除" ButtonType="Button">
                                    <ItemStyle Width="30px" />
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
