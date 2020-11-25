<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dingdanlist.aspx.cs" Inherits="dingdanlist" %>

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
<%----%>
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
                        订单详情</td>
                    <td width="81%">&nbsp;</td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="100%" valign="top">
                    <table align="center" border="1" bordercolordark="#9cc7ef" bordercolorlight="#145aa0"
                        cellpadding="4" cellspacing="0" width="100%">
                        <tr>
                            <td style="padding-left: 5px; height: 25px">
                        &nbsp;影片编号：<asp:TextBox ID="bh" runat="server"></asp:TextBox>影片名称：<asp:TextBox ID="mc"
                            runat="server"></asp:TextBox>&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click"
                                Text="查找" />
                        <asp:DataGrid ID="DataGrid1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            BorderColor="Black" CellPadding="2" font-name="verdana" Font-Names="verdana"
                            Font-Size="8pt" HeaderStyle-BackColor="#F8FAFC" 
                           
                            PageSize="8" Width="100%" OnPageIndexChanged="DataGrid1_PageIndexChanged" AllowPaging="True">
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
                                <asp:BoundColumn DataField=dingpiaoren HeaderText='订票人'></asp:BoundColumn><asp:BoundColumn DataField=yingpianbianhao HeaderText='影片编号'></asp:BoundColumn><asp:BoundColumn DataField=yingpianmingcheng HeaderText='影片名称'></asp:BoundColumn><asp:BoundColumn DataField=fangyingshijian HeaderText='放映时间'></asp:BoundColumn><asp:BoundColumn DataField=fangyingdidian HeaderText='放映地点'></asp:BoundColumn><asp:BoundColumn DataField=zuowei HeaderText='座位'></asp:BoundColumn><asp:BoundColumn DataField=piaojia HeaderText='票价'></asp:BoundColumn>
                                
                                <asp:TemplateColumn HeaderText="付款">
                                <ItemTemplate>
                                    <a href='fukuan.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'
                                       >付款</a>
                                </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="退订">
                                 <ItemTemplate>
                                    <a href='delid.aspx?delid=<%#DataBinder.Eval(Container.DataItem, "id") %>&tablename=dingpiaojilu&npage=dingdanlist.aspx'
                                        onclick="return confirm('确定要退订？')">退订</a>
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

