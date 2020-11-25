<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberConfigEdit.aspx.cs"
    Inherits="AllPower.Web.Admin.MemberConfigEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>会员配置</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script type="text/javascript" src="../js/publicform.js"></script>
   
    <script src="../JS/Common.js" type="text/javascript"></script>

<script type="text/javascript" src="../js/jquery.dialog.js"></script>

<script type="text/javascript" src="../js/win.js"></script>
     
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4>
            位置： <a href="#">会员管理</a> > <a href="#">会员登录配置</a></h4>
        <div id="panel">
            <fieldset>
                <dl>
                    <dt>
                        <%=Resources.Model.Authcode%></dt>
                    <dd>
                        <asp:CheckBox ID="cbIsAuthcode" runat="server" />
                        <%=Resources.Common.ON%>
                    </dd>
                </dl>
            </fieldset>
            
            </div>
        
        <div class="Submit">
            <asp:Button ID="btnSave" runat="server" Text="<%$Resources:Common,Update %>" OnClick="btnSave_Click" />
          
        </div>
    </div>
    </form>
</body>
</html>
