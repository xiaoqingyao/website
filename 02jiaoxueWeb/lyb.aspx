<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lyb.aspx.cs" Inherits="lyb" %>

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
    <table width="900" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr>
		<td>
			<uc1:top ID="Top1" runat="server" /></td>
	</tr>
	<tr>
		<td style="height: 100%"><table id="Table2" height="100%" border="0" cellpadding="0" cellspacing="0" style="width: 843px">
          <tr>
            <td height="100%" valign="top"><table id="Table3" width="220" height="100%" border="0" cellpadding="0" cellspacing="0">
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
            <td valign="top" style="width: 682px"><table id="Table6" width="676" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td valign="top" style="height: 136px"><table id="Table8" height="136" border="0" cellpadding="0" cellspacing="0" style="width: 614px">
                  <tr>
                    <td height="34" background="qtimages/img_02_03_02_01.gif" style="width: 602px"><table border="0" cellpadding="0" cellspacing="0" style="width: 92%">
                      <tr>
                        <td width="14%" align="center" style="height: 15px"><span class="STYLE6">留言板</span></td>
                        <td width="86%" style="height: 15px">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="111" background="qtimages/img_02_03_02_02.gif" style="width: 702px">
                        <table id="Table7" border="0" cellpadding="0" cellspacing="0" height="100%" style="width: 666px">
                            
                            <tr>
                                <td background="qtimages/hsglanse_05_02.gif" height="100%" rowspan="1" width="8">
                                    &nbsp;</td>
                                <td style="width: 697px" valign="top" align="center">
                                    <table id="Table1" border="0" cellpadding="0" cellspacing="0" height="214" width="652">
                                        <tr>
                                            <td colspan="2" style="height: 1px" valign="top">
                                                <br />
                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                                    <tr>
                                                        <td style="width: 100%; height: 100%" valign="top">
                                                            <div align="center">
                                                                <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                                                    <!--DWLayoutTable-->
                                                                    <tr>
                                                                        <td rowspan="2" style="width: 57%" valign="top">
                                                                            <table bgcolor="#c6eec8" border="0" cellpadding="0" cellspacing="1" style="width: 100%">
                                                                                <!--DWLayoutTable-->
                                                                                <tr>
                                                                                    <td align="center" bgcolor="#ffffff" height="20" style="width: 56px" valign="middle">
                                                                                        你的姓名:</td>
                                                                                    <td align="left" bgcolor="#ffffff" colspan="2" valign="top">
                                                                                        <asp:TextBox ID="username" runat="server" Style="border-right: #339900 1px solid;
                                                                                            border-top: #339900 1px solid; font: menu; border-left: #339900 1px solid; border-bottom: #339900 1px solid"></asp:TextBox>&nbsp;</td>
                                                                                    <td bgcolor="#ffffff" style="width: 57px" valign="top">
                                                                                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username"
                                                                                            ErrorMessage="*必填"></asp:RequiredFieldValidator></td>
                                                                                </tr>
                                                                                <tr style="color: #000000">
                                                                                    <td align="center" bgcolor="#ffffff" height="20" style="width: 56px" valign="middle">
                                                                                        性 别:</td>
                                                                                    <td align="left" bgcolor="#ffffff" style="width: 110px" valign="middle">
                                                                                        <asp:RadioButton ID="Radboy" runat="server" Checked="True" GroupName="sex" Style="border-right: #009900 1px solid;
                                                                                            border-top: #009900 1px solid; font: menu; border-left: #009900 1px solid; border-bottom: #009900 1px solid"
                                                                                            Text="男" />&nbsp;
                                                                                        <asp:RadioButton ID="Radgril" runat="server" GroupName="sex" Style="border-right: #009900 1px solid;
                                                                                            border-top: #009900 1px solid; font: icon; border-left: #009900 1px solid; border-bottom: #009900 1px solid"
                                                                                            Text="女" /></td>
                                                                                    <td bgcolor="#ffffff" colspan="2" style="color: #000000; font-family: Times New Roman"
                                                                                        valign="top">
                                                                                        <!--DWLayoutEmptyCell-->
                                                                                        &nbsp;</td>
                                                                                </tr>
                                                                                <tr style="font-family: Times New Roman">
                                                                                    <td align="center" bgcolor="#ffffff" height="20" style="width: 56px" valign="middle">
                                                                                        电子邮箱:</td>
                                                                                    <td align="left" bgcolor="#ffffff" colspan="2" valign="middle">
                                                                                        <asp:TextBox ID="email" runat="server" Style="border-right: #339900 1px solid; border-top: #339900 1px solid;
                                                                                            font: menu; border-left: #339900 1px solid; border-bottom: #339900 1px solid"></asp:TextBox>&nbsp;</td>
                                                                                    <td bgcolor="#ffffff" style="width: 57px" valign="top">
                                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email"
                                                                                            ErrorMessage="格式不对" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>&nbsp;</td>
                                                                                </tr>
                                                                                <tr style="font-family: Times New Roman">
                                                                                    <td align="center" bgcolor="#ffffff" height="20" style="width: 56px" valign="middle">
                                                                                        个人主页:</td>
                                                                                    <td align="left" bgcolor="#ffffff" colspan="2" valign="top">
                                                                                        <asp:TextBox ID="homepage" runat="server" Style="border-right: #339900 1px solid;
                                                                                            border-top: #339900 1px solid; font: menu; border-left: #339900 1px solid; border-bottom: #339900 1px solid"></asp:TextBox>&nbsp;</td>
                                                                                    <td bgcolor="#ffffff" style="width: 57px" valign="top">
                                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="homepage"
                                                                                            ErrorMessage="格式不对" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"></asp:RegularExpressionValidator>&nbsp;</td>
                                                                                </tr>
                                                                                <tr style="font-family: Times New Roman">
                                                                                    <td align="center" bgcolor="#ffffff" height="20" style="width: 56px" valign="middle">
                                                                                        QQ号码:</td>
                                                                                    <td align="left" bgcolor="#ffffff" style="width: 110px" valign="top">
                                                                                        <asp:TextBox ID="qq" runat="server" Style="border-right: #339900 1px solid; border-top: #339900 1px solid;
                                                                                            font: menu; border-left: #339900 1px solid; border-bottom: #339900 1px solid"
                                                                                            Width="102px"></asp:TextBox></td>
                                                                                    <td bgcolor="#ffffff" colspan="2" valign="top">
                                                                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="qq"
                                                                                            ErrorMessage="格式不对" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>&nbsp;</td>
                                                                                </tr>
                                                                                <tr style="font-family: Times New Roman">
                                                                                    <td bgcolor="#ffffff" height="27" style="width: 56px" valign="top">
                                                                                        <!--DWLayoutEmptyCell-->
                                                                                        <span>&nbsp;</span></td>
                                                                                    <td align="center" bgcolor="#ffffff" style="width: 110px; font-family: Times New Roman"
                                                                                        valign="middle">
                                                                                        &nbsp;<asp:Button ID="addly" runat="server" OnClick="addly_Click" Style="border-right: #009900 2px solid;
                                                                                            border-top: #009900 2px solid; font: menu; border-left: #009900 2px solid; border-bottom: #009900 2px solid;
                                                                                            background-color: #99cc99" Text="添加留言" Width="77px" /></td>
                                                                                    <td align="left" bgcolor="#ffffff" colspan="2" valign="middle">
                                                                                        &nbsp;<asp:CheckBox ID="ishde" runat="server" Text="悄悄话" /></td>
                                                                                </tr>
                                                                                <tr style="font-family: Times New Roman">
                                                                                    <td bgcolor="#ffffff" height="0" style="width: 56px; height: 24px">
                                                                                    </td>
                                                                                    <td bgcolor="#ffffff" style="width: 110px; height: 24px">
                                                                                    </td>
                                                                                    <td style="width: 6px; height: 24px">
                                                                                    </td>
                                                                                    <td bgcolor="#ffffff" style="width: 57px; height: 24px">
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td style="width: 467px; font-family: Times New Roman; height: 101px" valign="top">
                                                                            <table border="0" cellpadding="0" cellspacing="0" width="96%">
                                                                                <!--DWLayoutTable-->
                                                                                <tr>
                                                                                    <td align="left" style="width: 100%; height: 97px" valign="top">
                                                                                        <span>&nbsp;</span><asp:TextBox ID="lybody" runat="server" Height="91px" MaxLength="500"
                                                                                            Style="border-right: #339900 1px solid; border-top: #339900 1px solid; font: menu;
                                                                                            border-left: #339900 1px solid; border-bottom: #339900 1px solid" TextMode="MultiLine"
                                                                                            Width="95%"></asp:TextBox></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="font-family: Times New Roman">
                                                                        <td height="27" style="width: 467px" valign="top">
                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                <!--DWLayoutTable-->
                                                                                <tr>
                                                                                    <td height="26" width="457">
                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lybody"
                                                                                            ErrorMessage="内容不能为空"></asp:RequiredFieldValidator>
                                                                                        &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 留 言 内 容<asp:Label ID="Label1" runat="server"
                                                                                            Width="131px"></asp:Label></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                            <div align="center">
                                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 520px; font-family: Times New Roman">
                                                                    <!--DWLayoutTable-->
                                                                    <tr>
                                                                        <td align="center" height="18" style="width: 705px" valign="middle">
                                                                            留 言 列 表 &nbsp; &nbsp;
                                                                            <asp:HyperLink ID="admin_go" runat="server" NavigateUrl="login.aspx">管理登陆</asp:HyperLink>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                            <div align="center">
                                                                &nbsp;<asp:Repeater ID="rpt1" runat="server">
                                                                    <ItemTemplate>
                                                                        <table bgcolor="#009900" border="0" cellpadding="0" cellspacing="1" class="tb" width="100%">
                                                                            <!--DWLayoutTable-->
                                                                            <tr>
                                                                                <td bgcolor="#FFFFFF" rowspan="3" valign="top" width="11">
                                                                                    <!--DWLayoutEmptyCell-->
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td align="center" bgcolor="#FFFFFF" rowspan="2" valign="middle" width="85">
                                                                                    <%#"<img width='70'height='70' src=img/" + Eval("Face") + ".jpg border=0>"%>
                                                                                </td>
                                                                                <td align="left" bgcolor="#FFFFFF" height="20" valign="middle" width="528">
                                                                                    &nbsp; &nbsp; 留言于:<%#Eval("adddate")%>
                                                                                </td>
                                                                                <td align="center" bgcolor="#FFFFFF" valign="middle" width="136">
                                                                                    &nbsp; 教师回复
                                                                                </td>
                                                                                <td bgcolor="#FFFFFF" rowspan="3" style="width: 10px" valign="top" width="12">
                                                                                    <!--DWLayoutEmptyCell-->
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left" bgcolor="#FFFFFF" height="78" valign="top">
                                                                                    &nbsp;&nbsp;<%# showbody(Convert.ToBoolean(Eval("IsHidden")),Eval("body").ToString())%>
                                                                                    <%# showrely((bool)Eval("isrely"),Eval("rebody").ToString()) %>
                                                                                </td>
                                                                                <td align="left" bgcolor="#FFFFFF" height="78" valign="top">
                                                                                    <%#Eval("rebody")%>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="center" bgcolor="#FFFFFF" style="height: 25px" valign="middle">
                                                                                    姓名:<%#Eval("username")%></td>
                                                                                <td align="left" bgcolor="#FFFFFF" colspan="2" style="height: 25px" valign="middle">
                                                                                    &nbsp; &nbsp; 邮 箱:<%#Eval("email")%>&nbsp; &nbsp; QQ:<%#Eval("qq")%>&nbsp; &nbsp;
                                                                                    主页:<%#Eval("homepage")%></td>
                                                                            </tr>
                                                                        </table>
                                                                        <br>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                                <table id="Table4" border="0" cellpadding="1" cellspacing="1" style="font-family: Times New Roman"
                                                                    width="100%">
                                                                    <tr>
                                                                        <td align="center" style="width: 775px; height: 18px">
                                                                            共 <font face="宋体"><b>
                                                                                <asp:Label ID="lbTotalPage" runat="server">1</asp:Label></b></font> 页 &nbsp;
                                                                            | &nbsp;
                                                                            <asp:HyperLink ID="hlkFirstPage" runat="server">首页</asp:HyperLink>
                                                                            &nbsp; | &nbsp;
                                                                            <asp:HyperLink ID="hlkPrevPage" runat="server">上一页</asp:HyperLink>
                                                                            &nbsp; | &nbsp;
                                                                            <asp:HyperLink ID="hlkNextPage" runat="server">下一页</asp:HyperLink>
                                                                            &nbsp; | &nbsp;
                                                                            <asp:HyperLink ID="hlkLastPage" runat="server">末页</asp:HyperLink>
                                                                            &nbsp; | &nbsp; 第 <font face="宋体"><b>
                                                                                <asp:Label ID="lbCurrentPage" runat="server">1</asp:Label></b></font> 页
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="javascript:history.back();">返回</asp:HyperLink></td>
                            </tr>
                        </table>
                    </td>
                  </tr>
                  <tr>
                    <td style="width: 702px"><img src="qtimages/img_02_03_02_03.gif" width="676" height="1" alt=""></td>
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
