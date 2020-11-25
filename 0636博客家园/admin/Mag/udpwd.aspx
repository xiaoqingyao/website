<%@ Page Language="C#" AutoEventWireup="true" CodeFile="udpwd.aspx.cs" Inherits="admin_Mag_udpwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>修改密码</title>
    <link rel="stylesheet" type="text/css" href="../images/style.css" />

    <script type="text/javascript" src="../../js/jquery-1.3.2.min.js"></script>

    <script type="text/javascript" src="../../js/jquery.validate.min.js"></script>

    <script type="text/javascript" src="../../js/messages_cn.js"></script>

    <script type="text/javascript" src="../../js/jquery.form.js"></script>

    <script type="text/javascript" src="../js/cursorfocus.js"></script>

    <script type="text/javascript" src="../js/singleupload.js"></script>

    <script type="text/javascript">
        $(function() {
            //表单验证JS
            $("#form1").validate({
                //出错时添加的标签
                errorElement: "span",
                success: function(label) {
                    //正确时的样式
                    label.text(" ").addClass("success");
                }
            });
        });
    </script>

</head>
<body style="padding: 10px;">
    <form id="form1" runat="server">
        <div class="navigation">
            <b>您当前的位置：首页 &gt; 个人中心 &gt; 修改密码</b>
        </div>
        <div style="padding-bottom: 10px;">
        </div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
            <tr>
                <th colspan="3" align="left">
                    修改密码
                </th>
            </tr>
            <tr>
                <td width="15%" align="right">
                    旧密码：
                </td>
                <td width="30%">
                    <span style="color: #ff0000">
                        <input type="password" id="txtUserLogPwd" runat="server" name="password" class="input1" /><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1" runat="server" ErrorMessage="旧密码不能为空" ControlToValidate="txtUserLogPwd"></asp:RequiredFieldValidator></span>
                </td>
            </tr>
            <tr>
                <td width="15%" align="right">
                   新密码：
                </td>
                <td width="30%">
                    <span style="color: #ff0000">
                                <input type="password" id="txtUserLogPwdNew" runat="server" name="password" class="input1" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="新密码不能为空"
                                    ControlToValidate="txtUserLogPwdNew"></asp:RequiredFieldValidator></span>
                </td>
            </tr>
            <tr>
                <td width="15%" align="right">
                    确认密码：
                </td>
                <td width="30%">
                    <span style="color: #ff0000">
                                <input type="password" id="txtUserLogPwdNewSec" runat="server" name="password" class="input1" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="确认密码不能为空"
                                    ControlToValidate="txtUserLogPwdNewSec"></asp:RequiredFieldValidator></span>
                </td>
            </tr>
            <tr>
                <td width="15%" align="right">
                    &nbsp;
                </td>
                <td width="30%">
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtUserLogPwdNew"
                        ControlToValidate="txtUserLogPwdNewSec" ErrorMessage="两次密码不一致"></asp:CompareValidator>
                </td>
            </tr>
        </table>
        <div style="margin-top: 10px; text-align: center;">
            <asp:Button ID="btnSave" runat="server" Text="确认保存" CssClass="submit" OnClick="btnSave_Click" />
            &nbsp;
            <input name="重置" type="reset" class="submit" value="重置" />
        </div>
    </form>
</body>
</html>
