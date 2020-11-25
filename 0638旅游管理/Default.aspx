<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="qtleft.ascx" TagName="qtleft" TagPrefix="uc3" %>

<%@ Register Src="qtdown.ascx" TagName="qtdown" TagPrefix="uc2" %>

<%@ Register Src="qttop.ascx" TagName="qttop" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>著名旅游管理系统</title>
    <LINK href="qtimages/style.css" type=text/css rel=stylesheet>
    <style type="text/css">
<!--
.STYLE1 {color: #006666}
.STYLE2 {color: #006666; font-weight: bold; }
.STYLE5 {
	color: #FFFFFF;
	font-weight: bold;
}
.STYLE6 {color: #FFCC33}
-->
</style>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <form id="form1" runat="server">
    <div>
        <table width="978" height="1081" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr>
		<td><uc1:qttop ID="Qttop1" runat="server" />
        </td>
	</tr>
	<tr>
		<td><table id="Table2" width="978" height="785" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><uc3:qtleft ID="Qtleft1" runat="server" /></td>
              
 
            <td valign="top"><table id="Table12" width="758" height="785" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td><table id="Table13" width="758" height="240" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="337" height="240" align="center"><SCRIPT type=text/javascript>
var focus_width=320;
var focus_height=210;
var text_height=20;
var swf_height = focus_height+text_height;
var pics="";
var links="";
var texts="";


pics="<%=npics %>";
links="<%=nlinks %>";
texts="<%=ntexts %>";

document.write('<embed src="qtimages/pixviewer.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#ffffff" quality="Best" width="'+ focus_width +'" height="'+ swf_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">');

</SCRIPT></td>
                    <td><table id="Table14" width="421" height="240" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="421" height="42" background="qtimages/1_02_02_01_02_01.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="14%">&nbsp;</td>
                            <td width="86%" class="STYLE1"><strong>旅游资讯</strong></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td><table id="Table15" width="421" height="187" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td><img src="qtimages/1_02_02_01_02_02_01.jpg" width="10" height="187" alt=""></td>
                            <td width="399" height="187" class=newsline>
                                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" BorderWidth="0"
                                    ItemStyle-Height="25" ShowHeader="False" Width="100%">
                                    <Columns>
                                        <asp:TemplateColumn>
                                            <ItemTemplate>
                                                <img src="qtimages/1.jpg">
                                            </ItemTemplate>
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="标题">
                                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                Font-Underline="False" HorizontalAlign="Left" />
                                            <ItemTemplate>
                                                <a href='ggdetail.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'>
                                                    <%# CutStr(DataBinder.Eval(Container.DataItem, "title "))%>
                                                </a>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:BoundColumn DataField="addtime" HeaderText="发布时间">
                                            <HeaderStyle Width="100px" />
                                        </asp:BoundColumn>
                                    </Columns>
                                </asp:DataGrid></td>
                            <td><img src="qtimages/1_02_02_01_02_02_03.jpg" width="12" height="187" alt=""></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td><img src="qtimages/1_02_02_01_02_03.jpg" width="421" height="11" alt=""></td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table id="Table16" width="758" height="236" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="758" background="qtimages/1_02_02_02_01.jpg" style="height: 42px"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="5%">&nbsp;</td>
                        <td width="95%" class="STYLE2">名胜风景</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="Table17" width="758" height="183" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td><img src="qtimages/1_02_02_02_02_01.jpg" width="12" height="183" alt=""></td>
                        <td width="733" height="183">
                            <asp:DataList ID="DataList1" runat="server" Height="100%" RepeatColumns="5" Width="100%">
                                <ItemTemplate>
                                    <table align="center" border="0" bordercolor="#00FFFF" cellpadding="3" cellspacing="1"
                                        style="border-collapse: collapse" width="120">
                                        <tr>
                                            <td align="center" height="140">
                                                <a href='<%# Eval("tupian") %>'>
                                                    <asp:Image ID="Image1" runat="server" Height="100%" ImageUrl='<%# Eval("tupian") %>'
                                                        Width="116" /></a></td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("mingcheng") %>'></asp:Label></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList></td>
                        <td><img src="qtimages/1_02_02_02_02_03.jpg" width="13" height="183" alt=""></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_02_02_03.jpg" width="758" height="11" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table id="Table3" width="758" height="236" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="758" background="qtimages/1_02_02_02_01.jpg" style="height: 42px">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="5%">
                                        &nbsp;</td>
                                    <td width="95%" class="STYLE2">
                                        系统简介</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table id="Table1" width="758" height="183" border="0" cellpadding="0" cellspacing="0" class=newsline>
                                <tr>
                                    <td background="qtimages/1_02_02_02_02_01.jpg" width="12">
                                        <img src="qtimages/1_02_02_02_02_01.jpg" width="12" height="183" alt=""></td>
                                    <td width="733" height="183"><%=ncontent %>
                                    </td>
                                    <td background="qtimages/1_02_02_02_02_03.jpg" width="13">
                                        <img src="qtimages/1_02_02_02_02_03.jpg" width="13" height="183" alt=""></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="qtimages/1_02_02_02_03.jpg" width="758" height="11" alt=""></td>
                    </tr>
                </table>
                </td>
              </tr>
            </table></td>
          </tr>
        </table></td>
	</tr>
	<tr>
		<td style="height: 134px">
            <uc2:qtdown ID="Qtdown1" runat="server" />
        </td>
	</tr>
</table>
    </div></form>
</body>
</html>
