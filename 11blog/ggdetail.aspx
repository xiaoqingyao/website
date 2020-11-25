<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ggdetail.aspx.cs" Inherits="ggdetail" %>

<%@ Register Src="left5.ascx" TagName="left5" TagPrefix="uc4" %>

<%@ Register Src="top3.ascx" TagName="top3" TagPrefix="uc3" %>

<%@ Register Src="WebUserControl.ascx" TagName="WebUserControl" TagPrefix="uc2" %>

<%@ Register TagPrefix="uc1" TagName="hsgleft" Src="hsgleft.ascx" %>
<%@ Register TagPrefix="uc1" TagName="hsgtop2" Src="hsgtop2.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>个人网站系统站</title>
    <LINK href="images/CSS.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="Form1" method="post" runat="server">
			<DIV align="center"></DIV>
				<DIV align="center">
                    <uc3:top3 ID="Top3_1" runat="server" />
				</DIV>
				<TABLE style="BORDER-COLLAPSE: collapse" borderColor="#cccccc" cellSpacing="0" cellPadding="0"
					width="778" border="1" frame="vsides" align="center">
					
						<TR>
							<TD vAlign="top" style="width: 781px; height: 841px">
								<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
									<TBODY>
										<TR>
											<TD style="height: 5px"><uc1:hsgtop2 id="Hsgtop21" runat="server"></uc1:hsgtop2></TD>
										</TR>
									</TBODY>
								</TABLE>
								<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
									<TBODY>
										<TR>
											<TD style="HEIGHT: 576px" vAlign="top" align="left" width="203" height="576" rowSpan="2">
												<TABLE cellSpacing="0" cellPadding="0" width="100" border="0">
													<TBODY>
														<TR>
															<TD vAlign="top" background="images/bian-bg.gif" height="183"><FONT face="宋体">&nbsp;<TABLE id="Table2" style="WIDTH: 191px; HEIGHT: 32px" background="images/ttt.gif" border="0">
																		<TR>
																			<TD>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 站内导航</TD>
																		</TR>
																	</TABLE>
																	<uc1:hsgleft id="Hsgleft1" runat="server"></uc1:hsgleft></FONT></TD>
														</TR>
														<TR>
															<TD vAlign="bottom" background="images/bian-bg.gif" style="height: 40px"><FONT face="宋体"><TABLE id="Table3" style="WIDTH: 191px; HEIGHT: 32px" background="images/ttt.gif" border="0">
                                                                <TR>
                                                                    <TD>
                                                                        &nbsp; &nbsp; &nbsp; &nbsp; 友情链接</td>
                                                                </tr>
                                                            </table>
                                                            </FONT></TD>
														</TR>
														<TR>
															<TD vAlign="top" align="left" background="images/bian-bg.gif" style="height: 17px"></TD>
														</TR>
														<TR>
															<TD vAlign="top" align="center" background="images/bian-bg.gif" height="0">
                                                                <uc4:left5 ID="Left5_1" runat="server" />
															</TD>
														</TR>
														<TR>
															<TD vAlign="top" align="right" height="8"><IMG height="8" src="images/di-bg.gif" width="195"></TD>
														</TR>
													</TBODY>
												</TABLE>
											</TD>
											<TD vAlign="top" align="left" width="571" bgColor="#f2f2f2" style="height: 23px">
                                                <strong>当前位置:</strong><a href="default.aspx"><strong>首页</strong></a><strong>&gt;&gt;资讯详细</strong></TD>
						</TR>
		
						<TR>
							<TD style="HEIGHT: 527px" vAlign="top" height="527"><table width="100%" height="381" border="0">
  <tr>
    <td height="41" align="center"><%=ntitle %>&nbsp;</td>
  </tr>
  <tr>
    <td height="294" valign="top"><%=ncontent %>&nbsp;</td>
  </tr>
  <tr>
    <td heigh="38" align="center">&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="newslist.aspx?lb=1">返回</asp:HyperLink></td>
  </tr>
</table>
							</TD>
						</TR>
					</TBODY>
				</TABLE>
				
				<DIV align="center">
					<TABLE style="BORDER-COLLAPSE: collapse" borderColor="#cccccc" cellSpacing="0" cellPadding="0"
						width="778" border="0" frame="vsides">
						<TBODY>
							<TR>
								<TD align="left" width="10%" background="images/down-bg.gif" style="height: 42px"><IMG height="35" src="images/down-left.gif" width="1"></TD>
								<TD vAlign="bottom" align="center" width="80%" background="images/down-bg.gif" style="height: 42px">
								</TD>
								<TD align="right" width="10%" background="images/down-bg.gif" style="height: 42px"><IMG height="35" src="images/down-left.gif" width="1"></TD>
							</TR>
						</TBODY>
					</TABLE>
				</DIV>
                                <uc2:WebUserControl ID="WebUserControl1" runat="server" />
				

			</form>
			
</body>
</html>