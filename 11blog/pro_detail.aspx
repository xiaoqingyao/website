<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pro_detail.aspx.cs" Inherits="pro_detail" %>


<%@ Register Src="top3.ascx" TagName="top3" TagPrefix="uc3" %>

<%@ Register Src="WebUserControl.ascx" TagName="WebUserControl" TagPrefix="uc2" %>

<%@ Register TagPrefix="uc1" TagName="hsgleft" Src="hsgleft.ascx" %>
<%@ Register TagPrefix="uc1" TagName="hsgtop2" Src="hsgtop2.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>个人网站系统</title>
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
											<TD style="HEIGHT: 576px" vAlign="top" align="left" width="203" height="576" rowSpan="1">
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
																<TABLE cellSpacing="0" cellPadding="0" width="90%" align="center" border="0">
																	<TBODY>
																		<TR>
																			<TD vAlign="middle" align="left" height="29"><IMG height="9" src="images/arrow.gif" width="14">
																				<A href="http://www.dzswpx.cn/" target="_blank">电子商务培训网</A>
																			</TD>
																		</TR>
																		<TR>
																			<TD vAlign="middle" align="left" height="29"><IMG height="9" src="images/arrow.gif" width="14">
																				<A href="http://emci.sce.tsinghua.edu.cn/" target="_blank">国际工程管理认证</A>
																			</TD>
																		</TR>
																		<TR>
																			<TD vAlign="middle" align="left" height="29"><IMG height="9" src="images/arrow.gif" width="14">
																				<A href="http://emci.caiep.org/" target="_blank">中国人才交流协会网站</A>
																			</TD>
																		</TR>
																		<TR>
																			<TD vAlign="middle" align="left" height="29"><IMG height="9" src="images/arrow.gif" width="14">
																				<A href="http://www.cmarn.org/" target="_blank">中国市场营销培训网</A>
																			</TD>
																		</TR>
																		<TR>
																			<TD vAlign="middle" align="left" height="29"><IMG height="9" src="images/arrow.gif" width="14">
																				<A href="http://www.zjjmw.gov.cn/" target="_blank">浙江省经济贸易委员会</A>
																			</TD>
																		</TR>
																	</TBODY>
																</TABLE>
															</TD>
														</TR>
														<TR>
															<TD vAlign="top" align="right" height="8"><IMG height="8" src="images/di-bg.gif" width="195"></TD>
														</TR>
													</TBODY>
												</TABLE>
											</TD>
							<TD style="HEIGHT: 527px; text-align: center;" vAlign="top" height="527">
                                <table id="Table1" align="center" border="0" bordercolordark="#ffffff" bordercolorlight="#ffcf00"
                                    cellpadding="0" cellspacing="0" width="100%">
                                    <tbody>
                                        <tr>
                                            <td bgcolor="rgb(210,232,255)" class="tabTitle" colspan="2" height="22">
                                                <b>专辑详细</b></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" height="10">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="width: 173px; height: 192px" width="173">
                                                
                                                    <img border="0" height="146" src="uppic/<%=npic%>" style="width: 129px; height: 146px"
                                                        width="129" /><br />
                                                <asp:Label ID="Label4" runat="server" Width="104px">Label</asp:Label></td>
                                            <td align="left" style="height: 192px">
                                                <font face="宋体">
                                                    <p>
                                                        <strong>
                                                        专辑名称:</strong>
                                                        <asp:Label ID="Label1" runat="server" Width="104px">Label</asp:Label></p>
                                                    <p>
                                                        <strong>专辑类别:
                                                            <asp:Label ID="Label7" runat="server" Font-Bold="False" Width="104px">Label</asp:Label></strong></p>
                                                    <p>
                                                        <strong>发布时间:</strong>
                                                        <asp:Label ID="Label2" runat="server" Width="104px">Label</asp:Label></p>
                                                </font>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="height: 10px; text-align: left;">
                                                <strong>
                                                简介: </strong>
                                                <asp:Label ID="Label5" runat="server" Height="20px" Width="540px">Label</asp:Label></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br />
                                <br />
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="prolist.aspx">返回</asp:HyperLink>&nbsp;</TD>
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