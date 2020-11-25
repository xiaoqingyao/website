<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CwInfoEdit.aspx.cs" Inherits="Yg_CwInfoEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>YGInfoAdd</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR"/>
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE"/>
		<meta content="JavaScript" name="vs_defaultClientScript"/>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema"/>
		<link href="../CSS/master.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
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
                            楼栋信息：</td>
                        <td align="left" style="height: 21px" valign="middle" colspan="3">
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="505px">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 20%; height: 21px">
                            车位：</td>
                        <td align="left" style="height: 21px" valign="middle" width="30%">
                            <asp:DropDownList ID="DropDownList2" runat="server" Width="178px">
                                <asp:ListItem Value="A车位" Selected="True">A车位</asp:ListItem>
                                <asp:ListItem Value="B车位">B车位</asp:ListItem>
                                <asp:ListItem Value="C车位">C车位</asp:ListItem>
                                <asp:ListItem Value="D车位">D车位</asp:ListItem>
                            </asp:DropDownList></td>
                        <td align="center" style="height: 21px" width="20%">
                            车位名称：</td>
                        <td align="left" style="height: 21px">
                            <asp:TextBox ID="TextBox3" runat="server" Width="178px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 20%; height: 21px">
                            车位大小：</td>
                        <td align="left" style="height: 21px" valign="middle" width="30%">
                            <asp:TextBox ID="TextBox1" runat="server" Width="178px"></asp:TextBox></td>
                        <td align="center" style="height: 21px" width="20%">
                            </td>
                        <td align="left" style="height: 21px"></td>
                    </tr>
					<tr>
						<td align="center" colspan="4" style="HEIGHT: 43px">
                            &nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="保存" Width="68px" />
                            <asp:Button ID="Button1" runat="server" Text="返回" Width="68px" OnClick="Button1_Click" /></td>
					</tr>
				</table>
			</font>
    </div>
    </form>
</body>
</html>
