<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CWList.aspx.cs" Inherits="Admin_CWList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>车位管理</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR"/>
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE"/>
		<meta content="JavaScript" name="vs_defaultClientScript"/>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema"/>
		<link href="../CSS/master.css" type="text/css" rel="stylesheet"/>
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<table style="Z-INDEX: 101; WIDTH: 1000px; left: 0px; position: absolute; top: 0px;" cellspacing="1" cellpadding="1"  border="1" id="TABLE1">
				<tr align="center">
					<td class="bt12b" colspan="7" style="width: 740px">
                        <span style="font-family: 宋体">您管辖的车位信息列表</span></td>
				</tr>
				<tr>
					<td style="width: 495px; "><font face="宋体">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="车位代码" Width="100%"  >
                            <Columns>
                                <asp:BoundField DataField="车位代码" HeaderText="车位代码" Visible="False" />
                                <asp:BoundField DataField="车位名称" HeaderText="车位名称" >
                                </asp:BoundField>
                                <asp:BoundField DataField="车牌号" HeaderText="车牌号" />
                                <asp:BoundField DataField="信息" HeaderText="车主信息" >
                                    <ItemStyle Width="60%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="员工名称" HeaderText="操作员" />
                            </Columns>
                        </asp:GridView>
                    </font></td>
				</tr>
			</table>
			&nbsp;
		</form>
	</body>
</html>
