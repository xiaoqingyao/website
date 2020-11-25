<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="news" EnableEventValidation="false"  %>

<%@ Register Src="qtleft.ascx" TagName="qtleft" TagPrefix="uc3" %>

<%@ Register Src="qtdown.ascx" TagName="qtdown" TagPrefix="uc2" %>

<%@ Register Src="qttop.ascx" TagName="qttop" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
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
		<td>
            <uc1:qttop ID="Qttop1" runat="server" />
        </td>
	</tr>
	<tr>
		<td><table id="Table2" width="978" height="785" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><uc3:qtleft ID="Qtleft1" runat="server" /></td>
              
    
            <td valign="top"><table id="Table12" width="758" height="785" border="0" cellpadding="0" cellspacing="0">
              
              <tr>
                <td height="785" valign="top"><table id="Table13" width="758" height="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="758" height="42" background="qtimages/1_02_02_02_01.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="5%">&nbsp;</td>
                        <td width="95%" class="STYLE2"><strong><%=lb %></strong></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="100%" valign="top"><table id="Table14" width="758" height="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td background="qtimages/1_02_02_02_02_01.jpg">&nbsp;</td>
                        <td width="733" height="183" valign="top" class=newsline>
                          <p align="center">
                              <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                  BorderWidth="0" ItemStyle-Height="25" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                  PageSize="25" ShowHeader="False" Width="100%">
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
                                              [<%#DataBinder.Eval(Container.DataItem, "leibie")%>] <a href='ggdetail.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'>
                                                  <%#DataBinder.Eval(Container.DataItem, "title") %>
                                              </a>
                                          </ItemTemplate>
                                      </asp:TemplateColumn>
                                      <asp:TemplateColumn>
                                          <ItemTemplate>
                                              被点击
                                              <%# DataBinder.Eval(Container.DataItem, "dianjilv")%>
                                              次
                                          </ItemTemplate>
                                      </asp:TemplateColumn>
                                      <asp:BoundColumn DataField="addtime" HeaderText="发布时间">
                                          <HeaderStyle Width="100px" />
                                      </asp:BoundColumn>
                                  </Columns>
                                  <PagerStyle NextPageText="下一页" PrevPageText="上一页" />
                                  <ItemStyle Height="25px" />
                              </asp:DataGrid>&nbsp;</p></td>
                        <td width="13" background="qtimages/1_02_02_02_02_03.jpg">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="11"><img src="qtimages/1_02_02_02_03.jpg" width="758" height="11" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table></td>
	</tr>
	<tr>
		<td>
            <uc2:qtdown ID="Qtdown1" runat="server" />
        </td>
	</tr>
</table>
    </div></form>
</body>
</html>

