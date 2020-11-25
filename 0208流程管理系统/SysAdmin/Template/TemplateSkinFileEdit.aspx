<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateSkinFileEdit.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.Template.TemplateSkinFileEdit" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>风格文件编辑</title>
    <link type="text/css" href="../skin/green/css/style.css" rel="stylesheet" id="myskin" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <script type="text/javascript" src="../js/listcheck.js"></script>

    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script type="text/javascript" src="../js/common.js"></script>

</head>
<body>
    <form id="fromeditor" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div>
        <div class="container">
            <h4>
                位置：模板模型>><a href="TemplateSkinList.aspx?Action=ALL&NodeCode=<%=NodeCode %>">风格管理</a>
                <a>></a> <span style="color: Blue">风格文件编辑</span></h4>
            <div id="panel">
                <fieldset>
                    <dl>
                        <dt>文件名称</dt>
                        <dd>
                            <asp:TextBox ID="txtFileName" runat="server" Width="300px"></asp:TextBox><span style="color: Red">只能为css,js类型文件</span><br />
                            <asp:Label ID="lblFileName" runat="server" Text="Label" Visible="false"></asp:Label><asp:Label
                                runat="server" ID="lblPath" Visible="false"></asp:Label><asp:Literal ID="ltlRootPath"
                                    runat="server" Visible="false"></asp:Literal>
                        </dd>
                    </dl>
                    <dl>
                        <dt>文件内容</dt>
                        <dd>
                            <asp:TextBox ID="FileContent" runat="server" TextMode="MultiLine" Height="360px"
                                Width="800px"></asp:TextBox><br />
                            <span style="color: #FF82AB">提示:请尽量照文件类型的标准格式编辑,Image类型的请填写完整的路径</span></dd>
                    </dl>
                    <div style="clear: left">
                    </div>
                </fieldset>
            </div>
            <div class="Submit">
                <asp:Button ID="btnSave" runat="server" Text="保 存" CssClass="subButton" OnClick="btnSave_Click" />
                <input type="button" name="Submit" value=" 恢 复 " class="subButton" onclick="javascript:UnDo();" />
                <input type="button" name="ReBack" value=" 返 回 " class="subButton" onclick="javascript:history.go(-1);" />
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HiddenField_Path" runat="server" />
    <asp:HiddenField runat="server" ID="hidUrlReferrer" />
    </form>
</body>

<script language="javascript" type="text/javascript">
    function UnDo() {
        if (confirm('你确定要取消所做的更改吗?')) {
            document.fromeditor.reset();
        }
    }
    function getValue(value) {
        if (value != "") {
            insert(value);
        }
    }
</script>

</html>
