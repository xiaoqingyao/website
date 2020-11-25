<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SdfList.aspx.cs" Inherits="Yg_SdfList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="新缴费" Width="96px" /></td>
				</tr>
				<tr align="center">
					<td class="bt12b" colspan="7" style="width: 740px">
                        <span style="font-family: 宋体">水电费列表</span></td>
				</tr>
				<tr>
					<td style="width: 744px; "><font face="宋体">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="收费单号"
                            OnRowCommand="GridView1_RowCommand" Width="100%"  >
                            <Columns>
                                <asp:BoundField DataField="收费单号" HeaderText="收费单号" Visible="false" />
                                <asp:BoundField DataField="住户代码" HeaderText="住户代码" />
                                <asp:BoundField DataField="水费金额" HeaderText="水费金额" />
                                <asp:BoundField DataField="电费金额" HeaderText="电费金额" />
                                <asp:BoundField DataField="气费金额" HeaderText="气费金额" />
                                <asp:BoundField DataField="收费月份" HeaderText="收费月份" />
                                <asp:BoundField DataField="收费总额" HeaderText="收费总额" />
                                <asp:BoundField DataField="员工代码" HeaderText="操作员" />
                                <asp:BoundField DataField="是否缴费" HeaderText="是否缴费" />
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
