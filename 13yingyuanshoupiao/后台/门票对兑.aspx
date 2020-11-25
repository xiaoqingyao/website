<%@ Page Language="C#" AutoEventWireup="true" CodeFile="门票对兑.aspx.cs" Inherits="后台_门票对兑" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Rainbow影院网上购票系统</title>
    </head>
<body>
    <form id="form2" runat="server">
  <table width="600px" border="0" align="center" bgcolor="#CCCCCC">
    <tr>
      <td><img src="../前台/image/0.jpg" width="100%" /></td>
    </tr>
    <tr>
      <td background="image/27.jpg" style="text-align: left">
          <span style="color: menu"><strong>&nbsp;</strong></span></td>
    </tr>
    <tr>
      <td><table width="80%" border="0" align="center" bgcolor="#CCCCCC">
        <tr>
          <td width="30%" style="width: 35%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              门票编号：</td>
          <td style="width: 221px">
              <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </td>
          <td width="221" style="width: 221px" bgcolor="#CCCCCC">
              <asp:Button ID="Button1" runat="server" Text="查询" Width="79px" 
                  onclick="Button1_Click" />
                        </td>
        </tr>
        <tr>
          <td style="text-align: right" colspan="3"><div align="right" style="text-align: center">
              <table style="width:100%;">
                  <tr>
                      <td>
                          &nbsp;</td>
                                        <td>
                                            影院名称:</td>
                                        <td>
                                            <asp:DropDownList ID="DropDownList1" runat="server">
                                                <asp:ListItem>Rainbow-Two</asp:ListItem>
                                                <asp:ListItem>Rainbow-Three</asp:ListItem>
                                                <asp:ListItem>Rainbow-Four</asp:ListItem>
                                                <asp:ListItem>Rainbow-Five</asp:ListItem>
                                                <asp:ListItem>Rainbow-One</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            电影名称：</td>
                                        <td>
                                            <asp:Label ID="Label_FilmName" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            放映厅：</td>
                                        <td>
                                            <asp:Label ID="Label_Room" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            是否对兑门票：</td>
                                        <td>
                                            <asp:Label ID="Label_MenPiao" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            帐号:</td>
                                        <td>
                                            <asp:Label ID="Label_UserName" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            座位:</td>
                                        <td>
                                            <asp:Label ID="Label_Seat" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            订购日期:</td>
                                        <td>
                                            <asp:Label ID="Label_Date" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                                <asp:Button ID="Button2" runat="server" BorderColor="#0099FF" Font-Size="Large" 
                                    ForeColor="Red" Text="提    交" Width="110px" onclick="Button2_Click" />
                                <strong><span style="font-size: 24pt">
              <br />
              </span>
                              <asp:Label ID="Label1" runat="server" Font-Size="X-Large" ForeColor="Red" 
                                  Visible="False"></asp:Label>
                              </strong><span style="font-size: 14pt"><br />
                  </span></div></td>
        </tr>
        <tr>
          <td colspan="3" style="text-align: center">
              <HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color=#987cb9 SIZE=3>
              &nbsp;&nbsp;</td>
        </tr>
          <tr>
              <td style="height: 21px; text-align: center;" colspan="3">
                  &nbsp;</td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td style="text-align: center"><HR>
                    Corporation:张家港市Rainbow影院网上购票系统© 版权所有 技术支持：江苏科技大学（张家港）<br/>
          本网站所有资讯内容、广告信息，未经书面同意，不得转载。<br/> 
          打造地区最优秀的电影网上购票平台----Rainbow影院网上购票系统  <br/>
          服务热线：0512-58888888| 传真：0512-58888888<br/><br />
        </td>
    </tr>
  </table>
    </form>
</body>
</html>
