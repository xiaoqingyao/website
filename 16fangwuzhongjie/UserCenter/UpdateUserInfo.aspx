<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateUserInfo.aspx.cs" Inherits="houseIntermediaryMIS.UserCenter.UpdateUserInfo" %>
<%@ Register TagPrefix="UCtrl" TagName="Foot" Src="../UserControls/FootCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="Head" Src="../UserControls/HeadCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="MyLeft" Src="../UserControls/MyLeftCtrl.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  
</head>
	<body topmargin="0" leftmargin="0">
		<form id="Form1" method="post" runat="server">
			<UCtrl:Head id="Head1" runat="server"></UCtrl:Head>
			<table id="table1" width="900" align="center" border="0">
				<tr>
					<td valign="top" width="180">
						<UCtrl:MyLeft id="MyLeft1" runat="server"></UCtrl:MyLeft>
					</td>
					<td valign="top">
                    <table  style="font-size: 14px"  cellspacing="3" cellpadding="3" width="100%" align="center" border="0">
							<tbody>
								<tr>
									<td class="cont" colspan="2">
										<font color="Red">当前位置：-&gt;修改用户信息</font></B>
									</td>
								</tr>
								<tr>
									<td class="cont" colspan="2"><B>&lt;会员帐户&gt;</B></td>
								</tr>
								<tr>
									<td class="cont" align="right" width="15%">用 户 名：</td>
									<td class="cont" width="85%">
										<asp:Label id="lblUserName" runat="server"></asp:Label>
									</td>
								</tr>
								<!--<tr>
									<td class="cont" align="right">提示问题：</td>
									<td class="cont"><input id="txtQuestion"  maxlength="30" size="26" name="txtQuestion" runat="server" />&nbsp;<font color="#000000">如此处为空，则不修改原来的提示问题及答案。</font></td>
								</tr>
								<tr>
									<td class="cont" align="right">提示答案：</td>
									<td class="cont"><input id="txtAnswer" maxlength="30" size="26" name="txtAnswer" runat="server" /></td>
								</tr>-->
								<tr>
									<td class="cont" colspan="2"><B>&lt;以下是用户资料&gt;</B></td>
								</tr>
								<tr>
									<td class="cont" align="right">您的姓名：</td>
									<td class="cont"><input class="cont" id="txtName" maxlength="30" size="26" name="txtName" runat="server" />
										<font color="Red">*</font>
									</td>
								</tr>
								<tr>
									<td class="cont" align="right">性 别：</td>
									<td class="cont">
										<asp:RadioButtonList id="radSex" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
											<asp:ListItem Value="1">男&amp;nbsp;</asp:ListItem>
											<asp:ListItem Value="0">女</asp:ListItem>
										</asp:RadioButtonList>
										<font color="Red">*</font></td>
								</tr>
								<tr>
									<td class="cont" align="right">联系电话1：</td>
									<td class="cont"><input id="txtTel1" maxlength="50" size="30" name="txtTel1" runat="server" /><font color="Red">*</font></td>
								</tr>
								<tr>
									<td class="cont" align="right">联系电话2：</td>
									<td class="cont"><input class="cont" id="txtTel2" maxlength="50" size="30" name="txtTel2" runat="server" /></td>
								</tr>
								<tr>
									<td class="cont" align="right">Email地址：</td>
									<td class="cont"><input class="cont" id="txtEmail" onblur="check_email(txtEmail)" maxlength="50" size="30"
											name="txtEmail" runat="server" />
									</td>
								</tr>
								<tr>
									<td align="center" colspan="2">
										<div align="center"><input class="cont" id="btnSubmit" type="submit" value="提 交" name="btnSubmit" runat="server" onserverclick="btnSubmit_ServerClick" onclick="return btnSubmit_onclick()" />
											<input class="cont" type="reset" value="重 填" name="reset" />
										</div>
									</td>
								</tr>
								<tr>
									<td align="center" colspan="2">
										<asp:Label id="lblMsg" runat="server" ForeColor="Red"></asp:Label></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</table>
			<UCtrl:Foot id="Foot1" runat="server"></UCtrl:Foot>
		</form>
	</body>
</html>
