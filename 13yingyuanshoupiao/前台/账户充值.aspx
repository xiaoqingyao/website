<%@ Page Language="C#" AutoEventWireup="true" CodeFile="账户充值.aspx.cs" Inherits="前台_账户充值" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Rainbow影院网上购票系统</title>
    <style type="text/css">
        .style1
        {
            font-size: x-large;
            font-weight: bold;
        }
        .style2
        {
            font-size: large;
            font-weight: bold;
            width: 235px;
        }
        .style3
        {
            width: 235px;
        }
        .style5
        {
            height: 11px;
            width: 189px;
        }
        .style6
        {
            width: 99%;
        }
        .style7
        {
            width: 76%;
        }
        .style8
        {
            height: 11px;
            width: 235px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
  <table border="0" align="center" bgcolor="#CCCCCC" class="style7">
    <tr>
      <td height="180"><img alt="" src="image/0.jpg" width="100%"/></td>
    </tr>
    <tr>
      <td background="image/27.jpg" style="text-align: right">&nbsp;</td>
    </tr>
    <tr>
      <td>
      <table border="0" class="style6">
        <tr>
          <td width="20%" height="100%" style="text-align: justify; vertical-align: top;">
          <table width="100%" border="0">
            <tr>
              <td style="text-align: center">&nbsp;<asp:Label ID="Label1" runat="server" 
                      Text="欢迎" Width="188px" Font-Size="Large" 
                      style="font-weight: 700; color: #FF0000"></asp:Label>
                  <br />
                  <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" 
                      Text="label" style="color: #FF0000"></asp:Label></td>
            </tr>
            <tr>
              <td style="text-align: center"><HR/></td>
            </tr>
            <tr>
              <td style="text-align: center">
                  <asp:Button ID="account_details_btn" 
                      runat="server" PostBackUrl="~/前台/账户详细.aspx"
                      Text="账 号 详 情" style="font-size: large; font-weight: 700" Width="180px" /></td>
            </tr>
              <tr>
                  <td style="text-align: center">
                      <asp:Button ID="Button_CheckCart" runat="server" 
                          PostBackUrl="~/前台/购物车.aspx" Text="查看购物车" 
                          style="font-size: large; font-weight: 700" Width="180px" />
                  </td>
              </tr>
              <tr>
                  <td style="text-align: center">
                      &nbsp;</td>
              </tr>
          </table>
          </td>
          <td width="60%" height="100%" style="text-align: center">
          <table border="0" class="style6">
              <tr>
                  <td colspan="3" style="height: 21px" class="style1">
                      账号充值</td>
              </tr>
              <tr>
                  <td style="vertical-align: top; text-align: left" class="style3">
                      <strong>
                      现有余额：</strong></td>
                  <td colspan="2" style="vertical-align: top; text-align: justify">
                      ￥<strong><asp:Label ID="Label_Balance" runat="server" Text="Label"></asp:Label>
                      </strong></td>
              </tr>
              <tr>
                  <td style="vertical-align: top; text-align: left" class="style2">
                      充值：</td>
                  <td colspan="2" style="vertical-align: top; text-align: justify">
                      $<asp:TextBox ID="TextBox_Recharge" runat="server" Width="103px">0.00</asp:TextBox></td>
              </tr>
              <tr>
                  <td style="height: 11px;" colspan="3"><HR/>
                  </td>
              </tr>
              <tr>
                  <td colspan="3" style="height: 11px">
                      <span style="font-size: 16pt"><strong>银行卡充值</strong></span></td>
              </tr>
              <tr>
                  <td style="text-align: right;" class="style8">
                      卡<span lang="zh-cn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      </span>号：</td>
                  <td style="width: 293px; height: 11px; text-align: justify;">
                      <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                  <td class="style5">
                  </td>
              </tr>
              <tr>
                  <td style="text-align: right" class="style8">
                      账<span lang="zh-cn">&nbsp;&nbsp;&nbsp; </span>户<span lang="zh-cn">&nbsp;&nbsp;&nbsp;
                      </span>名：</td>
                  <td style="width: 293px; height: 11px; text-align: justify;">
                      <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                  <td class="style5">
                  </td>
              </tr>
              <tr>
                  <td style="text-align: right" class="style8">
                      银行卡类型：</td>
                  <td style="width: 293px; height: 11px; text-align: justify">
                      <asp:DropDownList ID="DropDownList1" runat="server">
                          <asp:ListItem>交通银行</asp:ListItem>
                          <asp:ListItem>建设银行</asp:ListItem>
                          <asp:ListItem>农业银行</asp:ListItem>
                          <asp:ListItem>工商银行</asp:ListItem>
                      </asp:DropDownList></td>
                  <td class="style5">
                  </td>
              </tr>
              <tr>
                  <td style="text-align: right" class="style8">
                      &nbsp;</td>
                  <td style="width: 293px; height: 11px; text-align: justify">
                                            &nbsp;</td>
                  <td class="style5">
                  </td>
              </tr>
              <tr>
                  <td class="style8">
                  </td>
                  <td style="width: 293px; height: 11px">
                      <asp:Button ID="Button2" runat="server" Text="确定充值" 
                          onclick="Button2_Click" Height="33px" 
                          style="font-size: large; font-weight: 700" Width="100px" /></td>
                  <td class="style5">
                  </td>
              </tr>
              <tr>
                  <td colspan="3" style="height: 11px"><HR/>
                  </td>
              </tr>
              <tr>
                  <td colspan="3" style="height: 11px">
                      <asp:Button ID="Button1" runat="server" PostBackUrl="~/前台/首页.aspx" Text="返回首页" 
                          style="font-weight: 700; font-size: large" onclick="Button1_Click" /></td>
              </tr>
</table>

          </td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td style="text-align: center"><HR>Corporation:张家港市Rainbow影院网上购票系统© 版权所有 
          技术支持：江苏科技大学（张家港）<br />
          本网站所有资讯内容、广告信息，未经书面同意，不得转载。<br />
          打造地区最优秀的电影网上购票平台----Rainbow影院网上购票系统 
          <br />
          服务热线：0512-58888888| 传真：0512-58888888<br />
        </td>
    </tr>
  </table>
    </form>
</body>
</html>