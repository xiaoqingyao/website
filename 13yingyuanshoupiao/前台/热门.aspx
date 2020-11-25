<%@ Page Language="C#" AutoEventWireup="true" CodeFile="热门.aspx.cs" Inherits="前台_热门" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Rainbow影院购票系统</title>
    <style type="text/css">
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
            text-align: center;
        }
        .style9
        {
            height: 280px;
            width: 106%;
        }
        .style10
        {
            width: 263px;
        }
        .style11
        {
            width: 431px;
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
              <td>&nbsp;&nbsp;
              </td>
    </tr>
    <tr>
      <td background="image/1.gif"  style="text-align: right" class="style2" 
            valign="baseline" align="justify">
      </td>
    </tr>
    <tr>
      <td class="style4">
      
      
      
      
      
      
      
          <table style="width:100%;">
              <tr>
                  <td class="style10">
                      &nbsp;</td>
                          <td class="style11">
          <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
              AutoGenerateColumns="False" DataKeyNames="ArrangeID" 
              DataSourceID="SqlDataSource1"  
              onselectedindexchanged="GridView1_SelectedIndexChanged1">
              <Columns>
                  <asp:CommandField ShowSelectButton="True" SelectText="详细" />
                  <asp:BoundField DataField="ArrangeID" HeaderText="ArrangeID" ReadOnly="True" 
                      SortExpression="ArrangeID" />
                  <asp:BoundField DataField="FilmName" HeaderText="FilmName" 
                      SortExpression="FilmName" />
                  <asp:BoundField DataField="Protagonist" HeaderText="Protagonist" 
                      SortExpression="Protagonist" />
                  <asp:BoundField DataField="Dircetor" HeaderText="Dircetor" 
                      SortExpression="Dircetor" />
              </Columns>
          </asp:GridView>
                          </td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td class="style10">
                              &nbsp;</td>
                          <td class="style11">
                              &nbsp;</td>
                          <td>
                              &nbsp;</td>
                      </tr>
                  </table>
                  <br />
                  <br />
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
              SelectCommand="SELECT f2.ArrangeID, f1.FilmName, f1.Protagonist, f1.Dircetor FROM Film AS f1 INNER JOIN FilmArrange AS f2 ON f1.FilmName = f2.FilmName">
          </asp:SqlDataSource>
          <br />
          <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Button ID="Button1" runat="server" Height="40px" 
              style="text-align: center; font-size: large; font-weight: 700" Text="返回首页" PostBackUrl="~/前台/首页.aspx" 
              Width="92px" />
        </td>
    </tr>
    <tr>
      <td style="text-align: center" class="style4"><HR>Corporation:张家港市Rainbow影院网上购票系统© 
          版权所有 技术支持：江苏科技大学（张家港）/>
          本网站所有资讯内容、广告信息，未经书面同意，不得转载。<br />
          打造地区最优秀的电影网上购票平台----Rainbow影院网上购票系统 
          <br />
          服务热线：0512-58888888| 传真：0512-5888888<span lang="zh-cn">8</span></td>
    </tr>
  </table>
    </form>
</body>
</html>