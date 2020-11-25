<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="前台_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Rainbow影院网上购票系统</title>
    <style type="text/css">
        .style1
        {
            text-align: center;
            font-size: xx-large;
            font-family: 黑体;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
  <table width="800px" border="0" align="center" bgcolor="#CCCCCC">
    <tr>
      <td><img alt="" src="image/0.jpg" width="100%"/></td>
    </tr>
    <tr>
      <td background="image/27.jpg" class="style1">
          <span style="color: menu"><strong>&nbsp;用户登录</strong></span></td>
    </tr>
    <tr>
      <td style="text-align: center">
          <br />
          <table border="0" align="center" style="width: 68%">
        <tr>
          <td style="width: 35%">&nbsp;</td>
          <td style="width: 221px">&nbsp;<asp:Label ID="Label1" runat="server" 
                  ForeColor="Red" Text="用户名或密码错误"
                  Visible="False" Width="222px"></asp:Label></td>
        </tr>
        <tr>
          <td style="width: 35%; text-align: right">用户名:</td>
          <td style="width: 221px; text-align: left;">&nbsp;<asp:TextBox ID="username_txt" runat="server" ToolTip="Input your user name"></asp:TextBox></td>
        </tr>
        <tr>
          <td style="width: 35%; text-align: right">密<span lang="zh-cn">&nbsp;&nbsp;&nbsp;
              </span>码:<br />
            </td>
          <td style="width: 221px; text-align: left;">&nbsp;<asp:TextBox ID="password_txt" type="password" runat="server" ToolTip="Input your passward" TabIndex="1" TextMode="Password"></asp:TextBox>
              <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:LinkButton ID="forget_passward_link" runat="server" 
                          ToolTip="Click if you forget your passward" PostBackUrl="~/ForgetPassward.aspx">忘记密码？</asp:LinkButton></td>
        </tr>
        <tr>
          <td style="width: 35%; text-align: right;"></td>
          <td style="width: 221px; text-align: left;">&nbsp;
              <asp:Button ID="submit_btn" runat="server" Text="提交" 
                  ToolTip="Finish and submit" OnClick="submit_btn_Click" TabIndex="2" />&nbsp; &nbsp;<asp:Button 
                  ID="reset_btn" runat="server" Text="重置" ToolTip="Reset all" 
                  OnClick="reset_btn_Click" />&nbsp;&nbsp;
              <asp:Button ID="Button1" runat="server" PostBackUrl="~/前台/Register.aspx" 
                  Text="注册" />
                          </td>
        </tr>
              <tr>
                  <td colspan="2" style="text-align: center">
                      <br />
                      <asp:Button ID="return_btn" runat="server" Text="返回首页" 
                          PostBackUrl="~/前台/首页.aspx" ToolTip="Return to the home page" Height="31px" 
                          style="font-size: large; font-weight: 700" Width="91px" /></td>
              </tr>
      </table>
      </td>
    </tr>
    <tr>
      <td style="text-align: center"><HR/>
          Corporation:张家港市Rainbow影院网上购票系统© 版权所有 技术支持：江苏科技大学（张家港）<br/>
          本网站所有资讯内容、广告信息，未经书面同意，不得转载。<br/> 
          打造地区最优秀的电影网上购票平台----Rainbow影院网上购票系统  <br/>
          服务热线：0512-58888888| 传真：0512-58888888<br/>
          </td>
    </tr>
  </table>
    &nbsp;&nbsp;
    </form>
</body>
</html>