<%@ Page Language="C#" AutoEventWireup="true" CodeFile="yingpian_add.aspx.cs" Inherits="yingpian_add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
                    <div align="center"><font color="#ffffff">添加影片</font></div>
                </td>
            </tr>

            <tr>
                <td nowrap width='30' style='width: 164px'><font face='宋体'>编号:</font></td>
                <td width='79%'>
                    <asp:TextBox ID='bianhao' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorbianhao" runat="server" ControlToValidate="bianhao" ErrorMessage="必填"></asp:RequiredFieldValidator><tr>
                        <td nowrap width='30' style='width: 164px'><font face='宋体'>影片名称:</font></td>
                        <td width='79%'>
                            <asp:TextBox ID='yingpianmingcheng' Width='395px' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatoryingpianmingcheng" runat="server" ControlToValidate="yingpianmingcheng" ErrorMessage="必填"></asp:RequiredFieldValidator><tr>
                                <td nowrap width='30' style='width: 164px'><font face='宋体'>上映时间:</font></td>
                                <td width='79%'>
                                    <asp:TextBox ID='shangyingshijian' runat='server' onclick="getDate(Form1.shangyingshijian,'2')" need="1"></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorshangyingshijian" runat="server" ControlToValidate="shangyingshijian" ErrorMessage="必填"></asp:RequiredFieldValidator><tr>
                                        <td nowrap width='30' style='width: 164px'><font face='宋体'>票数:</font></td>
                                        <td width='79%'>
                                            <asp:TextBox ID='piaoshu' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorpiaoshu" runat="server" ControlToValidate="piaoshu" ErrorMessage="必填"></asp:RequiredFieldValidator><tr>
                                                <td nowrap width='30' style='width: 164px'><font face='宋体'>地点:</font></td>
                                                <td width='79%'>
                                                    <asp:TextBox ID='didian' Width='395px' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatordidian" runat="server" ControlToValidate="didian" ErrorMessage="必填"></asp:RequiredFieldValidator><tr>
                                                        <td nowrap width='30' style='width: 164px'><font face='宋体'>影片类型:</font></td>
                                                        <td width='79%'>
                                                            <asp:DropDownList ID='yingpianleixing' runat='server'></asp:DropDownList></td>
                                                    </tr>
                                                    <tr>
                                                        <td nowrap width='30' style='width: 164px'><font face='宋体'>票价:</font></td>
                                                        <td width='79%'>
                                                            <asp:TextBox ID='piaojia' runat='server'></asp:TextBox>*<asp:RequiredFieldValidator ID="RequiredFieldValidatorpiaojia" runat="server" ControlToValidate="piaojia" ErrorMessage="必填"></asp:RequiredFieldValidator><tr>
                                                                <td nowrap width='30' style='width: 164px'><font face='宋体'>图片:</font></td>
                                                                <td width='79%'>
                                                                    <asp:TextBox ID="tupian" runat="server" Width="395px"></asp:TextBox>
                                                                    <a href="javaScript:OpenScript('hsgupfile.aspx?Result=tupian',500,30)">
                                                                        <img align="absMiddle" border="0" height="16" src="Images/Upload.gif" width="30" /></a></td>
                                                            </tr>
                                                            <tr>
                                                                <td nowrap width='30' style='width: 164px'><font face='宋体'>备注:</font></td>
                                                                <td width='79%'>
                                                                    <asp:TextBox ID='beizhu' Width='400px' Height='100px' TextMode='MultiLine' runat='server'></asp:TextBox></td>
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
