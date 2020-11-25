<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jipiaoxinxilist.aspx.cs" Inherits="jipiaoxinxilist" %>

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
                        <td width="95%" class="STYLE2"><strong>机票预订</strong></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="100%" valign="top"><table id="Table14" width="758" height="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td background="qtimages/1_02_02_02_02_01.jpg">&nbsp;</td>
                        <td width="733" height="183" valign="top" class=newsline>
                          <p align="center">
                              <table id="search" align="center" border="1" bordercolor="#cccccc" cellpadding="0"
                                  cellspacing="1" class="table_1" width="98%">
                                  <tbody>
                                      <tr class="tr1">
                                          <td style="padding-left: 5px; height: 25px">
                                              &nbsp;班机编号：<asp:TextBox ID="bh" runat="server"></asp:TextBox>出发城市：<asp:TextBox ID="mc"
                                                  runat="server"></asp:TextBox>
                                              到达城市：<asp:TextBox ID="ddcs" runat="server"></asp:TextBox>
                                              <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="查找" /><span
                                                  style="color: #0000ff; text-decoration: underline"> </span>
                                              <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AllowSorting="True"
                                                  AutoGenerateColumns="False" BorderColor="Black" CellPadding="2" font-name="verdana"
                                                  Font-Names="verdana" Font-Size="8pt" HeaderStyle-BackColor="#F8FAFC" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                  PageSize="8" Width="100%">
                                                  <HeaderStyle BackColor="#F8FAFC" Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                  <PagerStyle Font-Bold="True" Font-Names="宋体" ForeColor="Blue" HorizontalAlign="Right"
                                                      NextPageText="下一页" PrevPageText="上一页" />
                                                  <EditItemStyle BackColor="#E9F0F8" CssClass="input_text" Font-Bold="False" Font-Italic="False"
                                                      Font-Overline="False" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False"
                                                      HorizontalAlign="Left" VerticalAlign="Middle" Wrap="False" />
                                                  <Columns>
                                                      <asp:TemplateColumn HeaderText="序号">
                                                          <HeaderStyle Width="50px" />
                                                          <ItemTemplate>
                                                              <%#Container.ItemIndex+1 %>
                                                          </ItemTemplate>
                                                      </asp:TemplateColumn>
                                                      <asp:BoundColumn DataField="banjibianhao" HeaderText='班机编号'></asp:BoundColumn>
                                                      <asp:BoundColumn DataField="chufachengshi" HeaderText='出发城市'></asp:BoundColumn>
                                                      <asp:BoundColumn DataField="daodachengshi" HeaderText='到达城市'></asp:BoundColumn>
                                                      <asp:BoundColumn DataField="chufashijian" HeaderText='出发时间'></asp:BoundColumn>
                                                      <asp:BoundColumn DataField="daodashijian" HeaderText='到达时间'></asp:BoundColumn>
                                                      <asp:BoundColumn DataField="jiage" HeaderText='价格'></asp:BoundColumn>
                                                      <asp:TemplateColumn HeaderText="预订">
                                                          <ItemTemplate>
                                                              <a href='jipiaoyuding.aspx?banjibianhao=<%#DataBinder.Eval(Container.DataItem, "banjibianhao") %>&chufachengshi=<%#DataBinder.Eval(Container.DataItem, "chufachengshi") %>&daodachengshi=<%#DataBinder.Eval(Container.DataItem, "daodachengshi") %>'>
                                                                  预订</a>
                                                          </ItemTemplate>
                                                      </asp:TemplateColumn>
                                                  </Columns>
                                                  <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                      Font-Underline="False" HorizontalAlign="Center" />
                                              </asp:DataGrid></td>
                                      </tr>
                                      <tr class="tr1">
                                          <td bgcolor="#f1f8f5" style="padding-left: 5px; height: 25px">
                                              <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                              <a href="#" onclick="javascript:window.print();">打印本页</a></td>
                                      </tr>
                                  </tbody>
                              </table>
                              &nbsp;</p></td>
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

