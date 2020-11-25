<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserList.aspx.cs" Inherits="Admin_UserList" %>

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
			<table style="Z-INDEX: 101; WIDTH: 1000px; left: 0px; position: absolute; top: 0px;" cellspacing="1" cellpadding="1"  border="1" id="TABLE1">
                <tr>
                    <td id="Terr" runat="server" align="right" colspan="7">
                    </td>
                </tr>
				<tr>
                <td  align="right" colspan="7" style="width: 740px">
                        员工代码：<asp:TextBox   ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="查询" Width="54px" />
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="新员工" Width="50px" /></td>
				</tr>
				<tr align="center">
					<td class="bt12b" colspan="7">
                        <span style="font-family: 宋体">物业公司员工列表</span></td>
				</tr>
				<tr>
					<td style="width: 495px; "><font face="宋体">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="员工代码"
                            OnRowCommand="GridView1_RowCommand" Width="113%"  >
                            <Columns>
                                <asp:BoundField DataField="员工代码" HeaderText="员工代码" />
                                <asp:BoundField DataField="员工名称" HeaderText="员工名称" />
                                <asp:BoundField DataField="职位" HeaderText="职位" />
                                <asp:BoundField DataField="地址" HeaderText="地址" />
                                <asp:BoundField DataField="联系电话" HeaderText="联系电话" />
                                <asp:BoundField DataField="身份证号" HeaderText="身份证号" />
                                <asp:BoundField DataField="性别" HeaderText="性别" />
                                <asp:BoundField DataField="婚否" HeaderText="婚否">
                                </asp:BoundField>
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
