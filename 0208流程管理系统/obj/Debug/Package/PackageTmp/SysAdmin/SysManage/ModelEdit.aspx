<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModelEdit.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.ModelEdit" %>

<%@ Register TagPrefix="uc1" TagName="ucPublicOper" Src="../Controls/PublicOper.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
    </script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" id="hidLogTitle" runat="server" />
    <input type="hidden" id="hidoldOperCode" runat ="server" />
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %> &gt; <span class="breadcrumb_current"> 添加/修改模块</span>
        </h4>
        <div id="panel">
            <fieldset>
   
    <dl >
        <dt>模块名称：</dt>
        <dd>
            <asp:TextBox ID="txtModuleName" runat="server" Width=150 CssClass="validate[required,length[1,10]]"></asp:TextBox> *（必填）
            <asp:TextBox ID="txtModuleID" Visible=false runat="server" ReadOnly="true" Width="280px" BackColor="Gainsboro"></asp:TextBox>
            <asp:TextBox ID="txtModuleCode" runat="server" EnableTheming="True" Visible="False" Width="58px"></asp:TextBox>
        </dd>
    </dl>
    <dl>
        <dt>英文名称：</dt>
        <dd><asp:TextBox ID="txtModuleEncDesc" Width=150 class="validate[required,custom[onlyLetter],length[0,20]] text-input" runat="server"></asp:TextBox></dd>
    </dl>
    <dl>
        <dt>链接地址：</dt>
        <dd><asp:TextBox ID="txtLinkUrl" runat="server" Width="300px" CssClass="validate[required]"></asp:TextBox>*（例如：../SysManage/NewsList.aspx，必填项）</dd>
    </dl>
    <dl>
        <dt>系统模块：</dt>
        <dd><asp:CheckBox ID="chkIsSystem" runat="server" Text="是" />（默认为否）</dd>
    </dl>
    <dl>
        <dt>是否前台栏目模块：</dt>
        <dd><asp:CheckBox ID="chkModuleType" runat="server" Text="是" />（默认为否）</dd>
    </dl>
    <dl>
        <dt>是否有效：</dt>
        <dd><asp:RadioButtonList ID="RBL_IsValid" runat="server" Height="16px" RepeatDirection=Horizontal
                          Width="124px">
                          <asp:ListItem Value="0">禁用</asp:ListItem>
                          <asp:ListItem Value="1" Selected=True>启用</asp:ListItem>
                      </asp:RadioButtonList>
        </dd>
    </dl>
    <dl>
        <dt>模块说明：</dt>
        <dd><asp:TextBox ID="txtModuleDesc" CssClass="forms_txt" runat="server" TextMode="MultiLine" Width="280px" Height="120px"></asp:TextBox></dd>
    </dl>
    <dl>
        <dt>排序号：</dt>
        <dd><asp:TextBox ID="txtModuleOrder" runat="server" Text="100" Width="50px" CssClass="validate[required,custom[onlyNumber],length[0,3]] text-input"></asp:TextBox>（请填数字）</dd>
    </dl>
    <dl>
        <dt>请选择该模块所有的操作：</dt>
        <dd><table width=100%><tr><td id="OperTD"  runat="server"></td></tr></table></dd>
    </dl>
  <div style="clear:left"></div>
       </fieldset>
        </div>
        <div class="Submit">
            <asp:Button ID="btnEdit" CssClass="subButton" runat="server" Text="<%$Resources:Common,Add %>"
                OnClick="btnEdit_Click" />
           <input type="button" name="Submit422" Class="subButton" value="<%= Resources.Common.Back %>" onclick='location.href="Modellist.aspx<%=StrPageParams %>";'>
        </div>
    </div>
    </form>
</body>
</html>
