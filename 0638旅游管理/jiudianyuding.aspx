<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jiudianyuding.aspx.cs" Inherits="jiudianyuding" %>
<%@ Register Src="qtleft.ascx" TagName="qtleft" TagPrefix="uc3" %>

<%@ Register Src="qtdown.ascx" TagName="qtdown" TagPrefix="uc2" %>

<%@ Register Src="qttop.ascx" TagName="qttop" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>著名旅游管理系统</title><script language="javascript" src="js/Calendar.js"></script>
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
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <form id="form1" runat="server">
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
                        <td width="95%" class="STYLE2"><strong>酒店预订</strong></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="100%" valign="top"><table id="Table14" width="758" height="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td background="qtimages/1_02_02_02_02_01.jpg">&nbsp;</td>
                        <td width="733" height="183" valign="top" class=newsline>
                          <p align="center">
                              <table align="center" border="1" bordercolordark="#9cc7ef" bordercolorlight="#145aa0"
                                  cellpadding="4" cellspacing="0" style="width: 92%">
                                  <tr>
                                      <td align="left" nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体">酒店名称:</font></td>
                                      <td align="left" width="79%">
                                          <asp:TextBox ID="jiudianmingcheng" runat="server" Width="150px"></asp:TextBox>客房编号：<asp:TextBox
                                              ID="kefangbianhao" runat="server"></asp:TextBox></td>
                                  </tr>
                                  <tr>
                                      <td align="left" nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体">预订时间:</font></td>
                                      <td align="left" width="79%">
                                          <asp:TextBox ID="yudingshijian" runat="server" need="1" onclick="getDate(form1.yudingshijian,'2')"></asp:TextBox></td>
                                  </tr>
                                  <tr>
                                      <td align="left" nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体">预订天数:</font></td>
                                      <td align="left" width="79%">
                                          <asp:TextBox ID="yudingtianshu" runat="server"></asp:TextBox></td>
                                  </tr>
                                  <tr>
                                      <td align="left" nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体">您的姓名:</font></td>
                                      <td align="left" width="79%">
                                          <asp:TextBox ID="nindexingming" runat="server"></asp:TextBox></td>
                                  </tr>
                                  <tr>
                                      <td align="left" nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体">您的电话:</font></td>
                                      <td align="left" width="79%">
                                          <asp:TextBox ID="nindedianhua" runat="server"></asp:TextBox></td>
                                  </tr>
                                  <tr>
                                      <td align="left" nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体">您的身份证:</font></td>
                                      <td align="left" width="79%">
                                          <asp:TextBox ID="nindeshenfenzheng" runat="server" Width="395px"></asp:TextBox></td>
                                  </tr>
                                  <tr>
                                      <td align="left" nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体">备注:</font></td>
                                      <td align="left" width="79%">
                                          <asp:TextBox ID="beizhu" runat="server" Height="100px" TextMode="MultiLine" Width="400px"></asp:TextBox></td>
                                  </tr>
                                  <tr>
                                      <td align="left" height="25" nowrap="nowrap" style="width: 164px" width="164">
                                          <div align="right">
                                              <font face="宋体"></font>&nbsp;</div>
                                      </td>
                                      <td align="left" height="25" width="59%">
                                          &nbsp;
                                          <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="预订" /><font
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

