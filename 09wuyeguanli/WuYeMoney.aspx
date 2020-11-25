<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WuYeMoney.aspx.cs" Inherits="WuYeMoney" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>物业费</title>
    <link href="../css/admin.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
    <div style="padding-top:15px">
        <table style="border:1px solid #cbcbcb; background-color:#EEEEEE" cellpadding="4" cellspacing="0" align="center">
	<tr height="22">
		<td align="center" colspan="2"><strong>住户『<%=userinfo%>』的物业费信息</strong></td>
	</tr>

	<tr>
		<td align="center" style=" margin-left:30px;font-size:12px" colspan="2">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" Width="100%"  >
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID" />
                                <asp:BoundField DataField="住户代码" HeaderText="住户代码" />
                                <asp:BoundField DataField="管理费" HeaderText="管理费" />
                                <asp:BoundField DataField="绿化养护费" HeaderText="绿化养护费" />
                                <asp:BoundField DataField="道路养护费" HeaderText="道路养护费" />
                                <asp:BoundField DataField="安保费" HeaderText="安保费" />
                                <asp:BoundField DataField="设备折旧费" HeaderText="设备折旧费" />
                                <asp:BoundField DataField="物业费缴费年度" HeaderText="物业费缴费年度" />
                                <asp:BoundField DataField="总金额" HeaderText="总金额" />
                                <asp:BoundField DataField="是否缴费" HeaderText="是否缴费" />
                            </Columns>
                        </asp:GridView>
        </td>
	</tr>
	<tr height="22">
		<td align="center">已交费金额</td>
		<td align="center"><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
        
	</tr>
	<tr height="22">
		<td align="center">未交费金额</td>
		<td align="center"><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
	</tr>
	</table>
    </div>   
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </form>
</body>
</html>
