<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserComplaint.aspx.cs" Inherits="Admin_UserComplaint" %>

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
				<tr align="center">
					<td class="bt12b" colspan="7" style="width: 740px">
                        <span style="font-family: 宋体">用户投诉</span></td>
				</tr>
				<tr>
					<td style="width: 871px" ><font face="宋体">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            Width="100%"  >
                            <Columns>
                                <asp:BoundField DataField="投诉内容" HeaderText="投诉内容" />
                                <asp:BoundField DataField="参与人员" HeaderText="参与人员" />
                                <asp:BoundField DataField="处理日期" HeaderText="处理日期" />
                                <asp:BoundField DataField="投诉日期" HeaderText="投诉日期" />
                                <asp:BoundField DataField="是否处理" HeaderText="是否处理" />

                            </Columns>
                        </asp:GridView>
                    </font></td>
				</tr>
			</table>
			&nbsp;
		</form>
	</body>
</html>
