<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModelNodeEdit.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.SysManage.ModelNodeEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>节点管理</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <link rel="stylesheet" href="../css/template.css" type="text/css" />
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/Common.js"></script>
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
                msgContent = "添加节点<font color=red>" + title + "</font>成功<br>";
                msgContent += "<a href='ModelNodeList.aspx?NodeCode=<%=NodeCode%>' style='color:blue'>返回列表</a> | ";
                msgContent += "<a href='ModelNodeEdit.aspx?<%=AllPower.Common.Utils.GetUrlParams() %>' style='color:red'>继续添加</a>";
                msgContent += "<br>注：3秒钟后自动转到列表页面";
                jumpurl = "ModelNodeList.aspx?NodeCode=<%=NodeCode %>";
                alert({ msg: msgContent, status: "1", title: "提示信息", url: jumpurl, time: 3000, width: 400 })
            }
            else if (type == 1) {  //修改成功
            msgContent = "修改节点<font color=red>" + title + "</font>成功<br>";
                msgContent += "<a href='ModelNodeList.aspx<%=StrPageParams %>' style='color:blue'>返回列表</a> | ";
                msgContent += "<a href='ModelNodeEdit.aspx?<%=AllPower.Common.Utils.GetUrlParams() %>' style='color:red'>继续修改</a> <br> ";
                //msgContent += "<a href='ModelNodeEdit.aspx?<%=AllPower.Common.Utils.GetUrlParams().Replace("Edit","New") %>' style='color:red'>添加新节点</a><br>";
                msgContent += "注：3秒钟后自动转到列表页面";
                jumpurl = "ModelNodeList.aspx<%=StrPageParams %>";
                alert({ msg: msgContent, status: "1", title: "提示信息", url: jumpurl, time: 3000, width: 400 })
            }
            else if (type == 2) {  //操作失败
                msgContent = "操作失败,原因如下：<br>";
                msgContent += "<font style='color:green'>" + errmsg + "</font><br>";
                msgContent += "注：10秒钟后提示框自动关闭";
                alert({ msg: msgContent, status: "2", title: "提示信息", time: 10000, width: 400 })
            }
            else if (type == 3) {  //修改成功
                msgContent = "删除节点<font color=red>" + title + "</font>成功<br>";
                msgContent += "注：3秒钟后自动转到列表页面";
                jumpurl = "ModelNodeList.aspx<%=StrPageParams %>";
                alert({ msg: msgContent, status: "1", title: "提示信息", url: jumpurl, time: 3000, width: 400 })
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
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
    
</head>
<body>
    <form id="theForm" runat="server">
    <div class="container">
        <h4>
            位置： <%GetPageNav(NodeCode); %> &gt; <span class="breadcrumb_current"> 添加/修改节点</span>
        </h4>
        <div id="con">
            <div id="panel">
                <fieldset>
                <dl>
                    <dt>节点名称：</dt>
                    <dd>
                       <asp:TextBox ID="txtNodeName" runat="server" CssClass="validate[required,length[1,10]]"></asp:TextBox>
                       <asp:TextBox ID="txtNodeID" runat="server"  ReadOnly="true" Visible=false BackColor="Gainsboro"></asp:TextBox>
                       <asp:TextBox ID="txtNodeCode" runat="server" Visible=false></asp:TextBox>
                       <input type="hidden" id="hidLogTitle" runat="server" />
                    </dd>
                </dl>
                <dl>
                    <dt>英文名称：</dt>
                    <dd><asp:TextBox ID="txtNodelEngDesc" class="validate[required,custom[onlyLetter],length[0,20]] text-input" runat="server"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt>节点图标(如果是父节点类型或需自定义节点图标则需上传图片)：</dt>
                    <dd><asp:TextBox ID="txtNodelIcon" runat="server" Width="252px"></asp:TextBox> <input type="button" id="Button3" value="上传" class="subButton" runat="server" onclick="InputFile('theForm','txtNodelIcon','image',1,'jpg|gif|bmp|png');" /></dd>
                </dl>
                <dl>
                    <dt>是否父节点(只有父节点下才能包含子节点，父节点不能属于某个模块)：</dt>
                    <dd> 
                        <asp:CheckBox ID="chkIsFolder" runat="server" Text="是" AutoPostBack="true" oncheckedchanged="chkIsFolder_CheckedChanged" />
                    </dd>
                </dl>
                <dl>
                    <dt>所属模块：</dt>
                    <dd><asp:DropDownList ID="ddlModel" runat="server"></asp:DropDownList></dd>
                </dl>
                <dl>
                    <dt>自定义前台链接：</dt>
                    <dd><asp:TextBox ID="txtLinkURL" runat="server" Width="231px"></asp:TextBox>&nbsp;默认为空</dd>
                </dl>
                <dl>
                    <dt>自定义后台链接：</dt>
                    <dd><asp:TextBox ID="txtCustomManageLink" runat="server" Width="231px"></asp:TextBox>&nbsp;默认为空，可以是相对路径，不为空则后台节点读取此连接地址，否则读取模块的链接地址</dd>
                </dl>
                <dl>
                    <dt>审核流程：</dt>
                    <dd><asp:DropDownList ID="ddlReviewFlow" runat="server"></asp:DropDownList></dd>
                </dl>
                <dl>
                    <dt>左边菜单栏显示：</dt>
                    <dd>    
                        <asp:CheckBox ID="chkIsLeftDisplay" runat="server" Checked=true Text="是" />（默认为是）
                    </dd>
                </dl>    
                <dl>
                    <dt>是否系统节点：</dt>
                    <dd> <asp:CheckBox ID="chkIsSystem" runat="server" Text="是" />（系统节点:保证系统正常运行的节点，已经添加，不可维护）</dd>
                </dl>
                <dl>
                    <dt>是否包含前台栏目：</dt>
                    <dd> <asp:CheckBox ID="chkIsContainWebContent" runat="server" Text="是" />（只有包含前台栏目的系统节点才能在栏目管理中出现）</dd>
                </dl>
                <dl>
                    <dt>是否有效：</dt>
                    <dd><asp:RadioButtonList ID="RBL_IsValid" runat="server" Height="16px" RepeatDirection=Horizontal
                                      Width="124px">
                                      <asp:ListItem Value="0">禁用</asp:ListItem>
                                      <asp:ListItem Value="1" Selected=True>启用</asp:ListItem>
                                  </asp:RadioButtonList></dd>
                </dl>
                <dl>
                    <dt>节点说明：</dt>
                    <dd><asp:TextBox ID="txtNodelDesc" TextMode="MultiLine" runat="server" Height="112px" Width="284px"></asp:TextBox></dd>
                </dl>
                <dl>
                    <dt> 排序号：</dt>
                    <dd><asp:TextBox ID="txtNodelOrder" runat="server"  CssClass="validate[required,custom[onlyNumber],length[0,3]] text-input" Text="0" Width="50px"></asp:TextBox></dd>
                </dl>
                <div style="clear:left"></div>
             </fieldset></div>
             <div class="Submit">
                <asp:Button ID="btnHidAction" runat="server" OnClick="btnDel_Click" style="display:none" />
                <asp:Button ID="btnEdit" runat="server" CssClass="subButton" Text="<%$Resources:Common,Add %>" OnClick="btnEdit_Click" />
                <asp:Button ID="btnDel" runat="server" CssClass="subButton" Text="<%$Resources:Common,Del %>"  OnClientClick="selfconfirm({msg:'确定要执行删除操作吗？',fn:function(data){setAction1(data)}});return false;"/>
                <input type="button" name="Submit422" Class="subButton" value="<%= Resources.Common.Back %>" onclick='location.href="ModelNodeList.aspx<%=StrPageParams %>";'>
            </div>
        </div>
    </form>
</body>
</html>
