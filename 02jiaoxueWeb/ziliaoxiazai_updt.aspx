<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ziliaoxiazai_updt.aspx.cs" Inherits="ziliaoxiazai_updt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>�ޱ���ҳ</title>
    <script language="javascript" src="js/Calendar.js"></script>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <table cellspacing="0" bordercolordark="#9cc7ef" cellpadding="4" width="100%" align="center"
            bordercolorlight="#145aa0" border="1">
            <tr bgcolor="#4296e7">
                <td colspan="2">
                    <div align="center"><font color="#ffffff">�޸���������</font></div>
                </td>
            </tr>
            <tr>
                <td nowrap width='30' style='width: 164px'><font face='����'>���:</font></td>
                <td width='79%'>
                    <asp:TextBox ID='bianhao' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorbianhao" runat="server" ControlToValidate="bianhao" ErrorMessage="����"></asp:RequiredFieldValidator><tr>
                        <td nowrap width='30' style='width: 164px'><font face='����'>����:</font></td>
                        <td width='79%'>
                            <asp:TextBox ID='mingcheng' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatormingcheng" runat="server" ControlToValidate="mingcheng" ErrorMessage="����"></asp:RequiredFieldValidator><tr>
                                <td nowrap width='30' style='width: 164px'><font face='����'>����:</font></td>
                                <td width='79%'>
                                    <asp:DropDownList ID='leixing' runat='server'></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td nowrap width='30' style='width: 164px'><font face='����'>���:</font></td>
                                <td width='79%'>
                                    <asp:TextBox ID='jianjie' Width='400px' Height='100px' TextMode='MultiLine' runat='server'></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td nowrap width='30' style='width: 164px'><font face='����'>�ļ�:</font></td>
                                <td width='79%'>
                                    <asp:TextBox ID='wenjian' Width='395px' runat='server'></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td nowrap width='30' style='width: 164px'><font face='����'>������:</font></td>
                                <td width='79%'>
                                    <asp:TextBox ID='faburen' runat='server'></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td nowrap width="164" height="25" style="width: 164px">
                                    <div align="right"><font face="����"></font>&nbsp;</div>
                                </td>
                                <td width="59%" height="25">&nbsp;
						<asp:Button ID="Button1" runat="server" Text="�޸�" OnClick="Button1_Click"></asp:Button><font face="����">&nbsp;</font>
                                    <input id="Reset1" type="reset" value="����" /></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div align="center"></div>
                                </td>
                            </tr>
                            <tr bgcolor="#4296e7">
                                <td colspan="2">&nbsp;</td>
                            </tr>
        </table>
        <br>
    </form>
</body>
</html>

