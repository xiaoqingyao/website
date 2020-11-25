<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CwEdit.aspx.cs" Inherits="Yg_CwEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>YGInfoAdd</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR"/>
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE"/>
		<meta content="JavaScript" name="vs_defaultClientScript"/>
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
                            <span style="font-family: 宋体">车位信息</span></td>
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
                            车位名称：</td>
                        <td align="left" style="height: 21px" valign="middle" width="30%">
                            <asp:DropDownList ID="DropDownList2" runat="server" Width="178px" 
                                onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                            </asp:DropDownList></td>
                        <td align="center" style="height: 21px" width="20%">
                            车牌号：</td>
                        <td align="left" style="height: 21px">
                            <asp:TextBox ID="TextBox3" runat="server" Width="178px"></asp:TextBox></td>
                    </tr>
					<tr>
						<td align="center" colspan="4" style="HEIGHT: 43px">
                            &nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="保存" Width="68px" />
                            <asp:Button ID="Button1" runat="server" Text="返回" Width="68px" OnClick="Button1_Click" /></td>
					</tr>
				</table>
			</font>
		</form>
	</body>
</html>
