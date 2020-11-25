<%@ Page Language="C#" AutoEventWireup="true" CodeFile="下单.aspx.cs" Inherits="前台_下单" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Rainbow影院网上购票系统</title>
</head>
<body>
    <form id="form1" runat="server">
  <table width="80%" border="0" align="center">
    <tr>
      <td height="180"><img alt="" src="image/0.jpg" width="100%"/></td>
    </tr>
    <tr>
      <td background="image/toolbar.jpg" style="text-align: right"><label>
          <asp:Button ID="login_btn" runat="server" Text="登陆" onclick="login_btn_Click" />
          </label>
        </td>
    </tr>
    <tr>
      <td>
      <table width="100%" border="0">
        <tr>
          <td width="20%" height="100%" style="text-align: justify; vertical-align: top;">
          <table width="100%" border="0">
            <tr>
              <td style="text-align: center">&nbsp;<asp:Label ID="Label1" runat="server" Text="Welcome" Width="188px" Font-Size="Large"></asp:Label>
                  <br />
                  <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" 
                      Text="Label"></asp:Label></td>
            </tr>
            <tr>
              <td style="text-align: center"><HR/></td>
            </tr>
            <tr>
              <td style="text-align: center">
                  <asp:ImageButton ID="ImageButton1" runat="server" />
                </td>
            </tr>
              <tr>
                  <td style="text-align: center">
                      座位：<asp:DropDownList ID="DropDownList1" runat="server">
                      </asp:DropDownList>
                                    </td>
              </tr>
          </table>
          </td>
          <td width="60%" height="100%" style="text-align: center">
          <table width="80%" border="0">
              <tr>
                  <td style="height: 21px; text-align: justify;" colspan="4">
                      <span style="font-size: 32pt; font-family: Arial"><strong>Reserve Tickets</strong></span></td>
              </tr>
  <tr>
      <td rowspan="9" style="width: 200px">
          &nbsp;<asp:ImageButton ID="Image_1" runat="server" Height="122px" 
              Width="92px" BorderStyle="Double" BorderWidth="3px" 
              ImageUrl="~/前台/image/0.jpg" />&nbsp;</td>
      <td colspan="3">
          <asp:Label ID="Label3" runat="server" style="font-size: x-large"></asp:Label>
                                    </td>
  </tr>
          </table>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                >
                            </asp:GridView>
                            电影编号<br />
                            <asp:DropDownList ID="DropDownList2" runat="server" 
                                onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                            </asp:DropDownList>
              <br />
                            <br />
                            <strong>
                            <br />
                            <br />
              You Reserved:<br />
              </strong>You Reserved 3 Tickets on
              <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="hu"></asp:Label>
              <br />
              &nbsp;<asp:Button ID="Button3" runat="server" PostBackUrl="~/前台/购物车.aspx" 
                  Text="加入购物车" onclick="Button3_Click" /><br /><HR/>
                      <asp:HyperLink ID="HyperLink1" runat="server" 
                  NavigateUrl="~/前台/首页.aspx">返回首页</asp:HyperLink>
                          </td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td style="text-align: center"><HR>TicketBooking.com <span style="font-family: Arial">All Rights Reserved</span></td>
    </tr>
  </table>
    </form>
</body>
</html>