<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LableClassEdit.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.Template.LableClassAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>添加/修改标签分类</title>
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
     $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });

     var id = '<%=Request.QueryString["id"] %>';
     window.onload = function() {
         if (type > -1) {
             var name = "模板方案";
             var listUrl = "LableClassList.aspx?Code=<%=NodeCode%>";
             var addUrl = "LableClassEdit.aspx?action=NEW&NodeCode=<%=NodeCode%>";
             var updateUrl = "?Action=EDIT&NodeCode=<%=NodeCode%>&id=" + id;
             showEditMessage(name, listUrl, addUrl, updateUrl);
         }
     }
    </script>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4>
            位置：<a href="TemplateList.aspx">模板管理</a> > <a href="LableClassList.aspx?NodeCode=<%=NodeCode %>">
                标签管理</a> > <span class="breadcrumb_current">添加/修改标签分类</span></h4>
        <br />
        <div id="panel">
            <dl>
                <dt>分类名称：</dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtLableName" Width="150"  CssClass="validate[required,length[2,50]]" /> <span style="color:red">*</span></dd>
            </dl>
            <dl>
                <dt>所属网站：</dt>
                <dd>
                    <asp:DropDownList runat="server" ID="ddlSiteList"  CssClass="validate[required]">
                    </asp:DropDownList> <span style="color:red">*</span>
                    <asp:HiddenField runat="server" ID="hidClassID" />
                </dd>
            </dl>
            <dl>
                <dt>说明：</dt>
                <dd>
                    <asp:TextBox runat="server" ID="txtDescription" TextMode="MultiLine" Width="460"
                        Height="100" MaxLength="200"></asp:TextBox></dd>
            </dl>
        </div>
        <div class="Submit" id="HQB_Operation_Button">
            <asp:Button runat="server" ID="btnSubmit" Text="添加" CssClass="subButton" OnClick="btnSubmit_Click" />
            <input type="button" value="返回" class="subButton" onclick="javascript:history.back();" />
        </div>
    </div>
    </form>
</body>
</html>
