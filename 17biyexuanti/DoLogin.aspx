<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DoLogin.aspx.cs" Inherits="LLogin" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
<form action="" runat="server">
<table width="1250" height="768" style="background-color: #e0efff">
    <tr>
        <td style="width: 230px">
        </td>
        <td style="width: 74px">
        <div align="center">
  <table width="744" height="399" border="0" bordercolor="#5E5D62" bgcolor="#97CBFF">
    <!--DWLayoutTable-->
    <tr align="right" valign="bottom" bgcolor="#94CBFF">
      <td height="154" colspan="5"><div class="style1 style5">        </div>
      <div align="center"><img src="Images/i.jpg" width="700" alt="" height="140"></div></td>
    </tr>
    <tr valign="middle">
      <td width="16" align="left" valign="top" bgcolor="#94CBFF" style="height: 256px"><!--DWLayoutEmptyCell-->&nbsp;</td>
      <td align="right" valign="top" bgcolor=" #e0efff" style=" background-color: lightblue; height: 256px;"><!--DWLayoutEmptyCell-->&nbsp;<br />
          <img src="Images/1.jpg" style="width: 146px; height: 210px" /><br />
          &nbsp;</td>
      <td width="412" bgcolor="#e0efff" style=" background-color: lightblue; height: 256px;" class="style3">
		<span class="style8">
        </span>		
		<p class="style4">
          <span class="style6" style="background-color: powderblue">用户名:</span>
            <asp:TextBox ID="txtName" runat="server" Width="149px"></asp:TextBox>
          <p><span class="style7" style="background-color: powderblue"> 密　码:</span><asp:TextBox ID="txtPassWord" runat="server" TextMode="Password" Width="151px"></asp:TextBox><p>
                  角 &nbsp; 色:<asp:DropDownList ID="ddlUserRole" runat="server" DataSourceID="ObjectDataSource1" DataTextField="RoleName" DataValueField="UID" Width="157px">
            </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetUserRole"
                TypeName="ThesisManage.BLL.UserRoleManage"></asp:ObjectDataSource>
              </p>
          <p align="left">
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            <asp:Button ID="btnLogin" runat="server" Text="登  录" OnClick="btnLogin_Click" />
              <asp:Button ID="btnEsc" runat="server" Text="退  出" OnClick="btnEsc_Click" />

          <p align="left">
             
                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                  &nbsp; &nbsp;
                  <asp:Label ID="lbmes" runat="server" ForeColor="Red" Width="170px"></asp:Label>
          </p>
      </td>
      <td class="style3" style="width: 16px; height: 256px;"><!--DWLayoutEmptyCell-->&nbsp;</td>
    </tr>
    <tr>
        <td></td>
        <td colspan="3">
            </td>
        <td></td>
    </tr>
  </table>
  <p>
      <script language="JavaScript" type="text/javascript">         
 var msg  = "欢迎登录毕业设计选题系统：））" ;         
var interval = 120;         
var spacelen = 120;         
var space10=" ";         
var seq=0;         
function Scroll() {         
len = msg.length;         
window.status = msg.substring(0, seq+1);         
seq++;         
if ( seq >= len ) {          
seq = 0;          
window.status = '';         
window.setTimeout("Scroll();", interval );         
}         
else         
window.setTimeout("Scroll();", interval );         
}          
Scroll();         
</script>        </p>
</div>
        </td>
        <td style="width: 74px"></td>
    </tr>
</table>
</form>
</body>

</html>
