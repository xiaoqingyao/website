<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NeedDetail.aspx.cs" Inherits="houseIntermediaryMIS.NeedDetail" %>
<%@ Register TagPrefix="UCtrl" TagName="Foot" Src="UserControls/FootCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="Head" Src="UserControls/HeadCtrl.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
	<body leftMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
			<UCtrl:Head id="Head1" runat="server"></UCtrl:Head>
			<table id="tabTitle" width="770" align="center" border="0">
				<tr>
					<td align="center"><font class="Title">房屋需求信息显示</font>
					</td>
				</tr>
				<tr>
					<td align="center"><asp:label id="lblMsg" runat="server" ForeColor="Red"></asp:label></td>
				</tr>
			</table>
			<table id="table1" height="300" borderColor="#e3e3e3" cellSpacing="0" borderColorDark="#ffffff"
				cellPadding="0" width="770" align="center" border="1">
				<tr height="22">
					<td align="center"  colSpan="3"><strong>房 源 信 息</strong></td>
				</tr>
				<TR>
					<TD align="right" width="19%"  height="22"><font color="#999999">房源编号：</font></TD>
					<TD colSpan="2" height="22">
						<asp:Label id="lblId" runat="server" ForeColor="Red"></asp:Label></TD>
				</tr>
				<tr height="22">
					<td align="right" ><font color="#999999"><FONT color="#999999">需求</FONT>信息类型：</font>
					</td>
					<td colSpan="2"><asp:label id="lblType" runat="server"></asp:label></td>
				</tr>
				<tr height="22">
					<td align="right" width="19%" ><font color="#999999">所在区县：</font></td>
					<td colSpan="2"><asp:label id="lblArea" runat="server"></asp:label></td>
				</tr>
				<tr height="22">
					<td align="right" ><font color="#999999"><FONT color="#999999">需求</FONT>房源地址：</font>
					</td>
					<td colSpan="2"><asp:label id="lblAddr" runat="server"></asp:label></td>
				</tr>
				<tr height="22">
					<td align="right" ><font color="#999999"><FONT color="#999999">需求</FONT>房源类型：</font>
					</td>
					<td colSpan="2"><asp:label id="lblHouseType" runat="server"></asp:label></td>
				</tr>
				<tr height="22">
					<td align="right" ><font color="#999999">需求房源户型：</font>
					</td>
					<td width="37%"><asp:label id="lblFYHX" runat="server"></asp:label></td>
					<td><font color="#999999">&nbsp;<IMG height="8" src="/Images/back.gif" width="8" border="0">&nbsp;<FONT color="#999999">装修情况：
								<asp:label id="lblZXQK" runat="server"></asp:label></FONT></font></td>
				</tr>
				<tr height="22">
					<td align="right" ><FONT color="#999999">面积：</FONT>
					</td>
					<td width="37%"><asp:label id="lblSquare" runat="server"></asp:label></td>
					<td width="42%"><font color="#999999">&nbsp;<IMG height="8" src="/Images/back.gif" width="8" border="0">
							<FONT color="#999999">租价:
								<asp:label id="lblPrice" runat="server"></asp:label></FONT></font></td>
				</tr>
				<tr height="22">
					<td align="right" ><font color="#999999">详细需求描述：</font>
					</td>
					<td colSpan="2"><asp:label id="lblOther" runat="server"></asp:label></td>
				</tr>
                 <tr>
					<td  align="right" height="22">
						<font color="#999999">附件：</font>
					</td>
					<td colspan="2" height="22">
						<asp:Image runat="server" ID="imgPic" Height="200" Width="150"/>
					</td>
				</tr>
				<tr height="22">
					<td align="center"  colSpan="3"><b>联 系 人 信 息</b></td>
				</tr>
				<tr height="22">
					<td align="right" ><font color="#999999">联 系 人：</font>
					</td>
					<td width="37%"><asp:label id="lblLinkMan" runat="server"></asp:label></td>
					<td><img height="8" src="/Images/back.gif" width="8" border="0"> <font color="#999999">E-mail:
						</font>
						<asp:label id="lblEmail" runat="server"></asp:label></td>
				</tr>
				<tr height="22">
					<td align="right" ><font color="#999999">联系电话1：</font>
					</td>
					<td width="37%"><asp:label id="lblTel1" runat="server"></asp:label></td>
					<td><img height="8" src="/Images/back.gif" width="8" border="0"> <font color="#999999">联系电话2:
							<asp:label id="lblTel2" runat="server"></asp:label></font></td>
				</tr>
				<tr height="22">
					<td align="right" ><font color="#999999">有效期：</font>
					</td>
					<td width="37%"><asp:label id="lblExpire" runat="server"></asp:label></td>
					<td><img height="8" src="/Images/back.gif" width="8" border="0">&nbsp;<FONT color="#999999">发布时间:
						</FONT>
						<asp:Label id="lblAddTime" runat="server"></asp:Label></td>
				</tr>
				<tr height="45">
					<td  align="right" colspan="3" height="45" valign="bottom">
						<a href="#"></a>&nbsp;&nbsp;<a href="javascript:window.close();">关闭</a>&nbsp;</td>
				</tr>
			</table>
			<UCtrl:Foot id="Foot1" runat="server"></UCtrl:Foot></form>
	</body>
</html>
