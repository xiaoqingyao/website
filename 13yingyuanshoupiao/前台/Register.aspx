<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="前台_Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Rainbow影院网上购票系统</title>
    <style type="text/css">
        .style1
        {
            height: 23px;
            text-align: center;
            font-size: xx-large;
            font-family: 黑体;
        }
    </style>
</head>
<body>
<form id="form2" name="form1" method="post" runat="server" action="">
  <table width="800px" border="0" align="center" bgcolor="#CCCCCC">
    <tr>
      <td><img alt="" src="image/0.jpg" width="100%" /></td>
    </tr>
    <tr>
      <td background="image/27.jpg" class="style1">
          <span ><strong>&nbsp;用户注册</strong></span></td>
    </tr>
    <tr>
      <td><table width="80%" border="0" align="center">
        <tr>
          <td style="width: 44%">&nbsp;</td>
          <td style="width: 13px">&nbsp;</td>
          <td style="width: 149px">&nbsp;</td>
        </tr>
        <tr>
          <td style="width: 44%; text-align: right"><div align="right">用户名：</div></td>
          <td style="width: 13px"><asp:TextBox ID="username_txt" runat="server" ToolTip="Input your username"></asp:TextBox></td>
          <td style="width: 149px; text-align: left;">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username_txt"
                  ErrorMessage="用户名必填" Display="Dynamic"></asp:RequiredFieldValidator>
              <br />
              <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="此用户名已被使用"
                  Visible="False"></asp:Label></td>
        </tr>
        <tr>
          <td style="width: 44%; text-align: right; height: 21px;"><p align="right">密<span 
                  lang="zh-cn">&nbsp;&nbsp;&nbsp; </span>码：</p>
                          </td>
          <td style="width: 13px; height: 21px;"><asp:TextBox ID="password_txt" runat="server" ToolTip="Input your passward" TextMode="Password"></asp:TextBox></td>
          <td style="width: 149px; height: 21px;">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password_txt"
                  ErrorMessage="密码必填" Display="Dynamic"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
          <td style="width: 44%"><div align="right">确认密码：</div></td>
          <td style="width: 13px"><asp:TextBox ID="passward_confirm_txt" runat="server" ToolTip="Confirm your passward" TextMode="Password"></asp:TextBox></td>
          <td style="width: 149px; text-align: left;">
              <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password_txt"
                  ControlToValidate="passward_confirm_txt" ErrorMessage="密码不匹配" 
                  Display="Dynamic"></asp:CompareValidator>
              <br />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="passward_confirm_txt"
                  Display="Dynamic" ErrorMessage="密码必填"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
          <td style="width: 44%; height: 21px;"><div align="right">邮<span lang="zh-cn">&nbsp;&nbsp;&nbsp;
              </span>箱：</div></td>
          <td style="width: 13px; height: 21px;"><asp:TextBox ID="email_txt" runat="server" ToolTip="Input your e-mail addaress"></asp:TextBox></td>
          <td style="width: 149px; height: 21px;">
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                  ControlToValidate="email_txt" ErrorMessage="邮箱格式不正确" 
                  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                  Display="Dynamic"></asp:RegularExpressionValidator>
              <br />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="email_txt"
                  Display="Dynamic" ErrorMessage="邮箱必填" ToolTip="input your user name"></asp:RequiredFieldValidator>
              <br />
              <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="此邮箱已被使用"
                  Visible="False"></asp:Label></td>
        </tr>
          <tr>
              <td style="width: 44%; height: 21px; text-align: right">
                  地<span lang="zh-cn">&nbsp;&nbsp;&nbsp; </span>址：</td>
              <td style="width: 13px; height: 21px">
                  <asp:TextBox ID="address_txt" runat="server"></asp:TextBox></td>
              <td style="width: 149px; height: 21px">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="address_txt"
                      ErrorMessage="地址必填" Display="Dynamic"></asp:RequiredFieldValidator></td>
          </tr>
          <tr>
              <td style="width: 44%; height: 21px; text-align: right">
                  姓：</td>
              <td style="width: 13px; height: 21px">
                  <asp:TextBox ID="familyname_txt" runat="server" ToolTip="input your real family name"></asp:TextBox></td>
              <td style="width: 149px; height: 21px">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="familyname_txt"
                      ErrorMessage="输入姓" Display="Dynamic" Width="173px"></asp:RequiredFieldValidator></td>
          </tr>
          <tr>
              <td style="width: 44%; height: 21px; text-align: right">
                  名：</td>
              <td style="width: 13px; height: 21px">
                  <asp:TextBox ID="givenname_txt" runat="server" ToolTip="input your real given name"></asp:TextBox></td>
              <td style="width: 149px; height: 21px">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="givenname_txt"
                      ErrorMessage="输入名" Display="Dynamic" Width="179px"></asp:RequiredFieldValidator></td>
          </tr>
          <tr>
              <td style="width: 44%; height: 21px; text-align: right">
                  卡<span lang="zh-cn">&nbsp;&nbsp;&nbsp; </span>号：</td>
              <td style="width: 13px; height: 21px">
                  <asp:TextBox ID="idcard_txt" runat="server" ToolTip="input your real id card or driver licence"></asp:TextBox></td>
              <td style="width: 149px; height: 21px">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="idcard_txt"
                      ErrorMessage="输入卡号" TabIndex="7" Display="Dynamic"></asp:RequiredFieldValidator></td>
          </tr>
        <tr>
          <td colspan="3" style="text-align: center">
              <br />
              <asp:Button ID="account_detail_btn" runat="server" Text="确定提交" 
                  ToolTip="Submit and finish creating your account" 
                  OnClick="account_detail_btn_Click" Height="32px" 
                  style="font-size: large; font-weight: 700" />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:Button ID="reset_btn" runat="server" Text="重置信息" ToolTip="Reset all" 
                  style="font-size: large; font-weight: 700" onclick="reset_btn_Click" />
          </td>
        </tr>
        <tr>
          <td style="height: 21px;" colspan="3">&nbsp; &nbsp;&nbsp;
          </td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td style="text-align: center"><HR>
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