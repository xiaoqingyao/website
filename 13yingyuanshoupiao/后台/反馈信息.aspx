<%@ Page Language="C#" AutoEventWireup="true" CodeFile="反馈信息.aspx.cs" Inherits="后台_反馈信息" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Rainbow影院网上购票系统</title>
    <style type="text/css">
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
        </style>
</head>
<body>
    <form id="form1" runat="server">
  <table border="0" align="center" bgcolor="#CCCCCC" class="style7">
    <tr>
      <td height="180"><img alt="" src="../前台/image/0.jpg" width="100%"/></td>
    </tr>
    <tr>
      <td background="image/27.jpg" style="text-align: right">
          <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="注销" />
        </td>
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
                      style="color: #FF0000"></asp:Label></td>
            </tr>
            <tr>
              <td style="text-align: center"><HR/></td>
            </tr>
            <tr>
              <td style="text-align: center">
                  <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                      AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="FeedID" 
                      DataSourceID="SqlDataSource1" 
                      onselectedindexchanged="GridView1_SelectedIndexChanged">
                      <Columns>
                          <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                          <asp:BoundField DataField="FeedID" HeaderText="FeedID" InsertVisible="False" 
                              ReadOnly="True" SortExpression="FeedID" />
                          <asp:BoundField DataField="FeedDate" HeaderText="FeedDate" 
                              SortExpression="FeedDate" />
                      </Columns>
                  </asp:GridView>
                </td>
            </tr>
              <tr>
                  <td style="text-align: center">
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                          ConflictDetection="CompareAllValues" 
                          ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                          DeleteCommand="DELETE FROM [Feedback] WHERE [FeedID] = @original_FeedID AND (([FeedDate] = @original_FeedDate) OR ([FeedDate] IS NULL AND @original_FeedDate IS NULL))" 
                          InsertCommand="INSERT INTO [Feedback] ([FeedDate]) VALUES (@FeedDate)" 
                          OldValuesParameterFormatString="original_{0}" 
                          SelectCommand="SELECT [FeedID], [FeedDate] FROM [Feedback]" 
                          UpdateCommand="UPDATE [Feedback] SET [FeedDate] = @FeedDate WHERE [FeedID] = @original_FeedID AND (([FeedDate] = @original_FeedDate) OR ([FeedDate] IS NULL AND @original_FeedDate IS NULL))">
                          <DeleteParameters>
                              <asp:Parameter Name="original_FeedID" Type="Int32" />
                              <asp:Parameter DbType="Date" Name="original_FeedDate" />
                          </DeleteParameters>
                          <UpdateParameters>
                              <asp:Parameter DbType="Date" Name="FeedDate" />
                              <asp:Parameter Name="original_FeedID" Type="Int32" />
                              <asp:Parameter DbType="Date" Name="original_FeedDate" />
                          </UpdateParameters>
                          <InsertParameters>
                              <asp:Parameter DbType="Date" Name="FeedDate" />
                          </InsertParameters>
                      </asp:SqlDataSource>
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
                  <td colspan="2" style="vertical-align: top; text-align: justify">
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:TextBox ID="TextBox1" runat="server" Height="243px" TextMode="MultiLine" 
                          Width="442px"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td colspan="2" style="vertical-align: top; text-align: justify">
                      &nbsp;</td>
              </tr>
              <tr>
                  <td style="width: 293px; height: 11px; text-align: justify;">
                      &nbsp;</td>
                  <td class="style5">
                  </td>
              </tr>
              <tr>
                  <td style="width: 293px; height: 11px; text-align: justify;">
                      &nbsp;</td>
                  <td class="style5">
                  </td>
              </tr>
              <tr>
                  <td style="width: 293px; height: 11px; text-align: justify">
                      &nbsp;</td>
                  <td class="style5">
                  </td>
              </tr>
              <tr>
                  <td style="width: 293px; height: 11px; text-align: justify">
                                            &nbsp;</td>
                  <td class="style5">
                  </td>
              </tr>
              <tr>
                  <td style="width: 293px; height: 11px">
                      <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/后台/管理员工作界面.aspx">影片管理</asp:HyperLink>
                  </td>
                  <td class="style5">
                      <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/前台/首页.aspx">前往首页</asp:HyperLink>
                  </td>
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
