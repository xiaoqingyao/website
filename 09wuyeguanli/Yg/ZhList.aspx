<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ZhList.aspx.cs" Inherits="Yg_ZhList" %>

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
                     住户姓名：<asp:TextBox   ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="查询" Width="54px" />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="新住户登记" Width="96px" /></td>
				</tr>
				<tr align="center">
					<td class="bt12b" colspan="7" style="width: 740px">
                        <span style="font-family: 宋体">您管辖的住户信息列表</span></td>
				</tr>
				<tr>
					<td style="width: 495px; "><font face="宋体">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="住户代码"
                            OnRowCommand="GridView1_RowCommand" Width="100%"  >
                            <Columns>
                                <asp:BoundField DataField="住户代码" HeaderText="住户代码" Visible="False" />
                                <asp:BoundField DataField="楼栋名称" HeaderText="楼栋名称" >
                                </asp:BoundField>
                                <asp:BoundField DataField="房间号" HeaderText="房间号" />
                                <asp:BoundField DataField="户主" HeaderText="户主" />
                                <asp:BoundField DataField="房屋面积" HeaderText="房屋面积" />
                                <asp:BoundField DataField="联系方式" HeaderText="联系方式" />
                                <asp:BoundField DataField="房屋用途" HeaderText="房屋用途" />
                                <asp:ButtonField ButtonType="Button" CommandName="Mod" HeaderText="操作" Text="修改" >
                                    <ItemStyle Width="30px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="Del" HeaderText="操作" Text="删除" ButtonType="Button">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="40px" />
                                    <ControlStyle Width="30px" />
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
