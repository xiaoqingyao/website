<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="houseIntermediaryMIS.Admin.Login" %>
<%@ Register TagPrefix="UCtrl" TagName="Foot" Src="~/UserControls/FootCtrl.ascx" %>
<%@ Register TagPrefix="UCtrl" TagName="Head" Src="~/UserControls/HeadCtrl.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="Form1"  runat="server" >
    <UCtrl:Head id="Head1" runat="server"></UCtrl:Head>
    <table cellspacing="0" cellpadding="0" width="450" align="center" border="0">
        <tr>
            <td align="center" width="166">
                <img border="0" src="/Images/userinfo.gif" width="166" height="166">
            </td>
            <td align="left">
                <table id="Table3" width="100%" align="center" border="0">
                    <tbody>
                        <tr>
                            <td align="center">
                                <font size="+1"><strong>员工登录后台</strong></font>
                                <table id="Table4" cellspacing="2" cellpadding="2" width="100%" border="0">
                                    <tbody>
                                        <tr>
                                            <td width="1%">
                                            </td>
                                            <td width="23%">
                                                用&nbsp;户&nbsp;名：
                                            </td>
                                            <td width="70%">
                                                <input id="txtUserName" style="border-right: #ffffff 1px solid; border-top: #7a7a7a 1px solid;
                                                    font-size: 10pt; border-left: #7a7a7a 1px solid; color: #000000; border-bottom: #ffffff 1px solid;
                                                    height: 20px; background-color: #efefef" name="txtUserName"  runat="server"
                                                    size="20" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="1%">
                                            </td>
                                            <td width="23%">
                                                密&nbsp;&nbsp;&nbsp;&nbsp;码：
                                            </td>
                                            <td width="70%">
                                                <input id="txtPassword" style="border-right: #ffffff 1px solid; border-top: #7a7a7a 1px solid;
                                                    font-size: 10pt; border-left: #7a7a7a 1px solid; color: #000000; border-bottom: #ffffff 1px solid;
                                                    height: 20px; background-color: #efefef" type="password" name="txtPassword" 
                                                    runat="server" size="20" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="3">
                                                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td align="center" colspan="2">
                                                                <asp:Button ID="btnLogin" runat="server" Text=" 登 录 "  onclick="btnLogin_Click"  />
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
            <table width="900" border="0" align="center" cellpadding="2" cellspacing="0">
	<tr>
		<td height="62" bgcolor="#C5D5E5"><div align="center">
            <span style="font-size: 10pt; font-family: Courier New" />
			CopyRight @ 软件1401班    Visual Studio 2012 + SQL Server 2008<br />
                <span style="color: Red">--毕业设计--&nbsp;</span>
            <br />
           <a href="/Default.aspx">前台首页</a> </div>
		</td>
	</tr>
</table>

    </form>
</body>
</html>
