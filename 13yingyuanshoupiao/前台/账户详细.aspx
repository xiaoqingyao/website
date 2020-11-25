<%@ Page Language="C#" AutoEventWireup="true" CodeFile="账户详细.aspx.cs" Inherits="前台_AccountDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Rainbow影院网上购票系统</title>
    <style type="text/css">
        .style1
        {
            width: 251px;
        }
        .style2
        {
            height: 21px;
            width: 251px;
        }
        .style3
        {
            width: 297px;
        }
        .style4
        {
            height: 21px;
            width: 297px;
        }
        .style5
        {
            text-align: center;
            width: 749px;
        }
        .style6
        {
            font-size: xx-large;
        }
        .style7
        {
            color: #FF0000;
        }
        .style8
        {
            width: 100%;
            height: 232px;
        }
        .style9
        {
            width: 646px;
        }
        .style10
        {
            height: 331px;
            width: 81%;
        }
        .style11
        {
            width: 297px;
            height: 31px;
        }
        .style12
        {
            width: 251px;
            height: 31px;
        }
        .style13
        {
            height: 17px;
        }
        .style14
        {
            height: 15px;
            width: 297px;
        }
        .style15
        {
            height: 15px;
            width: 251px;
        }
        .style16
        {
            width: 749px;
        }
    </style>
</head>
<body>
    <form id="form2" name="form1" method="post" runat="server" action="">
  <table border="0" align="center" bgcolor="#CCCCCC">
    <tr>
      <td class="style16" bgcolor="#CCCCCC"><img alt="" src="image/0.jpg" class="style8" /></td>
    </tr>
    <tr>
      <td background="image/27.jpg" class="style5">
          <span style="color: menu"><strong style="text-align: center">&nbsp;<span 
              class="style6">用户账号详情</span></strong></span></td>
    </tr>
    <tr>
      <td class="style16"><table border="0" align="center" class="style10">
        <tr>
          <td class="style3">&nbsp;</td>
          <td class="style1">&nbsp;</td>
          <td style="width: 248px">&nbsp;</td>
        </tr>
          <tr>
              <td style="text-align: right" class="style3">
                  <strong>
                  用户名: &nbsp; </strong>
              </td>
              <td class="style1">
                  <asp:Label ID="Label1" runat="server" Text="Label" Width="195px"></asp:Label></td>
              <td style="width: 248px">
                  <strong>
                  现有账号余额:</strong></td>
          </tr>
        <tr>
          <td style="text-align: right" class="style11"><div align="right" class="style13">
              <strong>
                  姓: &nbsp;</strong></div></td>
          <td class="style12">
              <asp:Label ID="Label2" runat="server" TabIndex="1" Text="Label" Width="187px"></asp:Label></td>
            <td rowspan="5" style="width: 248px">
                <span style="font-size: 60px"><span class="style7">￥</span>&nbsp;</span><asp:Label ID="Label7" 
                    runat="server" Font-Bold="True" Font-Size="50pt" Height="68px"
                    Text="0.00" Width="117px" ForeColor="Red"></asp:Label></td>
        </tr>
        <tr>
          <td style="text-align: right; " class="style14"><p align="right" class="style13">
              <strong>名:<span lang="zh-cn"> </span>&nbsp;&nbsp; </strong>
          </p>            </td>
          <td class="style15">
              <asp:Label ID="Label3" runat="server" TabIndex="2" Text="Label" Width="199px"></asp:Label></td>
        </tr>
        <tr>
          <td class="style3"><div align="right">
              <strong>
                  地<span lang="zh-cn">&nbsp;&nbsp;&nbsp;&nbsp; </span>址:&nbsp;&nbsp; </strong>
          </div></td>
          <td class="style1">
              <asp:Label ID="Label4" runat="server" TabIndex="3" Text="Label" Width="199px"></asp:Label></td>
        </tr>
        <tr>
          <td class="style4"><div align="right">
              <strong>邮<span lang="zh-cn">&nbsp;&nbsp;&nbsp;&nbsp; </span>编: </strong>&nbsp;</div></td>
          <td class="style2">
              <asp:Label ID="Label5" runat="server" Text="Label" Width="197px"></asp:Label></td>
        </tr>
          <tr>
              <td style="text-align: right" class="style4">
                  <strong>
                  卡<span lang="zh-cn">&nbsp;&nbsp;&nbsp;&nbsp; </span>号: &nbsp;</strong></td>
              <td class="style2">
                  <asp:Label ID="Label6" runat="server" Text="Label" Width="196px"></asp:Label></td>
          </tr>
          <tr>
              <td style="text-align: right" class="style4">
              </td>
              <td class="style2">
              </td>
              <td style="width: 248px; height: 21px">
              </td>
          </tr>
        <tr>
          <td colspan="3" style="text-align: center">
              <asp:Button ID="modifyDetails_btn" runat="server" 
                  OnClick="modifyDetails_btn_Click" Text="修改资料" Height="29px" 
                  style="font-size: large; font-weight: 700" Width="105px" />
              <br />
              <br />
            </td>
        </tr>
        <tr>
          <td style="height: 21px; text-align: center;" colspan="3">
              <asp:Button ID="return_btn" runat="server" Text="返回首页" 
                  ToolTip="Reutn to Homepage" OnClick="return_btn_Click" Height="29px" 
                  style="font-size: large; font-weight: 700" Width="108px" /></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td style="text-align: center" class="style16"><HR class="style9">
          Corporation:张家港市Rainbow影院网上购票系统© 版权所有 技术支持：江苏科技大学（张家港）<br />
          本网站所有资讯内容、广告信息，未经书面同意，不得转载。<br />
          打造地区最优秀的电影网上购票平台----Rainbow影院网上购票系统 
          <br />
          服务热线：0512-58888888| 传真：0512-58888888<br />
          <br />
        </td>
    </tr>
  </table>
</form>
</body>
</html>