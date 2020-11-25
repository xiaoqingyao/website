<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WyfList.aspx.cs" Inherits="Admin_WyfList" %>

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
                    <td id="Terr" runat="server" align="left" colspan="7">
                    </td>
                </tr>
				<tr>
					<td align="right" colspan="7" style="width: 740px">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="新缴费" Width="96px" Visible="False" /></td>
				</tr>
				<tr align="center">
					<td class="bt12b" colspan="7" style="width: 740px">
                        <span style="font-family: 宋体">物业费列表</span></td>
				</tr>
				<tr>
					<td style="width: 744px; "><font face="宋体">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="收费单号"
                            OnRowCommand="GridView1_RowCommand" Width="100%"  >
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID" />
                                <asp:BoundField DataField="收费单号" HeaderText="收费单号" Visible="false" />
                                <asp:BoundField DataField="住户代码" HeaderText="住户代码" />
                                <asp:BoundField DataField="管理费" HeaderText="管理费" />
                                <asp:BoundField DataField="绿化养护费" HeaderText="绿化养护费" />
                                <asp:BoundField DataField="道路养护费" HeaderText="道路养护费" />
                                <asp:BoundField DataField="安保费" HeaderText="安保费" />
                                <asp:BoundField DataField="设备折旧费" HeaderText="设备折旧费" />
                                <asp:BoundField DataField="物业费缴费年度" HeaderText="物业费缴费年度" />
                                <asp:BoundField DataField="收费金额" HeaderText="总金额" />
                                <asp:BoundField DataField="是否缴费" HeaderText="是否缴费" />
                                <asp:ButtonField CommandName="See" HeaderText="操作" Text="详细" ButtonType="Button">
                                    <ItemStyle Width="40px" />
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
