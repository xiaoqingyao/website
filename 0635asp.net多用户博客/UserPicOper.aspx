<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserPicOper.aspx.cs" Inherits="UserPicOper" %>
<%@ Register src="Controls/Head.ascx" tagname="Head" tagprefix="uc1" %>
<%@ Register src="Controls/Foot.ascx" tagname="Foot" tagprefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���˲���ϵͳ[��ҵ���]</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form runat="server">
<uc1:Head ID="Head1" runat="server" />

<table width="950" height="273" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top:10px;">
      <tr>
        <td valign="top" style="width:180px;height:24px; background:url(images/gy.jpg) repeat-x; text-align:center;border:solid 1px #ddd; font-size:14px;">
            <br /><br />
            <a href="usermain.aspx"><font color="#2d7e17">���˻�����Ϣ</font></a><br /><br />
            <a href="userguanzhu.aspx"><font color="#2d7e17">�ҵ��ղ�</font></a><br /><br />
            <a href="userpicoper.aspx"><font color="#2d7e17">�ϴ����</font></a><br /><br />
            <a href="userpicmanage.aspx"><font color="#2d7e17">�ҵ�������</font></a><br /><br />
            <a href="userblogoper.aspx"><font color="#2d7e17">��������</font></a><br /><br />
            <a href="userBlogmanage.aspx"><font color="#2d7e17">�ҵĲ��͹���</font></a><br /><br />
            <a href="userhaoyou.aspx"><font color="#2d7e17">�ҵĺ���</font></a><br /><br />
            <a href="userxinmanage.aspx"><font color="#2d7e17">վ����</font></a><br /><br />
            <a href="userlogout.aspx"><font color="#2d7e17">�˳���¼</font></a><br />
        </td>
        <td align="center" valign="top">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td style="width:100%;height:24px; background:url(images/gy.jpg) repeat-x; text-align:center;border:solid 1px #ddd;">
                &nbsp;&nbsp;&nbsp;&nbsp;�ϴ����
                </td>
            </tr>
            <tr>
                <td style="padding:10px 0 10px 10px;" align="left">

<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#9FBD65" class="tab1">
                                
                                <tr>
                                    <td width="100" align="right" style="height:30px">�������ࣺ</td>
                                    <td>
                                        <asp:DropDownList ID="ddlPicClass" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="height:35px">�ϴ���Ƭ��</td>
                                    <td>
                                        <asp:FileUpload ID="FileUpload1" runat="server" Width="260px" /><br />
                                        <asp:Image ID="Image1" runat="server" Width="110px" Height="80px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100" align="right" style="height:30px">��Ƭ˵����</td>
                                    <td>
                                        <asp:TextBox ID="txtPicName" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding:10px 0;">&nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnSubmit" runat="server" Text=" ������Ϣ " OnClick="btnSubmit_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input id="Button1" type="button" value="����" onclick="javascript:history.go(-1);" />
                                    </td>
                                </tr>
                            </table>



                </td>
            </tr>
        </table>
        </td>
        
      </tr>
    </table></td>
  </tr>
</table>

<uc2:Foot ID="Foot1" runat="server" />
</form>
</body>
</html>