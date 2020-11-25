﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CwInfoList.aspx.cs" Inherits="Yg_CwInfoList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Environmentlist</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR"/>
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE"/>
		<meta content="JavaScript" name="vs_defaultClientScript"/>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema"/>
		<link href="../CSS/master.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="Z-INDEX: 101; WIDTH: 744px; left: 0px; position: absolute; top: 0px;" cellspacing="1" cellpadding="1"  border="1" id="TABLE1">
                <tr>
                    <td id="Terr" runat="server" align="left" colspan="7">
                    </td>
                </tr>
				<tr>
					<td align="right" colspan="7" style="width: 740px">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="新车位" Width="96px" /></td>
				</tr>
				<tr align="center">
					<td class="bt12b" colspan="7" style="width: 740px">
                        <span style="font-family: 宋体">车位信息列表</span></td>
				</tr>
				<tr>
					<td style="width: 744px; "><font face="宋体">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
                            OnRowCommand="GridView1_RowCommand" Width="100%"  >
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID" Visible="false" />
                                <asp:BoundField DataField="车位名称" HeaderText="车位名称" />
                                <asp:BoundField DataField="车位大小" HeaderText="车位大小" />
                                <asp:BoundField DataField="楼栋代码" HeaderText="楼栋代码" />
                                <asp:BoundField DataField="车位" HeaderText="车位" >
                                    <ItemStyle Width="30%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="占用状态" HeaderText="占用状态" />
                                <asp:ButtonField ButtonType="Button" CommandName="Mod" HeaderText="操作" Text="修改" >
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="Del" HeaderText="操作" Text="删除" ButtonType="Button">
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                            </Columns>
                        </asp:GridView>
                    </font></td>
				</tr>
			</table>
    </div>
    </form>
</body>
</html>