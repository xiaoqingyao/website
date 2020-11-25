<%@ Page Language="C#" AutoEventWireup="true" CodeFile="员工登陆.aspx.cs" Inherits="后台_管理员登陆" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Rainbow影院网上购票系统</title>
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
        .style2
        {
            font-size: xx-large;
            font-weight: bold;
            color: #FFFFCC;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
  <table width="80%" border="0" align="center" bgcolor="#CCCCCC">
    <tr>
      <td><img alt="" src="../前台/image/0.jpg" width="100%"/></td>
    </tr>
    <tr>
      <td background="image/27.jpg" class="style1">
          <span style="color: menu"><strong>&nbsp;</strong></span><span class="style2">员工登录</span></td>
    </tr>
    <tr>
      <td style="text-align: center">
          <br />
          <table width="60%" border="0" align="center" bgcolor="#CCCCCC">
        <tr>
          <td style="width: 35%">&nbsp;</td>
          <td style="width: 221px">&nbsp;<asp:Label ID="Label1" runat="server" 
                  ForeColor="Red" Text="用户名或密码出错"
                  Visible="False" Width="197px" style="text-align: left" TabIndex="6"></asp:Label></td>
        </tr>
        <tr>
          <td style="width: 35%; text-align: right">帐&nbsp;&nbsp;&nbsp; 号：</td>
          <td style="width: 221px; text-align: left;">&nbsp;<asp:TextBox ID="username_txt" 
                  runat="server" ToolTip="Input your user name" Width="148px"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                  ControlToValidate="username_txt" ErrorMessage="帐号不能为空">*</asp:RequiredFieldValidator>
                          </td>
        </tr>
        <tr>
          <td style="width: 35%; text-align: right; height: 28px;" bgcolor="#CCCCCC">密       &nbsp;&nbsp;&nbsp;码：</td>
          <td style="width: 221px; text-align: left; height: 28px;">&nbsp;<asp:TextBox ID="password_txt" type="password" runat="server" ToolTip="Input your passward" TabIndex="1" TextMode="Password" Width="148px"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                  ControlToValidate="password_txt" ErrorMessage="密码不能为空">*</asp:RequiredFieldValidator>
                          </td>
        </tr>
        <tr>
          <td style="width: 35%; text-align: right;"></td>
          <td style="width: 221px; text-align: left;">&nbsp;
              <asp:Button ID="submit_btn" runat="server" Text="登录" 
                  ToolTip="Finish and submit" OnClick="submit_btn_Click" TabIndex="2" 
                  style="font-size: large; font-weight: 700" />&nbsp; &nbsp;<asp:Button 
                  ID="reset_btn" runat="server" Text="重置" ToolTip="Reset all" 
                  OnClick="reset_btn_Click" style="font-size: large; font-weight: 700" 
                  TabIndex="4" /></td>
        </tr>
              <tr>
                  <td colspan="2" style="text-align: center">
                      <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                      <br />
                      <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/前台/首页.aspx" 
                          TabIndex="5">前往影院首页</asp:HyperLink>
                      <br />
                      </td>
              </tr>
      </table>
      </td>
    </tr>
    <tr>
      <td style="text-align: center"><HR/>
           Corporation:张家港市Rainbow影院网上购票系统© 版权所有 技术支持：江苏科技大学（张家港）   本网站所有资讯内容、广告信息，未经书面同意，不得转载。<br/> 
          打造地区最优秀的电影网上购票平台----Rainbow影院网上购票系统  <br/>
          服务热线：0512-58888888| 传真：0512-58888888<br/>
          </td>
    </tr>
  </table>
    &nbsp;&nbsp;
    </form>
</body>
</html>
