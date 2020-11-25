<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateSkinEdit.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.Template.TemplateSkinEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>风格编辑</title>
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

    <script src="../Calendar/WdatePicker.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });

        var id = '<%=Request.QueryString["id"] %>';
        window.onload = function() {
            if (type > -1) {
                var name = "模板风格";
                var listUrl = "TemplateSkinList.aspx<%=StrPageParams %>";
                var addUrl = "TemplateSkinEdit.aspx?action=NEW&NodeCode=<%=NodeCode%>";
                var updateUrl = "?action=edit&NodeCode=<%=NodeCode%>&id=" + id;
                showEditMessage(name, listUrl, addUrl, updateUrl);
            }
        }
    </script>

</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" name="hidLogTitle" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <a href="#">模板模型</a><a> &gt;</a> <a href="TemplateSkinList.aspx?Action=ALL&NodeCode=<%=NodeCode %>">
                风格管理</a><a> &gt;</a> <span style="color: Blue">添加/修改风格</span>
        </h4>
        <div id="panel">
            <fieldset>
                <dl>
                    <dt>风格名称:</dt>
                    <dd>
                        <asp:TextBox ID="txtTitle" Style="width: 200px" CssClass="validate[required,length[2,50]]"
                            runat="server"></asp:TextBox>
                        <font color="red">*</font></dd>
                </dl>
                <dl>
                    <dt>所属方案:</dt>
                    <dd>
                        <asp:DropDownList ID="ddlProjects" runat="server" Width="150px" CssClass="validate[optional]">
                        </asp:DropDownList>
                        <font color="red">*</font></dd>
                </dl>
                <dl>
                    <dt>风格目录:</dt>
                    <dd>
                        <asp:TextBox ID="txtDirectory" Style="width: 200px" runat="server" Enabled="false"></asp:TextBox>
                        <font color="red">此项为系统自动生成</font></dd>
                </dl>
                <dl>
                    <dt>设计者:</dt>
                    <dd>
                        <asp:TextBox ID="txtDevise" Style="width: 200px" CssClass="validate[required,length[2,20]]"
                            runat="server"></asp:TextBox>
                        <font color="red">*</font></dd>
                </dl>
                <dl>
                    <dt>简介:</dt>
                    <dd>
                        <asp:TextBox ID="txtIntro" TextMode="MultiLine" Rows="5" Columns="50" runat="server"></asp:TextBox></dd>
                </dl>
            </fieldset>
        </div>
        <div class="Submit">
            <asp:Button ID="btnConserve" runat="server" Text="保存" OnClick="btnConserve_Click"
                CssClass="subButton" />
            <input type="button" name="back" value="返回" onclick='location.href="TemplateSkinList.aspx?Action=ALL&NodeCode=<%=NodeCode %>";'
                class="subButton" />
        </div>
    </div>
    </form>
</body>
</html>
