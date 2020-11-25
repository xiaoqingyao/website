<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ZhbxEdit.aspx.cs" Inherits="Yg_ZhbxEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>YGInfoAdd</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR"/>
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE"/>
		<meta content="JavaScript" name="vs_defaultClientScript" />
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema"/>
		<link href="../CSS/master.css" type="text/css" rel="stylesheet"/>
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<font face="宋体">
				<table id="Table1" cellspacing="1" cellpadding="1" width="642" align="center" border="1"
					style="WIDTH: 642px; position: absolute; top: 0px;">
					<tr>
						<td id="Terr" style="HEIGHT: 13.7%" align="left" width="750" colspan="4" runat="server"><font face="宋体"></font></td>
					</tr>
					<tr>
						<td class="bt12b" style="HEIGHT: 13.7%" align="center" width="750" colspan="4">
                            <span style="font-family: 宋体">住户报修信息</span></td>
					</tr>
                    <tr>
                        <td align="center" style="width: 20%; height: 21px;">
                            住户信息：</td>
                        <td id="T政治面貌" align="left" style="height: 21px" valign="middle" colspan="3">
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="505px">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 20%; height: 21px">
                            报修时间：</td>
                        <td align="left" style="height: 21px" valign="middle" width="30%">
                            <asp:TextBox ID="TextBox1" runat="server" Width="493px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 20%; height: 21px">
                            问题描述：</td>
                        <td align="left" colspan="3" style="height: 21px">
                            <asp:TextBox ID="TextBox4" runat="server" Width="497px"></asp:TextBox></td>
                    </tr>
                    <tr runat="server" id="trJieJue">
                        <td align="center" style="width: 20%; height: 21px">
                            是否解决：</td>
                        <td align="left" colspan="3" style="height: 21px">
                            <asp:DropDownList ID="DropDownList2" runat="server" Width="496px" Enabled="false">
                                <asp:ListItem>解决</asp:ListItem>
                                <asp:ListItem>未解决</asp:ListItem>
                                <asp:ListItem Selected="True">处理中</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr runat="server" id="trCanYuRenYuan">
                        <td align="center" style="width: 20%; height: 21px">
                            参与人员：</td>
                        <td align="left" colspan="3" style="height: 21px">
                            <asp:TextBox ID="TextBox2" runat="server" Width="497px"></asp:TextBox></td>
                    </tr>
					<tr>
						<td align="center" colspan="4" style="HEIGHT: 43px">
							<asp:button id="Button1" runat="server" Width="68px" Text="保存" OnClick="Button1_Click"></asp:button>&nbsp;<asp:button id="Button2" runat="server" Width="68px" Text="取消" OnClick="Button2_Click"></asp:button></td>
					</tr>
				</table>
			</font>
		</form>
	</body>
</html>
