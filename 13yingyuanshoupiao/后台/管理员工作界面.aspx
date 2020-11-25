<%@ Page Language="C#" AutoEventWireup="true" CodeFile="管理员工作界面.aspx.cs" Inherits="后台_管理员工作界面" %>

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
        .style6
        {
            font-size: small;
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
          <strong style="text-align: center">电影安排</strong></td>
    </tr>
    <tr>
      <td style="text-align: center; " class="style5">
          <table width="100%" border="0">
  <tr>
  
    <td colspan="3">
        <table style="width:100%;">
            <tr>
                <td>
                    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/后台/反馈信息.aspx">反馈信息</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td>
                                          <asp:Panel ID="Panel1" runat="server" Width="181px">
                                          </asp:Panel>
                                      </td>
                                      <td>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            CellPadding="4" DataKeyNames="FilmID" 
            DataSourceID="SqlDataSource1" ForeColor="#333333"
            GridLines="None" CssClass="style6" Height="194px" Width="576px" 
            AllowPaging="True" AllowSorting="True" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="FilmID" HeaderText="电影编号" ReadOnly="True" 
                    SortExpression="FilmID" />
                <asp:BoundField DataField="FilmName" HeaderText="电影名称" 
                    SortExpression="FilmName" />
                <asp:BoundField DataField="Dircetor" HeaderText="导演" 
                    SortExpression="Dircetor" />
                <asp:BoundField DataField="Protagonist" HeaderText="演员" 
                    SortExpression="Protagonist" />
                <asp:BoundField DataField="PictureURL" HeaderText="照片" 
                    SortExpression="PictureURL" />
                <asp:BoundField DataField="BriefIntro" HeaderText="简介" 
                    SortExpression="BriefIntro" />
                <asp:BoundField DataField="Price" HeaderText="价格" SortExpression="Price" />
            </Columns>
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <EditRowStyle BackColor="#999999" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
       
        
                                      </td>
                                      <td>
                                          &nbsp;</td>
                                  </tr>
                              </table>
                              &nbsp; &nbsp;
    
                
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [Film] WHERE [FilmID] = @original_FilmID AND (([FilmName] = @original_FilmName) OR ([FilmName] IS NULL AND @original_FilmName IS NULL)) AND (([Dircetor] = @original_Dircetor) OR ([Dircetor] IS NULL AND @original_Dircetor IS NULL)) AND (([Protagonist] = @original_Protagonist) OR ([Protagonist] IS NULL AND @original_Protagonist IS NULL)) AND (([PictureURL] = @original_PictureURL) OR ([PictureURL] IS NULL AND @original_PictureURL IS NULL)) AND (([BriefIntro] = @original_BriefIntro) OR ([BriefIntro] IS NULL AND @original_BriefIntro IS NULL)) AND (([Price] = @original_Price) OR ([Price] IS NULL AND @original_Price IS NULL))" 
            InsertCommand="INSERT INTO [Film] ([FilmID], [FilmName], [Dircetor], [Protagonist], [PictureURL], [BriefIntro], [Price]) VALUES (@FilmID, @FilmName, @Dircetor, @Protagonist, @PictureURL, @BriefIntro, @Price)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT [FilmID], [FilmName], [Dircetor], [Protagonist], [PictureURL], [BriefIntro], [Price] FROM [Film]" 
            UpdateCommand="UPDATE [Film] SET [FilmName] = @FilmName, [Dircetor] = @Dircetor, [Protagonist] = @Protagonist, [PictureURL] = @PictureURL, [BriefIntro] = @BriefIntro, [Price] = @Price WHERE [FilmID] = @original_FilmID AND (([FilmName] = @original_FilmName) OR ([FilmName] IS NULL AND @original_FilmName IS NULL)) AND (([Dircetor] = @original_Dircetor) OR ([Dircetor] IS NULL AND @original_Dircetor IS NULL)) AND (([Protagonist] = @original_Protagonist) OR ([Protagonist] IS NULL AND @original_Protagonist IS NULL)) AND (([PictureURL] = @original_PictureURL) OR ([PictureURL] IS NULL AND @original_PictureURL IS NULL)) AND (([BriefIntro] = @original_BriefIntro) OR ([BriefIntro] IS NULL AND @original_BriefIntro IS NULL)) AND (([Price] = @original_Price) OR ([Price] IS NULL AND @original_Price IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_FilmID" Type="String" />
                <asp:Parameter Name="original_FilmName" Type="String" />
                <asp:Parameter Name="original_Dircetor" Type="String" />
                <asp:Parameter Name="original_Protagonist" Type="String" />
                <asp:Parameter Name="original_PictureURL" Type="String" />
                <asp:Parameter Name="original_BriefIntro" Type="String" />
                <asp:Parameter Name="original_Price" Type="Decimal" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="FilmName" Type="String" />
                <asp:Parameter Name="Dircetor" Type="String" />
                <asp:Parameter Name="Protagonist" Type="String" />
                <asp:Parameter Name="PictureURL" Type="String" />
                <asp:Parameter Name="BriefIntro" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="original_FilmID" Type="String" />
                <asp:Parameter Name="original_FilmName" Type="String" />
                <asp:Parameter Name="original_Dircetor" Type="String" />
                <asp:Parameter Name="original_Protagonist" Type="String" />
                <asp:Parameter Name="original_PictureURL" Type="String" />
                <asp:Parameter Name="original_BriefIntro" Type="String" />
                <asp:Parameter Name="original_Price" Type="Decimal" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="FilmID" Type="String" />
                <asp:Parameter Name="FilmName" Type="String" />
                <asp:Parameter Name="Dircetor" Type="String" />
                <asp:Parameter Name="Protagonist" Type="String" />
                <asp:Parameter Name="PictureURL" Type="String" />
                <asp:Parameter Name="BriefIntro" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>
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
    <td style="text-align: right" class="style8">&nbsp;影片名称:</td>
    <td style="width: 417px; text-align: left">
        <asp:TextBox ID="movieName_txt" runat="server"></asp:TextBox></td>
    <td>&nbsp;</td>
  </tr>
              <tr>
                  <td style="text-align: right" class="style8">
                      导演:</td>
                  <td style="width: 417px; text-align: left">
                      <asp:TextBox ID="dirctor_txt" runat="server"></asp:TextBox></td>
                  <td>
                  </td>
              </tr>
              <tr>
                  <td style="text-align: right" class="style8">
                      主演:</td>
                  <td style="width: 417px; text-align: left">
                      <asp:TextBox ID="leadingActor_txt" runat="server"></asp:TextBox></td>
                  <td>
                  </td>
              </tr>
              <tr>
                  <td style="text-align: right" class="style8">
                      价格:</td>
                  <td style="width: 417px; text-align: left">
                      <asp:TextBox ID="prices_txt" runat="server"></asp:TextBox></td>
                  <td>
                  </td>
              </tr>
  <tr>
    <td style="text-align: right" class="style8">&nbsp;电影宣传图片:</td>
    <td style="width: 417px; text-align: left">
        <asp:FileUpload ID="FileUpload1" runat="server" Width="191px" /></td>
    <td style="text-align: left">&nbsp;</td>
  </tr>
              <tr>
                  <td style="text-align: right" class="style8">
                      简介:</td>
                  <td style="width: 417px; text-align: left">
                      <asp:TextBox ID="desciption_txt" runat="server" Height="116px" TextMode="MultiLine"
                          Width="279px" MaxLength="254"></asp:TextBox></td>
                  <td>
                  </td>
              </tr>
              <tr>
                  <td style="text-align: right" class="style8">
                  </td>
                  <td style="width: 417px; text-align: left">
                      <asp:Button ID="Button1" runat="server" Text="添加新片" onclick="Button1_Click" 
                           />
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:Button ID="Button2" runat="server" Text="取消重置" onclick="Button2_Click"  />
                      <br />
                      <asp:Label ID="UploadStatusLabel" runat="server" 
                          style="color: #FF0000; font-weight: 700" Visible="False"></asp:Label>
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
                <asp:Label ID="Label1" runat="server" Text="一号影院"></asp:Label>
                </span></td>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="二号影院" 
                    style="font-family: 'Arial Black'"></asp:Label>
                        </td>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Text="三号影院" 
                    style="font-family: 'Arial Black'"></asp:Label>
                        </td>
            <td class="style2">
                <asp:Label ID="Label4" runat="server" style="font-family: 'Arial Black'" 
                    Text="四号影院"></asp:Label>
                          </td>
            <td class="style2">
                <asp:Label ID="Label5" runat="server" style="font-family: 'Arial Black'" 
                    Text="五号影院"></asp:Label>
                          </td>
          </tr>
          <tr>
            <td class="style3">
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
            <td class="style3">
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
            <td class="style3">
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
            <td class="style3">
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
            <td class="style3">
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
            <td class="style4">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT PlayTime, FilmName FROM FilmArrange WHERE (theaterID = 'T01')">
                </asp:SqlDataSource>
              </td>
            <td class="style4">
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT PlayTime, FilmName FROM FilmArrange WHERE (theaterID = 'T02')">
                </asp:SqlDataSource>
              </td>
            <td class="style4">
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT PlayTime, FilmName FROM FilmArrange WHERE (theaterID = 'T03')">
                </asp:SqlDataSource>
              </td>
            <td class="style4">
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT PlayTime, FilmName FROM FilmArrange WHERE (theaterID = 'T04')">
                </asp:SqlDataSource>
              </td>
            <td class="style4">
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT PlayTime, FilmName FROM FilmArrange WHERE (theaterID = 'T01')">
                </asp:SqlDataSource>
              </td>
          </tr>
          <tr>
            <td colspan="5"><HR></td>
          </tr>
          <tr>
            <td colspan="5">
                影院：<asp:DropDownList ID="DropDownList_cinema" runat="server" 
                    AutoPostBack="True" DataSourceID="SqlDataSource7" DataTextField="theaterName" 
                    DataValueField="theaterID" 
                    onselectedindexchanged="DropDownList_cinema_SelectedIndexChanged" 
                    style="margin-top: 0px">
                    <asp:ListItem>cinemaI</asp:ListItem>
                    <asp:ListItem>cinemaII</asp:ListItem>
                    <asp:ListItem>cinemaIII</asp:ListItem>
                    <asp:ListItem>cinemaIV</asp:ListItem>
                    <asp:ListItem>cinemaV</asp:ListItem>
                </asp:DropDownList>
                放映厅：<asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [theaterName], [theaterID] FROM [Theaters]">
                </asp:SqlDataSource>
                <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem Value="1">惊悚片</asp:ListItem>
                    <asp:ListItem Value="2">动作片</asp:ListItem>
                    <asp:ListItem Value="3">喜剧片</asp:ListItem>
                    <asp:ListItem Value="4">文艺片</asp:ListItem>
                </asp:DropDownList>
                时间：<asp:TextBox ID="TextBox1" runat="server" Width="72px"></asp:TextBox>
                到<asp:TextBox ID="TextBox2" runat="server" Width="78px"></asp:TextBox>
                上映电影:<asp:DropDownList ID="DropDownList_moive" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="FilmName" 
                    DataValueField="FilmName">
                </asp:DropDownList>
                <HR>
                <asp:Button ID="Button_Update" runat="server" 
                    Text="更新记录" onclick="Button_Update_Click" />
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
