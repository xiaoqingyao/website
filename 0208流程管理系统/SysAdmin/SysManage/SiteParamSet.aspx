<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SiteParamSet.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.SiteParamSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title></title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <style type="text/css">
        .container dl dt{ width:300px;}
    </style>
</head>
<body>
    <form id="theForm" runat="server">
    <input type=hidden id="hidSiteDir" runat="server" />
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %>
        </h4>
        <div id="panel">
                <dl id="dlManageDir" style="display:none" runat ="server">
                    <dt width="30%"><b>后台管理目录：</b><br>为了安全，您可以在此修改后台管理目录名称，<br>为空时默认为Admin，实际文件夹名不需更改。</dt>
                    <dd width="70%"><asp:TextBox ID="txtManageDir" runat="server" width="300px"></asp:TextBox></dd>
                </dl>
                <dl id="dlIsRZM" runat ="server">
                    <dt width="30%"><b>是否启用后台管理认证码：</b></dt>
                    <dd width="70%"><asp:RadioButton ID="RadTrue" runat="server" GroupName="IsEnableManageCode" Text="是" /><asp:RadioButton ID="RadFalse" runat="server" GroupName="IsEnableManageCode" Text="否" /></dd>
                </dl>
                <dl id="dlRZMCode" runat ="server">
                    <dt width="30%"><b>后台管理认证码：</b></dt>
                    <dd width="70%"><asp:TextBox ID="txtManageCode" runat="server" width="300px"></asp:TextBox></dd>
                </dl>
                <dl id="dl1" runat ="server">
                    <dt width="30%"><b>Dreamweaver API 校验码：</b></dt>
                    <dd width="70%"><asp:TextBox ID="txtSiteDWMange" runat="server" width="300px"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>网站根域名：</b><br>在启用子域名单点登录的情况下，必须要设置此值。</dt>
                    <dd width="70%"><asp:TextBox ID="txtSiteRootURL" runat="server" width="300px"></asp:TextBox></dd>
                </dl>
                <dl id="dlsubdomain" runat="server">
                    <dt width="30%"><b>本站点域名：</b><br>注意：本站点域名的主目录需设置到网站生成目录文件夹，<br />不填写则本站点域名为“网站根域名+网站生成目录，例如：http://www.360hqb.com/shop/，shop为网站生成目录” </dt>
                    <dd width="70%"><asp:TextBox ID="txtSiteDomain" runat="server" width="300px"></asp:TextBox></dd>
                </dl>
                <dl id="dlSiteDir" runat ="server">
                    <dt width="30%"><b>网站生成目录：</b> </dt>
                    <dd width="70%"><asp:TextBox ID="txtSiteDir" runat="server" width="300px"></asp:TextBox></dd>
                </dl>
                <dl id="dlmainSiteDir" runat ="server">
                    <dt width="30%"><b>网站生成目录：</b> </dt>
                    <dd width="70%"><input type="radio" id="radMainSiteDir0" name="radMainSiteDir" value="" runat="server"/> 生成在跟目录下 &nbsp; <input type="radio" id="radMainSiteDir1" name="radMainSiteDir" value="main" runat="server"/> 生成在main目录下</dd>
                </dl>
                <dl>
                    <dt width="30%"><b>生成文件扩展名：</b><br />此项设置生成静态页面的扩展名 </dt>
                    <dd width="70%"><select id="selCreateFileExt" runat="server">
                        <option>html</option>
                        <option>shtml</option>
                        <option>htm</option>
                        <option>shtm</option>
                        <option>aspx</option>
                    </select></dd>
                </dl>
                <%--<dl>
                    <dt width="30%"><b>网站模板根目录：</b></dt>
                    <dd width="70%"><asp:TextBox ID="txtSiteTempletDir" runat="server" width="300px"></asp:TextBox></dd>
                </dl>--%>
                <dl>
                    <dt width="30%"><b>禁止注册的用户名：</b><br>在右边指定的用户名将被禁止注册，<br>每个用户名请用“|”符号分隔 </dt>
                    <dd width="70%"><asp:TextBox ID="txtDisUserName" runat="server" TextMode="MultiLine" width="400px" Height="100px"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>编辑器选择：</b></dt>
                    <dd width="70%">
                    <asp:DropDownList ID="ddlEditControl" runat="server">
                    <asp:ListItem Value="CKEditor">CKEditor</asp:ListItem>
                    <asp:ListItem Value="eWebEditor">eWebEditor</asp:ListItem>
                    </asp:DropDownList>
                    </dd>
                </dl>
                <dl>
                    <dt width="30%"><b>日志记录方式：</b></dt>
                    <dd width="70%">
                    <asp:DropDownList ID="ddlLogType" runat="server">
                    <asp:ListItem Value="0">数据库</asp:ListItem>
                    <asp:ListItem Value="1">文件</asp:ListItem>
                    </asp:DropDownList>
                    </dd>
                </dl>
        </div>     
         <div class="Submit" style="padding-left:300px;">
        <asp:Button Text="保存设置" CssClass="subButton" ID="btnSave" runat="server" onclick="btnSave_Click" />
        </div>      
    </div>
    </form>
</body>
</html>
