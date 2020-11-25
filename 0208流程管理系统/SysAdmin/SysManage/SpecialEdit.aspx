<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpecialEdit.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.SpecialEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>更新专题</title>

    <script src="../JS/jquery-3.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/public.js"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>

    <script src="../JS/publicform.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        var id;
       <%=jsMessage %>
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
        $(function() {
            var name = "作者编辑";
            var listUrl = "SpecialList.aspx?<%=BackParam %>";
            var addUrl = "SpecialEdit.aspx?action=add&NodeCode=<%=NodeCode%>";
            var updateUrl = "SpecialEdit.aspx?action=edit&NodeCode=<%=NodeCode%>&id=" + id;
            showEditMessage(name, listUrl, addUrl, updateUrl);
        });

         function selectTemplateFile(contrName) {
            openframe({ title: "选择模板文件", url: "seltemplate.aspx?contrName=" + contrName, width: '400', height: '400' });
        }
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4>
            位置：
            <%GetPageNav(NodeCode); %></h4>
        <dl>
            <dt>专题名称：</dt>
            <dd>
                <asp:TextBox ID="txtName" CssClass="validate[required,length[2,128]]" runat="server"></asp:TextBox><span
                    style="color: #ff0000; font-weight: bold;">*</span></dd>
        </dl>
        <dl>
            <dt>专题标识符：</dt>
            <dd>
                <asp:TextBox ID="txtSpecialIdentifier" runat="server"></asp:TextBox></dd>
        </dl>
        <dl>
            <dt>专题的目录名：</dt>
            <dd>
                <asp:TextBox ID="txtDirectoryName" CssClass="validate[required,length[2,64]]" runat="server"></asp:TextBox><span
                    style="color: #ff0000; font-weight: bold;">*</span></dd>
        </dl>
        <dl>
            <dt>所属模型：</dt>
            <dd>
                <asp:DropDownList ID="ddlModelID" runat="server">
                </asp:DropDownList>
            </dd>
        </dl>
        <dl>
            <dt>专题图片地址：</dt>
            <dd>
                <asp:TextBox ID="txtIcon" runat="server"></asp:TextBox>
                <input type='button' onclick="InputImages('theForm', 'txtIcon', 1, 'jpg|gif|png', 4096, '',0,0)"
                    value='上传图片' /></dd>
        </dl>
        <dl>
            <dt>专题提示：</dt>
            <dd>
                <asp:TextBox ID="txtTips" TextMode="MultiLine" Rows="3" Columns="40" runat="server"></asp:TextBox></dd>
        </dl>
        <dl>
            <dt>专题说明：</dt>
            <dd>
                <asp:TextBox ID="txtDescription" TextMode="MultiLine" Rows="3" Columns="40" runat="server"></asp:TextBox></dd>
        </dl>
        <dl>
            <dt>专题META关键词：</dt>
            <dd>
                <asp:TextBox ID="txtMetaKeyword" TextMode="MultiLine" Rows="5" Columns="40" runat="server"></asp:TextBox></dd>
        </dl>
        <dl>
            <dt>专题META网页描述：</dt>
            <dd>
                <asp:TextBox ID="txtMetaDescription" TextMode="MultiLine" Rows="5" Columns="40" runat="server"></asp:TextBox></dd>
        </dl>
        <dl>
            <dt>是否推荐：</dt>
            <dd>
                <asp:RadioButtonList ID="radlIsElite" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1" Text="是" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="0" Text="否
"></asp:ListItem>
                </asp:RadioButtonList>
            </dd>
        </dl>
        <dl>
            <dt>打开方式：</dt>
            <dd>
                <asp:RadioButtonList ID="radlOpenType" RepeatDirection="Horizontal" runat="server">
                    <asp:ListItem Value="1" Text="在原窗口打开" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="2" Text="在新窗口打开
"></asp:ListItem>
                </asp:RadioButtonList>
            </dd>
        </dl>
        <dl>
            <dt>专题页模板：</dt>
            <dd>
                <asp:TextBox ID="txtTemplatePath" runat="server" Width="180"></asp:TextBox>
                <input type="button" class="subButton" onclick="selectTemplateFile('txtTemplatePath')"
                    value="选择模板..." /></dd>
        </dl>
        <dl style="display: none;">
            <dt>搜索页模板：</dt>
            <dd>
                <asp:TextBox ID="txtSearchTemplatePath" runat="server"></asp:TextBox>
                <input name="btnSearchTemplatePath" type="button" value="浏览" onclick="InputFile('theForm','txtSearchTemplatePath','file',1,'html|htm|shtml|shtm',4096,'')" /></dd>
        </dl>
        <dl>
            <dt>列表页是否生成HTML：</dt>
            <dd>
                <input type="radio" name="radIsCreateHtml" onclick="IsCreateHtml('ListPageSaveType', this.value)"
                    checked="checked" <%= isCreateHtml%> id="radIsCreateHtml0" value="1" /><label for="radIsCreateHtml0">是</label>
                <input type="radio" name="radIsCreateHtml" id="radIsCreateHtml1" onclick="IsCreateHtml('ListPageSaveType', this.value)"
                    <%= noCreateHtml%> value="0" /><label for="radIsCreateHtml1">否</label>
            </dd>
        </dl>
        <dl id="ListPageSaveType">
            <dt>列表页文件的存放位置：</dt>
            <dd>
                <asp:RadioButtonList ID="radlListPageSaveType" runat="server">
                    <asp:ListItem Value="1" Selected="True" Text="静态文件保存方式专题栏目目录 + 栏目目录"></asp:ListItem>
                    <asp:ListItem Value="2" Text="静态文件保存方式全部保存在专题栏目目录下"></asp:ListItem>
                    <asp:ListItem Value="3" Text="列表文件统一保存在Special目录的文件夹中"></asp:ListItem>
                </asp:RadioButtonList>
            </dd>
        </dl>
        <dl>
            <dt>列表页文件的扩展名：</dt>
            <dd>
                <asp:DropDownList ID="ddlPagePostfix" runat="server">
                    <asp:ListItem Value="1" Text="html"></asp:ListItem>
                    <asp:ListItem Value="2" Text="htm"></asp:ListItem>
                    <asp:ListItem Value="3" Text="shtml"></asp:ListItem>
                    <asp:ListItem Value="4" Text="shtm"></asp:ListItem>
                </asp:DropDownList>
            </dd>
        </dl>
        <div class="Submit">
            <asp:Button ID="btnEdit" OnClick="Special_Edit" runat="server" Text="添加" />
            <input type="button" onclick="location.href='SpecialList.aspx?<%=BackParam %>'" value="返回" />
        </div>
    </div>
    </form>

    <script type="text/javascript"><%=jsMessage%></script>

</body>
</html>
