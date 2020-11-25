<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userreg.aspx.cs" Inherits="userreg" %>

<%@ Register Src="qtleft.ascx" TagName="qtleft" TagPrefix="uc3" %>

<%@ Register Src="qtdown.ascx" TagName="qtdown" TagPrefix="uc2" %>

<%@ Register Src="qttop.ascx" TagName="qttop" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>著名旅游管理系统</title>
    <LINK href="qtimages/style.css" type=text/css rel=stylesheet>
    <style type="text/css">
<!--
.STYLE1 {color: #006666}
.STYLE2 {color: #006666; font-weight: bold; }
.STYLE5 {
	color: #FFFFFF;
	font-weight: bold;
}
.STYLE6 {color: #FFCC33}
-->
</style>
<script language="javascript">	
function OpenScript(url,width,height)
{
  var win = window.open(url,"SelectToSort",'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=yes' );
}
	function OpenDialog(sURL, iWidth, iHeight)
{
   var oDialog = window.open(sURL, "_EditorDialog", "width=" + iWidth.toString() + ",height=" + iHeight.toString() + ",resizable=no,left=0,top=0,scrollbars=no,status=no,titlebar=no,toolbar=no,menubar=no,location=no");
   oDialog.focus();
}
</script>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <form id="Form1" runat="server">
    <div>
       <table width="978" height="1081" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr>
		<td>
            <uc1:qttop ID="Qttop1" runat="server" />
        </td>
	</tr>
	<tr>
		<td><table id="Table2" width="978" height="785" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><uc3:qtleft ID="Qtleft1" runat="server" /></td>
              
    
            <td valign="top"><table id="Table12" width="758" height="785" border="0" cellpadding="0" cellspacing="0">
              
              <tr>
                <td height="785" valign="top"><table id="Table13" width="758" height="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="758" height="42" background="qtimages/1_02_02_02_01.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="5%">&nbsp;</td>
                        <td width="95%" class="STYLE2"><strong>用户注册</strong></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="100%" valign="top"><table id="Table14" width="758" height="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td background="qtimages/1_02_02_02_02_01.jpg">&nbsp;</td>
                        <td width="733" height="183" valign="top" class=newsline>
                          <p align="center">
                              <table align="center" border="1" bordercolor="#a5dfc6" cellpadding="0" cellspacing="0"
                                  style="border-collapse: collapse; height: 494px" width="96%">
                                  <tr>
                                      <td nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体">用户名:</font></td>
                                      <td align="left" width="79%">
                                          <asp:TextBox ID="yonghuming" runat="server"></asp:TextBox>*<asp:RequiredFieldValidator
                                              ID="RequiredFieldValidatoryonghuming" runat="server" ControlToValidate="yonghuming"
                                              ErrorMessage="必填"></asp:RequiredFieldValidator></td>
                                  </tr>
                                  <tr style="color: #000000; font-family: 宋体">
                                      <td nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体"><span>密码</span>:</font></td>
                                      <td align="left" style="font-family: Times New Roman" width="79%">
                                          <asp:TextBox ID="mima" runat="server" TextMode="Password" Width="147px"></asp:TextBox>*<asp:RequiredFieldValidator
                                              ID="RequiredFieldValidatormima" runat="server" ControlToValidate="mima" ErrorMessage="必填"></asp:RequiredFieldValidator></td>
                                  </tr>
                                  <tr style="color: #000000; font-family: 宋体">
                                      <td nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体"><span>姓名:</span></font></td>
                                      <td align="left" style="font-family: Times New Roman" width="79%">
                                          <asp:TextBox ID="xingming" runat="server"></asp:TextBox>*<asp:RequiredFieldValidator
                                              ID="RequiredFieldValidatorxingming" runat="server" ControlToValidate="xingming"
                                              ErrorMessage="必填"></asp:RequiredFieldValidator></td>
                                  </tr>
                                  <tr style="color: #000000; font-family: 宋体">
                                      <td nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体">电话:</font></td>
                                      <td align="left" width="79%">
                                          <asp:TextBox ID="dianhua" runat="server"></asp:TextBox>*<asp:RequiredFieldValidator
                                              ID="RequiredFieldValidatordianhua" runat="server" ControlToValidate="dianhua"
                                              ErrorMessage="必填"></asp:RequiredFieldValidator></td>
                                  </tr>
                                  <tr style="color: #000000; font-family: 宋体">
                                      <td nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体">邮箱:</font></td>
                                      <td align="left" width="79%">
                                          <asp:TextBox ID="youxiang" runat="server"></asp:TextBox></td>
                                  </tr>
                                  <tr>
                                      <td nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体">QQ:</font></td>
                                      <td align="left" width="79%">
                                          <asp:TextBox ID="QQ" runat="server"></asp:TextBox></td>
                                  </tr>
                                  <tr>
                                      <td nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体">头像:</font></td>
                                      <td align="left" width="79%">
                                          <asp:TextBox ID="touxiang" runat="server" Width="395px"></asp:TextBox>
                                          <a href="javaScript:OpenScript('hsgupfile.aspx?Result=touxiang',500,30)">
                                              <img align="absMiddle" border="0" height="16" src="Images/Upload.gif" width="30" /></a></td>
                                  </tr>
                                  <tr>
                                      <td nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体">籍贯:</font></td>
                                      <td align="left" style="font-family: Times New Roman" width="79%">
                                          <asp:TextBox ID="jiguan" runat="server"></asp:TextBox></td>
                                  </tr>
                                  <tr style="font-family: Times New Roman">
                                      <td nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体">地址:</font></td>
                                      <td align="left" width="79%">
                                          <asp:TextBox ID="dizhi" runat="server" Width="395px"></asp:TextBox></td>
                                  </tr>
                                  <tr style="font-family: Times New Roman">
                                      <td nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体">性别:</font></td>
                                      <td align="left" width="79%">
                                          <asp:DropDownList ID="xingbie" runat="server">
                                          </asp:DropDownList></td>
                                  </tr>
                                  <tr>
                                      <td nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体">备注:</font></td>
                                      <td align="left" width="79%">
                                          <asp:TextBox ID="beizhu" runat="server" Height="100px" TextMode="MultiLine" Width="400px"></asp:TextBox></td>
                                  </tr>
                                  <tr>
                                      <td height="25" nowrap="nowrap" style="width: 164px" width="164">
                                          <div align="right">
                                              <font face="宋体"></font>&nbsp;</div>
                                      </td>
                                      <td align="left" height="25" width="59%">
                                          &nbsp;
                                          <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Style="border-right: #000000 1px solid;
                                              border-top: #000000 1px solid; border-left: #000000 1px solid; color: #666666;
                                              border-bottom: #000000 1px solid; height: 19px" Text="注册" /><font face="宋体">&nbsp;</font>
                                          <input id="Reset1" style="border-right: #000000 1px solid; border-top: #000000 1px solid;
                                              border-left: #000000 1px solid; color: #666666; border-bottom: #000000 1px solid;
                                              height: 19px" type="reset" value="重置" /></td>
                                  </tr>
                                  <tr>
                                      <td colspan="2">
                                          <div align="center">
                                          </div>
                                      </td>
                                  </tr>
                              </table>
                              &nbsp;</p></td>
                        <td width="13" background="qtimages/1_02_02_02_02_03.jpg">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="11"><img src="qtimages/1_02_02_02_03.jpg" width="758" height="11" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table></td>
	</tr>
	<tr>
		<td>
            <uc2:qtdown ID="Qtdown1" runat="server" />
        </td>
	</tr>
</table>
    </div></form>
</body>
</html>

