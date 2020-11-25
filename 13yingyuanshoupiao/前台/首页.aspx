<%@ Page Language="C#" AutoEventWireup="true" CodeFile="首页.aspx.cs" Inherits="前台_首页" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Rainbow影院网上购票系统</title>
    <style type="text/css">
        .style1
        {
            width: 198px;
        }
        .style2
        {
            height:150px;
            width: 957px;
        }
        .style3
        {
            height: 403px;
            width: 957px;
            font-size: xx-large;
            font-family: 黑体;
            text-align: center;
        }
        .style4
        {
            width: 957px;
        }
        .style5
        {
            height: 33px;
            width: 956px;
            text-align: left;
        }
        .style6
        {
            width: 200px;
            height: 108px;
        }
        .style8
        {
            width: 259px;
        }
        .style9
        {
            height: 280px;
            width: 100%;
        }
    </style>
</head>
<body bgcolor="#cccccc">
    <form id="form1" runat="server">
  <table width="80%" border="0" align="center" bgcolor="#CCCCCC">
    <tr>
      <td class="style3">
          <img alt="" src="image/0.jpg" class="style9"/><br />
          <div id="Div1">
              <font color="blue" size="20">Rainbow影院网上购票系统</font>
          </div>
          <div id="navi" class="style5">
              <font color="brown" size="5" style="text-align: left">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click" 
                  PostBackUrl="~/前台/首页.aspx"><font color="brown" size="5" style="text-align: left" >影院首页</font></asp:LinkButton>
              |<asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/前台/热门.aspx" ><font color="brown" size="5" style="text-align: left">热门推荐</font></asp:LinkButton>
              |<asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/预告抢先.aspx"><font color="brown" size="5" style="text-align: left">预告抢先</font></asp:LinkButton>
              |<asp:LinkButton ID="LinkButton6" runat="server" onclick="LinkButton6_Click" 
                  onclientclick="alert(&quot;团购优惠:一次性购买10张以上可享受八折优惠！&quot;)"><font color="brown" size="5" style="text-align: left">心动折扣</font></asp:LinkButton>
              |<asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="~/Index.aspx"><font color="brown" size="5" style="text-align: left">影片分类</font></asp:LinkButton>
              |<asp:LinkButton ID="LinkButton1" 
                  runat="server" onclick="LinkButton1_Click" style="color: #990033">客户反馈</asp:LinkButton>
