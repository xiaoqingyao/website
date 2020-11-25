<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myself.aspx.cs" Inherits="admin_Mag_myself" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>个人资料</title>
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
            <b>您当前的位置：首页 &gt; 个人中心 &gt; 个人资料</b>
        </div>
        <div style="padding-bottom: 10px;">
        </div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
            <tr>
                <th colspan="3" align="left">
                    个人资料
                </th>
            </tr>
            <tr>
                <td width="15%" align="right">
                    姓名：
                </td>
                <td width="30%">
                    <asp:TextBox ID="txtName" runat="server" CssClass="input w380 required" MaxLength="250"></asp:TextBox>
                </td>
                <td rowspan="3" width="55%">
                    <asp:HiddenField ID="hidphoto" runat="server" />
                    <img runat="server" id="myPhotos" alt="" src="../../images/no.gif" height="90" style="width: 93px" /></td>
            </tr>
            <tr>
                <td width="15%" align="right">
                    帐号：
                </td>
                <td width="30%">
                    <asp:TextBox ID="txtLogName" runat="server" ReadOnly="true" CssClass="input w380 required" MaxLength="250"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="15%" align="right">
                    性别：
                </td>
                <td width="30%">
                    <asp:DropDownList ID="ddlSex" runat="server" CssClass="select" AutoPostBack="True"
                        Width="112px">
                        <asp:ListItem Value="-1">请选择性别...</asp:ListItem>
                        <asp:ListItem Value="男">男</asp:ListItem>
                        <asp:ListItem Value="女">女</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td width="15%" align="right">
                    昵称：
                </td>
                <td width="30%">
                    <asp:TextBox ID="txtNickName" runat="server" CssClass="input w380 required" MaxLength="250"></asp:TextBox>
                </td>
                <td width="55%"><asp:FileUpload ID="fu" runat="server" />
                    <asp:Button ID="btnUpLoad" runat="server" Text="上传" OnClick="btnUpLoad_Click" /></td>
            </tr>
            <tr>
                <td width="15%" align="right">
                    出生日期：
                </td>
                <td width="30%" colspan="2">
                    <asp:TextBox ID="txtBirthday" runat="server" CssClass="input w380 required" MaxLength="250"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="15%" align="right">
                    电话：
                </td>
                <td width="30%" colspan="2">
                    <asp:TextBox ID="txtTel" runat="server" CssClass="input w380 required" MaxLength="250"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="15%" align="right">
                    手机：
                </td>
                <td width="30%" colspan="2">
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="input w380 required" MaxLength="250"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="15%" align="right">
                    邮箱：
                </td>
                <td width="30%" colspan="2">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="input w380 required" MaxLength="250"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="15%" align="right">
                    职业：
                </td>
                <td width="30%" colspan="2">
                    <asp:TextBox ID="txtProfessional" runat="server" CssClass="input w380 required" MaxLength="250"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="15%" align="right">
                    地址：
                </td>
                <td width="30%" colspan="2">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="input w380 required" MaxLength="250"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    备注：
                </td>
                <td colspan="2">
                    <FCKeditorV2:FCKeditor ID="FCKeditor" runat="server" BasePath="~/fckeditor/" Height="400px"
                        Width="100%">
                    </FCKeditorV2:FCKeditor>
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
