<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateNodeEdit.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.SysManage.TemplateNodeEdit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>模板节点管理</title>
   <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <script type="text/javascript" src="../js/listcheck.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    <script type="text/javascript" src="../js/Common.js"></script>
    <script type="text/javascript">
        var type = -1;
        var title = "";
        var errmsg = "";
        function showMessage() {
            var msgContent = "";
            var jumpurl = "";
            //添加成功
            if (type == 0) {
                msgContent = "添加模板节点<font color=red>" + title + "</font>成功<br>";
                msgContent += "<a href='TemplateNodeManage.aspx?NodeCode=<%=NodeCode %>&TemplateID=<%=TemplateID %>' style='color:blue'>返回列表</a> | ";
                msgContent += "<a href='TemplateNodeEdit.aspx?<%=AllPower.Common.Utils.GetUrlParams() %>' style='color:red'>继续添加</a>";
                msgContent += "<br>注：3秒钟后自动转到列表页面";
                jumpurl = "TemplateNodeManage.aspx?NodeCode=<%=NodeCode %>&TemplateID=<%=TemplateID %>";
                alert({ msg: msgContent, status: "1", title: "提示信息", url: jumpurl, time: 3000, width: 400 })
            }
            else if (type == 1) {  //修改成功
            msgContent = "修改模板节点<font color=red>" + title + "</font>成功<br>";
            msgContent += "<a href='TemplateNodeManage.aspx?NodeCode=<%=NodeCode %>&TemplateID=<%=TemplateID %>' style='color:blue'>返回列表</a> | ";
            msgContent += "<a href='TemplateNodeEdit.aspx?<%=AllPower.Common.Utils.GetUrlParams() %>' style='color:red'>继续修改</a> | ";
                msgContent += "注：3秒钟后自动转到列表页面";
                jumpurl = "TemplateNodeManage.aspx?NodeCode=<%=NodeCode %>&TemplateID=<%=TemplateID %>";
                alert({ msg: msgContent, status: "1", title: "提示信息", url: jumpurl, time: 3000, width: 400 })
            }
            else if (type == 2) {  //操作失败
            msgContent = "修改模板节点失败,原因如下：<br>";
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
        function setAction1(data) {
            if (data == "true") {
                document.getElementById("btnHidAction").click();
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <input type="hidden" id="hidLogTitle" runat="server" />
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %> &gt;
            <span class="breadcrumb_current"> 添加/修改模板节点</span>
        </h4>          
         <div id="panel">
         <fieldset>
         <dl id="dlNodeCode" runat="server" visible="false"><dt>所属导航：</dt><dd>
            <asp:DropDownList ID="ddlNodeCode" runat="server">
            </asp:DropDownList>
            </dd>
         </dl>
         <dl><dt>节点名称：</dt>
         <dd>
         <asp:TextBox ID="txtNodeName" runat="server"></asp:TextBox>         
          <input type="hidden" runat="server" id="hidNodeCode" />
         </dd> </dl> 
         <dl><dt>英文名称：</dt><dd><asp:TextBox ID="txtNodelEngDesc" runat="server"></asp:TextBox></dd></dl>
         <dl><dt>节点类型： </dt><dd><asp:CheckBox ID="chkNodeType" runat="server" Text="是否文件夹类型" /></dd></dl>
         <dl><dt>所属模块： </dt><dd><asp:DropDownList ID="ddlModeID" runat="server"></asp:DropDownList></dd></dl>
         <dl><dt>自定义链接地址：</dt><dd><asp:TextBox ID="txtLink" runat="server"></asp:TextBox></dd></dl>
         <dl><dt>审核流程：</dt><dd><asp:DropDownList ID="ddlReviewFlow" runat="server"></asp:DropDownList></dd></dl>
         <dl><dt>是否系统栏目：</dt><dd><asp:CheckBox ID="chkIsSystem" runat="server" Text="是" />（系统节点:保证系统正常运行的节点，已经添加，不可维护）</dd>
         </dl><dl><dt>是否包含前台栏目：</dt><dd> <asp:CheckBox ID="chkIsContainWebContent" runat="server" Text="是" />（只有包含前台栏目的系统节点才能在栏目管理中出现）</dd></dl>                           
         <dl><dt>是否有效：</dt><dd>
         <asp:RadioButtonList ID="RBL_IsValid" runat="server" Height="16px" RepeatDirection="Horizontal" Width="124px">
          <asp:ListItem Value="0">禁用</asp:ListItem>
          <asp:ListItem Value="1" Selected=True>启用</asp:ListItem>
          </asp:RadioButtonList></dd>
         </dl>
         <dl><dt>节点说明：</dt><dd><asp:TextBox ID="txtNodelDesc" TextMode="MultiLine" runat="server" Height="112px" Width="284px"></asp:TextBox></dd></dl>
         <dl><dt> 排序号：</dt><dd><asp:TextBox ID="txtNodelOrder" runat="server" Text="0" Width="50px"></asp:TextBox></dd></dl>
        </fieldset>
        </div>
        <div class="Submit">
        <asp:Button ID="btnHidAction" runat="server" OnClick="btnDel_Click" style="display:none" />
            <asp:Button ID="btnTemplateNode" runat="server" CssClass="subButton" Text="<%$Resources:Common,Add %>"
                OnClick="btnTemplateNodeEdit_Click" />
            <asp:Button ID="btnDel" runat="server" CssClass="subButton" Text="<%$Resources:Common,Del %>" OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction1(data)}});return false;" />
            <input type="button" name="Submit422" class="subButton" value="<%= Resources.Common.Back %>"
                onclick='location.href="TemplateNodeManage.aspx?NodeCode=<%=NodeCode %>&TemplateID=<%=TemplateID %>";'>
        </div>
    </div>
    </form>
</body>
</html>
