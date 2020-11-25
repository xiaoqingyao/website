<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataBaseManageSet.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.DataBaseManageSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
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
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %>
        </h4>
        <div id="panel">
                <dl>
                    <dt width="30%"><b>sql服务器地址：</b><br>网站sqlserver的服务器地址</dt>
                    <dd width="70%"><asp:TextBox ID="txtServer" runat="server" width="300px"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>要备份的数据库名称：</b><br>请确保数据库名称和真实数据库名称一致</dt>
                    <dd width="70%"><asp:TextBox ID="txtDataBase" runat="server" width="300px"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>数据库连接用户名：</b></dt>
                    <dd width="70%"><asp:TextBox ID="txtUserName" runat="server" width="300px"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>数据库连接密码：</b></dt>
                    <dd width="70%"><asp:TextBox ID="txtPassWord" runat="server" width="300px"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>Bak备份文件所在文件夹路径：</b><br>sqlserver所在服务器上的绝对路径，必须确保sqlserver所在服务器必须有此目录，否则备份会出错!<br /><font color=red>注：为了您的网站安全，请不要备份在网站目录下</font></dt>
                    <dd width="70%"><asp:TextBox ID="txtBakFilePath" runat="server" width="300px"></asp:TextBox><input type="hidden" id="hidDataBackFileList" runat="server" /></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>Sql备份文件所在文件夹路径：</b><br>网站所在服务器上的绝对路径，必须确保网站所在服务器必须有此目录，否则备份会出错!<br /><font color=red>注：为了您的网站安全，请不要备份在网站目录下</font></dt>
                    <dd width="70%"><asp:TextBox ID="txtSqlFilePath" runat="server" width="300px"></asp:TextBox></dd>
                </dl>
        </div> 
        <div class="Submit" style="padding-left:300px;">
        <asp:Button Text="保存设置" CssClass="subButton" ID="btnSave" runat="server" onclick="btnSave_Click" />
        </div>        
    </div>
    </form>
</body>
</html>

