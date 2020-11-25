<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editor.aspx.cs" Inherits="AllPower.WEB.SysAdmin.Template.editor"
    ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>模板修改</title>
    <link type="text/css" href="../skin/green/css/style.css" rel="stylesheet" id="myskin" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/Prototype.js"></script>

    <script type="text/javascript" src="../js/template.js"></script>

    <script type="text/javascript" src="../editor/fck/Templet_editor.js"></script>

</head>
<body>
    <form id="fromeditor" runat="server">
    <div>
        <div class="container">
            <h4>
                位置：<a href="TemplateList.aspx">模板管理</a> <a>></a> <span class="breadcrumb_current">模板编辑</span></h4>
            <div id="panel">
                <fieldset>
                    <dl>
                        <dt>模板名称</dt>
                        <dd>
                            <asp:Label ID="txtTemplateName" runat="server" Text="Label"></asp:Label><asp:Label
                                runat="server" ID="lblPath"></asp:Label>
                        </dd>
                    </dl>
                    <dl>
                        <dt>常用标签</dt>
                        <dd>
                            <ul class="hassele">
                                <li>
                                    <input type="button" id="btnSystemLable" onclick="show('SystemLable',document.getElementById('btnSystemLable'),'系统标签(点击选择)',600,380);"
                                        value="系统标签" />
                                    <input type="button" id="btnFreeLable" onclick="show('FreeLable',document.getElementById('btnFreeLable'),'自由标签(点击选择)',600,380);"
                                        value="自由标签" />
                                    <input type="button" id="btnSpecialLable" onclick="show('SpecialLable',document.getElementById('btnSpecialLable'),'特殊标签(点击选择)',600,380);"
                                        value="特殊标签" />
                                    <input type="button" id="btnPrivateLable" onclick="show('PrivateLable',document.getElementById('btnPrivateLable'),'专属标签(点击选择)',600,380);"
                                        value="专属标签" /></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl>
                        <dt>模板内容</dt>
                        <dd>
                            <textarea rows="1" cols="1" name="FileContent" style="display: none" id="FileContent"
                                runat="server"></textarea>

                            <script type="text/javascript" language="JavaScript">
                                window.onload = function() {
                                    var sBasePath = "../editor/fck/"
                                    var oFCKeditor = new FCKeditor('FileContent');
                                    oFCKeditor.BasePath = sBasePath;
                                    oFCKeditor.Width = '100%';
                                    oFCKeditor.ToolbarSet = 'HQB_Templet';
                                    oFCKeditor.Height = '100%';
                                    oFCKeditor.ReplaceTextarea();
                                }
                            </script>

                        </dd>
                    </dl>
                    <div style="clear: left">
                    </div>
                </fieldset>
            </div>
            <div class="Submit">
                <asp:Button ID="Button_Save" runat="server" Text="保存模板" CssClass="subButton" OnClick="Button_Save_Click1" />
                <input type="button" name="Submit" value=" 恢 复 " class="subButton" onclick="javascript:UnDo();" />
                <a href="EditTemplate.aspx?path=<%=Path%>" onclick="if(!confirm('确定要切换到文本编辑吗?请在切换前先保存您的数据，否则会丢失!\n确定切换吗？')){return false;}">
                    切换到文本编辑</a>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HiddenField_Path" runat="server" />
    </form>
</body>

<script language="javascript" type="text/javascript">
    function UnDo() {
        if (confirm('你确定要取消所做的更改吗?')) {
            document.fromeditor.reset();
        }
    }
    function getValue(value) {
        if (value != "")
            insert(value);
    }
</script>

</html>
