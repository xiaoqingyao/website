<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ComplaintUpdate.aspx.cs" Inherits="ComplaintUpdate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>投诉更新</title>
    <link href="../css/admin.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table id="Table1" cellspacing="1" cellpadding="1" width="642" align="center" border="1"
			style="WIDTH: 642px; position: absolute; top: 0px;">
			<tr>
				<td id="Terr" style="HEIGHT: 13.7%" align="left" width="750" colspan="4" runat="server"><font face="宋体"></font></td>
			</tr>
			<tr>
				<td class="bt12b" style="HEIGHT: 13.7%" align="center" width="750" colspan="4">
                    <span style="font-family: 宋体">住户投诉信息</span></td>
			</tr>
            <tr>
                <td align="center" style="width: 20%; height: 21px;">
                    住户信息：</td>
                <td id="T政治面貌" align="left" style="height: 21px" valign="middle" colspan="3">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="505px" Enabled="false">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td align="center" style="width: 20%; height: 21px">
                    投诉日期：</td>
                <td align="left" style="height: 21px" valign="middle" width="30%">
                    <asp:TextBox ID="TextBox1" runat="server" Width="493px" Enabled="false"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="center" style="width: 20%; height: 21px">
                    投诉内容：</td>
                <td align="left" colspan="3" style="height: 21px">
                    <asp:TextBox ID="TextBox4" runat="server" Width="497px" Enabled="false"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="center" style="width: 20%; height: 21px">
                    是否解决：</td>
                <td align="left" colspan="3" style="height: 21px">
                    <asp:DropDownList ID="DropDownList2" runat="server" Width="496px">
                        <asp:ListItem>解决</asp:ListItem>
                        <asp:ListItem>未解决</asp:ListItem>
                        <asp:ListItem>处理中</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td align="center" style="width: 20%; height: 21px">
                    参与人员：</td>
                <td align="left" colspan="3" style="height: 21px">
                    <asp:TextBox ID="TextBox2" runat="server" Width="497px" Enabled="false"></asp:TextBox></td>
            </tr>
			<tr>
				<td align="center" colspan="4" style="HEIGHT: 43px">
					<asp:button id="Button1" runat="server" Width="68px" Text="保存" OnClick="Button1_Click"></asp:button>&nbsp;<asp:button id="Button2" runat="server" Width="68px" Text="取消" OnClick="Button2_Click"></asp:button></td>
			</tr>
		</table>
    </div>
    </form>
</body>
</html>
