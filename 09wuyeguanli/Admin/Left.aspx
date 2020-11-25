<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Left.aspx.cs" Inherits="Admin_Left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<link href="../CSS/master.css" type="text/css" rel="stylesheet"/>
    <title>无标题页</title>
    <style type="text/css">
        .style1
        {
            width: 160px;
            height: 22px;
        }
    </style>
    </head>

	<body>
		<form id="Form1" method="post" runat="server">
			<font face="宋体">
				<table id="Table1" style="Z-INDEX: 101; LEFT: 0px; WIDTH: 164px; POSITION: absolute; TOP: 0px"
					cellspacing="1" cellpadding="1" width="164" align="center" border="1">
					<tr>
						<td class="bt12b" align="center" style="HEIGHT: 55.72%; width: 160px;">
                            <span style="font-family: 宋体">信息菜单</span></td>
					</tr>
					<tr>
						<td align="center" style="HEIGHT: 14px; width: 160px;"><asp:hyperlink id="HyperLink1" runat="server" BorderColor="#EDF3FA" NavigateUrl="CopmanyInfo.aspx"
								Target="OfficeMain" ForeColor="#0000C0">物业信息</asp:hyperlink></td>
					</tr>
					<tr>
						<td align="center" style="width: 160px"><font face="宋体">
                        <asp:hyperlink id="HyperLink3" runat="server" BorderColor="#EDF3FA" NavigateUrl="UserList.aspx" Target="OfficeMain" ForeColor="#0000C0">员工信息</asp:hyperlink></font></td>
					</tr>
                    <tr>
                        <td align="center" class="style1">
                            <asp:HyperLink ID="Hyperlink2" runat="server" BorderColor="#EDF3FA" NavigateUrl="LdList.aspx"
                                Target="OfficeMain" ForeColor="#0000C0">楼栋信息</asp:HyperLink></td>
                    </tr>
                    <tr>
                         <td align="center" style="width: 160px">
                            <asp:HyperLink ID="Hyperlink5" runat="server" BorderColor="#EDF3FA" NavigateUrl="WysbList.aspx"
                                Target="OfficeMain" ForeColor="#0000C0">物业设备管理</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 160px">
                            <asp:HyperLink ID="Hyperlink12" runat="server" BorderColor="#EDF3FA" NavigateUrl="main1.aspx"
                                Target="OfficeMain" ForeColor="#0000C0">留言板</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td align="center" class="bt12b" style="height: 100%; width: 160px;">
                            业务菜单</td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 160px">
                            <asp:HyperLink ID="Hyperlink4" runat="server" BorderColor="#EDF3FA" NavigateUrl="ZhList.aspx"
                                Target="OfficeMain" ForeColor="#0000C0">住户信息列表</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 160px">
                            <asp:HyperLink ID="Hyperlink6" runat="server" BorderColor="#804040" NavigateUrl="WyfList.aspx"
                                Target="OfficeMain" ForeColor="#0000C0">物业费列表</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 160px">
                            <asp:HyperLink ID="HyperLink10" runat="server" BorderColor="#EDF3FA" NavigateUrl="SdfList.aspx"
                                Target="OfficeMain" ForeColor="#0000C0">水电费列表</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 160px; height: 20px;">
                            <asp:HyperLink ID="HyperLink8" runat="server" BorderColor="#EDF3FA" NavigateUrl="CWList.aspx"
                                Target="OfficeMain" ForeColor="#0000C0">车位管理列表</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 160px; height: 20px;">
                            <asp:HyperLink ID="HyperLink14" runat="server" BorderColor="#EDF3FA" NavigateUrl="../cheweishenqing_sh.aspx"
                                Target="OfficeMain" ForeColor="#0000C0">车位申请审核</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 160px; height: 26px">
                            <asp:HyperLink ID="HyperLink7" runat="server" BorderColor="#EDF3FA" ForeColor="#0000C0"
                                NavigateUrl="ZhBxList.aspx" Target="OfficeMain">住户报修列表</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 160px; height: 26px">
                            <asp:HyperLink ID="HyperLink13" runat="server" BorderColor="#EDF3FA" ForeColor="#0000C0"
                                NavigateUrl="UserComplaint.aspx" Target="OfficeMain">住户投诉列表</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 160px; height: 26px">
                            <asp:HyperLink ID="HyperLink9" runat="server" BorderColor="#EDF3FA" ForeColor="#0000C0"
                                NavigateUrl="WyfTj.aspx" Target="OfficeMain">物业费统计</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 160px; height: 26px">
                            <asp:HyperLink ID="HyperLink11" runat="server" BorderColor="#EDF3FA" ForeColor="#0000C0"
                                NavigateUrl="SdfTj.aspx" Target="OfficeMain">水电费统计</asp:HyperLink></td>
                    </tr>
					<tr>
						<td align="center" class="bt12b" style="HEIGHT: 100%; width: 160px;"><font face="宋体">修改密码</font></td>
					</tr>
					<tr>
						<td align="center" style="width: 160px"><font face="宋体">密码：
								<asp:TextBox id="TextBox1" runat="server" DESIGNTIMEDRAGDROP="388" Width="100px" TextMode="Password"></asp:TextBox></font></td>
					</tr>
					<tr>
						<td align="center" style="width: 160px"><font face="宋体">确认：
								<asp:TextBox id="TextBox2" runat="server" Width="100px" TextMode="Password"></asp:TextBox></font></td>
					</tr>
					<tr>
						<td align="center" style="width: 160px"><font face="宋体">
								<asp:LinkButton id="LinkButton1" runat="server" OnClick="LinkButton1_Click" ForeColor="#0000C0" >确认修改</asp:LinkButton></font></td>
					</tr>
					<tr>
						<td align="center" style="height: 26px; width: 160px;">
							<asp:LinkButton id="LinkButton2" runat="server" OnClick="LinkButton2_Click" ForeColor="#0000C0" >退出</asp:LinkButton></td>
					</tr>
				</table>
				<table id="Table2" style="Z-INDEX: 102; LEFT: 168px; WIDTH: 8px; POSITION: absolute; TOP: 0px; HEIGHT: 536px"
					height="536" cellspacing="0" cellpadding="0" width="8" border="0">
					<tr>
						<td bgcolor="honeydew" height="100%"><font face="宋体"></font></td>
					</tr>
				</table>
			</font>
		</form>
	</body>
</html>
