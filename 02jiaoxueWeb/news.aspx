<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="news" %>

<%@ Register Src="left1.ascx" TagName="left1" TagPrefix="uc3" %>
<%@ Register Src="left2.ascx" TagName="left2" TagPrefix="uc4" %>
<%@ Register Src="userlog.ascx" TagName="userlog" TagPrefix="uc2" %>
<%@ Register Src="top.ascx" TagName="top" TagPrefix="uc1" %>
<%@ Register Src="~/footer.ascx" TagPrefix="uc1" TagName="footer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>人工智能在线教学系统</title>
    <link href="qtimages/StyleSheet.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.STYLE2 {color: #FFFFFF}
.STYLE4 {color: #FFFFFF; font-weight: bold; }
.STYLE6 {color: #198A95; font-weight: bold; }
-->
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width="900" height="964" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr>
		<td>
			<uc1:top ID="Top1" runat="server" /></td>
	</tr>
	<tr>
		<td height="541"><table id="Table2" width="900" height="532" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="532" valign="top"><table id="Table3" width="220" height="532" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td colspan="2"><img src="qtimages/img_02_01_01.gif" width="220" height="3" alt=""></td>
              </tr>
              <tr>
                <td width="9" height="100%" rowspan="3" background="qtimages/img_02_01_02.gif">&nbsp;</td>
                <td width="211" valign="middle" background="qtimages/img_02_01_03.gif" style="height: 144px">
                    <uc2:userlog ID="Userlog1" runat="server" />
                </td>
              </tr>
              <tr>
                <td height="183">
                    <uc3:left1 ID="Left1_1" runat="server" />
                </td>
              </tr>
              <tr>
                <td height="183">
                    <uc4:left2 ID="Left2_1" runat="server" />
                </td>
              </tr>
              
              <tr>
                <td height="10" colspan="2" background="qtimages/img_02_01_07.gif">&nbsp;</td>
              </tr>
            </table></td>
            <td width="4" background="qtimages/img_02_02.gif">&nbsp;</td>
            <td valign="top"><table id="Table6" width="676" height="506" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="136" valign="top"><table id="Table8" width="676" height="136" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="676" height="34" background="qtimages/img_02_03_02_01.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="14%" align="center" style="height: 15px"><span class="STYLE6">新闻资讯</span></td>
                        <td width="86%" style="height: 15px">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td width="676" height="111" background="qtimages/img_02_03_02_02.gif">
                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="130px"
                            Width="96%">
                            <Columns>
                                <asp:TemplateColumn HeaderText="序号">
                                    <ItemTemplate>
                                        <%#DataBinder.Eval(Container.DataItem, "id") %>
                                    </ItemTemplate>
                                    <HeaderStyle Width="30px" />
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="标题">
                                    <ItemTemplate>
                                        <a href='ggdetail.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'>
                                            <%#DataBinder.Eval(Container.DataItem, "title") %>
                                        </a>
                                    </ItemTemplate>
                                    <HeaderStyle Width="200px" />
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Left" />
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="addtime" HeaderText="发布时间">
                                    <HeaderStyle Width="40%" />
                                </asp:BoundColumn>
                            </Columns>
                        </asp:DataGrid></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/img_02_03_02_03.gif" width="676" height="1" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              
              
            </table></td>
          </tr>
      </table></td>
	</tr>
	<tr>
		<td>
            <uc1:footer runat="server" ID="footer" />
		</td>
	</tr>
</table>
    </div>
    </form>
</body>
</html>
