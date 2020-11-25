<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppendToNode.aspx.cs" Inherits="KingTop.WEB.SysAdmin.Model.AppendToNode" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>添加记录至节点/栏目</title>

    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>

    <script src="../JS/Common.js" type="text/javascript"></script>

    <link href="../css/multiselect.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        function check() {
            var isTrue = (checkMultipleSelete("lstInfo") && checkMultipleSelete("lstNode"));
            if (!isTrue) {
                $("#Prompt").html("请选定内容和要添加的节点/栏目。");
            } else {
                $("#Prompt").html("");
            }
            return isTrue;
        }</script>

</head>
<body>
    <form id="theForm" runat="server">
    <div class="wsel">
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    选定的内容：
                </td>
                <td>
                </td>
                <td>
                    请选择节点/栏目：
                </td>
            </tr>
            <tr>
                <td>
                    <asp:ListBox ID="lstInfo" SelectionMode="Multiple" class="selectList" runat="server">
                    </asp:ListBox>
                </td>
                <td width="5">
                </td>
                <td>
                    <asp:ListBox ID="lstNode" SelectionMode="Multiple" class="selectList" runat="server">
                    </asp:ListBox>
                </td>
            </tr>
        </table>
        <table border="0" cellspacing="0" cellpadding="0" class="ifun">
            <tr>
                <td>
                    <input type="button" value="全选" onclick="multipleSelectAll('lstInfo')" />
                    <input type="button" value="全选取消" onclick="unMultipleSelectAll('lstInfo')" />
                    <asp:Button ID="Button1" OnCommand="BachAppendToNode" runat="server" OnClientClick="return check();"
                        Text="执行批处理" />
                    <input type="button" value="关闭" onclick="parent.CloseDialog()" />
                    <input type="button" value="全选" onclick="multipleSelectAll('lstNode')" />
                    <input type="button" value="全选取消" onclick="unMultipleSelectAll('lstNode')" />
                </td>
            </tr>
        </table>
        <span id="Prompt" style="color: Red; text-align: center;"></span>
    </div>
    </form>

    <script type="text/javascript">
    <%=jsMessage %>
    </script>

</body>
</html>