&nbsp;</font><label><asp:Button ID="login_btn" runat="server" Text="登录" 
                  onclick="login_btn_Click"/><asp:Button ID="register_btn" runat="server" Text="注册" 
              OnClick="register_btn_Click" /></label>
                  </div>
              </td>
    </tr>
    <tr>
      <td background="image/1.gif"  style="text-align: right" class="style2" 
            valign="baseline" align="justify">
      </td>
    </tr>
    <tr>
      <td class="style4">
      <table width="100%" border="0">
        <tr>
          <td height="100%" style="text-align: justify; vertical-align: top;" 
                class="style1">
          <table width="100%" border="0">
            <tr>
              <td style="text-align: center">&nbsp;<asp:Label ID="Label1" runat="server" 
                      Text="欢迎" Width="188px" Font-Size="Large" ForeColor="Red"></asp:Label>
                  <br />
                  <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" 
                      Text="游客" ForeColor="Red" style="background-color: #CCCCCC" 
                      BackColor="#CCCCCC"></asp:Label></td>
            </tr>
            <tr>
              <td style="text-align: center"><HR/></td>
            </tr>
            <tr>
              <td style="text-align: center">
                  <asp:Button ID="account_details_btn" 
                      runat="server" PostBackUrl="~/前台/账户详细.aspx"
                      Text="账 号 详 情" Visible="False" 
                      style="background-color: #3366FF; font-size: large; font-weight: 700;" 
                      Width="190px" onclick="account_details_btn_Click" /></td>
            </tr>
              <tr>
                  <td style="text-align: center">
                      <asp:Button ID="prepay_btn" runat="server" Text="账 号 充 值" 
                          Visible="False" PostBackUrl="~/前台/账户充值.aspx" 
                          style="background-color: #3366FF; font-size: large; font-weight: 700;" 
                          Width="190px" onclick="prepay_btn_Click" /></td>
              </tr>
              <tr>
                  <td style="text-align: center">
                      <asp:Button ID="Button_CheckCart" runat="server" 
                          PostBackUrl="~/前台/购物车.aspx" Text="查看购物车" 
                          Visible="False" 
                          style="background-color: #3366FF; font-size: large; font-weight: 700;" 
                          Width="190px" />
                  </td>
              </tr>
          </table>
                              <br />
                              <font color="brown" size="5">热映排行</font>
                              <ul>
                                  <li>1《金陵十三钗》<br />
                                      彩虹票价：￥50</li>
                                  <li>2《龙门飞甲》<br />
                                      彩虹票价：￥55</li>
                                  <li>3《倾城之泪》<br />
                                      彩虹票价：￥40</li>
                                  <li>4《那些年，我们一起追的女孩》<br />
                                      彩虹票价：￥50</li>
                                  <li>5《失恋33天》<br />
                                      彩虹票价：￥50</li>
                                  <li>6《暮光之城4》<br />
                                      彩虹票价：￥55</li>
                                  <li>7《开心魔法》<br />
                                      彩虹票价：￥55</li>
                                  <li>8《东成西就2011》<br />
                                      彩虹票价：￥40</li>
                                  <li>9《星空》<br />
                                      彩虹票价：￥50</li>
                                  <li>10《猩球崛起》<br />
                                      彩虹票价：￥50</li>
                              </ul>
                              <font color="brown" size="5">友情链接</font>
                              <ul>
                                  <li><a href="http://v.sogou.com/top/movie/index.html">搜狗影院</a></li>
                                  <li><a href="http://www.tudou.com">土豆视频</a></li>
                                  <li><a href="http://www.youku.com">优酷视频</a></li>
                                  <li><a href="http://v.pptv.com">皮皮影视</a></li>
                              </ul>
                              <br />
                              <asp:Button ID="Button25" runat="server" Height="30px" Text="管理员登录" 
                                  Width="133px" PostBackUrl="~/后台/员工登陆.aspx" 
                              style="font-weight: 700; background-color: Gray" 
                  BackColor="Gray" onclick="Button25_Click" />
          </td>
          <td width="80%" height="100%" style="text-align: center">
          <table border="0">
              <tr>
                  <td class="style6">
                      <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/前台/image/惊悚片.jpg" 
                          PostBackUrl="~/前台/电影分类.aspx?class=1" />
                  </td>
                  <td class="style6">
                      <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/前台/image/动作片.jpg" 
                          PostBackUrl="~/前台/电影分类.aspx?class=2" />
                  </td>
                  <td class="style6">
                      <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/前台/image/喜剧片.jpg" 
                          PostBackUrl="~/前台/电影分类.aspx?class=3" />
                  </td>
                  <td class="style6">
                  &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/前台/image/文艺片.jpg" 
                          PostBackUrl="~/前台/电影分类.aspx?class=4" />
              </tr>
  <tr>
    <td style="width: 200px">
        <asp:ImageButton ID="Image_1" runat="server" 
            Height="200px" Width="150px" ImageUrl="image/1.jpg" BorderStyle="Double" 
            BorderWidth="3px" onclick="btn_detail_1_Click" Visible="False" /></td>
    <td class="style8">
        <asp:ImageButton ID="Image_2" runat="server" Height="200px" Width="150px" 
            BorderStyle="Double" BorderWidth="3px" ImageUrl="image/2.jpg" 
            onclick="Button1_Click1" /></td>
    <td style="width: 200px">
        <asp:ImageButton ID="Image_3" runat="server" 
            Height="200px" Width="150px" BorderStyle="Double" BorderWidth="3px" 
            ImageUrl="image/3.jpg" onclick="btn_detail_3_Click" Visible="False" /></td>
      <td style="width: 200px">
          <asp:ImageButton ID="Image_4" runat="server" Height="200px" Width="150px" 
              ImageUrl="image/4.jpg" BorderStyle="Double" BorderWidth="3px" 
              onclick="btn_detail_4_Click" Visible="False" /></td>
  </tr>
  <tr>
    <td style="width: 200px">
    <table width="100%" border="0">
  <tr>
    <td style="text-align: center">
        <asp:Label ID="lab_moviename_1" runat="server" Font-Bold="True" 
            Font-Names="Arial" Visible="False"></asp:Label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
        <asp:Button ID="btn_detail_1" runat="server" Text="详情" 
            onclick="btn_detail_1_Click" Visible="False" />
        <asp:Button ID="btn_addCart_1" runat="server" Text="下单" 
            onclick="btn_addCart_1_Click" Visible="False" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
        <asp:Label ID="Label_id_1" runat="server" Visible="False"></asp:Label>
      </td>
    <td>&nbsp;</td>
  </tr>
  </table>
