<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%--<%@ Register src="ascx/help.ascx" tagname="help" tagprefix="uc1" %>--%>
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
  <div class="thelistone">
   <div class="slide">
   <script type="text/javascript">
       function getId(id) { return document.getElementById(id); }
       function addLoadEvent(func) {
           var oldonload = window.onload;
           if (typeof window.onload != 'function') {
               window.onload = func;
           } else {
               window.onload = function () {
                   oldonload();
                   func();
               }
           }
       }
       function moveElement(elementID, final_x, final_y, interval) {
           if (!document.getElementById) return false;
           if (!document.getElementById(elementID)) return false;
           var elem = document.getElementById(elementID);
           if (elem.movement) {
               clearTimeout(elem.movement);
           }
           if (!elem.style.left) {
               elem.style.left = "0px";
           }
           if (!elem.style.top) {
               elem.style.top = "0px";
           }
           var xpos = parseInt(elem.style.left);
           var ypos = parseInt(elem.style.top);
           if (xpos == final_x && ypos == final_y) {
               return true;
           }
           if (xpos < final_x) {
               var dist = Math.ceil((final_x - xpos) / 10);
               xpos = xpos + dist;
           }
           if (xpos > final_x) {
               var dist = Math.ceil((xpos - final_x) / 10);
               xpos = xpos - dist;
           }
           if (ypos < final_y) {
               var dist = Math.ceil((final_y - ypos) / 10);
               ypos = ypos + dist;
           }
           if (ypos > final_y) {
               var dist = Math.ceil((ypos - final_y) / 10);
               ypos = ypos - dist;
           }
           elem.style.left = xpos + "px";
           elem.style.top = ypos + "px";
           var repeat = "moveElement('" + elementID + "'," + final_x + "," + final_y + "," + interval + ")";
           elem.movement = setTimeout(repeat, interval);
       }
       function classNormal(iFocusBtnID, iFocusTxID) {
           var iFocusBtns = getId(iFocusBtnID).getElementsByTagName('li');
           var iFocusTxs = getId(iFocusTxID).getElementsByTagName('li');
           for (var i = 0; i < iFocusBtns.length; i++) {
               iFocusBtns[i].className = 'normal';
               iFocusTxs[i].className = 'normal';
           }
       }
       function classCurrent(iFocusBtnID, iFocusTxID, n) {
           var iFocusBtns = getId(iFocusBtnID).getElementsByTagName('li');
           var iFocusTxs = getId(iFocusTxID).getElementsByTagName('li');
           iFocusBtns[n].className = 'current';
           iFocusTxs[n].className = 'current';
       }
       function iFocusChange() {
           if (!getId('ifocus')) return false;
           getId('ifocus').onmouseover = function () { atuokey = true };
           getId('ifocus').onmouseout = function () { atuokey = false };
           var iFocusBtns = getId('ifocus_btn').getElementsByTagName('li');
           var listLength = iFocusBtns.length;
           iFocusBtns[0].onmouseover = function () {
               moveElement('ifocus_piclist', 0, 0, 5);
               classNormal('ifocus_btn', 'ifocus_tx');
               classCurrent('ifocus_btn', 'ifocus_tx', 0);
           }
           if (listLength >= 2) {
               iFocusBtns[1].onmouseover = function () {
                   moveElement('ifocus_piclist', 0, -226, 5);
                   classNormal('ifocus_btn', 'ifocus_tx');
                   classCurrent('ifocus_btn', 'ifocus_tx', 1);
               }
           }
           if (listLength >= 3) {
               iFocusBtns[2].onmouseover = function () {
                   moveElement('ifocus_piclist', 0, -452, 5);
                   classNormal('ifocus_btn', 'ifocus_tx');
                   classCurrent('ifocus_btn', 'ifocus_tx', 2);
               }
           }
           if (listLength >= 4) {
               iFocusBtns[3].onmouseover = function () {
                   moveElement('ifocus_piclist', 0, -678, 5);
                   classNormal('ifocus_btn', 'ifocus_tx');
                   classCurrent('ifocus_btn', 'ifocus_tx', 3);
               }
           }
           if (listLength >= 5) {
               iFocusBtns[4].onmouseover = function () {
                   moveElement('ifocus_piclist', 0, -904, 5);
                   classNormal('ifocus_btn', 'ifocus_tx');
                   classCurrent('ifocus_btn', 'ifocus_tx', 4);
               }
           }
       }
       setInterval('autoiFocus()', 5000);
       var atuokey = false;
       function autoiFocus() {
           if (!getId('ifocus')) return false;
           if (atuokey) return false;
           var focusBtnList = getId('ifocus_btn').getElementsByTagName('li');
           var listLength = focusBtnList.length;
           for (var i = 0; i < listLength; i++) {
               if (focusBtnList[i].className == 'current') var currentNum = i;
           }
           if (currentNum == 0 && listLength != 1) {
               moveElement('ifocus_piclist', 0, -226, 5);
               classNormal('ifocus_btn', 'ifocus_tx');
               classCurrent('ifocus_btn', 'ifocus_tx', 1);
           }
           if (currentNum == 1 && listLength != 2) {
               moveElement('ifocus_piclist', 0, -452, 5);
               classNormal('ifocus_btn', 'ifocus_tx');
               classCurrent('ifocus_btn', 'ifocus_tx', 2);
           }
           if (currentNum == 2 && listLength != 3) {
               moveElement('ifocus_piclist', 0, -678, 5);
               classNormal('ifocus_btn', 'ifocus_tx');
               classCurrent('ifocus_btn', 'ifocus_tx', 3);
           }
           if (currentNum == 3 && listLength != 4) {
               moveElement('ifocus_piclist', 0, -904, 5);
               classNormal('ifocus_btn', 'ifocus_tx');
               classCurrent('ifocus_btn', 'ifocus_tx', 4);
           }
           if (currentNum == 4) {
               moveElement('ifocus_piclist', 0, 0, 5);
               classNormal('ifocus_btn', 'ifocus_tx');
               classCurrent('ifocus_btn', 'ifocus_tx', 0);
           }
           if (currentNum == 1 && listLength == 2) {
               moveElement('ifocus_piclist', 0, 0, 5);
               classNormal('ifocus_btn', 'ifocus_tx');
               classCurrent('ifocus_btn', 'ifocus_tx', 0);
           }
           if (currentNum == 2 && listLength == 3) {
               moveElement('ifocus_piclist', 0, 0, 5);
               classNormal('ifocus_btn', 'ifocus_tx');
               classCurrent('ifocus_btn', 'ifocus_tx', 0);
           }
       }
       addLoadEvent(iFocusChange);
  </script>
      <DIV id=ifocus>
        <DIV id=ifocus_pic>
          <DIV style="TOP: 0px; LEFT: 0px" id=ifocus_piclist>
            <UL>
              <LI><A href="#" target="_blank"><img alt=侏罗纪世界 src="images/tbanner1.jpg"></A></LI>
              <LI><A href="#" target="_blank"><img alt=钢铁侠 src="images/tbanner2.jpg"></A></LI>
              <LI><A href="#" target="_blank"><img alt=分手合约 src="images/tbanner3.jpg"></A></LI>
              <LI><A href="#" target="_blank"><img alt=变形金刚4 src="images/tbanner4.jpg"></A></LI>
              <li><a href="#" target="_blank"><img alt=寂静岭5 src="images/tbanner5.jpg" /></a></li>
            </UL>
          </DIV>
          <DIV id=ifocus_btn>
            <UL>
              <A href="#" target="_blank">
              <LI class=current>极乐空间</LI>
              </A> <A href="#" target="_blank">
              <LI class=current>蓝精灵2</LI>
              </A> <A href="#" target="_blank">
              <LI class=current>全民目击</LI>
              </A> <A href="#" target="_blank">
              <LI class=current>分手合约</LI>
              </A> <A href="#" target="_blank">
              <LI class=current>宫崎骏动画片</LI>
              </A>
            </UL>
          </DIV>
          <DIV id=ifocus_opdiv></DIV>
          <DIV style="DISPLAY: none" id=ifocus_tx>
            <UL>
              <A href="#" target="_blank">
              <LI  class=current>影院在线订票系统	</LI>
              </A> <A href="#" target="_blank">
              <LI  class=current>影院在线订票系统</LI>
              </A> <A href="#" target="_blank">
              <LI  class=current>素菲亚衣柜</LI>
              </A> <A href="#" target="_blank">
              <LI  class=current>LO.SUNG</LI>
              </A> <A href="#" target="_blank">
              <LI  class=current>东鹏洁具</LI>
              </A>
            </UL>
          </DIV>
        </DIV>
      </DIV>
   </div>
   <!-- /end slide -->
   <dl class="Notice">
    <dt>系统公告</dt>
    <dd>
    <marquee border="0" direction="up" height="138" onmouseout="start()" onmouseover="stop()"
                            scrollamount="1" scrolldelay="50"><TABLE 
            height="100%" cellSpacing=5 cellPadding=0 width="92%" align=center 
            border=0><TBODY><TR><TD><P>&nbsp;&nbsp;由杨乐乐担纲制作人的喜剧片《大人物》将于3月11日在全国上映，在娱乐圈沉浮了30多年的吴孟达终于变身男一号，在这部励志题材的电影里，他仿佛演的就是自己过往的种种经历。

