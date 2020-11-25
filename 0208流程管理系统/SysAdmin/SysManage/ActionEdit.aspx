<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActionEdit.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.ActionEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>操作管理</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
     <script type="text/javascript" src="../js/Common.js"></script>
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
                msgContent = "添加操作<font color=red>" + title + "</font>成功<br>";
                msgContent += "<a href='ActionList.aspx?NodeCode=<%=NodeCode %>' style='color:blue'>返回列表</a> | ";
                msgContent += "<a href='ActionEdit.aspx?action=New&NodeCode=<%=NodeCode %>' style='color:red'>继续添加</a>";
                msgContent += "<br>注：3秒钟后自动转到列表页面";
                jumpurl = "ActionList.aspx?NodeCode=<%=NodeCode %>";
                alert({ msg: msgContent, status: "1", title: "提示信息", url: jumpurl, time: 3000, width: 400 })
            }
            else if (type == 1) {  //修改成功
                msgContent = "修改操作<font color=red>" + title + "</font>成功<br>";
                msgContent += "<a href='ActionList.aspx<%=StrPageParams %>' style='color:blue'>返回列表</a> | ";
                msgContent += "<a href='ActionEdit.aspx?<%=AllPower.Common.Utils.GetUrlParams() %>' style='color:red'>继续修改</a> | ";
                msgContent += "<a href='ActionEdit.aspx?action=New&NodeCode=<%=NodeCode %>' style='color:red'>添加新操作</a><br>";
                msgContent += "注：3秒钟后自动转到列表页面";
                jumpurl = "ActionList.aspx<%=StrPageParams %>";
                alert({ msg: msgContent, status: "1", title: "提示信息", url: jumpurl, time: 3000, width: 400 })
            }
            else if (type == 2) {  //操作失败
                msgContent = "操作失败,原因如下：<br>";
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
    
    <script type="text/javascript" src="../js/jquery.cookie.js"></script>
    <script type="text/javascript" src="../js/skin.js"></script>
</head>
<body>
    <form id="theForm" runat="server">
    <input type="hidden" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %> &gt; <span class="breadcrumb_current"> 添加/修改操作</span>
        </h4>
        <div id="panel">
            <fieldset>
         <dl>
        	<dt>所属模块：</dt>
        	<dd>
                <asp:DropDownList ID="ddlModel" runat="server"></asp:DropDownList>
                <asp:TextBox ID="txID" Visible=false runat="server" ReadOnly="true" Width="280px" BackColor="Gainsboro"></asp:TextBox>
           </dd>
        </dl>
        <dl>
        	<dt>操作名称(尽量和公共操作表里的名称一致)：</dt>
        	<dd>
                <asp:TextBox ID="txtOperName" runat="server" CssClass="validate[required,length[1,20]]"></asp:TextBox>
                &nbsp;<asp:TextBox ID="txtOperCode" Visible=false runat="server"></asp:TextBox>
            </dd>
         </dl>
         <dl>
             <dt>英文名称：</dt>
             <dd> 
                 <asp:DropDownList ID="DDLOperEngDesc" CssClass="validate[required]" runat="server"></asp:DropDownList> &nbsp;（*必填）
             </dd>
         </dl>
         <dl>
        	<dt>默认操作：</dt>
        	<dd>
        	    <asp:CheckBox ID="chkIsDefaultOper" runat="server" Text="是" />（默认为否）
            </dd>
         </dl>
         <dl>
        	<dt>系统操作：</dt>
        	<dd>
        	   <asp:CheckBox ID="chkIsSystem" runat="server" Text="是" />（默认为否）
            </dd>
         </dl>
         <dl>
        	<dt>是否有效：</dt>
        	<dd><asp:RadioButtonList ID="RBL_IsValid" runat="server" Height="16px" RepeatDirection="Horizontal">
                          <asp:ListItem Value="0">禁用</asp:ListItem>
                          <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                      </asp:RadioButtonList> 
            </dd>
         </dl>
         <dl>
        	<dt>操作说明(如无特别说明就直接用操作名称)：</dt>
        	<dd>
        	    <asp:TextBox ID="txtOperDesc" TextMode="MultiLine" runat="server" Height="122px" Width="340px"></asp:TextBox>
            </dd>
         </dl>
         <dl>
        	<dt>排序号：</dt>
        	<dd>
        	    <asp:TextBox  ID="txtOperOrder" runat="server" Text="0" Width="41px"  CssClass="validate[required,custom[onlyNumber],length[0,3]] text-input"></asp:TextBox>
            </dd>
          </dl>
          <div style="clear:left"></div>
       </fieldset>
        </div>
        <div class="Submit">
            <asp:HiddenField ID="hdnMCode" runat="server" />
            <asp:Button ID="btnEdit" CssClass="subButton" runat="server" Text="<%$Resources:Common,Add %>"
                OnClick="btnEdit_Click" />
            <input type="button" name="Submit422" Class="subButton" value="<%= Resources.Common.Back %>" onclick='location.href="ActionList.aspx<%=StrPageParams %>";'>
        </div>
    </div>
    </form>
</body>
</html>
