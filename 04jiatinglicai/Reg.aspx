<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reg.aspx.cs" Inherits="Reg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>家庭理财管理系统</title>
    <LINK rel="stylesheet" 
type="text/css" href="Images/lanmu.css">
<STYLE type="text/css">
<!--
.STYLE6 {	font-family: "楷体_GB2312";
	font-size: 16px;
	line-height:25px;
}
.STYLE8 {font-family: "楷体_GB2312"; font-size: 24px; }
.STYLE9 {	font-size: 22px;
	font-weight: bold;
}
    .style1
    {
        color: #000000;
        font-size: xx-large;
    }
-->
</STYLE>
</head>
<body leftMargin="0" topMargin="0" bgColor="#e3f0fd" marginheight="0" 
marginwidth="0">
    <form id="form1" runat="server">
   <TABLE id="__01" border="0" cellSpacing="0" cellPadding="0" width="851" bgColor="#ffffff" 
align="center" style="height: 21px">
  <TBODY>
  <TR>
    <TD rowSpan="2" colSpan="1" background="Images/bggg.gif" class="style1">家庭理财管理系统</TD>
      
    <TD><IMG alt="" src="Images/分隔符.gif" width="1" height="51"></TD></TR>
  <TR>
 
    <TD style="height: 50px"><IMG alt="" src="Images/分隔符.gif" width="1" height="50"></TD></TR>
  <TR>
      <td colspan="3" style="height: 41px">
      <DIV id="lanmu-05" style="width: 854px">
       
       
       <A class="dh_bai" href="Default.aspx">用户注册&nbsp;&nbsp;</A>
       
       </DIV>
      </td>
    <TD style="height: 41px"><IMG alt="" src="Images/分隔符.gif" width="1" height="29"></TD></TR>
  <TR>
    <TD colSpan="3" style="height: 15px"><IMG alt="" src="Images/lanmu_07.gif" width="850" 
      height="15"></TD>
    <TD style="height: 15px"><IMG alt="" src="Images/分隔符.gif" width="1" height="15"></TD></TR>
  <TR>
    <TD vAlign="top" rowSpan="2" colSpan="3" align="left">
        <table align="center" border="0" cellpadding="3" class="" width="99%">
            <tr>
                <td class="left_title_1" style="width: 88px; height: 30px">
                    用户姓名：</td>
                <td style="width: 621px; height: 30px">
                    <asp:TextBox ID="Name" runat="server" Width="153px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name"
                        ErrorMessage="必填"></asp:RequiredFieldValidator></td>
            </tr>
            <tr style="color: #000000">
                <td class="left_title_1" style="width: 88px; height: 30px">
                    登陆账号：</td>
                <td style="width: 621px; height: 30px">
                    <asp:TextBox ID="loginName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="loginName"
                        ErrorMessage="必填"></asp:RequiredFieldValidator></td>
            </tr>
            <tr style="color: #000000">
                <td class="left_title_1" style="width: 88px; height: 30px">
                    登陆密码：</td>
                <td style="width: 621px; height: 30px">
                    <asp:TextBox ID="Pass" runat="server" TextMode="Password" Width="123px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="loginName"
                        ErrorMessage="必填"></asp:RequiredFieldValidator></td>
            </tr>
            <tr style="color: #000000">
                <td class="left_title_1" height="30" style="width: 88px">
                    性别：</td>
                <td height="30" style="width: 621px">
                    <asp:DropDownList ID="Sex" runat="server" Width="89px">
                        <asp:ListItem>男</asp:ListItem>
                        <asp:ListItem>女</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr style="color: #000000">
                <td class="left_title_1" style="width: 88px; height: 30px">
                    年龄：</td>
                <td style="width: 621px; height: 30px">
                    <asp:TextBox ID="NianLing" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
            <tr style="color: #000000">
                <td class="left_title_1" style="width: 88px; height: 30px">
                    身份证号码：</td>
                <td style="width: 621px; height: 30px">
                    <asp:TextBox ID="SFZ" runat="server" Width="319px"></asp:TextBox></td>
            </tr>
            <tr style="color: #000000">
                <td class="left_title_1" style="width: 88px; height: 30px">
                    称呼：</td>
                <td style="width: 621px; height: 30px">
                    <asp:TextBox ID="XueLI" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
            <tr style="color: #000000">
                <td class="left_title_1" style="width: 88px; height: 30px">
                    联系电话：</td>
                <td style="width: 621px; height: 30px">
                    <asp:TextBox ID="TEl" runat="server" Width="75px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="left_title_1" style="width: 88px; height: 85px">
                    备注：</td>
                <td style="width: 621px; height: 85px">
                    <asp:TextBox ID="Ds" runat="server" Height="81px" TextMode="MultiLine" Width="473px"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="center" class="left_title_1" colspan="2" style="height: 30px">
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Width="56px">注册</asp:LinkButton></td>
            </tr>
        </table>
    
      </TD>
    <TD><IMG alt="" src="Images/分隔符.gif" width="1" height="2"></TD></TR>
  <TR vAlign="top">
    <TD><IMG alt="" src="Images/分隔符.gif" width="1" height="534"></TD></TR>
  </TBODY></TABLE>
    </form>
</body>
</html>
