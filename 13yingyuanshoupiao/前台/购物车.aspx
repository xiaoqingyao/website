<%@ Page Language="C#" AutoEventWireup="true" CodeFile="购物车.aspx.cs" Inherits="前台_购物车" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Rainbow影院网上购票系统</title>
    <style type="text/css">
        .style3
        {
            color: #FF0000;
        }
        .style5
        {
            width: 64%;
            text-align: left;
        }
        .style6
        {
            width: 800px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
  <table border="0" align="center" class="style6" bgcolor="#CCCCCC">
    <tr>
      <td height="180"><img alt="" src="image/0.jpg" width="100%"/></td>
    </tr>
    <tr>
      <td background="image/27.jpg" style="text-align: right">&nbsp;</td>
    </tr>
    <tr>
      <td>
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
                      Text="匿名" style="color: #FF0000" BackColor="#CCCCCC"></asp:Label></td>
            </tr>
            <tr>
              <td style="text-align: center"><HR/></td>
            </tr>
            <tr>
              <td style="text-align: center">
                  <asp:Button ID="account_details_btn" 
                      runat="server" PostBackUrl="~/前台/账户详细.aspx"
                      Text="账号详情" Visible="False" style="font-size: large; font-weight: 700" 
                      Width="191px" /></td>
            </tr>
              <tr>
                  <td style="text-align: center">
                      <asp:Button ID="prepay_btn" runat="server" Text="账号充值" Visible="False" 
                          PostBackUrl="~/前台/账户充值.aspx" style="font-weight: 700; font-size: large" 
                          Width="192px" /></td>
              </tr>
              <tr>
                  <td style="text-align: center">
                      &nbsp;</td>
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
          </td>
          <td height="100%" class="style5">
            <table>
                    <tr>
                        <td style="font-size: xx-large; font-weight: 700">
                             &nbsp;&nbsp;&nbsp; 购物车</td>
                    </tr>
                    <tr>
                        <td style="font-size: xx-large; font-weight: 700">
                             您已有的订单：
                         
                             <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="账户余额不足" 
                                 Visible="False"></asp:Label>
                             <table style="width:100%;">
                                 <tr>
                                     <td>
                                         &nbsp;</td>
                                                  <td>
           
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                  CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" 
                  ForeColor="#333333" GridLines="None" AllowPaging="True" style="font-size: large">
                  <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                  <RowStyle BackColor="#EFF3FB" />
                  <Columns>
                      <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                      <asp:BoundField DataField="ID" InsertVisible="False" ReadOnly="True" 
                          SortExpression="ID" />
                      <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                      <asp:BoundField DataField="FilmName" HeaderText="FilmName" 
                          SortExpression="FilmName" />
                      <asp:BoundField DataField="Cinema" HeaderText="Cinema" 
                          SortExpression="Cinema" />
                      <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                      <asp:BoundField DataField="Seat" HeaderText="Seat" SortExpression="Seat" />
                      <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                  </Columns>
                  <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                  <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                  <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                  <EditRowStyle BackColor="#2461BF" />
                  <AlternatingRowStyle BackColor="White" />
              </asp:GridView>
                                                  </td>
                                                  <td>
                                                      &nbsp;</td>
                                              </tr>
                                              <tr>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                              <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                  ConflictDetection="CompareAllValues" 
                  ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                  DeleteCommand="DELETE FROM [BookingCart] WHERE [ID] = @original_ID AND (([State] = @original_State) OR ([State] IS NULL AND @original_State IS NULL)) AND (([FilmName] = @original_FilmName) OR ([FilmName] IS NULL AND @original_FilmName IS NULL)) AND (([Cinema] = @original_Cinema) OR ([Cinema] IS NULL AND @original_Cinema IS NULL)) AND (([Date] = @original_Date) OR ([Date] IS NULL AND @original_Date IS NULL)) AND (([Time] = @original_Time) OR ([Time] IS NULL AND @original_Time IS NULL)) AND (([Seat] = @original_Seat) OR ([Seat] IS NULL AND @original_Seat IS NULL)) AND (([Price] = @original_Price) OR ([Price] IS NULL AND @original_Price IS NULL))" 
                  InsertCommand="INSERT INTO [BookingCart] ([State], [FilmName], [Cinema], [Date], [Time], [Seat], [Price]) VALUES (@State, @FilmName, @Cinema, @Date, @Time, @Seat, @Price)" 
                  OldValuesParameterFormatString="original_{0}" 
                  SelectCommand="SELECT ID, State, FilmName, Cinema, Time, Seat, Price FROM BookingCart WHERE (UserName = @Param1)" 
                  
                                                          UpdateCommand="UPDATE [BookingCart] SET [State] = @State, [FilmName] = @FilmName, [Cinema] = @Cinema, [Date] = @Date, [Time] = @Time, [Seat] = @Seat, [Price] = @Price WHERE [ID] = @original_ID AND (([State] = @original_State) OR ([State] IS NULL AND @original_State IS NULL)) AND (([FilmName] = @original_FilmName) OR ([FilmName] IS NULL AND @original_FilmName IS NULL)) AND (([Cinema] = @original_Cinema) OR ([Cinema] IS NULL AND @original_Cinema IS NULL)) AND (([Date] = @original_Date) OR ([Date] IS NULL AND @original_Date IS NULL)) AND (([Time] = @original_Time) OR ([Time] IS NULL AND @original_Time IS NULL)) AND (([Seat] = @original_Seat) OR ([Seat] IS NULL AND @original_Seat IS NULL)) AND (([Price] = @original_Price) OR ([Price] IS NULL AND @original_Price IS NULL))">
                                  <SelectParameters>
                                      <asp:SessionParameter DefaultValue="游客" Name="Param1" SessionField="username" />
                                  </SelectParameters>
                                  <DeleteParameters>
                                      <asp:Parameter Name="original_ID" Type="Int32" />
                                      <asp:Parameter Name="original_State" Type="String" />
                                      <asp:Parameter Name="original_FilmName" Type="String" />
                                      <asp:Parameter Name="original_Cinema" Type="String" />
                                      <asp:Parameter Name="original_Date" Type="String" />
                                      <asp:Parameter Name="original_Time" Type="String" />
                                      <asp:Parameter Name="original_Seat" Type="String" />
                                      <asp:Parameter Name="original_Price" Type="Decimal" />
                                  </DeleteParameters>
                                  <UpdateParameters>
                                      <asp:Parameter Name="State" Type="String" />
                                      <asp:Parameter Name="FilmName" Type="String" />
                                      <asp:Parameter Name="Cinema" Type="String" />
                                      <asp:Parameter Name="Date" Type="String" />
                                      <asp:Parameter Name="Time" Type="String" />
                                      <asp:Parameter Name="Seat" Type="String" />
                                      <asp:Parameter Name="Price" Type="Decimal" />
                                      <asp:Parameter Name="original_ID" Type="Int32" />
                                      <asp:Parameter Name="original_State" Type="String" />
                                      <asp:Parameter Name="original_FilmName" Type="String" />
                                      <asp:Parameter Name="original_Cinema" Type="String" />
                                      <asp:Parameter Name="original_Date" Type="String" />
                                      <asp:Parameter Name="original_Time" Type="String" />
                                      <asp:Parameter Name="original_Seat" Type="String" />
                                      <asp:Parameter Name="original_Price" Type="Decimal" />
                                  </UpdateParameters>
                                  <InsertParameters>
                                      <asp:Parameter Name="State" Type="String" />
                                      <asp:Parameter Name="FilmName" Type="String" />
                                      <asp:Parameter Name="Cinema" Type="String" />
                                      <asp:Parameter Name="Date" Type="String" />
                                      <asp:Parameter Name="Time" Type="String" />
                                      <asp:Parameter Name="Seat" Type="String" />
                                      <asp:Parameter Name="Price" Type="Decimal" />
                                  </InsertParameters>
              </asp:SqlDataSource>
                                                  </td>
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
                                              </tr>
                                          </table>
                        </td>
                    </tr>
            </table>
           
                  <br /><HR>
                      <span class="style3">注意：订单将在电影开始前24小时内被取消，请及时付款。</span><span class="style3"><br />
                          <asp:Label ID="Label_Total" runat="server" 
                              style="font-weight: 700; font-size: 16pt; color: #000000;" 
                  Text="总计：￥" Visible="False"></asp:Label>
                          <span style="font-size: 16pt">
              <asp:Label ID="Label_TotalAmount" runat="server" 
                              Text="Label" style="color: #000000; font-weight: 700" 
                  Visible="False"></asp:Label>
                          <br />
                          <asp:Button ID="Button2" runat="server" 
                              Text="确定付款" onclick="Button2_Click" Height="31px" 
                  style="font-size: large; font-weight: 700" Width="96px" />
                              <asp:Label ID="Label4" runat="server" Text="付款成功" Visible="False"></asp:Label>
                          </span><HR/>
                          <br />
                          <asp:Button ID="Button1" runat="server" PostBackUrl="~/前台/首页.aspx" 
                  Text="返回首页" Height="35px" style="font-size: large; font-weight: 700" 
                  Width="91px" onclick="Button1_Click" /></span><br />

          </td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td style="text-align: center"><HR>          
          Corporation:张家港市Rainbow影院网上购票系统© 版权所有 技术支持：江苏科技大学（张家港）<br/>
          本网站所有资讯内容、广告信息，未经书面同意，不得转载。<br/> 
          打造地区最优秀的电影网上购票平台----Rainbow影院网上购票系统  <br/>
          服务热线：0512-58888888| 传真：0512-58888888<br/>
          </td>
    </tr>
  </table>
    </form>
</body>
</html>
