<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublishTaskEdit.aspx.cs"  ValidateRequest="false"  Inherits="AllPower.WEB.SysAdmin.Collection.PublishTaskEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>发布任务编辑</title>
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />

    <script src="../JS/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/public.js"></script>

    <script src="../JS/publicform.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script src="../JS/jquery.ui.draggable.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/Collection.js"></script>

    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        $(pageInitPublishTask);
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4>
            位置： <a href="#">信息采集</a> > <a href="#">采集任务编辑</a></h4>
        <ul id="tags">
            <li class="selectTag"><a href="javascript:;">基本信息</a> </li>
            <li><a href="javascript:;">高级配置</a> </li>
        </ul>
        <div id="panel">
        <!--基本属性-->
        <fieldset>
            <dl>
                <dt>任务名称：</dt>
                <dd>
                    <asp:TextBox ID="txtName" CssClass="validate[required]" runat="server"></asp:TextBox></dd>
            </dl>
            <dl>
                <dt>数据源：</dt>
                <dd>
                    <asp:DropDownList ID="ddlCollectionTaskID" Width="140" runat="server">
                    </asp:DropDownList>
                </dd>
                <dd>&nbsp;数据源从采集任务中选择</dd>
            </dl>
            <dl>
                <dt>发布类型：</dt>
                <dd>
                    <asp:DropDownList ID="ddlPublishType" runat="server" Width="140">
                        <asp:ListItem Value="1" Text="当前站点"></asp:ListItem>
                        <asp:ListItem Value="2" Text="其它位置"></asp:ListItem>
                    </asp:DropDownList>
                </dd>
            </dl>
            <dl>
                <dt>目标数据库类型：</dt>
                <dd>
                    <asp:DropDownList ID="ddlDBType" Width="140" runat="server">
                        <asp:ListItem Value="1" Text="MS SQL"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Access"></asp:ListItem>
                        <asp:ListItem Value="3" Text="MySQL"></asp:ListItem>
                        <asp:ListItem Value="4" Text="Oracle"></asp:ListItem>
                    </asp:DropDownList>
                </dd>
            </dl>
            <div id="OtherType" style="display: none;">
                <dl>
                    <dt>主机地址/名称：</dt><dd><asp:TextBox ID="txtHostName" runat="server"></asp:TextBox></dd></dl>
                <dl>
                    <dt>端口：</dt><dd><asp:TextBox ID="txtHostPort" CssClass="validate[regex[\d*,只能为数字]]" runat="server"></asp:TextBox></dd></dl>
                <dl>
                    <dt>用户名：</dt><dd><asp:TextBox ID="txtUsername" runat="server"></asp:TextBox></dd></dl>
                <dl>
                    <dt>密码：</dt><dd><asp:TextBox ID="txtPassword" runat="server"></asp:TextBox></dd></dl>
                    <dl><dt>数据库名称：</dt><dd><asp:TextBox ID="txtDBName" runat="server"></asp:TextBox></dd></dl>
                <dl><dt>数据库编码：</dt><dd><asp:TextBox ID="txtDBEncodeType"  runat="server"></asp:TextBox></dd><dd>&nbsp;默认为当前站点编码</dd></dl>
            </div>
            <div id="LocalHost">
                <dl>
                    <dt>图片文件转移目录：</dt>
                    <dd><asp:TextBox ID="txtImageDir" runat="server"></asp:TextBox></dd>
                    <dd>&nbsp;相对站点根目录以/结尾 如 images/</dd>
                </dl>
                <dl>
                    <dt>FLASH文件转移目录：</dt>
                    <dd><asp:TextBox ID="txtFlashDir" runat="server"></asp:TextBox></dd>
                    <dd>&nbsp;相对站点根目录/结尾 如 flash/</dd>

                </dl>
                <dl>
                    <dt>其它文件转移目录：</dt>
                    <dd><asp:TextBox ID="txtOtherDir" runat="server"></asp:TextBox></dd>
                    <dd>&nbsp;相对站点根目录,不同类型分开时用 扩展名|目录路径 如 rar|../UploadFile,</dd>
                </dl>
            </div>
            <dl id="DMCode">
                <dt>操作代码(SQL)：</dt><dd><asp:TextBox ID="txtDMCode" runat="server" TextMode="MultiLine"
                    Width="600" Height="180"></asp:TextBox></dd>
            </dl>
        </fieldset>
        <!--高级属性-->
       <fieldset style=" display:none;">
       <dl>
            <dt>批处理条数：</dt>
            <dd><asp:TextBox ID="txtBatchAmount" Text="10" runat="server"></asp:TextBox></dd>
       </dl>
       <dl>
            <dt>是否删除数据源：</dt>
            <dd><asp:RadioButtonList ID="radlIsDataSourceDel" runat="server" RepeatColumns="2" RepeatDirection="Horizontal">
            <asp:ListItem Value="0" Selected="True" Text="否"></asp:ListItem>
            <asp:ListItem Value="1"  Text="是"></asp:ListItem>
            </asp:RadioButtonList></dd>
       </dl>
       </fieldset>
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" CssClass="subButton" runat="server" OnClick="Save" Text="添 加" />
            <input class="subButton" type="button" onclick="location.href='PublishTaskList.aspx'"
                value="返回" />
        </div>
    </div>
    <input type="hidden" id="OpType" value="<%=opType %>" />
    </form>
    <script type="text/javascript"><%=jsMessage %></script>

</body>
</html>

