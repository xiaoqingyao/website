<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fukuan.aspx.cs" Inherits="fukuan" %>

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
                                        <td width="684" background="qtimages/index_04_02_01.gif" style="height: 37px">
                                            <table width="100%" height="88%" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="19%" align="center" valign="bottom" class="STYLE1">
                                                        在线支付
                                                    </td>
                                                    <td width="81%">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="100%" valign="top">
                                            <table align="center" border="1" bordercolordark="#9cc7ef" bordercolorlight="#145aa0"
                                                cellpadding="4" cellspacing="0" width="100%">
                                                <tr>
                                                    <td style="padding-left: 5px; height: 25px">
                                                        <asp:DataGrid ID="DataGrid1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                                            BorderColor="Black" CellPadding="2" font-name="verdana" Font-Names="verdana"
                                                            Font-Size="8pt" HeaderStyle-BackColor="#F8FAFC" PageSize="8" Width="100%" AllowPaging="True">
                                                            <PagerStyle Font-Bold="True" Font-Names="宋体" ForeColor="Blue" HorizontalAlign="Right"
                                                                NextPageText="" PrevPageText="订单详情" />
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="序号">
                                                                    <HeaderStyle Width="50px" />
                                                                    <ItemTemplate>
                                                                        <%#Container.ItemIndex+1 %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="dingpiaoren" HeaderText='订票人'></asp:BoundColumn>
                                                                <asp:BoundColumn DataField="yingpianbianhao" HeaderText='影片编号'></asp:BoundColumn>
                                                                <asp:BoundColumn DataField="yingpianmingcheng" HeaderText='影片名称'></asp:BoundColumn>
                                                                <asp:BoundColumn DataField="fangyingshijian" HeaderText='放映时间'></asp:BoundColumn>
                                                                <asp:BoundColumn DataField="fangyingdidian" HeaderText='放映地点'></asp:BoundColumn>
                                                                <asp:BoundColumn DataField="zuowei" HeaderText='座位'></asp:BoundColumn>
                                                                <asp:BoundColumn DataField="piaojia" HeaderText='票价'></asp:BoundColumn>
                                                            </Columns>
                                                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                                Font-Underline="False" HorizontalAlign="Center" />
                                                        </asp:DataGrid>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text="使用网上银行支付:" valign="bottom" class="STYLE1"></asp:Label>
                                                        <div id="bankCardContainer" style="background-color: #f0f0f2; cellpadding: 4; cellspacing: 0;">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <input id="Radio1" type="radio" name="bankCard" value="1005" />
                                                                        <img src="qtimages/zhaoshang.jpg" />
                                                                    </td>
                                                                    <td>
                                                                        <input id="Radio2" type="radio" name="bankCard" value="1005" />
                                                                        <img src="qtimages/gongshang.jpg" />
                                                                    </td>
                                                                    <td>
                                                                        <input id="Radio3" type="radio" name="bankCard" value="1005" />
                                                                        <img src="qtimages/jianshe.jpg" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <input id="Radio4" type="radio" name="bankCard" value="1005" />
                                                                        <img src="qtimages/zhongguo.jpg" />
                                                                    </td>
                                                                    <td>
                                                                        <input id="Radio5" type="radio" name="bankCard" value="1005" />
                                                                        <img src="qtimages/nongye.jpg" />
                                                                    </td>
                                                                    <td>
                                                                        <input id="Radio6" type="radio" name="bankCard" value="1005" />
                                                                        <img src="qtimages/jiaotong.jpg" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <p class="pl18 mt5">
                                                            <a id="MoreBankBtn" href="#" onclick="return false;" _status="hide"></a>
                                                        </p>
                                                        <asp:Label ID="Label2" runat="server" Text="支付平台:" valign="bottom" class="STYLE1"></asp:Label>
                                                        <div id="Div1" style="background-color: #f0f0f2">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <input id="Radio7" type="radio" name="bankCard" value="1005" />
                                                                        <img src="qtimages/zhifubao.jpg" />
                                                                    </td>
                                                                    <td>
                                                                        <input id="Radio9" type="radio" name="bankCard" value="1005" />
                                                                        <img src="qtimages/kuaiqian.jpg" />
                                                                    </td>
                                                                    <td>
                                                                        <input id="Radio8" type="radio" name="bankCard" value="1005" />
                                                                        <img src="qtimages/yinlian.jpg" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <p class="tc mt15" align="center">
                                                            <input id="btnSubmit" type="button" class="btn_orange6 new_btn_orange" style="margin-left: -1px;"
                                                                value="付款" />
                                                        </p>
                                                    </td>
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

