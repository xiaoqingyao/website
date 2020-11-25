<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ColumnCopy.aspx.cs" Inherits="AllPower.WEB.SysAdmin.SysManage.ColumnCopy" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>栏目复制</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <link rel="stylesheet" href="../css/template.css" type="text/css" />
    <link href="../CSS/validationEngine.css" rel="stylesheet" type="text/css" />
    <script src="../JS/jquery-validationEngine.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/<%=Resources.Common.formValidationLanguage %>"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script type="text/javascript">
        $(document).ready(function() { $("#theForm").validationEngine({ promptPosition: "centerRight" }) });
        function setAction1(data) {
            if (!checkMultipleSelete("lsbColumn1")) {
                alert({ msg: "请选择要复制的栏目!", title: "信息提示" });
                return false;
            }
            if (!checkMultipleSelete("lsbColumn2")) {
                alert({ msg: "请选择复制到的栏目!", title: "信息提示" });
                return false;
            }
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
            位置： <%GetPageNav(NodeCode); %>
        </h4>
        <div id="panel">
            <fieldset style="padding:20px 50px 20px 50px">
             <dl>
                <dd>
                <table border=0 style="padding:10px 0px 10px 20px">
                
                <tr>
                <td>将栏目</td>
                <td><asp:ListBox ID="lsbColumn1" runat="server" SelectionMode="Single" Width="300px" Height="280px"/></td>
                <td>复制到</td>
                <td><asp:ListBox ID="lsbColumn2" runat="server" SelectionMode="Single" Width="300px" Height="280px"/></td>
                </tr>
                <tr>
                <td colspan=4 style="padding-left:38px;color:red">
                <input type="checkbox" id="chkIsDataCopy" name="chkIsDataCopy" value="1"/><label for="chkIsInfoCopy">栏目中的数据同步复制</label>
                </td>
                </tr>
                </table>

                </dd>                
             </dl>
             <dl>
                <dd style="padding-left:20px 0px 20px 20px">
                注意事项：<br>
                1、所有操作不可逆，请慎重操作。<br> 
                2、复制节点操作后，您所指定的节点（或者包括其下属节点）不会被删除，目标节点中会产生一份指定的节点（或者包括其下属节点）的副本。 
                </dd>
             </dl>
          <div style="clear:left"></div>
          </fieldset>
        </div>
        <div class="Submit">
            <asp:Button ID="btnHidAction" runat="server" OnClick="btnSave_Click" style="display:none" />
            <asp:Button ID="btnSave" class="subButton" runat="server" Text="<%$Resources:Common,Save %>"  OnClientClick="selfconfirm({msg:'确定要复制栏目吗？',fn:function(data){setAction1(data)}});return false;"/>
            <%--<asp:Button ID="btnBack" class="subButton" runat="server" Text="<%$Resources:Common,Back %>" OnClick="btnBack_Click" />--%>
        </div>
    </div>
    </form>
</body>
</html>
