<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDirectory.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Template.AddDirectory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>目录编辑</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-3.2-vsdoc2.js" type="text/javascript"></script>

    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script type="text/javascript" src="../js/common.js"></script>

    <script type="text/javascript">
        $(document).ready(function() { $("#fromeditor").validationEngine({ promptPosition: "centerRight" }) });
    </script>

</head>
<body>
    <form id="fromeditor" runat="server">
    <div>
        <div class="container">
            <h4>
                位置：<a href="#">模板模型</a> <a>></a> <span style="color: Blue">新建目录</span></h4>
            <br />
            <div id="panel">
                <fieldset>
                    <dl>
                        <dt>目录名称：</dt>
                        <dd>
                            <asp:TextBox ID="txtDirectoryName" runat="server" Width="300px" CssClass="validate[required,length[2,50]]"></asp:TextBox>
                            请以英文或数字命名<asp:HiddenField runat="server" ID="hidDirectoryPath" />
                            <asp:HiddenField runat="server" ID="hidUrlReferrer" />
                        </dd>
                    </dl>
                    <div style="clear: left">
                    </div>
                </fieldset>
            </div>
            <div class="Submit">
                <asp:Button ID="btnSubmit" runat="server" Text="确定" CssClass="subButton" OnClick="btnSubmit_Click" />
                <input type="button" name="ReBack" value=" 返回 " class="subButton" onclick='javascript:history.back();' />
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HiddenField_Path" runat="server" />
    </form>
</body>
</html>
