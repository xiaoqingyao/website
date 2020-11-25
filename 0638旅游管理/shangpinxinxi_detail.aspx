<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shangpinxinxi_detail.aspx.cs" Inherits="shangpinxinxi_detail" %>

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
                        <td width="95%" class="STYLE2"><strong>商品详细</strong></td>
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
                                  cellpadding="4" cellspacing="0" style="width: 94%">
                                  <tr>
                                      <td align="left" nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体">编号:</font></td>
                                      <td align="left" style="width: 49%">
                                          <%=nbianhao %>
                                      </td>
                                      <td align="center" rowspan="6" width="79%">
                                          <img src="<%=ntupian %>" style="width: 237px; height: 224px" />
                                      </td>
                                  </tr>
                                  <tr style="font-family: 宋体">
                                      <td align="left" nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体"><span style="font-family: Times New Roman">名称</span>:</font></td>
                                      <td align="left" style="width: 49%">
                                          <%=nmingcheng %>
                                      </td>
                                  </tr>
                                  <tr style="font-family: 宋体">
                                      <td align="left" nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体">价格:</font></td>
                                      <td align="left" style="width: 49%">
                                          <%=njiage %>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td align="left" nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体">类别:</font></td>
                                      <td align="left" style="width: 49%">
                                          <%=nleibie %>
                                      </td>
                                  </tr>
                                  <tr style="font-family: Times New Roman">
                                      <td align="left" nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体">库存:</font></td>
                                      <td align="left" style="width: 49%">
                                          <%=nkucun %>
                                      </td>
                                  </tr>
                                  <tr style="font-family: Times New Roman">
                                      <td align="left" nowrap="nowrap" style="width: 164px" width="30">
                                          <font face="宋体">发布人:</font></td>
                                      <td align="left" style="width: 49%">
                                          <%=nfaburen %>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td align="left" height="25" nowrap="nowrap" style="width: 164px" width="164">
                                          <font face="宋体">简介:</font>
                                      </td>
                                      <td align="left" colspan="2" height="25">
                                          <%=njianjie %>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td colspan="3">
                                          <div align="center">
                                              &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="javascript:history.back();">返回</asp:HyperLink>&nbsp;
                                              购买数量：<asp:TextBox ID="sl" runat="server" Width="95px">1</asp:TextBox>
                                              <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="购买" /></div>
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

