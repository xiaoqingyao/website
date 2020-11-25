<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ZhEdit.aspx.cs" Inherits="Yg_ZhEdit" %>

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
                            <span style="font-family: 宋体">住户信息</span></td>
					</tr>
                    <tr>
                        <td align="center" style="width: 20%; height: 21px;">
                            楼栋名称：</td>
                        <td id="T政治面貌" align="left" width="30%" style="height: 21px" valign="middle">
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="190px">
                            </asp:DropDownList></td>
                        <td align="center" width="20%" style="height: 21px">
                            房间号：</td>
                        <td id="T籍贯" align="left" style="height: 21px">
                            <asp:TextBox ID="TextBox10" runat="server" Width="178px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 20%; height: 21px">
                            户主：</td>
                        <td align="left" style="height: 21px" valign="middle" width="30%">
                            <asp:TextBox ID="TextBox1" runat="server" Width="178px"></asp:TextBox></td>
                        <td align="center" style="height: 21px" width="20%">
                            房屋面积：</td>
                        <td align="left" style="height: 21px">
                            <asp:TextBox ID="TextBox3" runat="server" Width="178px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 20%; height: 21px">
                            联系方式：</td>
                        <td align="left" style="height: 21px" valign="middle" width="30%">
                            <asp:TextBox ID="TextBox4" runat="server" Width="178px"></asp:TextBox></td>
                        <td align="center" style="height: 21px" width="20%">
                            房屋用途：</td>
                        <td align="left" style="height: 21px">
                            <asp:DropDownList ID="DropDownList2" runat="server" Width="190px">
                                <asp:ListItem>民用</asp:ListItem>
                                <asp:ListItem>商用</asp:ListItem>
                            </asp:DropDownList></td>
                        <tr>
                        <td align="left" colspan="4" style="height: 24px"><font color='red'>注：新住户密码默认为123456,登录后自己修改!</font>
                        </td>
                    </tr>
                    </tr>
					<tr>
						<td align="center" colspan="4" style="HEIGHT: 43px">
							<asp:button id="Button1" runat="server" Width="68px" Text="保存" OnClick="Button1_Click"></asp:button>&nbsp;
                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="返回" Width="68px" /></td>
					</tr>
				</table>
			</font>
		</form>
	</body>
</html>
