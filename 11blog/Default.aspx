<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="left5.ascx" TagName="left5" TagPrefix="uc4" %>

<%@ Register Src="top3.ascx" TagName="top3" TagPrefix="uc3" %>

<%@ Register Src="WebUserControl.ascx" TagName="WebUserControl" TagPrefix="uc2" %>

<%@ Register TagPrefix="uc1" TagName="hsgleft" Src="hsgleft.ascx" %>
<%@ Register TagPrefix="uc1" TagName="hsgtop2" Src="hsgtop2.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>魏一宁个人网站</title>
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
							<TD vAlign="top" style="width: 781px; height: 780px">
								<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
									<TBODY>
										<TR>
											<TD style="height: 5px"><uc1:hsgtop2 id="Hsgtop21" runat="server" OnLoad="Hsgtop21_Load"></uc1:hsgtop2></TD>
										</TR>
									</TBODY>
								</TABLE>
								<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" style="height: 691px">
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
											<TD vAlign="top" align="left" width="571" bgColor="#f2f2f2" style="height: 2px">
							</TD>
						</TR>
		
						<TR>
							<TD style="HEIGHT: 494px" vAlign="top"><TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
									<TBODY>
										<TR>
											
											<TD vAlign="top" align="right" width="100%">
												<TABLE style="WIDTH: 100%; HEIGHT: 190px" cellSpacing="0" cellPadding="0" width="337"
													border="0">
													<TBODY>
														
														<TR>
															<TD vAlign="top" align="left" height="149"><FONT face="宋体">
																	<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
																		<TR>
																			<TD align="left" width="82%" background="images/bian-bian.gif" height="35"><FONT face="宋体" color="#ffffff">最新资讯</FONT></TD>
																			<TD width="18%" background="images/bian-bian.gif"><A href="http://www.zjqypx.com/manage.asp?bcgid=49"></A></TD>
																		</TR>
																	</TABLE>
																</FONT>
																<asp:datagrid id="DataGrid1" runat="server" AutoGenerateColumns="False" Width="99%" Height="130px">
																	<Columns>
																		<asp:TemplateColumn HeaderText="序号">
																			<ItemTemplate>
																				<%#DataBinder.Eval(Container.DataItem, "id") %>
																			</ItemTemplate>
                                                                            <HeaderStyle Width="30px" />
																		</asp:TemplateColumn>
                                                                        <asp:TemplateColumn HeaderText="标题">
                                                                            <HeaderStyle  />
                                                                            <ItemTemplate>
                                                            <a href='ggdetail.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'><%#DataBinder.Eval(Container.DataItem, "title") %></a>
                                                        </ItemTemplate>
                                                                        </asp:TemplateColumn>
																		<asp:BoundColumn DataField="addtime" HeaderText="发布时间"></asp:BoundColumn>
																	</Columns>
																</asp:datagrid></TD>
														</TR>
													</TBODY>
												</TABLE>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
								<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
									<TBODY>
										<TR>
											<TD height="12"></TD>
										</TR>
									</TBODY>
								</TABLE>
								<TABLE style="HEIGHT: 276px" cellSpacing="0" cellPadding="0" width="100%"
									border="0">
									<TBODY>
										<TR>
											<TD vAlign="top" width="48%" style="height: 231px">
												<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
													<TBODY>
														<TR>
															<TD align="left" width="82%" background="images/bian-bian.gif" height="35"><FONT face="宋体"><span style="color: #ffffff">魏一宁个人简介</span></FONT></TD>
															<TD width="18%" background="images/bian-bian.gif"><A href="http://www.zjqypx.com/manage.asp?bcgid=49"></A></TD>
														</TR>
													</TBODY>
												</TABLE>
                                               魏一宁，1991年2月12日出生于吉林省长春市，中国内地男歌手，毕业于东北师范大学。
2010年，报名参加湖南卫视《快乐男声》长春唱区的比赛，获得长春唱区7强、全国61强[1] 。2012年，推出个人单曲《你看不见我》[2-3]   。2013年，报名参加湖南卫视《快乐男声》成都唱区的比赛，获得成都唱区10强、全国66强、复活赛亚军[4] 。2014年，正式签约电童娱乐并推出首张个人创作专辑《WEI》[5-6]   。
</TD>
										</TR>
									</TBODY>
								</TABLE>
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