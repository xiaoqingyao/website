<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Left.aspx.cs" Inherits="Yg_Left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<link href="../CSS/master.css" type="text/css" rel="stylesheet"/>
    <title>无标题页</title>
</head>
	<body>
		<form id="Form1" method="post" runat="server">
			<font face="宋体">
				<table id="Table1" style="Z-INDEX: 101; LEFT: 0px; WIDTH: 164px; POSITION: absolute; TOP: 0px"
					cellspacing="1" cellpadding="1" width="164" align="center" border="1">
					<tr>
						<td class="bt12b" align="center" style="HEIGHT: 55.72%; width: 160px;">
                            <span style="font-family: 宋体">操作员菜单</span></td>
					</tr>
					<tr>
						<td align="center" style="HEIGHT: 14px; width: 160px;"><asp:hyperlink id="HyperLink1" runat="server" BorderColor="#EDF3FA" NavigateUrl="ZhList.aspx"
								Target="OfficeMain" ForeColor="#0000C0">住户信息维护</asp:hyperlink></td>
					</tr>
					<tr>
						<td align="center" style="width: 160px"><font face="宋体">
						    <asp:hyperlink id="HyperLink3" runat="server" BorderColor="#EDF3FA" NavigateUrl="WysfEdit.aspx" 
						        Target="OfficeMain" ForeColor="#0000C0">物业收费</asp:hyperlink></font></td>
					</tr>
					<tr>
						<td align="center" style="width: 160px"><font face="宋体">
						    <asp:hyperlink id="HyperLink7" runat="server" BorderColor="#EDF3FA" NavigateUrl="WyfList.aspx" 
						        Target="OfficeMain" ForeColor="#0000C0">物业费列表</asp:hyperlink></font></td>
					</tr>
                    <tr>
                        <td align="center" style="height: 22px; width: 160px;">
                            <asp:HyperLink ID="Hyperlink2" runat="server" BorderColor="#EDF3FA" NavigateUrl="SdqEdit.aspx"
                                Target="OfficeMain" ForeColor="#0000C0">物业收水电费</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td align="center" style="height: 22px; width: 160px;">
                            <asp:HyperLink ID="Hyperlink8" runat="server" BorderColor="#EDF3FA" NavigateUrl="SdfList.aspx"
                                Target="OfficeMain" ForeColor="#0000C0">水电费列表</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 160px">
                            <asp:HyperLink ID="Hyperlink5" runat="server" BorderColor="#EDF3FA" NavigateUrl="CwList.aspx"
                                Target="OfficeMain" ForeColor="#0000C0">车位管理</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 160px; height: 20px;">
                            <asp:HyperLink ID="HyperLink14" runat="server" BorderColor="#EDF3FA" NavigateUrl="../cheweishenqing_sh.aspx"
                                Target="OfficeMain" ForeColor="#0000C0">车位申请审核</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 160px">
                            <asp:HyperLink ID="Hyperlink6" runat="server" BorderColor="#EDF3FA" NavigateUrl="CwInfoList.aspx"
                                Target="OfficeMain" ForeColor="#0000C0">车位信息</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 160px">
                            <asp:HyperLink ID="HyperLink12" runat="server" BorderColor="#EDF3FA" ForeColor="#0000C0"
                                NavigateUrl="ZhbxList.aspx" Target="OfficeMain">住户报修</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 160px">
                            <asp:HyperLink ID="HyperLink9" runat="server" BorderColor="#EDF3FA" ForeColor="#0000C0"
                                NavigateUrl="ZhtsList.aspx" Target="OfficeMain">住户投诉</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 160px">
                            <asp:HyperLink ID="HyperLink10" runat="server" BorderColor="#EDF3FA" ForeColor="#0000C0"
                                NavigateUrl="LFList.aspx" Target="OfficeMain">来访信息</asp:HyperLink></td>
                    </tr>
					<tr>
						<td align="center" class="bt12b" style="HEIGHT: 100%; width: 160px;"><font face="宋体">操作员信息</font></td>
					</tr>
					<tr>
						<td align="center" style="width: 160px"><font face="宋体">
                            <asp:HyperLink ID="HyperLink4" runat="server" BorderColor="#EDF3FA" ForeColor="#0000C0"
                                NavigateUrl="User.aspx" Target="OfficeMain">修改密码</asp:HyperLink></font></td>
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
