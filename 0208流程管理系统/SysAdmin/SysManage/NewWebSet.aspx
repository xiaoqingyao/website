<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewWebSet.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.NewWebSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>设置站点</title>
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
        function domainShowHide(isChecked) {
            if (isChecked) {
                $("#dlDomain").css("display", "");
            }
            else {
                $("#dlDomain").css("display", "none");
            }
        }
        var NewSiteID = 0;
        var NewSiteName = "";
        window.onload = function() {
            var isChecked = document.getElementById("chkIsDomain").checked;
            domainShowHide(isChecked);
            //添加站点后刷新左边菜单
            if (NewSiteID != 0)
            {
                var leftObj = window.parent.frames["frameLeft"];
                var siteObj = leftObj.document.getElementById("ddlChangeSite");
                siteObj.add(new Option(NewSiteName, NewSiteID));
            }
        }
    </script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %>
        </h4>
        <div id="panel">
            <fieldset>
 <dl>
    <dt>使用的站点模板名称：</dt>
    <dd><asp:Label ID="lblTemplateName" runat="server"></asp:Label><asp:HiddenField ID="hiddenTemplateID" runat="server" /></dd>
 </dl>
 <dl>
    <dt>站点名称(必填)：</dt>
    <dd><asp:TextBox ID="txtSiteName" runat="server" CssClass="validate[required,length[1,10]]"></asp:TextBox></dd>
 </dl>
 <dl>
    <dt>站点类型：</dt>
    <dd><asp:RadioButton ID="rdoMain" runat="server" GroupName="SiteType" Text="主站" />
    <asp:RadioButton ID="rdoLeaf" runat="server" GroupName="SiteType" Text="子站" /></dd>
  </dl> 
  <dl>
    <dt>文件夹名称(生成站点的文件夹,必填)：</dt>
    <dd><asp:TextBox ID="txtDir" runat="server"></asp:TextBox> </dd>  
  </dl> 
  <%--<dl>
    <dt>网页编码：</dt>
    <dd>
       <asp:DropDownList ID="ddlSiteCode" runat="server">
       <asp:ListItem Value="UTF-8">UniCode(UTF-8)</asp:ListItem>
       <asp:ListItem Value="GB2312" Selected="True">简体中文(GB2312)</asp:ListItem>
       <asp:ListItem Value="Big5">繁体中文(Big5)</asp:ListItem>
       </asp:DropDownList>
    </dd>
  </dl>--%>
  <dl>
    <dt>是否导入栏目及内容：</dt>
    <dd><asp:CheckBox ID="chkIsImportNode" runat="server" Checked="true" /></dd>
  </dl>
  <%--<dl>
    <dt>是否导入表单样式：</dt>
    <dd><asp:CheckBox ID="chkImportFormStyle" runat="server" Checked="true" /></dd>
  </dl>--%>
  <dl>
    <dt>是否启用独立域名（或子域名）：</dt>
    <dd><asp:CheckBox ID="chkIsDomain" runat="server" onclick="domainShowHide(this.checked)"/></dd>
  </dl>
  <dl id="dlDomain" style="display:none">
    <dt>网站域名：<br>注意：本站点域名的主目录需设置到网站生成目录文件夹</dt>
    <dd><asp:TextBox ID="txtSiteURL" runat="server" Width=300></asp:TextBox></dd>
  </dl>
  <div style="clear:left"></div>
  </fieldset>
        </div>
        <div class="Submit">
            <asp:Button ID="btnSave" class="subButton" runat="server" Text="<%$Resources:Common,Save %>" OnClick="btnSave_Click" />
            <%--<asp:Button ID="btnBack" class="subButton" runat="server" Text="<%$Resources:Common,Back %>"
                OnClick="btnBack_Click" />--%>
                <input type="button" onclick="location.href='CreateWebSite.aspx?NodeCode=<%=NodeCode %>';" value="返回" class="subButton" />
        </div>
    </div>
    </form>
</body>
</html>
