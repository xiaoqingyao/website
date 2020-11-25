<%@ Page Language="C#" AutoEventWireup="true" CodeFile="yingpianlist.aspx.cs" Inherits="yingpianlist" %>

<%@ Register src="tHead.ascx" tagname="head" tagprefix="uc2" %>
<%@ Register Src="qtleft.ascx" TagName="qtleft" TagPrefix="uc3" %>
<%--<%@ Register src="ascx/foot.ascx" tagname="foot" tagprefix="uc3" %>
<%@ Register src="ascx/category.ascx" tagname="category" tagprefix="uc4" %>
<%@ Register src="ascx/product_click.ascx" tagname="product_click" tagprefix="uc5" %>
<%@ Register src="ascx/product_by_category.ascx" tagname="product_by_category" tagprefix="uc6" %>
<%@ Register src="ascx/category_2.ascx" tagname="category_2" tagprefix="uc7" %>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>影院在线订票系统</title>
<link href="style/common.css" rel="stylesheet" type="text/css" />
<link href="style/index.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.2.6.pack.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="js/indexhome.js"></script>
<script language="javascript" type="text/javascript" src="js/flash.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $($("ul.navigation a")[0]).addClass('hover');
    });
</script>
</head>
<body>
<form id="form1" runat="server">
<uc2:head ID="head1" runat="server" />

<!-- /end banner -->
<div class="defaultMain">
 <div class="defaultMainLeft">
                <uc3:qtleft ID="Qtleft1" runat="server" />
 
 </div>
 <!-- /end defaultMainLeft -->
 <div class="defaultMainRight">
 <table id="Table6" width="684" border="0" cellpadding="0" cellspacing="0" style="height: 566px">
              <tr>
                <td width="684" background="qtimages/index_04_02_01.gif" style="height: 37px"><table width="100%" height="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="19%" align="center" valign="bottom" class="STYLE1">
                        影片列表</td>
                    <td width="81%">&nbsp;</td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="100%" valign="top">
                    <table id="search" align="center" border="1" bordercolor="#cccccc" cellpadding="0"
                        cellspacing="1" class="table_1" width="98%">
                        <tbody>
                            <tr class="tr2">
                                <td bgcolor="#f1f8f5" style="padding-left: 5px; height: 25px">
                                    所有影片信息列表</td>
                            </tr>
                            <tr class="tr1">
                                <td style="padding-left: 5px; height: 25px">
                                    &nbsp;编号：<asp:TextBox ID="bh" runat="server"></asp:TextBox>影片名称：<asp:TextBox ID="mc"
                                        runat="server"></asp:TextBox>&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click"
                                            Text="查找" /><span style="color: #0000ff; text-decoration: underline"> </span>
                                    <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AllowSorting="True"
                                        AutoGenerateColumns="False" BorderColor="Black" CellPadding="2" font-name="verdana"
                                        Font-Names="verdana" Font-Size="8pt" HeaderStyle-BackColor="#F8FAFC" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                        PageSize="8" Width="100%">
                                        <EditItemStyle BackColor="#E9F0F8" CssClass="input_text" Font-Bold="False" Font-Italic="False"
                                            Font-Overline="False" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False"
                                            HorizontalAlign="Left" VerticalAlign="Middle" Wrap="False" />
                                        <PagerStyle Font-Bold="True" Font-Names="宋体" ForeColor="Blue" HorizontalAlign="Right"
                                            NextPageText="下一页" PrevPageText="上一页" />
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
                                            <asp:BoundColumn DataField="bianhao" HeaderText="编号"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="yingpianmingcheng" HeaderText="影片名称"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="shangyingshijian" HeaderText="上映时间"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="piaoshu" HeaderText="票数"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="yingpianleixing" HeaderText="影片类型"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="piaojia" HeaderText="票价"></asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="详细">
                                                <ItemTemplate>
                                                    <a href='yingpian_detail.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'>详细</a>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                        </Columns>
                                    </asp:DataGrid></td>
                            </tr>
                            <tr class="tr1">
                                <td bgcolor="#f1f8f5" style="padding-left: 5px; height: 25px">
                                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                    <a href="#" onclick="javascript:window.print();">打印本页</a></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
              </tr>
            </table>
 </div>
 <!-- /end defaultMainRight -->
</div>
<!-- /end defaultMain -->
<div class="banner"></div>
<!-- /end banner -->
<%--<uc1:help ID="help1" runat="server" />--%>    
<!-- /end help -->
<%--<uc3:foot ID="foot1" runat="server" />--%>
    </form>
</body>
</html>

