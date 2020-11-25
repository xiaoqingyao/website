<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateEdit.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.TemplateEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>模板管理</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <link rel="stylesheet" href="../css/template.css" type="text/css" />
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>
    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });

        var type = -1;
        var title = "";
        var errmsg = "";
        function showMessage() {
            var msgContent = "";
            var jumpurl = "";
            //添加成功
            if (type == 0) {
                msgContent = "添加模板<font color=red>" + title + "</font>成功<br>";
                msgContent += "<a href='TemplateManage.aspx?NodeCode=<%=NodeCode %>' style='color:blue'>返回列表</a> | ";
                msgContent += "<a href='TemplateEdit.aspx?action=New&NodeCode=<%=NodeCode %>' style='color:red'>继续添加</a>";
                msgContent += "<br>注：3秒钟后自动转到列表页面";
                jumpurl = "TemplateManage.aspx?NodeCode=<%=NodeCode %>";
                alert({ msg: msgContent, status: "1", title: "提示信息", url: jumpurl, time: 3000, width: 400 })
            }
            else if (type == 1) {  //修改成功
            msgContent = "修改模板<font color=red>" + title + "</font>成功<br>";
            msgContent += "<a href='TemplateManage.aspx<%=StrPageParams %>' style='color:blue'>返回列表</a> | ";
            msgContent += "<a href='TemplateEdit.aspx?<%=AllPower.Common.Utils.GetUrlParams() %>' style='color:red'>继续修改</a> | ";
            msgContent += "<a href='TemplateEdit.aspx?action=New&NodeCode=<%=NodeCode %>' style='color:red'>添加新模板</a><br>";
                msgContent += "注：3秒钟后自动转到列表页面";
                jumpurl = "TemplateManage.aspx<%=StrPageParams %>";
                alert({ msg: msgContent, status: "1", title: "提示信息", url: jumpurl, time: 3000, width: 400 })
            }
            else if (type == 2) {  //操作失败
            msgContent = "修改模板失败,原因如下：<br>";
                msgContent += "<font style='color:green'>" + errmsg + "</font><br>";
                msgContent += "注：10秒钟后提示框自动关闭";
                alert({ msg: msgContent, status: "2", title: "提示信息", time: 10000, width: 400 })
            }
        }
        window.onload = function() {
            if (type > -1) {
                showMessage();
            }
        }
    </script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <input type="hidden" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %> &gt; <span class="breadcrumb_current"> 添加/修改模板</span>
        </h4>
        <div id="panel">
            <fieldset>
         <dl>
    	<dt> 模板名称:</dt>
    	<dd><asp:TextBox ID="txtTemplateName" runat="server" CssClass="validate[required,length[1,10]]"></asp:TextBox> </dd>
     </dl>
     <div style="clear:left"></div>
       </fieldset>
        </div>
        <div class="Submit">
            <asp:HiddenField ID="hdnID" runat="server" />
            <asp:Button ID="btnTemplateEdit"  runat="server" CssClass="subButton" Text="<%$Resources:Common,Add %>"
                OnClick="btnTemplateEdit_Click" />
            <input type="button" name="Submit422" Class="subButton" value="<%= Resources.Common.Back %>" onclick='location.href="TemplateManage.aspx<%=StrPageParams %>";'>
        </div>
    </div>
    </form>
</body>
</html>
