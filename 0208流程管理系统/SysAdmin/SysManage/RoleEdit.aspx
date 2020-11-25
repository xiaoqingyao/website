<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoleEdit.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.RoleEdit" %>

<%@ Register TagPrefix="uc1" TagName="ucPublicOper" Src="../Controls/PublicOper.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>角色管理</title>
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
    <script type="text/javascript">
    
        var type=-1;
        var title="";
        var errmsg="";
        var id=-1;
        function showMessage() {
        var msgContent="";
        var jumpurl="";
        //添加成功
            if (type == 0) {
                msgContent="添加角色<font color=red>"+title+"</font>成功<br>";
                msgContent+="<a href='RoleList.aspx?NodeCode=<%=NodeCode %>' style='color:blue'>返回列表</a> | ";
                msgContent+="<a href='RoleEdit.aspx?action=New&NodeCode=<%=NodeCode %>' style='color:red'>继续添加</a>";
                if(id!=-1)
                {
                    msgContent+=" | <a href='RoleEdit.aspx?action=Edit&NodeCode=<%=NodeCode %>&ID="+id+"' style='color:red'>修改本角色</a>";
                }
                msgContent+="<br>注：3秒钟后自动转到列表页面";
                jumpurl="RoleList.aspx?NodeCode=<%=NodeCode %>";
                alert({ msg: msgContent, status: "1", title: "提示信息", url:jumpurl,time: 3000,width:400 })
            }
            else if (type == 1) {  //修改成功
                msgContent="修改角色<font color=red>"+title+"</font>成功<br>";
                msgContent+="<a href='RoleList.aspx<%=StrPageParams %>' style='color:blue'>返回列表</a> | ";
                msgContent+="<a href='RoleEdit.aspx?<%=AllPower.Common.Utils.GetUrlParams()%>' style='color:red'>继续修改</a> | ";
                msgContent+="<a href='RoleEdit.aspx?action=New&NodeCode=<%=NodeCode %>' style='color:red'>添加新角色</a><br>";
                msgContent+="注：3秒钟后自动转到列表页面";
                jumpurl="RoleList.aspx<%=StrPageParams %>";
                alert({ msg: msgContent, status: "1", title: "提示信息", url:jumpurl,time: 3000,width:400 })
            }
            else if (type == 2) {  //操作失败
                msgContent="操作失败,原因如下：<br>";
                msgContent+="<font style='color:green'>"+errmsg+"</font><br>";
                msgContent+="注：10秒钟后提示框自动关闭";
                alert({ msg: msgContent, status: "2", title: "提示信息", time: 10000,width:400 })
            }
        }
        window.onload=function(){
            if(type>-1)
            {
                showMessage();
            }
        }
    </script>
</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %> &gt; <span class="breadcrumb_current"> 添加/修改角色</span>
        </h4>
        <div id="panel">
            <fieldset>
         <dl >
        	<dt>角色名称：</dt>
        	<dd><asp:TextBox ID="txtRoleName" runat="server"  CssClass="validate[required]"></asp:TextBox></dd>
         </dl>
         <dl>
        	<dt>角色说明：</dt>
        	<dd><asp:TextBox ID="txtRoleDescription" TextMode=MultiLine runat="server" 
                    Height="64px" Width="255px"></asp:TextBox></dd>
         </dl>
         <dl>
        	<dt>排序ID：</dt>
        	<dd><asp:TextBox ID="txtRoleOrder" Text="0" runat="server" CssClass="validate[required,custom[onlyNumber],length[0,3]] text-input"></asp:TextBox></dd>
         </dl>
         <div style="clear:left"></div>
        </fieldset>
        </div>
        <div class="Submit">
            <asp:HiddenField ID="hdnID" runat="server" />
            <asp:Button ID="btnRole" runat="server" CssClass="subButton" Text="<%$Resources:Common,Add %>"
                OnClick="btnRole_Click" />
           <input type="button" name="Submit422" Class="subButton" value="<%= Resources.Common.Back %>" onclick='location.href="RoleList.aspx<%=StrPageParams %>";'>
        </div>
    </div>
    </form>
</body>
</html>
