<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zuoyefabu_add.aspx.cs" Inherits="zuoyefabu_add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>�ޱ���ҳ</title>
    <script language="javascript" src="js/Calendar.js"></script>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<script language="javascript">
    function OpenScript(url, width, height) {
        var win = window.open(url, "SelectToSort", 'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=yes');
    }
    function OpenDialog(sURL, iWidth, iHeight) {
        var oDialog = window.open(sURL, "_EditorDialog", "width=" + iWidth.toString() + ",height=" + iHeight.toString() + ",resizable=no,left=0,top=0,scrollbars=no,status=no,titlebar=no,toolbar=no,menubar=no,location=no");
        oDialog.focus();
    }
    function UpSuccess(filePath) {
        document.getElementById("fujian").value = filePath;
    }
</script>
<body>
    <form id="Form1" method="post" runat="server">
        <table cellspacing="0" bordercolordark="#9cc7ef" cellpadding="4" width="100%" align="center"
            bordercolorlight="#145aa0" border="1">
            <tr bgcolor="#4296e7">
                <td colspan="2">
                    <div align="center"><font color="#ffffff">�����ҵ����</font></div>
                </td>
            </tr>

            <tr>
                <td nowrap width='30' style='width: 164px'><font face='����'>���:</font></td>
                <td width='79%'>
                    <asp:TextBox ID='bianhao' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorbianhao" runat="server" ControlToValidate="bianhao" ErrorMessage="����"></asp:RequiredFieldValidator><tr>
                        <td nowrap width='30' style='width: 164px'><font face='����'>��ҵ����:</font></td>
                        <td width='79%'>
                            <asp:TextBox ID='zuoyemingcheng' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorzuoyemingcheng" runat="server" ControlToValidate="zuoyemingcheng" ErrorMessage="����"></asp:RequiredFieldValidator><tr>
                                <td nowrap width='30' style='width: 164px'><font face='����'>�γ�:</font></td>
                                <td width='79%'>
                                    <asp:TextBox ID='kecheng' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorkecheng" runat="server" ControlToValidate="kecheng" ErrorMessage="����"></asp:RequiredFieldValidator><tr>
                                        <td nowrap width='30' style='width: 164px'><font face='����'>����:</font></td>
                                        <td width='79%'>
                                            <asp:TextBox ID='neirong' Width='400px' Height='100px' TextMode='MultiLine' runat='server'></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td nowrap width='30' style='width: 164px'><font face='����'>����:</font></td>
                                        <td width='79%'>
                                            <asp:TextBox ID='fujian' Width='395px' runat='server'></asp:TextBox>&nbsp;<a href="javaScript:OpenScript('hsgupfile.aspx?Result=fujian',500,30)"><img src='Images/Upload.gif' width='30' height='16' border='0' align='absmiddle' /></a></td>
                                    </tr>
                                    <tr>
                                        <td nowrap width='30' style='width: 164px'><font face='����'>������:</font></td>
                                        <td width='79%'>
                                            <asp:TextBox ID='faburen' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorfaburen" runat="server" ControlToValidate="faburen" ErrorMessage="����"></asp:RequiredFieldValidator>



                                            <tr>
                                                <td nowrap width="164" height="25" style="width: 164px">
                                                    <div align="right"><font face="����"></font>&nbsp;</div>
                                                </td>
                                                <td width="59%" height="25">&nbsp;
						<asp:Button ID="Button1" runat="server" Text="���" OnClick="Button1_Click"></asp:Button><font face="����">&nbsp;</font>
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
