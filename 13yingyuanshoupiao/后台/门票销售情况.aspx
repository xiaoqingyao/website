<%@ Page Language="C#" AutoEventWireup="true" CodeFile="门票销售情况.aspx.cs" Inherits="后台_门票销售情况" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Movie Ticket Booking System</title>
    <style type="text/css">
        .style2
        {
            height: 25px;
        }
        .style3
        {
            height: 128px;
        }
        .style4
        {
            height: 18px;
        }
        .style5
        {
            height: 638px;
        }
        .style7
        {
            height: 46px;
            text-align: center;
            font-size: xx-large;
        }
        .style8
        {
            width: 478px;
        }
    </style>
</head>
<body bgcolor="#cccccc">
    <form id="form1" runat="server">
    <table width="80%" border="0" align="center" bgcolor="#CCCCCC">
    <tr>
      <td><img alt="" src="../前台/image/0.jpg" width="100%" style="height: 292px"  /></td>
    </tr>
    <tr>
      <td background="image/toolbar.jpg" class="style7">
          <strong style="text-align: center">电影门票销售情况</strong></td>
    </tr>
    <tr>
      <td style="text-align: center; " class="style5">
          <table width="100%" border="0">
  <tr>
  
    <td colspan="3">
        <table style="width:100%;">
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td>
                                          
                                          <table style="width:100%;">
                                              <tr>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                <span style="font-family: Arial Black"> 
                <asp:Label ID="Label1" runat="server" Text="一号影院"></asp:Label>
                </span>
                                                  </td>
                                                  <td>
                <asp:Label ID="Label2" runat="server" Text="二号影院" 
                    style="font-family: 'Arial Black'"></asp:Label>
                                                  </td>
                                                  <td>
                <asp:Label ID="Label3" runat="server" Text="三号影院" 
                    style="font-family: 'Arial Black'"></asp:Label>
                                                  </td>
                                                  <td>
                <asp:Label ID="Label4" runat="server" style="font-family: 'Arial Black'" 
                    Text="四号影院"></asp:Label>
                                                  </td>
                                                  <td>
                <asp:Label ID="Label5" runat="server" style="font-family: 'Arial Black'" 
                    Text="五号影院"></asp:Label>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                    CellPadding="3" 
                    ForeColor="Black" GridLines="Vertical" DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="PlayTime" HeaderText="上映时间" 
                            SortExpression="PlayTime" />
                        <asp:BoundField DataField="FilmName" HeaderText="电影名称" 
                            SortExpression="FilmName" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                </asp:GridView>
                                                  </td>
                                                  <td>
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                    CellPadding="3" 
                    ForeColor="Black" GridLines="Vertical" DataSourceID="SqlDataSource3">
                    <Columns>
                        <asp:BoundField DataField="PlayTime" HeaderText="上映时间" 
                            SortExpression="PlayTime" />
                        <asp:BoundField DataField="FilmName" HeaderText="电影名称" 
                            SortExpression="FilmName" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                </asp:GridView>
                                                  </td>
                                                  <td>
                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                    CellPadding="3" 
                    ForeColor="Black" GridLines="Vertical" DataSourceID="SqlDataSource4">
                    <Columns>
                        <asp:BoundField DataField="PlayTime" HeaderText="上映时间" 
                            SortExpression="PlayTime" />
                        <asp:BoundField DataField="FilmName" HeaderText="电影名称" 
                            SortExpression="FilmName" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                </asp:GridView>
                                                  </td>
                                                  <td>
                <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                    CellPadding="3" 
                    ForeColor="Black" GridLines="Vertical" DataSourceID="SqlDataSource5">
                    <Columns>
                        <asp:BoundField DataField="PlayTime" HeaderText="上映时间" 
                            SortExpression="PlayTime" />
                        <asp:BoundField DataField="FilmName" HeaderText="电影名称" 
                            SortExpression="FilmName" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                </asp:GridView>
                                                  </td>
                                                  <td>
                <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                    CellPadding="3" 
                    ForeColor="Black" GridLines="Vertical" DataSourceID="SqlDataSource6">
                    <Columns>
                        <asp:BoundField DataField="PlayTime" HeaderText="上映时间" 
                            SortExpression="PlayTime" />
                        <asp:BoundField DataField="FilmName" HeaderText="电影名称" 
                            SortExpression="FilmName" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                </asp:GridView>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT PlayTime, FilmName FROM FilmArrange WHERE (theaterID = 'T01')">
                </asp:SqlDataSource>
                                                  </td>
                                                  <td>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT PlayTime, FilmName FROM FilmArrange WHERE (theaterID = 'T02')">
                </asp:SqlDataSource>
                                                  </td>
                                                  <td>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT PlayTime, FilmName FROM FilmArrange WHERE (theaterID = 'T03')">
                </asp:SqlDataSource>
                                                  </td>
                                                  <td>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT PlayTime, FilmName FROM FilmArrange WHERE (theaterID = 'T04')">
                </asp:SqlDataSource>
                                                  </td>
                                                  <td>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT PlayTime, FilmName FROM FilmArrange WHERE (theaterID = 'T01')">
                </asp:SqlDataSource>
                                                  </td>
                                              </tr>
                                          </table>
                                          <table style="width:100%;">
                                              <tr>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                              </tr>
                                              <tr>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                              </tr>
                                              <tr>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                              </tr>
                                          </table>
                                          <table style="width:100%;">
                                              <tr>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                              </tr>
                                              <tr>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                              </tr>
                                              <tr>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      &nbsp;</td>
                                              </tr>
                                          </table>
                                          
                                      </td>
                                      <td>
    
                                          &nbsp;</td>
                                      <td>
                                          &nbsp;</td>
                                  </tr>
                              </table>
                              &nbsp; &nbsp;
    
                
        <HR>
    </td>
  </tr>
  <tr>
    <td style="text-align: right" class="style8">&nbsp;</td>
    <td style="width: 417px; text-align: left">
        &nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="text-align: right" class="style8">&nbsp;</td>
    <td style="width: 417px; text-align: left">
        &nbsp;</td>
    <td>&nbsp;</td>
  </tr>
              <tr>
                  <td style="text-align: right" class="style8">
                      &nbsp;</td>
                  <td style="width: 417px; text-align: left">
                      &nbsp;</td>
                  <td>
                  </td>
              </tr>
              <tr>
                  <td style="text-align: right" class="style8">
                      &nbsp;</td>
                  <td style="width: 417px; text-align: left">
                      &nbsp;</td>
                  <td>
                  </td>
              </tr>
              <tr>
                  <td style="text-align: right" class="style8">
                      &nbsp;</td>
                  <td style="width: 417px; text-align: left">
                      &nbsp;</td>
                  <td>
                  </td>
              </tr>
  <tr>
    <td style="text-align: right" class="style8">&nbsp;:</td>
    <td style="width: 417px; text-align: left">
        &nbsp;</td>
    <td style="text-align: left">&nbsp;</td>
  </tr>
              <tr>
                  <td style="text-align: right" class="style8">
                      &nbsp;</td>
                  <td style="width: 417px; text-align: left">
                      &nbsp;</td>
                  <td>
                  </td>
              </tr>
              <tr>
                  <td style="text-align: right" class="style8">
                  </td>
                  <td style="width: 417px; text-align: left">
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <br />
                  </td>
                  <td>
                  </td>
              </tr>
              <tr>
                  <td style="text-align: right" colspan="3">
                      <HR></td>
              </tr>
</table>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
<table width="100%" border="0">
          <tr>
            <td class="style2">
                <span style="font-family: Arial Black">&nbsp; 
                </span></td>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
          </tr>
          <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
          </tr>
          <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
          </tr>
          <tr>
            <td colspan="5"><HR></td>
          </tr>
          <tr>
            <td colspan="5">
                <HR>
                <br />
              </td>
          </tr>
          <tr>
            <td colspan="5"><HR/>
              </td>
          </tr>
        </table>
                <div id="footer">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Corporation:张家港市Rainbow影院网上购票系统© 版权所有 
                    技术支持：江苏科技大学（张家港）<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    本网站所有资讯内容、广告信息，未经书面同意，不得转载。<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    打造地区最优秀的电影网上购票平台----Rainbow影院网上购票系统 
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    服务热线：0512-58888888| 传真：0512-58888888<br />
                </div>
                <br /></table>
</form>
</body>
</html>
