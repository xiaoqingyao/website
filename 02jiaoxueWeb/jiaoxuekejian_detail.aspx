<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jiaoxuekejian_detail.aspx.cs" Inherits="jiaoxuekejian_detail" %>

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
                        <td width="14%" align="center" style="height: 15px"><span class="STYLE6">课件详细</span></td>
                        <td width="86%" style="height: 15px">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td width="676" height="111" background="qtimages/img_02_03_02_02.gif">
                        <table align="center" border="1" bordercolordark="#9cc7ef" bordercolorlight="#145aa0"
                            cellpadding="4" cellspacing="0" style="width: 91%">
                            <tr>
                                <td nowrap="nowrap" style="height: 38px;" colspan="2" align=center>
                                    <font face="宋体"><%=nmingcheng %></font>
                                </td>
                            </tr>
                            <tr style="color: #000000; font-family: 宋体">
                                <td nowrap="nowrap" colspan="2" align=center>
                                    <font face="宋体"><span style="font-family: Times New Roman">编号:<%=nfaburen %>  课程:<%=nkecheng%>  发布人
                                        <%=nfaburen%>  文件:<a href="<%=nwenjian %>">下载</a></span></font></td>
                            </tr>
                            
                            <tr style="color: #000000">
                                <td nowrap="nowrap" style="height: 62px;" colspan="2">
                                    <font face="宋体"></font><%=njianjie %>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div align="center">
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="javascript:history.back();">返回</asp:HyperLink></div>
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

