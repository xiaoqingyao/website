<%@ Page Language="C#" AutoEventWireup="true" CodeFile="xiaoyuanfengjing_add.aspx.cs" Inherits="xiaoyuanfengjing_add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>无标题页</title>
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
        document.getElementById("tupian").value = filePath;
    }
</script>
<body>
    <form id="Form1" method="post" runat="server">
        <table cellspacing="0" bordercolordark="#9cc7ef" cellpadding="4" width="100%" align="center"
            bordercolorlight="#145aa0" border="1">
            <tr bgcolor="#4296e7">
                <td colspan="2">
                    <div align="center"><font color="#ffffff">添加学员作品</font></div>
                </td>
            </tr>

            <tr>
                <td nowrap width='30' style='width: 164px'><font face='宋体'>名称:</font></td>
                <td width='79%'>
                    <asp:TextBox ID='mingcheng' Width='395px' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatormingcheng" runat="server" ControlToValidate="mingcheng" ErrorMessage="必填"></asp:RequiredFieldValidator><tr>
                        <td nowrap width='30' style='width: 164px'><font face='宋体'>图片:</font></td>
                        <td width='79%'>
                            <asp:TextBox ID='tupian' Width='395px' runat='server'></asp:TextBox>&nbsp;<a href="javaScript:OpenScript('hsgupfile.aspx?Result=tupian',500,30)"><img src='Images/Upload.gif' width='30' height='16' border='0' align='absmiddle' /></a>*<asp:RequiredFieldValidator ID="RequiredFieldValidatortupian" runat="server" ControlToValidate="tupian" ErrorMessage="必填"></asp:RequiredFieldValidator>



                            <tr>
                                <td nowrap width="164" height="25" style="width: 164px">
                                    <div align="right"><font face="宋体"></font>&nbsp;</div>
                                </td>
                                <td width="59%" height="25">&nbsp;
						<asp:Button ID="Button1" runat="server" Text="添加" OnClick="Button1_Click"></asp:Button><font face="宋体">&nbsp;</font>
                                    <input id="Reset1" type="reset" value="重置" /></td>
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
