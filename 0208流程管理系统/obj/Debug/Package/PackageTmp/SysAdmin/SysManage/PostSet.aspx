<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostSet.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.PostSet" %>

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
                    <dt width="30%"><b>发送人邮箱:</b><br>例：someone@360hqb.com</dt>
                    <dd width="70%"><asp:TextBox ID="txtEmail" runat="server" width="300px"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>发送人邮箱密码：</b></dt>
                    <dd width="70%"><asp:TextBox ID="txtPassword" runat="server" width="300px" 
                            TextMode="Password"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>发送邮件服务器(SMTP)：</b><br>用来发送邮件的SMTP服务器，<br>如果你不清楚此参数含义，请联系你的空间商 </dt>
                    <dd width="70%"><asp:TextBox ID="txtSmtpServer" runat="server" width="300px"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt width="30%"><b>端口号：</b><br>端口号必需是非负整正数，默认是25端口 </dt>
                    <dd width="70%"><asp:TextBox ID="txtPort" runat="server" width="300px"></asp:TextBox></dd>
                </dl>             
        </div> 
        <div class="Submit" style="padding-left:300px;">
        <asp:Button Text="保存设置" CssClass="subButton" ID="btnSave" runat="server" onclick="btnSave_Click" />
        </div>            
    </div>
    </form>
</body>
</html>
