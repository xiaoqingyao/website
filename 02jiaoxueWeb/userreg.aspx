<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userreg.aspx.cs" Inherits="userreg" %>

<%@ Register Src="left1.ascx" TagName="left1" TagPrefix="uc3" %>
<%@ Register Src="left2.ascx" TagName="left2" TagPrefix="uc4" %>
<%@ Register Src="userlog.ascx" TagName="userlog" TagPrefix="uc2" %>
<%@ Register Src="top.ascx" TagName="top" TagPrefix="uc1" %>
<%@ Register Src="~/footer.ascx" TagPrefix="uc1" TagName="footer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>人工智能在线教学系统</title>
    <link href="qtimages/StyleSheet.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.STYLE2 {color: #FFFFFF}
.STYLE4 {color: #FFFFFF; font-weight: bold; }
.STYLE6 {color: #198A95; font-weight: bold; }
-->
</style>
</head>

<body>
    <form id="form1" runat="server">
    <div>
    <table width="900" height="964" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr>
		<td>
			<uc1:top ID="Top1" runat="server" /></td>
	</tr>
	<tr>
		<td height="541"><table id="Table2" width="900" height="532" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="532" valign="top"><table id="Table3" width="220" height="532" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td colspan="2"><img src="qtimages/img_02_01_01.gif" width="220" height="3" alt=""></td>
              </tr>
              <tr>
                <td width="9" height="100%" rowspan="3" background="qtimages/img_02_01_02.gif">&nbsp;</td>
                <td width="211" valign="middle" background="qtimages/img_02_01_03.gif" style="height: 144px">
                    <uc2:userlog ID="Userlog1" runat="server" />
                </td>
              </tr>
              <tr>
                <td height="183">
                    <uc3:left1 ID="Left1_1" runat="server" />
                </td>
              </tr>
              <tr>
                <td height="183">
                    <uc4:left2 ID="Left2_1" runat="server" />
                </td>
              </tr>
              
              <tr>
                <td height="10" colspan="2" background="qtimages/img_02_01_07.gif">&nbsp;</td>
              </tr>
            </table></td>
            <td width="4" background="qtimages/img_02_02.gif">&nbsp;</td>
            <td valign="top"><table id="Table6" width="676" height="506" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="136" valign="top"><table id="Table8" width="676" height="136" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="676" height="34" background="qtimages/img_02_03_02_01.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="14%" align="center" style="height: 15px"><span class="STYLE6">用户住册</span></td>
                        <td width="86%" style="height: 15px">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td width="676" height="111" background="qtimages/img_02_03_02_02.gif">
                        <table align="center" border="1" bordercolordark="#9cc7ef" bordercolorlight="#145aa0"
                            cellpadding="4" cellspacing="0" style="width: 87%">
                            <tr>
                                <td nowrap="nowrap" style="width: 99px">
                                    <font face="宋体">用户名:</font></td>
                                <td width="79%">
                                    <asp:TextBox ID="yonghuming" runat="server"></asp:TextBox>*<asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator1" runat="server" ControlToValidate="yonghuming" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" style="width: 99px">
                                    <font face="宋体">密码:</font></td>
                                <td width="79%">
                                    <asp:TextBox ID="mima" runat="server" TextMode="Password"></asp:TextBox>*<asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator2" runat="server" ControlToValidate="mima" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" style="width: 99px">
                                    验证密码:</td>
                                <td width="79%">
                                    <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>*<asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="mima"
                                        ControlToValidate="TextBox1" ErrorMessage="密码不一至"></asp:CompareValidator></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" style="width: 99px">
                                    <font face="宋体">姓名:</font></td>
                                <td width="79%">
                                    <asp:TextBox ID="xingming" runat="server"></asp:TextBox>*<asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator3" runat="server" ControlToValidate="xingming" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" style="width: 99px">
                                    <font face="宋体">电话:</font></td>
                                <td width="79%">
                                    <asp:TextBox ID="dianhua" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" style="width: 99px">
                                    <font face="宋体">身份证:</font></td>
                                <td width="79%">
                                    <asp:TextBox ID="shenfenzheng" runat="server" Width="395px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" style="width: 99px">
                                    <font face="宋体">邮箱:</font></td>
                                <td width="79%">
                                    <asp:TextBox ID="youxiang" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" style="width: 99px">
                                    <font face="宋体">QQ:</font></td>
                                <td width="79%">
                                    <asp:TextBox ID="QQ" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" style="width: 99px">
                                    <font face="宋体">地址:</font></td>
                                <td width="79%">
                                    <asp:TextBox ID="dizhi" runat="server" Width="395px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" style="width: 99px">
                                    <font face="宋体">性别:</font></td>
                                <td width="79%">
                                    <asp:DropDownList ID="xingbie" runat="server">
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td height="25" nowrap="nowrap" style="width: 99px">
                                    <div align="right">
                                        <font face="宋体"></font>&nbsp;</div>
                                </td>
                                <td height="25" width="59%">
                                    &nbsp;
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="注册" /><font
                                        face="宋体">&nbsp;</font>
                                    <input id="Reset1" type="reset" value="重置" /></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div align="center">
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/img_02_03_02_03.gif" width="676" height="1" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              
              <tr>
                <td height="171"></td>
              </tr>
              
              
            </table></td>
          </tr>
      </table></td>
	</tr>
	<tr>
		<td>
            <uc1:footer runat="server" ID="footer" />
		</td>
	</tr>
</table>
    </div>
    </form>
</body>
</html>
