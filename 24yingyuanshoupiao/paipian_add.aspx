<%@ Page Language="C#" AutoEventWireup="true" CodeFile="paipian_add.aspx.cs" Inherits="paipian_add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>无标题页</title>
    <script language="javascript" src="js/Calendar.js"></script>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<script language="javascript">
    function OpenScript(url, width, height) {

        var win = window.showModalDialog(url, "", "dialogHeight=300px;dialogWidth=500px");
        document.getElementById("tupian").value = win;
    }
    function OpenDialog(sURL, iWidth, iHeight) {
        var oDialog = window.open(sURL, "_EditorDialog", "width=" + iWidth.toString() + ",height=" + iHeight.toString() + ",resizable=no,left=0,top=0,scrollbars=no,status=no,titlebar=no,toolbar=no,menubar=no,location=no");
        oDialog.focus();
    }
</script>
<body>
    <form id="Form1" method="post" runat="server">
        <table cellspacing="0" bordercolordark="#9cc7ef" cellpadding="4" width="100%" align="center"
            bordercolorlight="#145aa0" border="1">
            <tr bgcolor="#4296e7">
                <td colspan="2">
                    <div align="center"><font color="#ffffff">排片</font></div>
                </td>
            </tr>
            <tr>
                <td nowrap width='30' style='width: 164px'><font face='宋体'>影院名称:</font></td>
                <td width='79%'>
                    <asp:DropDownList runat="server" ID="yingyuan"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td nowrap width='30' style='width: 164px'><font face='宋体'>影片名称:</font></td>
                <td width='79%'>
                    <asp:DropDownList runat="server" ID="yingpian"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td nowrap width='30' style='width: 164px'><font face='宋体'>放映时间:</font></td>
                <td width='79%'>
                    <asp:TextBox  runat='server' ID='playtime' onclick="getDate(Form1.playtime,'')"></asp:TextBox></td>
            </tr>
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