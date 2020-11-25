<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MovieDetail.aspx.cs" Inherits="前台_MovieDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Rainbow影院网上购票系统</title>
    <style type="text/css">
        .style1
        {
            text-align: justify;
            z-index: 1;
            font-weight: bold;
            width: 116px;
            height: 46px;
        }
        .style2
        {
            height: 21px;
            width: 116px;
        }
        .style3
        {
            width: 116px;
            height: 45px;
        }
        .style4
        {
            height: 11px;
            width: 116px;
        }
        .style5
        {
            width: 116px;
            font-weight: bold;
            height: 44px;
        }
        .style6
        {
            width: 671px;
        }
        .style7
        {
            width: 116px;
            height: 46px;
        }
        .style8
        {
            height: 46px;
        }
        .style9
        {
            height: 45px;
        }
        .style10
        {
            height: 44px;
        }
        .style11
        {
            text-align: justify;
            z-index: 1;
            font-weight: bold;
            width: 116px;
        }
        .style12
        {
            height: 21px;
            width: 316px;
        }
        .style13
        {
            width: 316px;
        }
        .style14
        {
            height: 11px;
            width: 316px;
        }
    </style>
</head>
<body bgcolor="#cccccc">
    <form id="form1" runat="server">
  <table width="80%" border="0" align="center" style="margin-right: 35px">
    <tr>
      <td height="180" class="style6"><img alt="" src="image/0.jpg" style="width: 100%"/></td>
    </tr>
    <tr>
      <td background="image/27.jpg" style="text-align: right" class="style6"><label>
          <asp:Button ID="login_btn" runat="server" Text="登录" 
              onclick="login_btn_Click" PostBackUrl="~/前台/Login.aspx" />
          <asp:Button ID="register_btn" runat="server" Text="注册" 
              PostBackUrl="~/前台/Register.aspx" /></label></td>
    </tr>
    <tr>
      <td class="style6">
      <table width="100%" border="0">
        <tr>
          <td width="20%" height="100%" style="text-align: justify; vertical-align: top;">
          <table width="100%" border="0">
            <tr>
              <td style="text-align: center">&nbsp;<asp:Label ID="Label1" runat="server" 
                      Text="欢迎" Width="188px" Font-Size="Large" 
                      style="font-weight: 700; color: #FF0000"></asp:Label>
                  <br />
                  <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" 
                      Text="游客" style="color: #FF0000"></asp:Label></td>
            </tr>
            <tr>
              <td style="text-align: center"><HR/></td>
            </tr>
            <tr>
                <td style="color: #FF0000">&nbsp;
                </td>
            </tr>
            <tr>
              <td style="text-align: center">
                  <br />
          <asp:Image ID="Image1" runat="server" Height="218px" Width="171px" />
                  <br />
                  <br />
                  <br />
                  <br />
                </td>
            </tr>
              </table>
          </td>
          <td width="60%" height="100%" style="text-align: center">
          <table border="0" style="height: 383px; width: 100%">
              <tr>
                  <td class="style12">
                      <span style="font-size: 32pt; font-family: Arial">
          <asp:Label ID="movieName_lab" runat="server" Font-Bold="True" 
              Font-Size="XX-Large"></asp:Label>
                      </span>
                      <br />
                      简介：</td>
                  <td class="style2">
                  </td>
                  <td style="width: 127px; height: 21px;">
                  </td>
                  <td style="width: 156px; height: 21px;">
                  </td>
              </tr>
  <tr>
      <td rowspan="6" class="style13">
          <asp:Label ID="Label_jianjie" runat="server" Text="Label"></asp:Label>
      </td>
  </tr><tr>
  <td class="style1">    &nbsp;</td>
      <td colspan="2" style="text-align: justify" class="style8">
          &nbsp;</td></tr>
  <tr>
    <td class="style11">    导演：</td>
      <td colspan="2" style="text-align: justify">
          <asp:Label ID="Lab_director" runat="server" Text="lab_director"></asp:Label>
                                    </td>
  </tr>
              <tr>
                  <td style="text-align: left;" class="style3">
                      <b>主演：</b></td>
                  <td colspan="2" style="text-align: justify" class="style9">
                      <asp:Label ID="Lab_leadingActor" runat="server" Text="Label"></asp:Label>
                                    </td>
              </tr>
              <tr>
                  <td style="vertical-align: top; text-align: left; font-weight: 700;" 
                      class="style7">
                      &nbsp;</td>
                  <td colspan="2" style="vertical-align: top; text-align: justify" class="style8">
                      &nbsp;</td>
              </tr>
              <tr>
                  <td style="vertical-align: top; text-align: left" class="style5">
                      票价：</td>
                  <td colspan="2" style="vertical-align: top; text-align: justify" 
                      class="style10">
                      ￥<asp:Label ID="Lab_Price" runat="server" Text="Label"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td style="height: 11px;" colspan="3"><HR/>
                  </td>
              </tr>
              <tr>
                  <td colspan="2" style="height: 11px">
                      <asp:Button ID="Button1" runat="server" PostBackUrl="~/前台/首页.aspx" Text="返回首页" 
                          style="font-weight: 700" /></td>
                  <td style="width: 156px; height: 11px">
                      <asp:Button ID="Button2" runat="server" Text="加入购物车" 
                          onclick="Button2_Click" Height="26px" style="font-weight: 700" 
                          Width="92px" Visible="False" /></td>
              </tr>
              <tr>
                  <td class="style14">
                  </td>
                  <td class="style4">
                  </td>
                  <td style="width: 127px; height: 11px">
                      <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/前台/购物车.aspx">前往购物车</asp:HyperLink>
                  </td>
                  <td style="width: 156px; height: 11px">
                  </td>
              </tr>
              <tr>
                  <td class="style14">
                  </td>
                  <td class="style4">
                  </td>
                  <td style="width: 127px; height: 11px">
                  </td>
                  <td style="width: 156px; height: 11px">
                  </td>
              </tr>
</table>

          </td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td style="text-align: center" class="style6"><HR>Corporation:张家港市Rainbow影院网上购票系统© 版权所有 技术支持：江苏科技大学（张家港）<br/>
          本网站所有资讯内容、广告信息，未经书面同意，不得转载。<br/> 
          打造地区最优秀的电影网上购票平台----Rainbow影院网上购票系统  <br/>
          服务热线：0512-58888888| 传真：0512-58888888</td>
    </tr>
  </table>
    </form>
</body>
</html>>
