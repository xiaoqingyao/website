<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ly.aspx.cs" Inherits="ly" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>留言本</title>
</head>

<center><font color="green">[发表留言]</font></center>

<body>
<center>
    <form id="form1" runat="server">
    <div>
    <table border="1" width="500">
    <tr><td>    
      <table border="0" width="500">
        <tr bgcolor="#F0F8FF">
          <td align="right" width="15%"><small>您的昵称：</small></td>
          <td width="35%">
           <asp:textbox id="name" columns="17" runat="server"  />
          </td>
          <td width="15%" align="right" ><small>性  别：</small></td>
          <td width="35%">
            <asp:RadioButton id="Radio1"
                 Text="帅哥"
                 Checked="true"
                 Font-size="11"
                 GroupName="GroupName"
                 Runat="Server" />&nbsp;&nbsp;                                                                               
            <asp:RadioButton id="Radio2"
                 Text="靓女"
                 Font-size="11"
                 GroupName="GroupName"
                 Runat="Server" />&nbsp;&nbsp;
          </td>
        </tr>
        <tr bgcolor="#F0F8FF">
          <td align="right" rowspan="4"><small>选择头像：</small></td>
          <td rowspan="4">
            <asp:Image id="dispimg"
                 AlternateText="图片预览"
                 ImageUrl=""
                 width="50"
                 height="100"
                 Runat="Server" />&nbsp;&nbsp;
               
           <asp:dropdownlist id="drop" 
                 autopostback="True" 
                 OnSelectedIndexChanged="Index_Changed"
                 runat="server">
                 </asp:dropdownlist>
               
          </td>
          <td align="right" ><small>QQ号码：</small></td>
          <td>
            <asp:TextBox id="qq" columns="19" runat="server" />
          </td>
        </tr>

        <tr bgcolor="#F0F8FF">
          <td align="right"><small>Email ：</small></td>                                                                         
          <td>
            <asp:textbox id="email" columns="19" runat="server" />
          </td>
        </tr>
        <tr bgcolor="#F0F8FF">
          <td align="right"><small>个人主页：</small></td>
          <td>
            <asp:textbox id="homepage" columns="19" runat="server" />
          </td>
        </tr>
        <tr>
        <!--<tr bgcolor="#F0F8FF"><td bgcolor="#F0F8FF"></td><td bgcolor="#F0F8FF"></td>-->
          <td align="right" bgcolor="#F0F8FF"><small>真实姓名：</small></td>
          <td bgcolor="#F0F8FF">
            <asp:textbox id="textbox1" columns="19" runat="server" />
          </td>
        </tr>
        <tr bgcolor="#F0F8FF">
          <td align="right"><small>留言主题：</small></td>
          <td colspan="3">
            <asp:textbox id="theTitle" columns="61" runat="server" />
          </td>
        </tr>
        <tr bgcolor="#F0F8FF">
          <td align="right" valign="top"><small>留言内容：</small></td>
          <td colspan="3">
            <asp:textbox id="Content" textmode="multiline" columns="47" rows="4" runat="server" />
          </td>
        </tr>
        <tr bgcolor="#F0F8FF">
          <td colspan="4" align="center" height="30" valign="bottom">
            <asp:button id="sure" onclick="sure_click" text="确 定" runat="server" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:button id="clear" onclick="Clear_click" text="清 空" runat="server" />
          </td>
        </tr>
      </table>
    </td></tr>
  </table>
  <span id="span1" runat="server" />
    </div>
        </form>
    </center>

</body>
</html>
