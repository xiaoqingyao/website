<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeoMapCreate.aspx.cs" Inherits="KingTop.WEB.SysAdmin.Model.SeoMapCreate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>网站地图生成</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>

    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/validationEngine.jquery.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery.dialog.js"></script>

    <script type="text/javascript" src="../js/win.js"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#theForm").validationEngine({ validationEventTriggers: "blur",  //触发的事件  validationEventTriggers:"keyup blur",
                inlineValidation: true,                                        //是否即时验证，false为提交表单时验证,默认true
                success: false,                                                //为true时即使有不符合的也提交表单,false表示只有全部通过验证了才能提交表单,默认false
                promptPosition: "topRight"                                     //提示所在的位置，topLeft, topRight, bottomLeft,  centerRight, bottomRight
            })
        });
    </script>

</head>
<body>
    <form id="frmSeoMap" runat="server">
    <div class="container">
        <h4>
            位置： 扩展应用&gt; <span class="breadcrumb_current">站点地图更新</span></h4>
        <div style="text-align: center">
            <dl>
                <dt>地图的类型：</dt>
                <dd>
                    <asp:RadioButtonList ID="rblMapType" runat="server" RepeatDirection="Horizontal"
                        RepeatLayout="Flow" CellPadding="0" CellSpacing="20">
                        <asp:ListItem Value="1" Text="Google" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Baidu"></asp:ListItem>
                    </asp:RadioButtonList>
                </dd>
            </dl>
            <dl>
                <dt>更新的频率：</dt>
                <dd>
                    <asp:DropDownList ID="ddlChangeFreq" runat="server" Width="100px">
                        <asp:ListItem Text="always" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="hourly"></asp:ListItem>
                        <asp:ListItem Text="daily"></asp:ListItem>
                        <asp:ListItem Text="weekly"></asp:ListItem>
                        <asp:ListItem Text="yearly"></asp:ListItem>
                        <asp:ListItem Text="never"></asp:ListItem>
                    </asp:DropDownList>
                    【<span style="color: #077AC7">注：即网页可能发生更改的频率,默认为每次访问时</span>】
                </dd>
            </dl>
            <dl>
                <dt>帮助说明/备注：</dt>
                <dd>
                    【<a href="SiteMapHelp.html" style="color: Red;">说明</a>】【<span style="color: #077AC7">注：文件保存地址--站点目录/Plus/SeoMap/</span>】
                </dd>
            </dl>
            <div style="clear: left">
            </div>
        </div>
        <div class="Submit">
            <asp:Button ID="btnXml" runat="server" Class="subButton" Text="生成XML" OnClick="btnXml_Click" />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnHtml" runat="server" Class="subButton" Text="生成HTML" OnClick="btnHtml_Click" />
        </div>
    </div>
    </form>
</body>
</html>