昨日，《大人物》导演谭华带着主演吴孟达、李伯清来黄龙溪古镇为该片宣传造势，李伯清的徒弟们廖健、闵天浩、钟燕平、叮当、矮冬瓜也在片中出演重要戏份，他们也全来了，一桌混合了泡菜风味的无厘头喜剧大餐正式开席！</P></TD></TR></TBODY></TABLE></marquee>
    </dd>
   </dl>
   <!-- /end -->
  </div>
  <!-- /end thelistone -->
  <dl class="thelistwo">
   <dt><img src="images/icon-015.gif" alt="" /><%--<uc7:category_2 ID="category_21" 
           runat="server"  IsNew="true" />--%>
           
          
    </dt>
   
   <dd>
    <ul>
      <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" Height="100%"
                            ShowHeader="False" Width="100%">
                            <Columns>
                                <asp:TemplateColumn>
                                    <ItemTemplate>
                                        <img src="qtimages/4.gif">
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="标题">
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Left" />
                                    <ItemTemplate>
                                        [<%#DataBinder.Eval(Container.DataItem, "leibie") %>] <a href='ggdetail.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id") %>'>
                                            <%#DataBinder.Eval(Container.DataItem, "title") %>
                                        </a>
                                    </ItemTemplate>
                                    <HeaderStyle Width="200px" />
                                </asp:TemplateColumn>
                            </Columns>
                        </asp:DataGrid>
   <%-- <asp:Repeater ID="rNewsProduct" runat="server">
    <ItemTemplate>
        <li><a href='p_show.aspx?productId=<%#Eval("Id") %>' target="_blank"><img src='/upload-file/images/product/<%#GetImage(int.Parse(Eval("Id").ToString())).Image %>' alt='<%#GetImage(int.Parse(Eval("Id").ToString())).Alt %>' width="166px" height="166px" /></a><p><a href="p_show.aspx" target="_blank"><%#Eval("product_name") %></a></p><%#float.Parse(Eval("sale_price").ToString()).ToString("0") %>元<span>￥<%#float.Parse(Eval("price").ToString()).ToString("0") %>元</span></li>
    </ItemTemplate>
    </asp:Repeater>--%>
    </ul>
   </dd>
  </dl>
  <!-- /end thelistwo -->
  <dl class="thelisthree">
   <dt><img src="images/icon-016.gif" alt="" /><%--<uc7:category_2 ID="category_22" 
           runat="server" IsHot="true" />--%></dt>
   <dd>
    <ul>
   <%-- <asp:Repeater ID="rHotProduct" runat="server">
    <ItemTemplate>
        <li><a href='p_show.aspx?productId=<%#Eval("Id") %>'  target="_blank"><img src='/upload-file/images/product/<%#GetImage(int.Parse(Eval("Id").ToString())).Image %>' alt='<%#GetImage(int.Parse(Eval("Id").ToString())).Alt %>' width="166px" height="166px" /></a><p><a href="p_show.aspx"  target="_blank"><%#Eval("product_name") %></a></p><%#float.Parse(Eval("sale_price").ToString()).ToString("0") %>元<span>￥<%#float.Parse(Eval("price").ToString()).ToString("0") %>元</span></li>
    </ItemTemplate>
    </asp:Repeater>--%>
    </ul>
   </dd>
  </dl>
  <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" Width="100%">
                            <ItemTemplate>
                                <table width="120" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
  <tr>
    <td height="100" align="center"><a href='yingpian_detail.aspx?id=<%# Eval("id") %>' >
    <asp:Image ID="Image1" runat="server" Height="100" ImageUrl='<%# Eval("tupian") %>'
                                            Width="116" /></a></td>
  </tr>
  <tr>
    <td align="center"><asp:Label ID="Label1" runat="server" Text='<%# Eval("yingpianmingcheng") %>'></asp:Label></td>
  </tr>
</table>
                            </ItemTemplate>
                        </asp:DataList>
  <div class="banner"><img src="images/ad/adfile003.jpg" alt="" /></div>
  <!-- /end banner -->
  
  <!-- /end thelisthree -->
  <dl class="thelistfour">
   <dt><img src="images/icon-017.gif" alt="" /><%--<uc7:category_2 ID="category_23" 
           runat="server" IsDiscount="true"/>--%>
      </dt>
   <dd>
    <ul>
   我们网站给您带来了很多方便吧？呵呵！希望您能通过我站轻而易举足不出户地买到您喜欢的影片票据！<br />
                                
    </ul>
   </dd>
  </dl>
  <!-- /end thelistfour -->
 </div>
 <!-- /end defaultMainRight -->
</div>
<!-- /end defaultMain -->
<div class="banner"><a href="p_list.aspx?categoryId=783"><img src="images/ad/adfile004.jpg" alt="" /></a></div>
<!-- /end banner -->
<%--<uc1:help ID="help1" runat="server" />--%>    
<!-- /end help -->
<%--<uc3:foot ID="foot1" runat="server" />--%>
    </form>
</body>
</html>
