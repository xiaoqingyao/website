<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModelNodeList.aspx.cs"
    Inherits="AllPower.WEB.SysAdmin.SysManage.ModelNodeList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>��Ŀ����</title>
    <link href="../css/ustyle.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="../css/treeview.css" rel="stylesheet" />
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.form.select.js"></script>
    <script type="text/javascript" src="../js/publicform.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <script type="text/javascript" src="../JS/DTree.js"></script>
    <link href="../css/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.dialog.js"></script>
    <script type="text/javascript" src="../js/win.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h4>
            λ�ã� <%GetPageNav(NodeCode); %>
        </h4>
        <div class="function">
            <input type="hidden" id="hdPvalue" class="subButton" runat="server" />
            <asp:Button ID="btnNew" runat="server" Text="����һ���ڵ�" OnClick="Butnew_Click" />
        </div>
        <table border="0" width=100% cellpadding="0" cellspacing="0" id="senfe">
            <tr>
                <td width=20px></td>
                <td style="border:1px solid #CCCCCC;padding:10px 0 10px 30px">
                    <div class="dtree" id="menutree" runat="server">
                    </div>
                </td>
                <td width=20px></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
