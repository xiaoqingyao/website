<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jiudianxinxidetail.aspx.cs" Inherits="jiudianxinxidetail" %>

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
                        <td width="95%" class="STYLE2"><strong>酒店详细</strong></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="100%" valign="top"><table id="Table14" width="758" height="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td background="qtimages/1_02_02_02_02_01.jpg">&nbsp;</td>
                        <td width="733" height="183" valign="top" class=newsline>
                          <p align="center">
                              <table align="center" border="1" bordercolordark="#9cc7ef" bordercolorlight="#145aa0"
                                  cellpadding="4" cellspacing="0" width="95%">
                                  <tr>
                                      <td align="left" width="11%">
                                          编号：</td>
                                      <td align="left" width="39%">
                                          <%=nbianhao%>
                                      </td>
                                      <td align="center" colspan="2" rowspan="5">
                                          <img src="<%=nzhaopian%>" style="width: 268px; height: 244px" />
                                      </td>
                                  </tr>
                                  <tr>
                                      <td align="left" width="11%">
                                          名称：</td>
                                      <td align="left" width="39%">
                                          <%=nmingcheng%>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td align="left" width="11%">
                                          地址：</td>
                                      <td align="left" width="39%">
                                          <%=ndizhi%>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td align="left" width="11%">
                                          星级：</td>
                                      <td align="left" width="39%">
                                          <%=nxingji%>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td align="left" width="11%">
                                          电话：</td>
                                      <td align="left" width="39%">
                                          <%=ndianhua%>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td align="left" style="height: 117px" width="11%">
                                          备注：</td>
                                      <td align="left" colspan="3" style="height: 117px">
                                          <%=nbeizhu%>
                                          &nbsp;&nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td align="center" colspan="4" height="25" nowrap="nowrap">
                                          <asp:DataGrid ID="DataGrid1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                              BorderColor="Black" CellPadding="2" font-name="verdana" Font-Names="verdana"
                                              Font-Size="8pt" HeaderStyle-BackColor="#F8FAFC" PageSize="6" Width="100%">
                                              <EditItemStyle BackColor="#E9F0F8" CssClass="input_text" Font-Bold="False" Font-Italic="False"
                                                  Font-Overline="False" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False"
                                                  HorizontalAlign="Left" VerticalAlign="Middle" Wrap="False" />
                                              <PagerStyle Font-Bold="True" Font-Names="宋体" ForeColor="Blue" HorizontalAlign="Right"
                                                  Mode="NumericPages" NextPageText="下一页" PrevPageText="上一页" />
                                              <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                  Font-Underline="False" HorizontalAlign="Center" />
                                              <HeaderStyle BackColor="#F8FAFC" Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                                              <Columns>
                                                  <asp:TemplateColumn HeaderText="序号">
                                                      <ItemTemplate>
                                                          <%#Container.ItemIndex+1 %>
                                                      </ItemTemplate>
                                                      <HeaderStyle Width="50px" />
                                                  </asp:TemplateColumn>
                                                  <asp:BoundColumn DataField="kefangbianhao" HeaderText="客房编号"></asp:BoundColumn>
                                                  <asp:BoundColumn DataField="leixing" HeaderText="类型"></asp:BoundColumn>
                                                  <asp:BoundColumn DataField="daxiao" HeaderText="大小"></asp:BoundColumn>
                                                  <asp:BoundColumn DataField="jiage" HeaderText="价格"></asp:BoundColumn>
                                                  <asp:BoundColumn DataField="beizhu" HeaderText="备注"></asp:BoundColumn>
                                                  <asp:TemplateColumn HeaderText="预订">
                                                      <ItemTemplate>
                                                          <a href='jiudianyuding.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'>预订</a>
                                                      </ItemTemplate>
                                                  </asp:TemplateColumn>
                                              </Columns>
                                          </asp:DataGrid></td>
                                  </tr>
                                  <tr>
                                      <td align="center" colspan="4" height="25" nowrap="nowrap">
                                          &nbsp;<font face="宋体"> <a href="javascript:history.back();"><span style="color: #0000ff;
                                              text-decoration: underline">返回</span></a></font></td>
                                  </tr>
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