</td>
    <td class="style8">
        <table width="100%" border="0">
  <tr>
    <td><asp:Label ID="lab_moviename_2" runat="server" Font-Bold="True" 
            Font-Names="Arial" Visible="False"></asp:Label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><asp:Button ID="btn_detail_2" runat="server" Text="详情" 
            onclick="Button1_Click1" Visible="False" />
        <asp:Button ID="btn_addCart_2" runat="server" Text="下单" 
            onclick="btn_addCart_2_Click" Visible="False" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
        <asp:Label ID="Label_id_2" runat="server" Visible="False"></asp:Label>
      </td>
    <td>&nbsp;</td>
  </tr>
  </table>
    </td>
    <td style="width: 200px">    <table width="100%" border="0">
  <tr>
    <td><asp:Label ID="lab_moviename_3" runat="server" Font-Bold="True" 
            Font-Names="Arial" Visible="False"></asp:Label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><asp:Button ID="btn_detail_3" runat="server" Text="详情" 
            onclick="btn_detail_3_Click" Visible="False" />
        <asp:Button ID="btn_addCart_6" runat="server" Text="下单" 
            onclick="btn_addCart_6_Click" Visible="False" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
        <asp:Label ID="Label_id_3" runat="server" Visible="False"></asp:Label>
      </td>
    <td>&nbsp;</td>
  </tr>
  </table></td>
      <td style="width: 200px">
          <table width="100%" border="0">
              <tr>
                  <td>
                      <asp:Label ID="lab_moviename_4" runat="server" Font-Bold="True" 
                          Font-Names="Arial" Visible="False"></asp:Label></td>
                  <td>
                      &nbsp;</td>
              </tr>
              <tr>
                  <td>
                      <asp:Button ID="btn_detail_4" runat="server" Text="详情" 
                          onclick="btn_detail_4_Click" style="height: 26px" Visible="False" />
                      <asp:Button ID="btn_addCart_4" runat="server" Text="下单" 
                          onclick="btn_addCart_4_Click" Visible="False" /></td>
                  <td>
                      &nbsp;</td>
              </tr>
              <tr>
                  <td>
                      <asp:Label ID="Label_id_4" runat="server" Visible="False"></asp:Label>
                  </td>
                  <td>
                      &nbsp;</td>
              </tr>
              </table>
      </td>
  </tr>
  <tr>
    <td style="width: 200px">
        <asp:ImageButton ID="Image_5" runat="server" 
            Height="200px" Width="150px" ImageUrl="image/5.jpg" BorderStyle="Double" 
            BorderWidth="3px" onclick="btn_detail_5_Click" Visible="False" />
                  </td>
    <td class="style8">    
        <asp:ImageButton ID="Image_6" runat="server" Height="200px" Width="150px" 
            ImageUrl="image/6.jpg" BorderStyle="Double" BorderWidth="3px" 
            onclick="btn_detail_6_Click" Visible="False" /></td>
    <td style="width: 200px">
        <asp:ImageButton ID="Image_7" runat="server" 
            Height="200px" Width="150px" ImageUrl="image/7.jpg" BorderStyle="Double" 
            BorderWidth="3px" onclick="btn_detail_7_Click" Visible="False" /></td>
      <td style="width: 200px">
          <asp:ImageButton ID="Image_8" runat="server" Height="200px" Width="150px" 
              ImageUrl="image/8.jpg" BorderStyle="Double" BorderWidth="3px" 
              onclick="btn_detail_8_Click" Visible="False" /></td>
  </tr>
              <tr>
                  <td style="width: 200px">
                      <table width="100%" border="0">
  <tr>
    <td>
                              <asp:Label ID="lab_moviename_5" runat="server" Font-Bold="True" 
            Font-Names="Arial" Visible="False"></asp:Label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
                              <asp:Button ID="btn_detail_5" runat="server" Text="详情" 
            onclick="btn_detail_5_Click" style="height: 26px" Visible="False" />
        <asp:Button ID="btn_addCart_5" runat="server" Text="下单" 
            onclick="btn_addCart_5_Click" Visible="False" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
        <asp:Label ID="Label_id_5" runat="server" Visible="False"></asp:Label>
      </td>
    <td>&nbsp;</td>
  </tr>
  </table>
                  </td>
                  <td class="style8">
                          <table width="100%" border="0">
  <tr>
    <td><asp:Label ID="lab_moviename_6" runat="server" Font-Bold="True" 
            Font-Names="Arial" Visible="False"></asp:Label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><asp:Button ID="btn_detail_6" runat="server" Text="详情" 
            onclick="btn_detail_6_Click" Visible="False" />
        <asp:Button ID="btn_addCart_3" runat="server" Text="下单" 
            onclick="btn_addCart_3_Click" Visible="False" Width="40px" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
        <asp:Label ID="Label_id_6" runat="server" Visible="False"></asp:Label>
      </td>
    <td>&nbsp;</td>
  </tr>
  </table>
                  </td>
                  <td style="width: 200px"><table width="100%" border="0">
                      <tr>
                          <td>
                              <asp:Label ID="lab_moviename_7" runat="server" Font-Bold="True" 
                                  Font-Names="Arial" Visible="False"></asp:Label></td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td>
                              <asp:Button ID="btn_detail_7" runat="server" Text="详情" 
                                  onclick="btn_detail_7_Click" Visible="False" />
                              <asp:Button ID="btn_addCart_7" runat="server" Text="下单" 
                                  onclick="btn_addCart_7_Click" Visible="False" /></td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td>
                              <asp:Label ID="Label_id_7" runat="server" Visible="False"></asp:Label>
                          </td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      </table>
                  </td>
                  <td style="width: 200px">
                      <table width="100%" border="0">
                          <tr>
                              <td>
                                  <asp:Label ID="lab_moviename_8" runat="server" Font-Bold="True" 
                                      Font-Names="Arial" Visible="False"></asp:Label></td>
                              <td>
                                  &nbsp;</td>
                          </tr>
                          <tr>
                              <td>
                                  <asp:Button ID="btn_detail_8" runat="server" Text="详情" 
                                      onclick="btn_detail_8_Click" Visible="False" />
                                  <asp:Button ID="btn_addCart_8" runat="server" Text="下单" 
                                      onclick="btn_addCart_8_Click" Visible="False" /></td>
                              <td>
                                  &nbsp;</td>
                          </tr>
                          <tr>
                              <td>
                                  <asp:Label ID="Label_id_8" runat="server" Visible="False"></asp:Label>
                              </td>
                              <td>
                                  &nbsp;</td>
                          </tr>
                          </table>
                  </td>
              </tr>
              <tr>
                  <td style="width: 200px">
                      <asp:ImageButton ID="Image_9" runat="server" 
            Height="200px" Width="150px" BorderStyle="Double" 
            BorderWidth="3px" onclick="btn_detail_9_Click" Visible="False" />
                  </td>
                  <td class="style8">

        <asp:ImageButton ID="Image_10" runat="server" Height="200px" Width="150px" 
                          BorderStyle="Double" BorderWidth="3px" 
            onclick="btn_detail_10_Click" Visible="False" />

                  </td>
                  <td style="width: 200px">
                      <asp:ImageButton ID="Image_11" runat="server" 
            Height="200px" Width="150px" BorderStyle="Double" 
            BorderWidth="3px" onclick="btn_detail_11_Click" Visible="False" />
                  </td>
                  <td style="width: 200px">
          <asp:ImageButton ID="Image_12" runat="server" Height="200px" Width="150px" 
                          BorderStyle="Double" BorderWidth="3px" 
              onclick="btn_detail_12_Click" Visible="False" />
                  </td>
              </tr>
                                  <tr>
                  <td style="width: 200px">
                      <table width="100%" border="0">
  <tr>
    <td><asp:Label ID="lab_moviename_9" runat="server" Font-Bold="True" 
            Font-Names="Arial" Visible="False"></asp:Label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><asp:Button ID="btn_detail_9" runat="server" Text="详情" 
            onclick="btn_detail_9_Click" style="height: 26px" Visible="False" />
        <asp:Button ID="btn_addCart_9" runat="server" Text="下单" 
            onclick="btn_addCart_9_Click" Visible="False" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
        <asp:Label ID="Label_id_9" runat="server" Visible="False"></asp:Label>
      </td>
    <td>&nbsp;</td>
  </tr>
  </table>
                  </td>
                  <td class="style8">
                          <table width="100%" border="0">
  <tr>
    <td><asp:Label ID="lab_moviename_10" runat="server" Font-Bold="True" 
            Font-Names="Arial"></asp:Label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><asp:Button ID="btn_detail_10" runat="server" Text="详情" 
            onclick="btn_detail_10_Click" Visible="False" />
        <asp:Button ID="btn_addCart_10" runat="server" Text="下单" 
            onclick="btn_addCart_10_Click" Visible="False" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
        <asp:Label ID="Label_id_10" runat="server" Visible="False"></asp:Label>
      </td>
    <td>&nbsp;</td>
  </tr>
  </table>
                  </td>
                  <td style="width: 200px"><table width="100%" border="0">
                      <tr>
                          <td>
                              <asp:Label ID="lab_moviename_11" runat="server" Font-Bold="True" 
                                  Font-Names="Arial" Visible="False"></asp:Label></td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td>
                              <asp:Button ID="btn_detail_11" runat="server" Text="详情" 
                                  onclick="btn_detail_11_Click" Visible="False" />
                              <asp:Button ID="btn_addCart_11" runat="server" Text="下单" 
                                  onclick="btn_addCart_11_Click" Visible="False" /></td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td>
                              <asp:Label ID="Label_id_11" runat="server" Visible="False"></asp:Label>
                          </td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      </table>
                  </td>
                  <td style="width: 200px">
                      <table width="100%" border="0">
                          <tr>
                              <td>
                                  <asp:Label ID="lab_moviename_12" runat="server" Font-Bold="True" 
                                      Font-Names="Arial" Visible="False"></asp:Label></td>
                              <td>
                                  &nbsp;</td>
                          </tr>
                          <tr>
                              <td>
                                  <asp:Button ID="btn_detail_12" runat="server" Text="详情" 
                                      onclick="btn_detail_12_Click" Visible="False" />
                                  <asp:Button ID="btn_addCart_12" runat="server" Text="下单" 
                                      onclick="btn_addCart_12_Click" Visible="False" /></td>
                              <td>
                                  &nbsp;</td>
                          </tr>
                          <tr>
                              <td>
                                  <asp:Label ID="Label_id_12" runat="server" Visible="False"></asp:Label>
                              </td>
                              <td>
                                  &nbsp;</td>
                          </tr>
                          </table>
                  </td>
                                  </tr>
</table>

          </td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td style="text-align: center" class="style4"><HR>Corporation:张家港市Rainbow影院网上购票系统© 
          版权所有 技术支持：江苏科技大学（张家港）<br />
          本网站所有资讯内容、广告信息，经书面同意，不得转载。<br />
          打造地区最优秀的电影网上购票平台----Rainbow影院网上购票系统 
          <br />
          服务热线：0512-58888888| 传真：0512-5888888<span lang="zh-cn">8</span></td>
    </tr>
  </table>
    </form>
</body>
</html>