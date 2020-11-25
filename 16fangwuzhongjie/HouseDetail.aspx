<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HouseDetail.aspx.cs" Inherits="houseIntermediaryMIS.HouseDetail" %>
<%@ Register TagPrefix="UCtrl" TagName="Head" Src="UserControls/HeadCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="Foot" Src="UserControls/FootCtrl.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	</head>
	<body leftMargin="0" topmargin="0">
		<form id="Form1" method="post" runat="server">
			<UCtrl:Head id="Head1" runat="server"></UCtrl:Head>
			<table id="tabTitle" border="0" width="900" align="center">
				<tr>
					<td align="center"><font class="Title">房源信息显示</font>
					</td>
				</tr>
				<tr>
					<td align="center"><asp:Label id="lblMsg" runat="server" ForeColor="Red"></asp:Label>
					</td>
				</tr>
			</table>
			<table height="395" borderColor="#e3e3e3" cellspacing="0" borderColorDark="#ffffff" cellpadding="0"
				width="900" align="center" border="1" id="table1">
				<tr>
					<td  align="center" colspan="3" height="22">
						<strong>房 源 信 息</strong></td>
				</tr>
				<tr>
					<td align="right" width="19%"  height="22"><font color="#999999">房源编号：</font></td>
					<td colspan="2" height="22">
						<asp:Label id="lblId" runat="server" ForeColor="Red"></asp:Label></td>
				</tr>
				<tr>
					<td  align="right" height="22">
						<font color="#999999">信息类型：</font>
					</td>
					<td colspan="2" valign="middle" height="22">
						<asp:Label id="lblType" runat="server"></asp:Label>
					</td>
				</tr>
				<tr>
					<td width="19%"  align="right" height="22">
						<font color="#999999">区域位置：</font></td>
					<td colspan="2" height="22">
						<asp:Label id="lblArea" runat="server"></asp:Label></td>
				</tr>
				<tr>
					<td  align="right" height="22">
						<font color="#999999">房源地址：</font>
					</td>
					<td colspan="2" height="22">
						<asp:Label id="lblAddr" runat="server"></asp:Label>
					</td>
				</tr>
				<tr>
					<td  align="right" height="22">
						<font color="#999999">房源类型：</font>
					</td>
					<td colspan="2" height="22">
						<asp:Label id="lblHouseType" runat="server"></asp:Label>
					</td>
				</tr>
				<tr>
					<td  align="right" height="22">
						<font color="#999999">房源户型：</font>
					</td>
					<td width="37%" height="22">
						<asp:Label id="lblFYHX" runat="server"></asp:Label>
					</td>
					<td height="22">
						<img height="8" src="/Images/back.gif" width="8" border="0"><font color="#999999">朝向：
							<asp:Label id="lblDirection" runat="server"></asp:Label></font></td>
				</tr>
				<tr>
					<td  align="right" height="22">
						<font color="#999999">楼 层：</font>
					</td>
					<td width="37%" height="22">
						<asp:Label id="lblFloor" runat="server"></asp:Label>
					</td>
					<td width="42%" height="22">
						<img height="8" src="/Images/back.gif" width="8" border="0"><font color="#999999">装修情况：
							<asp:Label id="lblZXQK" runat="server"></asp:Label></font></td>
				</tr>
				<tr>
					<td  align="right" height="22">
						<font color="#999999">面积：</font></td>
					<td width="37%" height="22">
						<asp:Label id="lblSquare" runat="server"></asp:Label>
					</td>
					<td height="22">
						<img height="8" src="/Images/back.gif" width="8" border="0"> <font color="#999999">
							<asp:Label id="lblPriceType" runat="server"></asp:Label>
							<asp:Label id="lblPrice" runat="server"></asp:Label></font></td>
				</tr>
				<tr>
					<td  align="right" height="22">
						<font color="#999999">基础设施：</font></td>
					<td colspan="2" height="22">
						<asp:Label id="lblJCSS" runat="server"></asp:Label>
					</td>
				</tr>
				<tr>
					<td  align="right" height="22">
						<font color="#999999">配套设施：</font>
					</td>
					<td colspan="2" height="22">
						<asp:Label id="lblPTSS" runat="server"></asp:Label>
					</td>
				</tr>
				<tr>
					<td  align="right" height="22">
						<font color="#999999">交通情况：</font>
					</td>
					<td colspan="2" height="22">
						<asp:Label id="lblJTQK" runat="server"></asp:Label>
					</td>
				</tr>
				<tr>
					<td  align="right" height="22">
						<font color="#999999">备 注：</font>
					</td>
					<td colspan="2" height="22">
						<asp:Label id="lblOther" runat="server"></asp:Label>
					</td>
				</tr>
                <tr>
					<td  align="right" height="22">
						<font color="#999999">附件：</font>
					</td>
					<td colspan="2" height="22">
						<asp:Image runat="server" ID="imgPic" Height="200" Width="150"/>
					</td>
				</tr>
				<tr>
					<td  colspan="3" align="center" height="22">
						<b>联 系 人 信 息</b></td>
				</tr>
				<tr>
					<td  align="right" height="22">
						<font color="#999999">联 系 人：</font>
					</td>
					<td width="37%" height="22">
						<asp:Label id="lblLinkMan" runat="server"></asp:Label>
					</td>
					<td height="22">
						<img height="8" src="/Images/back.gif" width="8" border="0"> <font color="#999999">E-mail:
						</font>
						<asp:Label id="lblEmail" runat="server"></asp:Label>
					</td>
				</tr>
				<tr>
					<td  align="right" height="22">
						<font color="#999999">联系电话1：</font>
					</td>
					<td width="37%" height="22">
						<asp:Label id="lblTel1" runat="server"></asp:Label>
					</td>
					<td height="22">
						<img height="8" src="/Images/back.gif" width="8" border="0"> <font color="#999999">联系电话2:
							<asp:Label id="lblTel2" runat="server"></asp:Label></font></td>
				</tr>
				<tr>
					<td  align="right" height="22">
						<font color="#999999">有效期：</font>
					</td>
					<td width="37%" height="22">
						<asp:Label id="lblExpire" runat="server"></asp:Label>
					</td>
					<td height="22">
						<img height="8" src="/Images/back.gif" width="8" border="0">&nbsp;<font color="#999999">发布时间:
						</font>
						<asp:Label id="lblAddTime" runat="server"></asp:Label></td>
				</tr>
				<tr>
					<td  align="right" colspan="3" height="45" valign="bottom">
						<a href="#"></a>&nbsp;<a href="javascript:window.print();">打印</a>&nbsp;<a href="javascript:window.close();">关闭</a>&nbsp;</td>
				</tr>
			</table>
			<UCtrl:Foot id="Foot1" runat="server"></UCtrl:Foot>
		</form>
	</body>
</html>
